Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80F20F9B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689183909; x=1720719909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocNzKGLwg8b+WRsaskM6lhr/53my5cRy9s8DEQ1zhzU=;
  b=ime+e6TVwjxVkW/oUyB0+gwNlTHC23W+Ju6Wvjk3eizuq+1fRZexgWp6
   Gf1UvHp43xN3LNlwpCi3Q6Jcsd4qUThBiT5yiVAHpod5JVdrHhRVCL44i
   cspmgGSAVJt8fWAvBcAPhUUA1P8YaActh4xJeqPr4lN9iG5kUNnKg8ohl
   u4343pX2l90eL0rF4aSwPKBjOPmcTEctewlGW/lBMF0USbPj2tXaUx6LF
   JafQ3nF7ljTbJrc5U5CmxCnN+2axuaQDU2Z0jYIca/hI4TEeoOFLsrtKI
   Q5glNe8454qhtv73SXz7kTcLSRMlVqfwDod7HQQTMpIKIP1GQiFO2mHME
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="451321429"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="451321429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 10:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="791705551"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="791705551"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 10:45:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJdtf-0005tN-1F;
	Wed, 12 Jul 2023 17:45:03 +0000
Date: Thu, 13 Jul 2023 01:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/defer-free 2/2] net/core/dev.c:6567:35: warning:
 variable 'new' set but not used
Message-ID: <202307130106.yb3DuxON-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux net/defer-free
head:   bc14c0e28995a8d2a7c5c481a90973553861cbe2
commit: bc14c0e28995a8d2a7c5c481a90973553861cbe2 [2/2] net/core: optimise ipi_schedule checks
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230713/202307130106.yb3DuxON-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130106.yb3DuxON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130106.yb3DuxON-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/loongarch/include/asm/bitops.h:27,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:5,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c: In function 'skb_defer_free_flush':
   include/linux/atomic/atomic-arch-fallback.h:326:14: error: void value not ignored as it ought to be
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^
   include/linux/atomic/atomic-instrumented.h:4914:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4914 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   net/core/dev.c:6576:19: note: in expansion of macro 'try_cmpxchg128'
    6576 |         } while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
         |                   ^~~~~~~~~~~~~~
>> net/core/dev.c:6567:35: warning: variable 'new' set but not used [-Wunused-but-set-variable]
    6567 |         softnet_defer_list_t old, new = {};
         |                                   ^~~


vim +/new +6567 net/core/dev.c

29863d41bb6e1d Wei Wang       2021-02-08  6564  
e6f50edfef046c Eric Dumazet   2023-04-21  6565  static void skb_defer_free_flush(struct softnet_data *sd)
e6f50edfef046c Eric Dumazet   2023-04-21  6566  {
c3205b3c22a6b7 Pavel Begunkov 2023-07-10 @6567  	softnet_defer_list_t old, new = {};
e6f50edfef046c Eric Dumazet   2023-04-21  6568  	struct sk_buff *skb, *next;
e6f50edfef046c Eric Dumazet   2023-04-21  6569  
c3205b3c22a6b7 Pavel Begunkov 2023-07-10  6570  	if (!READ_ONCE(sd->defer.list))
e6f50edfef046c Eric Dumazet   2023-04-21  6571  		return;
e6f50edfef046c Eric Dumazet   2023-04-21  6572  
c3205b3c22a6b7 Pavel Begunkov 2023-07-10  6573  	old = __READ_ONCE(sd->defer);
bc14c0e28995a8 Pavel Begunkov 2023-07-10  6574  	do {
bc14c0e28995a8 Pavel Begunkov 2023-07-10  6575  		new.ipi_scheduled  = old.ipi_scheduled;
bc14c0e28995a8 Pavel Begunkov 2023-07-10 @6576  	} while (!try_cmpxchg128(&sd->defer.full, &old.full, new.full));
e6f50edfef046c Eric Dumazet   2023-04-21  6577  
c3205b3c22a6b7 Pavel Begunkov 2023-07-10  6578  	skb = old.list;
e6f50edfef046c Eric Dumazet   2023-04-21  6579  	while (skb != NULL) {
e6f50edfef046c Eric Dumazet   2023-04-21  6580  		next = skb->next;
e6f50edfef046c Eric Dumazet   2023-04-21  6581  		napi_consume_skb(skb, 1);
e6f50edfef046c Eric Dumazet   2023-04-21  6582  		skb = next;
e6f50edfef046c Eric Dumazet   2023-04-21  6583  	}
e6f50edfef046c Eric Dumazet   2023-04-21  6584  }
e6f50edfef046c Eric Dumazet   2023-04-21  6585  

:::::: The code at line 6567 was first introduced by commit
:::::: c3205b3c22a6b7d0147dd98c1c0a4888436efe73 net/core: lockless defer free

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Pavel Begunkov <asml.silence@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
