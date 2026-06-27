Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944E37F73E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782595746; cv=none; b=LM6zLH7KyhNAdaniPIgW9r+kWJkdYpBC8nhUXcKrscDFk3RtsvOA3sy2v51iPUwul99ta9GaXWwR8/DCZzF/gskRwLFMGACQqQ9U+by7fJ+99ZPADAmLfhVdEPBl/Dxg9Fo1uTmhUeTVYpMuDLsglYHtrLRux5j7W3/iP1zqdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782595746; c=relaxed/simple;
	bh=eBClUulmLa2e2zemOZSX2OO7GCtylB5qtSeuSfq0dUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TQvZIih5L/F/Fzvehnev4O4JBCj09XkwA2ZaxcpUmPPNoiL30zEbir95N2BwbCPqckqwKosMzFj9VR3xxhh+V15ZQ2qUgoKqri0Dn5CS0Ila9xmXIXdiQmjBqtBYvJQtiSOKnFgsJGHg+BeTS1s/nnwtelaVrWkmrS6bhwcW4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARZZSvSW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARZZSvSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782595743; x=1814131743;
  h=date:from:to:cc:subject:message-id;
  bh=eBClUulmLa2e2zemOZSX2OO7GCtylB5qtSeuSfq0dUo=;
  b=ARZZSvSWEqpUaJbiLQUR81+vtlDWYCPTboNrjeDn/epdKYtUaY4I7zyl
   BiHX0OmicIgeYPi2O4uOLVHhtsjQFlUzyj2ZGPArNnkvQMF3p+5rAT294
   HykQcsuxiZTWYYfc7M5m4CIbtSx5lFgk3fO1cs5UZIHRNMYWJpGERzppQ
   Hh87XKPZDeN29uT80EvbwdFopmjWQMOVygRz4/XDITC/M7RjjD4yDuuKB
   y7lVmKZWNbAZaRsTAY2RUaBqyw8pNM3A7BmB9f2YVHyL7t4J+bDqJr0fB
   /9KhRNTWVrozeNTqPbmIEKlXXPwHbT7gmC++Fal9/H/czGVVYsgsFWoP0
   w==;
X-CSE-ConnectionGUID: Xih7wI1FQaGINa4O4N394g==
X-CSE-MsgGUID: D7uVOgJZSLaK8JfQ65z4jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="85891868"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="85891868"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 14:29:03 -0700
X-CSE-ConnectionGUID: +ST26SHdRcSu7RoguviuEQ==
X-CSE-MsgGUID: FAzyKa9dQcO1C2Jp4nYmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="248959234"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2026 14:29:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdaaB-0000000064H-0NCl;
	Sat, 27 Jun 2026 21:28:59 +0000
Date: Sun, 28 Jun 2026 05:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 15141/15543]
 include/linux/lockdep.h:541:87: error: '_THIS_IP_' undeclared
Message-ID: <202606280549.v36QivFo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d5670d672ae08b8c534b7beed6f57c8b44e7b43
commit: 9cbc3d9806d31abda2718ceac587ddee3a04849b [15141/15543] tracing: Remove trace_printk.h from kernel.h
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260628/202606280549.v36QivFo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606280549.v36QivFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606280549.v36QivFo-lkp@intel.com/

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
     541 | #define lock_map_acquire(l)                     lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
         |                                                                                       ^~~~~~~~~
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
