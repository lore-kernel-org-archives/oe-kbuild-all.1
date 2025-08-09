Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB72BE65A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754759705; cv=none; b=C1HIiRvkoXWfxmPS3wrZoedvhTvICSActkjlFpXU2YNXOrXuQWmsadOy1Xhrv98jS2L7Cf2slVdROVVR9AEX93cLxkIxdkwezat+2N3k9mMS/yzMbpbQaZQ4drHDtAkmxSBreQD/YKZaEOknZYj/4FPwgA6N6B22BFfkgbVtoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754759705; c=relaxed/simple;
	bh=EKwmNvXGq4jGxkDfb8FV5j3ls0LBberwsTvG2zDmb+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbvSuy56LIed9zcn0arbZzPyc3u/zXDexjDVeXLUpi4bUVPGrtzhDXHVav+I23o6cOWTSIGVeb/HI1zdujgF8DIPp1mDoggquJ3EkPKx7vG9gOtmIIt7Hd38t9GeDYEaXLP8ktPR5coh2CasALgVp/hNgcGRftCrvjfIeEnWkbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnDAK1w6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnDAK1w6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754759703; x=1786295703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKwmNvXGq4jGxkDfb8FV5j3ls0LBberwsTvG2zDmb+s=;
  b=AnDAK1w6bAb47u6JvBVwD632c2WtGP0hU6rcCkY/XyRTyKLHYqocjpV4
   KPE/qJiMKTbJIX2ytxbo/Darxx/K/y6MQ/QPTY3Nz9Gr6qDFR+kpbZig0
   ssrEMwQebZtyhQJ6i9QglBync2ynMQiHjTQJJB+sxP/vtSbh0HBe8zdi2
   xgagjIb0S0TKdHFkE38BC8oc3aaSuCnUgFeRcy/0Zt3HJQjUFPPVRyAvH
   BufVBeO4THEXxxXJS8MXpfL5RTmq5LUvgLjpbptFBvcfHNYdCtA909gnd
   2wCyDM3dNIa1zl95dLuTFXtsKz9H/cafKgMTW97cVM12I9DnGxmbF+I+L
   g==;
X-CSE-ConnectionGUID: IRaxSCL5Qyyyj1MSJJDdRg==
X-CSE-MsgGUID: i6r47iuiQrq9qBXHokbWig==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="56952093"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56952093"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 10:15:03 -0700
X-CSE-ConnectionGUID: iVZ9KTOAQ6q3XywZVluS2A==
X-CSE-MsgGUID: 14VP4FPJR9iVxpXlx5STKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165874954"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Aug 2025 10:15:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukn9n-0004xK-1q;
	Sat, 09 Aug 2025 17:14:59 +0000
Date: Sun, 10 Aug 2025 01:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 4/42]
 include/linux/rcupdate.h:541:11: error: dereferencing pointer to incomplete
 type 'struct selinux_policy'
Message-ID: <202508100112.MimdLqFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   5ae6bb1e8738f77faaddd063db4fe0af6b588e3a
commit: e17b52704f6838291c5bf253589b40d1f5cd0d13 [4/42] selinux: dynamically allocate selinux namespace
config: parisc-randconfig-r122-20250809 (https://download.01.org/0day-ci/archive/20250810/202508100112.MimdLqFi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250810/202508100112.MimdLqFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508100112.MimdLqFi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from security/selinux/hooks.c:29:
   security/selinux/hooks.c: In function 'selinux_state_free':
>> include/linux/rcupdate.h:541:11: error: dereferencing pointer to incomplete type 'struct selinux_policy'
     ((typeof(*p) __force __kernel *)(p)); \
              ^
   include/linux/rcupdate.h:743:2: note: in expansion of macro '__rcu_dereference_protected'
     __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:7795:12: note: in expansion of macro 'rcu_dereference_protected'
      policy = rcu_dereference_protected(state->policy,
               ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +541 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  522  
24ba53017e188e Chun-Hung Tseng         2021-09-15  523  #define __rcu_access_pointer(p, local, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  524  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  525  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  526) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  527  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  528  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  529  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  530  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  531  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  532  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  533  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  534) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  535  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  536  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  537  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  538  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  539  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  540) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28 @541  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  542  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  543  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  544  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  545  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  546  	typeof(p) local = READ_ONCE(p); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  547  	((typeof(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  548  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  549  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  550  

:::::: The code at line 541 was first introduced by commit
:::::: ca5ecddfa8fcbd948c95530e7e817cee9fb43a3d rcu: define __rcu address space modifier for sparse

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
