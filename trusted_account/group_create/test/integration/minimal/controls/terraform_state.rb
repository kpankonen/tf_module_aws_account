require 'json'
require 'rspec/expectations'


terraform_state = attribute 'terraform_state', {}

control 'terraform_state' do
  tf_state_json = json(terraform_state)

  describe 'the Terraform state file' do
    subject { json(terraform_state).terraform_version }

    it('is accessible') { is_expected.to match(/\d+\.\d+\.\d+/) }
  end

  describe 'the Terraform state file' do
    #require 'pry'; binding.pry; #uncomment to jump into the debugger

    outputs = tf_state_json.modules[1]['outputs']
    describe 'outputs' do

      describe('trusted.iam_group_name') do
        subject { outputs['trusted.iam_group_name'] }
        it { is_expected.to eq({"sensitive" => false, "type" => "string", "value" => "AR-trusted_group_name"}) }
      end
      describe('trusted.iam_policy') do
        subject { outputs['trusted.iam_policy_name'] }
        it { is_expected.to eq({"sensitive" => false, "type" => "string", "value" => "AR-trusted_group_name"}) }
      end

    end

  end

end
