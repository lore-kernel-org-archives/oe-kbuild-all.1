Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611E20E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692209988; x=1723745988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AphTBFZxYjCwb48i+6/WlDHUQlIqL6ShmmEu8Zh/m4s=;
  b=gmCmHgFsWA/yE4/spgx9iquAxscPtzeyiEsPtwgBniF2CcsCfYUHhC1y
   GfiO/WPLqYqVC9dp7IIg0o6fdBxn/lhFZiLcS1WiIT544xLq6RQzuXAH/
   kzgYClLuAg1t43H7Kuz2PszghOgRbAsJsKuGt1pGqoR3S5FdG46pPZ0zl
   RsVlWBNRxQJsFgTHsG669/T/elavhmcIRG4+H0+a7GJJUzUwfd4+2vroO
   8nx6iq2jOAfT3+JMJIvqUtUMth89W30favVNsCxDJSXZznZVsK/TSnX3k
   zuAcvuMuQ/m/7T8PFhLM7/xBRdKLW+c5Z0q01NnKCxXUIZ+P/rZsGskeU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370074717"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="370074717"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 11:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848577127"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="848577127"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 11:19:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWL7R-0000UX-00;
	Wed, 16 Aug 2023 18:19:45 +0000
Date: Thu, 17 Aug 2023 02:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <imagedong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 1605/10518] net/bpf/test_run.c:568:17: warning:
 no previous declaration for 'bpf_modify_return_test2'
Message-ID: <202308170206.fZG3V1Gy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef66bf8aeb91fd331cf8f5dca8f9d7bca9ab2849
commit: 5e9cf77d81f9ba51019157dc55a3b73dc89a7cf4 [1605/10518] selftests/bpf: add testcase for TRACING with 6+ arguments
config: x86_64-randconfig-r032-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170206.fZG3V1Gy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170206.fZG3V1Gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170206.fZG3V1Gy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/bpf/test_run.c:508:17: warning: no previous declaration for 'bpf_fentry_test1' [-Wmissing-declarations]
    __bpf_kfunc int bpf_fentry_test1(int a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:514:14: warning: no previous declaration for 'bpf_fentry_test2' [-Wmissing-declarations]
    int noinline bpf_fentry_test2(int a, u64 b)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:519:14: warning: no previous declaration for 'bpf_fentry_test3' [-Wmissing-declarations]
    int noinline bpf_fentry_test3(char a, int b, u64 c)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:524:14: warning: no previous declaration for 'bpf_fentry_test4' [-Wmissing-declarations]
    int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:529:14: warning: no previous declaration for 'bpf_fentry_test5' [-Wmissing-declarations]
    int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:534:14: warning: no previous declaration for 'bpf_fentry_test6' [-Wmissing-declarations]
    int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:543:14: warning: no previous declaration for 'bpf_fentry_test7' [-Wmissing-declarations]
    int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:548:14: warning: no previous declaration for 'bpf_fentry_test8' [-Wmissing-declarations]
    int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                 ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:553:17: warning: no previous declaration for 'bpf_fentry_test9' [-Wmissing-declarations]
    __bpf_kfunc u32 bpf_fentry_test9(u32 *a)
                    ^~~~~~~~~~~~~~~~
   net/bpf/test_run.c:558:15: warning: no previous declaration for 'bpf_fentry_test_sinfo' [-Wmissing-declarations]
    void noinline bpf_fentry_test_sinfo(struct skb_shared_info *sinfo)
                  ^~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:562:17: warning: no previous declaration for 'bpf_modify_return_test' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test(int a, int *b)
                    ^~~~~~~~~~~~~~~~~~~~~~
>> net/bpf/test_run.c:568:17: warning: no previous declaration for 'bpf_modify_return_test2' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test2(int a, int *b, short c, int d,
                    ^~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:575:14: warning: no previous declaration for 'bpf_fentry_shadow_test' [-Wmissing-declarations]
    int noinline bpf_fentry_shadow_test(int a)
                 ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:597:18: warning: no previous declaration for 'bpf_kfunc_call_test_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:602:18: warning: no previous declaration for 'bpf_kfunc_call_memb_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_modify_return_test2 +568 net/bpf/test_run.c

   567	
 > 568	__bpf_kfunc int bpf_modify_return_test2(int a, int *b, short c, int d,
   569						void *e, char f, int g)
   570	{
   571		*b += 1;
   572		return a + *b + c + d + (long)e + f + g;
   573	}
   574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
