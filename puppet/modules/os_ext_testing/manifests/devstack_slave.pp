# A Jenkins slave that will execute jobs that use devstack
# to set up a full OpenStack environment for test runs.

class os_ext_testing::devstack_slave (
  $bare = true,
  $certname = $::fqdn,
  $ssh_key = '',
  $python3 = false,
  $include_pypy = false,
  $jenkins_url = '',
  $project_config_repo = '',
  $devstack_gate_3pprj_base = '',
  $devstack_gate_3pbranch = '',
) {
  class { 'os_ext_testing::base':
    project_config_repo => $project_config_repo,
  }
  include openstack_project::tmpcleanup
  class { 'jenkins::slave':
    bare         => $bare,
    ssh_key      => $ssh_key,
    python3      => $python3,
    include_pypy => $include_pypy,
    jenkins_url  => $jenkins_url,
  }
  include devstack_host
}
