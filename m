Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F8B63A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 00:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695689383; x=1727225383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEY5z3WwI+JZnMn/9qMRgDPOnxVPt+NutefCS/Bp474=;
  b=Vo+pOKMkYzGlrY+E+APMkfOeUr6mNpuf74mHmqovWOERX0T5CyRExAjY
   6tdmNb6t236WkwLoNRSJuXYUK6jvplezAG7LdlGS5Is8WHhh1A5GyzG0L
   QUHJqT5kgfdjw54YVdoGCR3Qd2DAu4oVXdUMb0QPnHdVB0TI2EEFl0eJH
   i1qYxPtZ42mcuS7hoMmzepcFXPEFA86StaVy/GRwB2V0z6im29yxgbqQx
   Q1oZHbGorl9+hlIkW+1atLn4sKw08Z8hBBrPhG7pKLNW3/gNDSSHP8jqS
   rEi+5//KUYfu4UnayVqq2+wbA1MYfNOwMEWmNyQSbaOP4XYMkKUgy+vry
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445577274"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="445577274"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 17:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751955325"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="751955325"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 17:49:40 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkwGg-0002Cr-2f;
	Tue, 26 Sep 2023 00:49:38 +0000
Date: Tue, 26 Sep 2023 08:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/xdp-multi 9/9] include/linux/rcupdate.h:436:2: error:
 passing argument 1 of 'xdp_run' from incompatible pointer type
Message-ID: <202309260804.N0xA89eh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/xdp-multi
head:   83f1483cdee8611d004ce761c31d6c3a78da1c95
commit: 83f1483cdee8611d004ce761c31d6c3a78da1c95 [9/9] poc hack
config: powerpc-randconfig-002-20230926 (https://download.01.org/0day-ci/archive/20230926/202309260804.N0xA89eh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260804.N0xA89eh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260804.N0xA89eh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/events/xdp.h:12,
                    from include/linux/bpf_trace.h:5,
                    from drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:33:
   include/net/xdp.h:494:22: warning: 'struct bpf_mprog_entry' declared inside parameter list will not be visible outside of this definition or declaration
     494 | xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
         |                      ^~~~~~~~~~~~~~~
   include/net/xdp.h: In function 'xdp_run':
   include/net/xdp.h:500:9: error: implicit declaration of function 'bpf_mprog_foreach_prog'; did you mean 'bpf_prog_lock_ro'? [-Werror=implicit-function-declaration]
     500 |         bpf_mprog_foreach_prog(entry, fp, prog) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         bpf_prog_lock_ro
   include/net/xdp.h:500:48: error: expected ';' before '{' token
     500 |         bpf_mprog_foreach_prog(entry, fp, prog) {
         |                                                ^~
         |                                                ;
   include/net/xdp.h:498:13: warning: unused variable 'ret' [-Wunused-variable]
     498 |         int ret = XDP_NEXT;
         |             ^~~
   include/net/xdp.h:510:1: error: no return statement in function returning non-void [-Werror=return-type]
     510 | }
         | ^
   include/net/xdp.h: In function 'bpf_prog_run_xdp':
   include/net/xdp.h:523:21: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     523 |                 if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
         |                     ^~~
         |                     net
   include/net/xdp.h:523:21: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:37,
                    from drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:35:
   drivers/net/ethernet/mellanox/mlx5/core/en.h: At top level:
   drivers/net/ethernet/mellanox/mlx5/core/en.h:722:33: error: field 'bundle' has incomplete type
     722 |         struct bpf_mprog_bundle bundle;
         |                                 ^~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:265:6: error: conflicting types for 'mlx5e_xdp_handle'; have 'bool(struct mlx5e_rq *, struct mlx5e_xdp_buff *)' {aka '_Bool(struct mlx5e_rq *, struct mlx5e_xdp_buff *)'}
     265 | bool mlx5e_xdp_handle(struct mlx5e_rq *rq, struct mlx5e_xdp_buff *mxbuf)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:104:6: note: previous declaration of 'mlx5e_xdp_handle' with type 'bool(struct mlx5e_rq *, struct bpf_prog *, struct mlx5e_xdp_buff *)' {aka '_Bool(struct mlx5e_rq *, struct bpf_prog *, struct mlx5e_xdp_buff *)'}
     104 | bool mlx5e_xdp_handle(struct mlx5e_rq *rq,
         |      ^~~~~~~~~~~~~~~~
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from include/linux/netdevice.h:26,
                    from include/trace/events/xdp.h:8:
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c: In function 'mlx5e_xdp_handle':
>> include/linux/rcupdate.h:436:2: error: passing argument 1 of 'xdp_run' from incompatible pointer type [-Werror=incompatible-pointer-types]
     436 | ({ \
         | ~^~~
         |  |
         |  struct bpf_mprog_entry *
     437 |         /* Dependency order vs. p above. */ \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     438 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     439 |         RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     440 |         rcu_check_sparse(p, space); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 |         ((typeof(*p) __force __kernel *)(local)); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 | })
         | ~~
   include/linux/rcupdate.h:586:9: note: in expansion of macro '__rcu_dereference_check'
     586 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:658:28: note: in expansion of macro 'rcu_dereference_check'
     658 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:271:23: note: in expansion of macro 'rcu_dereference'
     271 |         act = xdp_run(rcu_dereference(rq->xdp_active), xdp);
         |                       ^~~~~~~~~~~~~~~
   include/net/xdp.h:494:39: note: expected 'const struct bpf_mprog_entry *' but argument is of type 'struct bpf_mprog_entry *'
     494 | xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:282:56: error: 'prog' undeclared (first use in this function)
     282 |                 err = xdp_do_redirect(rq->netdev, xdp, prog);
         |                                                        ^~~~
   cc1: some warnings being treated as errors


vim +/xdp_run +436 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  428  
24ba53017e188e Chun-Hung Tseng         2021-09-15  429  #define __rcu_access_pointer(p, local, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  430  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  431  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  432) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  433  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  434  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  435  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28 @436  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  437  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  438  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  439  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  440) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  441  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  442  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  443  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  444  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  445  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  446) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  447  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  448  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  449  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  450  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  451  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  452  	typeof(p) local = READ_ONCE(p); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  453  	((typeof(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  454  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  455  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  456  

:::::: The code at line 436 was first introduced by commit
:::::: ca5ecddfa8fcbd948c95530e7e817cee9fb43a3d rcu: define __rcu address space modifier for sparse

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
