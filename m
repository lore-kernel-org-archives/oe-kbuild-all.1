Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4AC156D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692196223; x=1723732223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9y9ZADtpeX/OuJskabBUxZgVO4GnfcKWLv/n5Yz7cqQ=;
  b=kI+X5hfDp4QxbOuE7oqUkSl+7Z6O3lEzRykDg2zzHv4WgF0fuDGt9vo9
   1XdSDrgfSBpj+W9oMnCI4Fgq4RoFaO2GSwiMK7XpjlrlTZSapTqqlgijI
   B5GtQBIiFmG0m8ax+/ZDow9EBqglbF2FdZUcJJ1jENSDhQmkGOj/mXxAl
   vgb4SfgX0AQDrdyXiTJeICjTuI4w1cK5KDuylSTx0voMdUW1h1ZAw3NwW
   YL0Scg2QojlCYlK/uIrzkvBWMoAphAYe8j4ME1JJ8ZY/Y3amtL3hB56bj
   DEIsZXn3JZjSIIRboCv9qbOJVGSiabQ9jO3DG23HTvIjKj9LeSU0TAnLo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362699339"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="362699339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 07:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727763258"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="727763258"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Aug 2023 07:29:59 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWHX4-0000Mz-2r;
	Wed, 16 Aug 2023 14:29:58 +0000
Date: Wed, 16 Aug 2023 22:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [linux-next:master 470/10518] net/bpf/test_run.c:558:15: warning: no
 previous declaration for 'bpf_fentry_test_sinfo'
Message-ID: <202308162234.Y7j8JEIF-lkp@intel.com>
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
commit: 2597a25cb865b17c1c9c2a0dcf4925e9d1a696bb [470/10518] selftests/bpf: Add test to exercise typedef walking
config: x86_64-randconfig-r032-20230816 (https://download.01.org/0day-ci/archive/20230816/202308162234.Y7j8JEIF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162234.Y7j8JEIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162234.Y7j8JEIF-lkp@intel.com/

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
>> net/bpf/test_run.c:558:15: warning: no previous declaration for 'bpf_fentry_test_sinfo' [-Wmissing-declarations]
    void noinline bpf_fentry_test_sinfo(struct skb_shared_info *sinfo)
                  ^~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:562:17: warning: no previous declaration for 'bpf_modify_return_test' [-Wmissing-declarations]
    __bpf_kfunc int bpf_modify_return_test(int a, int *b)
                    ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:568:14: warning: no previous declaration for 'bpf_fentry_shadow_test' [-Wmissing-declarations]
    int noinline bpf_fentry_shadow_test(int a)
                 ^~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:590:18: warning: no previous declaration for 'bpf_kfunc_call_test_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bpf/test_run.c:595:18: warning: no previous declaration for 'bpf_kfunc_call_memb_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_fentry_test_sinfo +558 net/bpf/test_run.c

   557	
 > 558	void noinline bpf_fentry_test_sinfo(struct skb_shared_info *sinfo)
   559	{
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
