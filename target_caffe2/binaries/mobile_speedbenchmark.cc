#include "caffe2/core/init.h"
#include "caffe2/core/operator.h"
#include "caffe2/proto/caffe2.pb.h"
#include "caffe2/utils/proto_utils.h"
#include "caffe2/core/logging.h"

#include <regex>
#include <string>

CAFFE2_DEFINE_string(net, "", "The given net to benchmark.");
CAFFE2_DEFINE_string(init_net, "",
                     "The given net to initialize any parameters.");
CAFFE2_DEFINE_int(warmup, 0, "The number of iterations to warm up.");
CAFFE2_DEFINE_int(iter, 10, "The number of iterations to run.");
CAFFE2_DEFINE_bool(run_individual, false, "Whether to benchmark individual operators.");
CAFFE2_DEFINE_string(input_dims, "1,720,1080,4", "Input sizes, comma-separated");

std::vector<int32_t> split(const std::string& input, const std::string& regex) {
  // passing -1 as the submatch index parameter performs splitting
  std::regex re(regex);
  std::sregex_token_iterator
    first{input.begin(), input.end(), re, -1},
    last;
    std::vector<std::string> ss(first, last);
    std::vector<int32_t> result;
    for (const auto& s: ss) {
      result.push_back(std::atoi(s.data()));
    }
    return result;
}

int main(int argc, char** argv) {
  caffe2::GlobalInit(&argc, &argv);
  std::unique_ptr<caffe2::Workspace> workspace(new caffe2::Workspace());
  // Run initialization network.
  caffe2::NetDef net_def;
  CAFFE_ENFORCE(ReadProtoFromFile(caffe2::FLAGS_init_net, &net_def));
  CAFFE_ENFORCE(workspace->RunNetOnce(net_def)); //@cref
  CAFFE_ENFORCE(ReadProtoFromFile(caffe2::FLAGS_net, &net_def));
  caffe2::NetBase* net = workspace->CreateNet(net_def);
  auto* b = workspace->GetBlob(net_def.external_input(0))->GetMutable<caffe2::TensorCPU>();
  b->Resize(split(caffe2::FLAGS_input_dims, ","));
  b->mutable_data<float>();
  CHECK_NOTNULL(net);
  CAFFE_ENFORCE(net->Run());
  net->TEST_Benchmark(caffe2::FLAGS_warmup, caffe2::FLAGS_iter, caffe2::FLAGS_run_individual);
  return 0;
}
