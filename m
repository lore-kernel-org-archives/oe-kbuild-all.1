Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE351101
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680918382; x=1712454382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTllOcRgXCGgoYRmViEydJP6s7jnQ95qAdam0UY3g/4=;
  b=nAdt+RXzKotsD8FnEUXjwSKtfLT5VdtDlxPA27FDVGLA4oyoXM36SPe5
   oZLx1qiMU0VYJo5jOw35Jdnd7tAEqJWHSCzc5y8rjdPgNGz1Apw6/BgFc
   NycqTDg7yheMbELvjKoZA4gkIbM2fFV1/He23XAR2q4GHUarRCnSKWfeY
   IxSMmEMlv7bB1iICfPFHT+1B0NgQtYEzzkW+m9bjAiMd5bKj7PR4ScaGQ
   eWTDlIuGfFiQ0X73uKuKMgcaKVgL9QMXWCy3zIlcdCCJmjNiGHj6Sm7Jm
   mbRhKXPzXpLrhbkV/elIop6tVCm7TsIgpuUotJXurGLnYx4uPI9L22Bwq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344877348"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="344877348"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 18:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="665071606"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="665071606"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 18:46:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkxel-000T8l-0O;
	Sat, 08 Apr 2023 01:46:19 +0000
Date: Sat, 8 Apr 2023 09:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 1636/9787]
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:68:17: warning: no
 previous prototype for 'bpf_iter_testmod_seq_new'
Message-ID: <202304080951.l14IDv3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: 7e86a8c4ac8d5dcf7dd58f5a4779d1a6ff0a827d [1636/9787] selftests/bpf: implement and test custom testmod_seq iterator
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7e86a8c4ac8d5dcf7dd58f5a4779d1a6ff0a827d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7e86a8c4ac8d5dcf7dd58f5a4779d1a6ff0a827d
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080951.l14IDv3n-lkp@intel.com/

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
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:68:17: warning: no previous prototype for 'bpf_iter_testmod_seq_new' [-Wmissing-prototypes]
      68 | __bpf_kfunc int bpf_iter_testmod_seq_new(struct bpf_iter_testmod_seq *it, s64 value, int cnt)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:81:18: warning: no previous prototype for 'bpf_iter_testmod_seq_next' [-Wmissing-prototypes]
      81 | __bpf_kfunc s64 *bpf_iter_testmod_seq_next(struct bpf_iter_testmod_seq* it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:91:18: warning: no previous prototype for 'bpf_iter_testmod_seq_destroy' [-Wmissing-prototypes]
      91 | __bpf_kfunc void bpf_iter_testmod_seq_destroy(struct bpf_iter_testmod_seq *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:109:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_1' [-Wmissing-prototypes]
     109 | bpf_testmod_test_btf_type_tag_user_1(struct bpf_testmod_btf_type_tag_1 __user *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:117:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_2' [-Wmissing-prototypes]
     117 | bpf_testmod_test_btf_type_tag_user_2(struct bpf_testmod_btf_type_tag_2 *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:122:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_1' [-Wmissing-prototypes]
     122 | bpf_testmod_test_btf_type_tag_percpu_1(struct bpf_testmod_btf_type_tag_1 __percpu *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:127:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_2' [-Wmissing-prototypes]
     127 | bpf_testmod_test_btf_type_tag_percpu_2(struct bpf_testmod_btf_type_tag_3 *arg) {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:131:14: warning: no previous prototype for 'bpf_testmod_loop_test' [-Wmissing-prototypes]
     131 | noinline int bpf_testmod_loop_test(int n)
         |              ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:143:30: warning: no previous prototype for 'bpf_testmod_return_ptr' [-Wmissing-prototypes]
     143 | __weak noinline struct file *bpf_testmod_return_ptr(int arg)
         |                              ^~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:159:14: warning: no previous prototype for 'bpf_testmod_fentry_test1' [-Wmissing-prototypes]
     159 | noinline int bpf_testmod_fentry_test1(int a)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:164:14: warning: no previous prototype for 'bpf_testmod_fentry_test2' [-Wmissing-prototypes]
     164 | noinline int bpf_testmod_fentry_test2(int a, u64 b)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:169:14: warning: no previous prototype for 'bpf_testmod_fentry_test3' [-Wmissing-prototypes]
     169 | noinline int bpf_testmod_fentry_test3(char a, int b, u64 c)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:177:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
     177 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:228:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
     228 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_testmod_seq_new +68 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c

    67	
  > 68	__bpf_kfunc int bpf_iter_testmod_seq_new(struct bpf_iter_testmod_seq *it, s64 value, int cnt)
    69	{
    70		if (cnt < 0) {
    71			it->cnt = 0;
    72			return -EINVAL;
    73		}
    74	
    75		it->value = value;
    76		it->cnt = cnt;
    77	
    78		return 0;
    79	}
    80	
  > 81	__bpf_kfunc s64 *bpf_iter_testmod_seq_next(struct bpf_iter_testmod_seq* it)
    82	{
    83		if (it->cnt <= 0)
    84			return NULL;
    85	
    86		it->cnt--;
    87	
    88		return &it->value;
    89	}
    90	
  > 91	__bpf_kfunc void bpf_iter_testmod_seq_destroy(struct bpf_iter_testmod_seq *it)
    92	{
    93		it->cnt = 0;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
