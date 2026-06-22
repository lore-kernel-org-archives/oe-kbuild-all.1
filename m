Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F55285C84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128011; cv=none; b=N+MJe7p8WtL9Z8GmM8l4PXtkDZkd8GAi+ZB5/hTEET/LoKdXdlvx0bkSAVuCDmou/hhqTZRUQL9EDINPeV7v2JXbLtuPpFeuIhr8PqLkgjY54O+/ZHP0ion9ismtpliaQL6i0XMTtlwre6neU4egjSBqpN75ibt9VxWbas35E9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128011; c=relaxed/simple;
	bh=mPuSmIa7NIrJNnprXbmqNtAn754DTEy3Ua9//VGmSzM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UDHYv7VHdwKuXGH31tb62phHbmGMrgsz+/M6UeBEuuZ2F6TVWop/3rpVt3toAGadHgsJNALrdqNjtvbwtlKbWM9+wlPVvgUBOJseZizzMIk3yXKOXWs7KZJJkqe9HqDXsFSyq02CtGo7OfC75gHoIoMhwVDcRvAQwUnPbvy87YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpjFdBFe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpjFdBFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782128011; x=1813664011;
  h=date:from:to:cc:subject:message-id;
  bh=mPuSmIa7NIrJNnprXbmqNtAn754DTEy3Ua9//VGmSzM=;
  b=YpjFdBFeLOUKDaIvTsaBYOC8M646x2WFAGJiRhQ/80HBIQlzrKpUlF8v
   CtB1mUnAA3z9DzoMmy7NcgGep5p6aYY9thqHCn87Fec9Je9gfD3ICT4W3
   Hl//pMB0CS87G93mjon+KBqJG+DQw6A2hW/IQhai0eCAKW4fCFSld5zyC
   Mhq8hOd/urlpIhiX9mWLVE/0e2ESCRDFokJKVOJWl0WcNJQ7M/rNwt8Fz
   giBL9MLIFYMiJozE/B7NcNDJBNI+2NuafACJl/mVU30kxCHNgpJ4/R3Gb
   TP4nETmZX9JCcUx0mkwz/UXORTMmRnroxN0yHNGjlg3SguMAwyJf7le2U
   A==;
X-CSE-ConnectionGUID: J34+dfAXSjS9KS5FS5N10Q==
X-CSE-MsgGUID: OMUjav9zQ0e4Bpd6ffyQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93220121"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93220121"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 04:33:29 -0700
X-CSE-ConnectionGUID: dsvMziAaT7qTrdAK8SBbdw==
X-CSE-MsgGUID: wvUvbqJMQQCS/H+NZiGJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="246886508"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2026 04:33:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbcu5-0000000015N-0thg;
	Mon, 22 Jun 2026 11:33:25 +0000
Date: Mon, 22 Jun 2026 19:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:trace_pritk3 3/5] include/linux/lockdep.h:541:87:
 error: '_THIS_IP_' undeclared
Message-ID: <202606221947.1UOUggwU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux trace_pritk3
head:   269a48e0145577a55e41cad363ea0a8c7f8b71b6
commit: b2ec6f354aace55c19cf7223166e97a76fdea9df [3/5] kernel.h: drop trace_printk.h
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260622/202606221947.1UOUggwU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221947.1UOUggwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221947.1UOUggwU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/local_lock_internal.h:8,
                    from include/linux/local_lock.h:5,
                    from lib/test_context-analysis.c:9:
   include/linux/local_lock_internal.h: In function 'local_lock_acquire':
>> include/linux/lockdep.h:541:87: error: '_THIS_IP_' undeclared (first use in this function)
     541 | #define lock_map_acquire(l)                     lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
         |                                                                                       ^~~~~~~~~
   include/linux/lockdep.h:509:88: note: in definition of macro 'lock_acquire_exclusive'
     509 | #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
         |                                                                                        ^
   include/linux/local_lock_internal.h:46:9: note: in expansion of macro 'lock_map_acquire'
      46 |         lock_map_acquire(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~
   include/linux/lockdep.h:541:87: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/lockdep.h:509:88: note: in definition of macro 'lock_acquire_exclusive'
     509 | #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
         |                                                                                        ^
   include/linux/local_lock_internal.h:46:9: note: in expansion of macro 'lock_map_acquire'
      46 |         lock_map_acquire(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h: In function 'local_trylock_acquire':
   include/linux/lockdep.h:542:87: error: '_THIS_IP_' undeclared (first use in this function)
     542 | #define lock_map_acquire_try(l)                 lock_acquire_exclusive(l, 0, 1, NULL, _THIS_IP_)
         |                                                                                       ^~~~~~~~~
   include/linux/lockdep.h:509:88: note: in definition of macro 'lock_acquire_exclusive'
     509 | #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
         |                                                                                        ^
   include/linux/local_lock_internal.h:53:9: note: in expansion of macro 'lock_map_acquire_try'
      53 |         lock_map_acquire_try(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h: In function 'local_lock_release':
   include/linux/lockdep.h:545:65: error: '_THIS_IP_' undeclared (first use in this function)
     545 | #define lock_map_release(l)                     lock_release(l, _THIS_IP_)
         |                                                                 ^~~~~~~~~
   include/linux/local_lock_internal.h:62:9: note: in expansion of macro 'lock_map_release'
      62 |         lock_map_release(&l->dep_map);
         |         ^~~~~~~~~~~~~~~~


vim +/_THIS_IP_ +541 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar       2006-07-03  540  
a51805efae5dda Michel Lespinasse 2013-07-08 @541  #define lock_map_acquire(l)			lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
0cce06ba859a51 Peter Zijlstra    2023-04-25  542  #define lock_map_acquire_try(l)			lock_acquire_exclusive(l, 0, 1, NULL, _THIS_IP_)
a51805efae5dda Michel Lespinasse 2013-07-08  543  #define lock_map_acquire_read(l)		lock_acquire_shared_recursive(l, 0, 0, NULL, _THIS_IP_)
dd56af42bd829c Paul E. McKenney  2014-08-25  544  #define lock_map_acquire_tryread(l)		lock_acquire_shared_recursive(l, 0, 1, NULL, _THIS_IP_)
5facae4f3549b5 Qian Cai          2019-09-19  545  #define lock_map_release(l)			lock_release(l, _THIS_IP_)
2f1f043e7bea3f Boqun Feng        2023-01-12  546  #define lock_map_sync(l)			lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
4f3e7524b2e703 Peter Zijlstra    2008-08-11  547  

:::::: The code at line 541 was first introduced by commit
:::::: a51805efae5dda0da66f79268ffcf0715f9dbea4 lockdep: Introduce lock_acquire_exclusive()/shared() helper macros

:::::: TO: Michel Lespinasse <walken@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
