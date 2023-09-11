Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E178F5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 22:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694471402; x=1726007402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3++CjOf2MVTvcPtX0zR2JaAhxR5J8g/jqdMUdvOsaI=;
  b=UmcnF0YCCe3xK9DOogCctnvr1zKBly7tLrUQSU8opFBnOabCnyjWJT7n
   cSTkcHH3NMrQx2osu2nGnMv1VuRzqVhdw0IHzaP2vJEhJXMWGxDBXDkC0
   7tU/HSfCrnFFrhYSd9NKPaHTFtTpv8b6TEhQgArRiKnDNOJYYEz13Vr6b
   5UxiQSp/fpHIfRCrcPus34F7gozx17w4UAlpjSoPRG6GrFFCFwPdCGptp
   C46rniWslC/G884mRfmRuzQU2f1rEUEtqOdRQJfPHMrTk4Qo1cMbggu+b
   3v/5Dt1VlhYT2vYIdtcYBx1DQXRjfbAxOlE0/ragJAjIUv1qMlvsj+3lw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368476014"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="368476014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 15:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886712308"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="886712308"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2023 15:29:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfpPh-0006oQ-1Y;
	Mon, 11 Sep 2023 22:29:49 +0000
Date: Tue, 12 Sep 2023 06:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Zhou <zhoufeng.zf@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Chengming Zhou <zhouchengming@bytedance.com>
Subject: net/bpf/test_run.c:544:17: warning: no previous declaration for
 'bpf_fentry_test9'
Message-ID: <202309120606.EpVb64D5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 75dcef8d3609d0b1d3497d6ed4809096513e0b83 selftests/bpf: Add test to access u32 ptr argument in tracing program
date:   5 months ago
config: x86_64-randconfig-002-20230910 (https://download.01.org/0day-ci/archive/20230912/202309120606.EpVb64D5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120606.EpVb64D5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120606.EpVb64D5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/bpf/test_run.c:499:17: warning: no previous declaration for 'bpf_fentry_test1' [-Wmissing-declarations]
    __bpf_kfunc int bpf_fentry_test1(int a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:505:14: warning: no previous declaration for 'bpf_fentry_test2' [-Wmissing-declarations]
    int noinline bpf_fentry_test2(int a, u64 b)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:510:14: warning: no previous declaration for 'bpf_fentry_test3' [-Wmissing-declarations]
    int noinline bpf_fentry_test3(char a, int b, u64 c)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:515:14: warning: no previous declaration for 'bpf_fentry_test4' [-Wmissing-declarations]
    int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:520:14: warning: no previous declaration for 'bpf_fentry_test5' [-Wmissing-declarations]
    int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:525:14: warning: no previous declaration for 'bpf_fentry_test6' [-Wmissing-declarations]
    int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:534:14: warning: no previous declaration for 'bpf_fentry_test7' [-Wmissing-declarations]
    int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:539:14: warning: no previous declaration for 'bpf_fentry_test8' [-Wmissing-declarations]
    int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
>> net/bpf/test_run.c:544:17: warning: no previous declaration for 'bpf_fentry_test9' [-Wmissing-declarations]
    __bpf_kfunc u32 bpf_fentry_test9(u32 *a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:549:17: warning: no previous declaration for 'bpf_modify_return_test' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test(int a, int *b)
                    ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:555:17: warning: no previous declaration for 'bpf_kfunc_call_test1' [-Wmissing-declarations]
    __bpf_kfunc u64 bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
                    ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:560:17: warning: no previous declaration for 'bpf_kfunc_call_test2' [-Wmissing-declarations]
    __bpf_kfunc int bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
                    ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:565:26: warning: no previous declaration for 'bpf_kfunc_call_test3' [-Wmissing-declarations]
    __bpf_kfunc struct sock *bpf_kfunc_call_test3(struct sock *sk)
                             ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:570:15: warning: no previous declaration for 'bpf_kfunc_call_test4' [-Wmissing-declarations]
    long noinline bpf_kfunc_call_test4(signed char a, short b, int c, long d)
                  ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:578:14: warning: no previous declaration for 'bpf_fentry_shadow_test' [-Wmissing-declarations]
    int noinline bpf_fentry_shadow_test(int a)
                 ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:608:1: warning: no previous declaration for 'bpf_kfunc_call_test_acquire' [-Wmissing-declarations]
    bpf_kfunc_call_test_acquire(unsigned long *scalar_ptr)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:614:18: warning: no previous declaration for 'bpf_kfunc_call_test_offset' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_offset(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:620:1: warning: no previous declaration for 'bpf_kfunc_call_memb_acquire' [-Wmissing-declarations]
    bpf_kfunc_call_memb_acquire(void)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:626:18: warning: no previous declaration for 'bpf_kfunc_call_test_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:631:18: warning: no previous declaration for 'bpf_kfunc_call_memb_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:635:18: warning: no previous declaration for 'bpf_kfunc_call_memb1_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:648:18: warning: no previous declaration for 'bpf_kfunc_call_test_get_rdwr_mem' [-Wmissing-declarations]
    __bpf_kfunc int *bpf_kfunc_call_test_get_rdwr_mem(struct prog_test_ref_kfunc *p,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:654:18: warning: no previous declaration for 'bpf_kfunc_call_test_get_rdonly_mem' [-Wmissing-declarations]
    __bpf_kfunc int *bpf_kfunc_call_test_get_rdonly_mem(struct prog_test_ref_kfunc *p,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:665:18: warning: no previous declaration for 'bpf_kfunc_call_test_acq_rdonly_mem' [-Wmissing-declarations]
    __bpf_kfunc int *bpf_kfunc_call_test_acq_rdonly_mem(struct prog_test_ref_kfunc *p,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:671:18: warning: no previous declaration for 'bpf_kfunc_call_int_mem_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_int_mem_release(int *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:676:1: warning: no previous declaration for 'bpf_kfunc_call_test_kptr_get' [-Wmissing-declarations]
    bpf_kfunc_call_test_kptr_get(struct prog_test_ref_kfunc **pp, int a, int b)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:724:18: warning: no previous declaration for 'bpf_kfunc_call_test_pass_ctx' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:728:18: warning: no previous declaration for 'bpf_kfunc_call_test_pass1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:732:18: warning: no previous declaration for 'bpf_kfunc_call_test_pass2' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:736:18: warning: no previous declaration for 'bpf_kfunc_call_test_fail1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:740:18: warning: no previous declaration for 'bpf_kfunc_call_test_fail2' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:744:18: warning: no previous declaration for 'bpf_kfunc_call_test_fail3' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:748:18: warning: no previous declaration for 'bpf_kfunc_call_test_mem_len_pass1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:752:18: warning: no previous declaration for 'bpf_kfunc_call_test_mem_len_fail1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:756:18: warning: no previous declaration for 'bpf_kfunc_call_test_mem_len_fail2' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail2(u64 *mem, int len)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:760:18: warning: no previous declaration for 'bpf_kfunc_call_test_ref' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_ref(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:765:18: warning: no previous declaration for 'bpf_kfunc_call_test_destructive' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_destructive(void)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_fentry_test9 +544 net/bpf/test_run.c

   543	
 > 544	__bpf_kfunc u32 bpf_fentry_test9(u32 *a)
   545	{
   546		return *a;
   547	}
   548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
