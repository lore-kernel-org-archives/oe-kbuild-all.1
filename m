Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA6322A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 23:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680735871; x=1712271871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFp4m96fnacZ3JCiIXdl8tovzsb6+a+6LACIVJs3xME=;
  b=TFciDEOnZWX20GHgWcDu9uirgVUL0pKJ19MTsOX6ATEKUaXlKtiS0WS1
   niVrO9xFRI1xLc8jCOQ/o/m9uKhCFs0K3wBdEYhWa5BbEpvinVKv0Qp4P
   PLakEUPWyzPV10uhUzmnvl5vtMDKNU3Qf13ddpekf0czy5luf+UcGAH4U
   ciN80xgbenGek3IpKpxyhZ7mpTZC+im9s3oN0zXcTveGs0qvu8WaNWkBx
   kzIrlAcnND/rytshAYwrMPWR0Db1QWxATYs1EnYAhDYSQS1jNRf2Cf+L2
   Qxy6kBG3LOdSlj8viA9XX2uvyJgU6GbjXb6wpwhglshXw+Or+z1InCrui
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405373439"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="405373439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 16:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830538523"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="830538523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2023 16:04:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkCB2-000Qsc-1w;
	Wed, 05 Apr 2023 23:04:28 +0000
Date: Thu, 6 Apr 2023 07:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:131:14:
 warning: no previous prototype for 'bpf_testmod_fentry_test1'
Message-ID: <202304060622.P2hBPE4g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99ddf2254febae9eab7fb0bcc02c5322243f5c49
commit: fee356ede980b6c2c8db612e18b25738356d6744 selftests/bpf: Add bpf_testmod_fentry_* functions
date:   5 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fee356ede980b6c2c8db612e18b25738356d6744
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fee356ede980b6c2c8db612e18b25738356d6744
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060622.P2hBPE4g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:32:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_1' [-Wmissing-prototypes]
      32 | bpf_testmod_test_struct_arg_1(struct bpf_testmod_struct_arg_2 a, int b, int c) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:38:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_2' [-Wmissing-prototypes]
      38 | bpf_testmod_test_struct_arg_2(int a, struct bpf_testmod_struct_arg_2 b, int c) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:44:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_3' [-Wmissing-prototypes]
      44 | bpf_testmod_test_struct_arg_3(int a, int b, struct bpf_testmod_struct_arg_2 c) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:50:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_4' [-Wmissing-prototypes]
      50 | bpf_testmod_test_struct_arg_4(struct bpf_testmod_struct_arg_1 a, int b,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:57:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_5' [-Wmissing-prototypes]
      57 | bpf_testmod_test_struct_arg_5(void) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:63:1: warning: no previous prototype for 'bpf_testmod_test_mod_kfunc' [-Wmissing-prototypes]
      63 | bpf_testmod_test_mod_kfunc(int i)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:81:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_1' [-Wmissing-prototypes]
      81 | bpf_testmod_test_btf_type_tag_user_1(struct bpf_testmod_btf_type_tag_1 __user *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:89:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_2' [-Wmissing-prototypes]
      89 | bpf_testmod_test_btf_type_tag_user_2(struct bpf_testmod_btf_type_tag_2 *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:94:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_1' [-Wmissing-prototypes]
      94 | bpf_testmod_test_btf_type_tag_percpu_1(struct bpf_testmod_btf_type_tag_1 __percpu *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:99:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_2' [-Wmissing-prototypes]
      99 | bpf_testmod_test_btf_type_tag_percpu_2(struct bpf_testmod_btf_type_tag_3 *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:103:14: warning: no previous prototype for 'bpf_testmod_loop_test' [-Wmissing-prototypes]
     103 | noinline int bpf_testmod_loop_test(int n)
         |              ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:115:30: warning: no previous prototype for 'bpf_testmod_return_ptr' [-Wmissing-prototypes]
     115 | __weak noinline struct file *bpf_testmod_return_ptr(int arg)
         |                              ^~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:131:14: warning: no previous prototype for 'bpf_testmod_fentry_test1' [-Wmissing-prototypes]
     131 | noinline int bpf_testmod_fentry_test1(int a)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:136:14: warning: no previous prototype for 'bpf_testmod_fentry_test2' [-Wmissing-prototypes]
     136 | noinline int bpf_testmod_fentry_test2(int a, u64 b)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:141:14: warning: no previous prototype for 'bpf_testmod_fentry_test3' [-Wmissing-prototypes]
     141 | noinline int bpf_testmod_fentry_test3(char a, int b, u64 c)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:149:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
     149 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:200:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
     200 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_testmod_fentry_test1 +131 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c

   130	
 > 131	noinline int bpf_testmod_fentry_test1(int a)
   132	{
   133		return a + 1;
   134	}
   135	
 > 136	noinline int bpf_testmod_fentry_test2(int a, u64 b)
   137	{
   138		return a + b;
   139	}
   140	
 > 141	noinline int bpf_testmod_fentry_test3(char a, int b, u64 c)
   142	{
   143		return a + b + c;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
