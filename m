Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7233446AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997990; cv=none; b=o28IijkMUppqtzKR6zVmxA9XvEri+ElRgaJK9OWz0IvxQUkrKkWroDr1tqFCESgzluYExKkJ8ecUR0ktmfxYfoWG6TJT9iYSqTDSJpBC3R7KdHlOyzKy4NZgobquq0GlfEQ5S8IzEkfcaBket0Cqc/O4pF4zGf4VJ0I90QMUw9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997990; c=relaxed/simple;
	bh=7rsJTFBIJcfIPcFq9Lker+uhR0fukXLtnUkX+NA3QhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RIQFWChH8u+bw7NwgtxSp5OWE/FvIOEdv58qkwkguOESBDkMTyOFuNVkAfEGyrdahg6h/uWn+UANwTXQxBwrw9xCA1AgFBkOfOH15SSq/oJjf1q28+Bgum6qiOkjHn0IpnFBxu5mKA7NfZERwJAewTvG43ei6iT1v2xT6VD11n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHlUJMuE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHlUJMuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773997985; x=1805533985;
  h=date:from:to:cc:subject:message-id;
  bh=7rsJTFBIJcfIPcFq9Lker+uhR0fukXLtnUkX+NA3QhI=;
  b=BHlUJMuEscSzKUqOtBMkCEzqF/Zk2zVhUFCcqVbxZp+BJlPxTROX9ksU
   3jr1ZS7bPSpONoid/ywb7vWFFoQ8w9BVm4gzTWz3ftFJzjieAyKtwiaq+
   XcCPSVBE4OWpUMUv7sPa455f1y0JrJxJIbKNAnTtbdJlsjoAX2CmDFGad
   YrUxJgRNzkfEjRMioaUH6etqE1mC2n+I5qdPK4K0TADuqM7F0CJEZ6FDY
   BLl2vTwuqEh2dbjLgbSOrYgY1pbs9+w7S2Bx9ZmQfCJj3WNcIuJ873eA3
   kNpIjqxYv48TIBxdpnBXup9zdk+56HVUSQo5A2dGaLN0lBz4MhEnixuwd
   Q==;
X-CSE-ConnectionGUID: dSX2lYF7Q92FbVh81lYo5Q==
X-CSE-MsgGUID: M7MInu5YRuij6KXPfj+gTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86442855"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86442855"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:13:04 -0700
X-CSE-ConnectionGUID: 4rEnKRwbTi6Xy/sYWcgn/Q==
X-CSE-MsgGUID: bHdK6ajdQQCDAg7Bl4QhJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227359427"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 02:13:03 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Vue-000000002Bf-1OaF;
	Fri, 20 Mar 2026 09:13:00 +0000
Date: Fri, 20 Mar 2026 17:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 21/21]
 include/linux/compiler.h:168:17: error: '__UNIQUE_ID_y__822' undeclared; did
 you mean '__UNIQUE_ID_x__821'?
Message-ID: <202603201735.Kxf5XOSV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   4974c93ce402d69988eb7b2e9e490c22cc22bb7b
commit: 4974c93ce402d69988eb7b2e9e490c22cc22bb7b [21/21] sched/eevdf: Move to a single runqueue
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603201735.Kxf5XOSV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201735.Kxf5XOSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201735.Kxf5XOSV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function '__calc_prop_weight':
   kernel/sched/fair.c:4066:28: error: 'MIN_SHARES' undeclared (first use in this function)
    4066 |         return max(weight, MIN_SHARES);
         |                            ^~~~~~~~~~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~
   kernel/sched/fair.c:4066:28: note: each undeclared identifier is reported only once for each function it appears in
    4066 |         return max(weight, MIN_SHARES);
         |                            ^~~~~~~~~~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~
   In file included from <command-line>:
>> include/linux/compiler.h:168:17: error: '__UNIQUE_ID_y__822' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__821'?
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:168:9: note: in expansion of macro '__PASTE'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   kernel/sched/fair.c:4066:16: note: in expansion of macro 'max'
    4066 |         return max(weight, MIN_SHARES);
         |                ^~~


vim +168 include/linux/compiler.h

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  165  
afb026b6d35c79 Josh Poimboeuf       2025-09-17  166  /* Format: __UNIQUE_ID_<name>_<__COUNTER__> */
afb026b6d35c79 Josh Poimboeuf       2025-09-17  167  #define __UNIQUE_ID(name)					\
afb026b6d35c79 Josh Poimboeuf       2025-09-17 @168  	__PASTE(__UNIQUE_ID_,					\
afb026b6d35c79 Josh Poimboeuf       2025-09-17  169  	__PASTE(name,						\
afb026b6d35c79 Josh Poimboeuf       2025-09-17  170  	__PASTE(_, __COUNTER__)))
6f33d58794ef4c Rusty Russell        2012-11-22  171  

:::::: The code at line 168 was first introduced by commit
:::::: afb026b6d35c79f6f47752147327932827aeac8c compiler: Tweak __UNIQUE_ID() naming

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
