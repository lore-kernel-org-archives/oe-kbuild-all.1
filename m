Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B7156C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694463042; x=1725999042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xWLHe7NkDlXoKQHWTZn+No1mBECYYmu9UVDtprxQS8=;
  b=oEQjj1+iJZHFPVHjyktkv2mtZE3dyoBdON5Un665Bn3cDlb8CfSC3DDq
   BvZXsyVFwV363L35ouaIskYERJaUBjdh+EZ3rI+SQqyT9Bt8diZeaUG6v
   k2ztZ2SQJnNwoOe48Y9I+Eqwi8Q2WO0rsEceB9hs3yZ/iYFSSnJ/J/pCs
   qP8cv/CizV/7+rgtYhb1YSnb5kK+CnkthnOC5eyQltHIH2tx5drgulHFp
   vlKn5BwCZjX103k7Lme/oJ1kdHX/bY53pRCAJ1WO+xLh72L27WP32VXTL
   VDkt1geAGcbevmGotGeI7Vz1njofiiEReYSQjzEtho6zdKLvME5CSWKoI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409152624"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="409152624"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 13:10:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="746579510"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="746579510"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2023 13:10:39 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfnEz-0006gq-0z;
	Mon, 11 Sep 2023 20:10:37 +0000
Date: Tue, 12 Sep 2023 04:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: net/bpf/test_run.c:563:14: warning: no previous declaration for
 'bpf_fentry_shadow_test'
Message-ID: <202309120423.DpcjZ6lB-lkp@intel.com>
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
commit: aa3d65de4b9004d799f97700751a86d3ebd7d5f9 bpf/selftests: Test fentry attachment to shadowed functions
date:   6 months ago
config: x86_64-randconfig-002-20230910 (https://download.01.org/0day-ci/archive/20230912/202309120423.DpcjZ6lB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120423.DpcjZ6lB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120423.DpcjZ6lB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/bpf/test_run.c:489:17: warning: no previous declaration for 'bpf_fentry_test1' [-Wmissing-declarations]
    __bpf_kfunc int bpf_fentry_test1(int a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:495:14: warning: no previous declaration for 'bpf_fentry_test2' [-Wmissing-declarations]
    int noinline bpf_fentry_test2(int a, u64 b)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:500:14: warning: no previous declaration for 'bpf_fentry_test3' [-Wmissing-declarations]
    int noinline bpf_fentry_test3(char a, int b, u64 c)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:505:14: warning: no previous declaration for 'bpf_fentry_test4' [-Wmissing-declarations]
    int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:510:14: warning: no previous declaration for 'bpf_fentry_test5' [-Wmissing-declarations]
    int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:515:14: warning: no previous declaration for 'bpf_fentry_test6' [-Wmissing-declarations]
    int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:524:14: warning: no previous declaration for 'bpf_fentry_test7' [-Wmissing-declarations]
    int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:529:14: warning: no previous declaration for 'bpf_fentry_test8' [-Wmissing-declarations]
    int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:534:17: warning: no previous declaration for 'bpf_modify_return_test' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test(int a, int *b)
                    ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:540:17: warning: no previous declaration for 'bpf_kfunc_call_test1' [-Wmissing-declarations]
    __bpf_kfunc u64 bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
                    ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:545:17: warning: no previous declaration for 'bpf_kfunc_call_test2' [-Wmissing-declarations]
    __bpf_kfunc int bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
                    ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:550:26: warning: no previous declaration for 'bpf_kfunc_call_test3' [-Wmissing-declarations]
    __bpf_kfunc struct sock *bpf_kfunc_call_test3(struct sock *sk)
                             ^~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:555:15: warning: no previous declaration for 'bpf_kfunc_call_test4' [-Wmissing-declarations]
    long noinline bpf_kfunc_call_test4(signed char a, short b, int c, long d)
                  ^~~~~~~~~~~~~~~~~~~~
>> net/bpf/test_run.c:563:14: warning: no previous declaration for 'bpf_fentry_shadow_test' [-Wmissing-declarations]
    int noinline bpf_fentry_shadow_test(int a)
                 ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:593:1: warning: no previous declaration for 'bpf_kfunc_call_test_acquire' [-Wmissing-declarations]
    bpf_kfunc_call_test_acquire(unsigned long *scalar_ptr)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:600:1: warning: no previous declaration for 'bpf_kfunc_call_memb_acquire' [-Wmissing-declarations]
    bpf_kfunc_call_memb_acquire(void)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:606:18: warning: no previous declaration for 'bpf_kfunc_call_test_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:614:18: warning: no previous declaration for 'bpf_kfunc_call_memb_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:618:18: warning: no previous declaration for 'bpf_kfunc_call_memb1_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:631:18: warning: no previous declaration for 'bpf_kfunc_call_test_get_rdwr_mem' [-Wmissing-declarations]
    __bpf_kfunc int *bpf_kfunc_call_test_get_rdwr_mem(struct prog_test_ref_kfunc *p,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:637:18: warning: no previous declaration for 'bpf_kfunc_call_test_get_rdonly_mem' [-Wmissing-declarations]
    __bpf_kfunc int *bpf_kfunc_call_test_get_rdonly_mem(struct prog_test_ref_kfunc *p,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:648:18: warning: no previous declaration for 'bpf_kfunc_call_test_acq_rdonly_mem' [-Wmissing-declarations]
    __bpf_kfunc int *bpf_kfunc_call_test_acq_rdonly_mem(struct prog_test_ref_kfunc *p,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:654:18: warning: no previous declaration for 'bpf_kfunc_call_int_mem_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_int_mem_release(int *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:659:1: warning: no previous declaration for 'bpf_kfunc_call_test_kptr_get' [-Wmissing-declarations]
    bpf_kfunc_call_test_kptr_get(struct prog_test_ref_kfunc **pp, int a, int b)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:707:18: warning: no previous declaration for 'bpf_kfunc_call_test_pass_ctx' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:711:18: warning: no previous declaration for 'bpf_kfunc_call_test_pass1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:715:18: warning: no previous declaration for 'bpf_kfunc_call_test_pass2' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:719:18: warning: no previous declaration for 'bpf_kfunc_call_test_fail1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:723:18: warning: no previous declaration for 'bpf_kfunc_call_test_fail2' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:727:18: warning: no previous declaration for 'bpf_kfunc_call_test_fail3' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:731:18: warning: no previous declaration for 'bpf_kfunc_call_test_mem_len_pass1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:735:18: warning: no previous declaration for 'bpf_kfunc_call_test_mem_len_fail1' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:739:18: warning: no previous declaration for 'bpf_kfunc_call_test_mem_len_fail2' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail2(u64 *mem, int len)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:743:18: warning: no previous declaration for 'bpf_kfunc_call_test_ref' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_ref(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:748:18: warning: no previous declaration for 'bpf_kfunc_call_test_destructive' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_destructive(void)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_fentry_shadow_test +563 net/bpf/test_run.c

   544	
 > 545	__bpf_kfunc int bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
   546	{
   547		return a + b;
   548	}
   549	
   550	__bpf_kfunc struct sock *bpf_kfunc_call_test3(struct sock *sk)
   551	{
   552		return sk;
   553	}
   554	
   555	long noinline bpf_kfunc_call_test4(signed char a, short b, int c, long d)
   556	{
   557		/* Provoke the compiler to assume that the caller has sign-extended a,
   558		 * b and c on platforms where this is required (e.g. s390x).
   559		 */
   560		return (long)a + (long)b + (long)c + d;
   561	}
   562	
 > 563	int noinline bpf_fentry_shadow_test(int a)
   564	{
   565		return a + 1;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
