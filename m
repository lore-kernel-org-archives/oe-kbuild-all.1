Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A4274B2A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129478; cv=none; b=kuNk+l4ATzNdZ523MULiE0c7NeQskwnRuzgxHZqVAfFY4MDaYgQLQceu4D0nhx4FwM/oRP01r5/q3+Pekj1MM5AD8zIBusL9EhavqQQ1bf1zNo7Cqjq5EPOCGF/DwzSRHbyt4C8LdlWU8xmZDdiXY1jf/MqDf6L2Nh1hv26Tl4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129478; c=relaxed/simple;
	bh=1DrNaRj9pUb8mrQxz1dosdSbobDsBVbuw8Ab7mAcwT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZGcsGgaqWbe0HgHAjetyep/t5HoQbLU9PWapp9x+AZag9Iga2r1BF/usCQ2WtinLYDNcfZdx5lg6qlN1NvAEWHmFkUuKO9CcDvXStsoeNvSHA8caWOZf2OjvrDO7UyopEDN6B/x46cp/Djy6uZsQRjWdGGaV3qCgwo4+8WMubGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1KHuF2D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1KHuF2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782129477; x=1813665477;
  h=date:from:to:cc:subject:message-id;
  bh=1DrNaRj9pUb8mrQxz1dosdSbobDsBVbuw8Ab7mAcwT4=;
  b=L1KHuF2DfelUvD6bUmSVqTiK/sLAodIcbOiuZElv9pHNSfr6pgDDPGF0
   +QjhJ3pFPadmntOOBaWzeijRtKhEyzlF4uxSeMt3PhQfaD1Ab9yxjuGaw
   JtC6cf0KGe6ih7LcUvkzNxUbFe3aT9DbUkiQ5dnrCAQn2KcyppLUVx5Lg
   b2+Rp/y5XwbN0VdgYncmgEpqDX1izZ1J7/qxDKh6hcDc/3rhTmRLsFlTx
   T3lZKOdQypvvcjx4WMKtdP7fVPSw4dqlft2milK67mJj1BWw6QZC2Zk1e
   PKtpeR6MDjzl9wLliIDE+vxSb1oPAcKl4ypF6JiO59G0R0S+Qy24Cx3rh
   g==;
X-CSE-ConnectionGUID: 34NITkG/SjOxs6lJnorKmQ==
X-CSE-MsgGUID: lrZLkYfAS2+qfQ1l4bebBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93510895"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93510895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 04:57:56 -0700
X-CSE-ConnectionGUID: F+bvDLTuRii5NjMw5/Khmg==
X-CSE-MsgGUID: mXPbaTotQXu/uXpIMJ6xZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249063667"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 04:57:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbdHk-0000000016b-3AQS;
	Mon, 22 Jun 2026 11:57:52 +0000
Date: Mon, 22 Jun 2026 19:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:trace_pritk3 3/5]
 include/linux/local_lock_internal.h:46:2: error: use of undeclared identifier
 '_THIS_IP_'
Message-ID: <202606221928.uiMi4NZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux trace_pritk3
head:   269a48e0145577a55e41cad363ea0a8c7f8b71b6
commit: b2ec6f354aace55c19cf7223166e97a76fdea9df [3/5] kernel.h: drop trace_printk.h
config: i386-randconfig-002-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221928.uiMi4NZP-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221928.uiMi4NZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221928.uiMi4NZP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_context-analysis.c:9:
   In file included from include/linux/local_lock.h:5:
>> include/linux/local_lock_internal.h:46:2: error: use of undeclared identifier '_THIS_IP_'
      46 |         lock_map_acquire(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:541:69: note: expanded from macro 'lock_map_acquire'
     541 | #define lock_map_acquire(l)                     lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
         |                                                                                       ^~~~~~~~~
   In file included from lib/test_context-analysis.c:9:
   In file included from include/linux/local_lock.h:5:
   include/linux/local_lock_internal.h:53:2: error: use of undeclared identifier '_THIS_IP_'
      53 |         lock_map_acquire_try(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:542:73: note: expanded from macro 'lock_map_acquire_try'
     542 | #define lock_map_acquire_try(l)                 lock_acquire_exclusive(l, 0, 1, NULL, _THIS_IP_)
         |                                                                                       ^~~~~~~~~
   In file included from lib/test_context-analysis.c:9:
   In file included from include/linux/local_lock.h:5:
   include/linux/local_lock_internal.h:62:2: error: use of undeclared identifier '_THIS_IP_'
      62 |         lock_map_release(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:545:47: note: expanded from macro 'lock_map_release'
     545 | #define lock_map_release(l)                     lock_release(l, _THIS_IP_)
         |                                                                 ^~~~~~~~~
   3 errors generated.


vim +/_THIS_IP_ +46 include/linux/local_lock_internal.h

0aaddfb0688250 Sebastian Andrzej Siewior 2025-02-21  31  
91710728d1725d Thomas Gleixner           2020-05-27  32  #ifdef CONFIG_DEBUG_LOCK_ALLOC
d8bbd97ad0b99a Thomas Gleixner           2021-08-15  33  # define LOCAL_LOCK_DEBUG_INIT(lockname)		\
91710728d1725d Thomas Gleixner           2020-05-27  34  	.dep_map = {					\
91710728d1725d Thomas Gleixner           2020-05-27  35  		.name = #lockname,			\
91710728d1725d Thomas Gleixner           2020-05-27  36  		.wait_type_inner = LD_WAIT_CONFIG,	\
dfd5e3f5fe27bd Peter Zijlstra            2020-12-09  37  		.lock_type = LD_LOCK_PERCPU,		\
d8bbd97ad0b99a Thomas Gleixner           2021-08-15  38  	},						\
d8bbd97ad0b99a Thomas Gleixner           2021-08-15  39  	.owner = NULL,
91710728d1725d Thomas Gleixner           2020-05-27  40  
51339d99c0131b Alexei Starovoitov        2025-04-02  41  # define LOCAL_TRYLOCK_DEBUG_INIT(lockname)		\
212b0f07cf0215 Alexei Starovoitov        2025-09-03  42  	LOCAL_LOCK_DEBUG_INIT(lockname)
51339d99c0131b Alexei Starovoitov        2025-04-02  43  
91710728d1725d Thomas Gleixner           2020-05-27  44  static inline void local_lock_acquire(local_lock_t *l)
91710728d1725d Thomas Gleixner           2020-05-27  45  {
91710728d1725d Thomas Gleixner           2020-05-27 @46  	lock_map_acquire(&l->dep_map);
91710728d1725d Thomas Gleixner           2020-05-27  47  	DEBUG_LOCKS_WARN_ON(l->owner);
91710728d1725d Thomas Gleixner           2020-05-27  48  	l->owner = current;
91710728d1725d Thomas Gleixner           2020-05-27  49  }
91710728d1725d Thomas Gleixner           2020-05-27  50  

:::::: The code at line 46 was first introduced by commit
:::::: 91710728d1725de51d06b40674abf6e860d592c7 locking: Introduce local_lock()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
