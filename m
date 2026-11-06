Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985459;
	b=jWy+VumPCbeG/rHv159KPKqCQJTCpzChCpb1L0j9JzoFfxUiy0ivM1ExGOTf4sT+b5Zb
	 f9iRIwk+1Ec36xTp05brPMWjXwjdnWa9sKCw32wHqea0ih6TnqUajvgoqdeZHqCjm8zJV
	 GSpt0yloMv+e/A2Iqg6M7T9U16VCbf4P/dw7KN3z5zEY+nmyE7tOqpl3yI3FE9Y0VDvsd
	 PXFiYzMFXdQtQkJcE/JMm+d2d8nDxJviA78b/9NvJtKarpyaavqwiD4eHTOD6orr8H8Mo
	 LQvKsLlNPjc5xyjx/nHNRg+DbtA2PFtG5SxTcEbE7R7Zg2KCeZTCR5k36nfwwI2Jzaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985459;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=v7OEV8H2ttuTpDywcgHSvQrjBKzEhKk15iUMQrK5MWM=;
	b=CGA/rWP66RLtyiW+ZmDCedbUGlZq1xg0bncnN00k5528tdZBkpQ6CCjQaK8AGUXxW1gK
	 1GwpqbqsjKE12LqUhTLumcrR6q5r6suDvQtDojQxGFlqapCXPaOLKmIYH6t70jzFcjP29
	 tXGs9H0jTeih1WtE+EpsH5SMSXO4ttH2uUbNHy/fZK/dPf2lzMk8sYVVOp0GQDC2YeG91
	 91ROnwKkxrCffcAGBdUoz3lAW7FYqS/o0wBHBF3oKTQ5a+z2X5K2hpo5jsn5OtgD1r9QC
	 9Wa3z4Tj/L6NFrsoCjNLN4dY5k96rTexOCHJaAMZvEBObM7jx4sfksLMxqqlLKYtzrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="AiF/LCUz";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94FA606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 17:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94FA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AiF/LCUz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793985458; x=1825521458;
  h=date:from:to:cc:subject:message-id;
  bh=kWsqlL3yMPlFAC5jqgsKcvU5aCxicXKfChKw7y8t6qE=;
  b=AiF/LCUzvML2W8owzkYPQYn8otDLVLkRTNm3rkSan6uXoXFLczGkN8RA
   tGCkZlu2zurtSQByMbzyPmd/snwr+MDIOjo23e79MGukqHdM4OOCGNaju
   RmAgtFVZXzcTzabwJcd24tP9XlzkQcQTbFpssmkE/MIUES004/Y3YZ59n
   9vpw8VM+Yh1zecYpY3kItUDx7VAuCUncgCawXNcEh597IgdR11ivfvX3q
   fZqlbzTeHt8LeT0hnVT7pRQKekQCkl+8X1zRF+pxZcrc1n+WMpf90dlXV
   +C+JHMDwxqWjQIWesbLCWNRBvunyaFlJbYgfEiVXUzYijFQEYwlM3aJvH
   Q==;
X-CSE-ConnectionGUID: hvUfrXqvQlaLwJOW/OUUSw==
X-CSE-MsgGUID: 3LyW+biURYmQQ9MYl0ZFTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2835833"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2835833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:17:37 -0800
X-CSE-ConnectionGUID: nj0QQmx1QVKxdnKTE0+JjA==
X-CSE-MsgGUID: mMtCT/L8Q2SAXgoppjl4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7426161"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2026 09:17:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPNZE-00000000AKF-2WU3;
	Fri, 06 Nov 2026 17:17:32 +0000
Date: Fri, 06 Nov 2026 18:16:54 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.procfs.cleanup 106/174]
 include/linux/rcupdate.h:511:9: error: dereferencing pointer to incomplete
 type 'struct proc_dir_entry'
Message-ID: <202611061806.AmoFgAGQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs.cleanup
head:   a6e013c7b3fceb9c5df32518edb227f6d2ac893b
commit: f7de705dd5dc819a9b724adb5b13a92a15ef8235 [106/174] md: let procfs own the wait queue of /proc/mdstat
config: powerpc64-randconfig-2200-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061806.AmoFgAGQ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061806.AmoFgAGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061806.AmoFgAGQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/sched/mm.h:8,
                    from drivers/md/md.c:40:
   drivers/md/md.c: In function 'md_new_event':
>> include/linux/rcupdate.h:511:9: error: dereferencing pointer to incomplete type 'struct proc_dir_entry'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:661:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:751:28: note: in expansion of macro 'rcu_dereference_check'
    #define rcu_dereference(p) rcu_dereference_check(p, 0)
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:363:8: note: in expansion of macro 'rcu_dereference'
     pde = rcu_dereference(mdstat_entry);
           ^~~~~~~~~~~~~~~
--
   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/sched/mm.h:8,
                    from md.c:40:
   md.c: In function 'md_new_event':
>> include/linux/rcupdate.h:511:9: error: dereferencing pointer to incomplete type 'struct proc_dir_entry'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:661:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:751:28: note: in expansion of macro 'rcu_dereference_check'
    #define rcu_dereference(p) rcu_dereference_check(p, 0)
                               ^~~~~~~~~~~~~~~~~~~~~
   md.c:363:8: note: in expansion of macro 'rcu_dereference'
     pde = rcu_dereference(mdstat_entry);
           ^~~~~~~~~~~~~~~


vim +511 include/linux/rcupdate.h

76c8eaafe4f061f Paul E. McKenney        2021-04-21  501  
573d76f7db5ba05 Paul E. McKenney        2026-06-28  502  #define __rcu_access_pointer(p, local, space) context_unsafe( \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  503  ({ \
24ba53017e188e0 Chun-Hung Tseng         2021-09-15  504  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  505) 	rcu_check_sparse(p, space); \
0381ade2ea82b48 Ricardo Ribalda         2026-09-14  506  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(local)); \
573d76f7db5ba05 Paul E. McKenney        2026-06-28  507  }) )
24ba53017e188e0 Chun-Hung Tseng         2021-09-15  508  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  509  ({ \
ac59853c06993a4 Pranith Kumar           2014-11-13  510  	/* Dependency order vs. p above. */ \
24ba53017e188e0 Chun-Hung Tseng         2021-09-15 @511  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa55 Paul E. McKenney        2015-06-18  512  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  513) 	rcu_check_sparse(p, space); \
0381ade2ea82b48 Ricardo Ribalda         2026-09-14  514  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  515  })
24ba53017e188e0 Chun-Hung Tseng         2021-09-15  516  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  517  ({ \
f78f5b90c4ffa55 Paul E. McKenney        2015-06-18  518  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  519) 	rcu_check_sparse(p, space); \
0381ade2ea82b48 Ricardo Ribalda         2026-09-14  520  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  521  })
24ba53017e188e0 Chun-Hung Tseng         2021-09-15  522  #define __rcu_dereference_raw(p, local) \
995f1405610bd84 Paul E. McKenney        2016-07-01  523  ({ \
995f1405610bd84 Paul E. McKenney        2016-07-01  524  	/* Dependency order vs. p above. */ \
24ba53017e188e0 Chun-Hung Tseng         2021-09-15  525  	typeof(p) local = READ_ONCE(p); \
0381ade2ea82b48 Ricardo Ribalda         2026-09-14  526  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(local)); \
995f1405610bd84 Paul E. McKenney        2016-07-01  527  })
24ba53017e188e0 Chun-Hung Tseng         2021-09-15  528  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  529  

:::::: The code at line 511 was first introduced by commit
:::::: 24ba53017e188e031f9cb8b290286fad52d2af00 rcu: Replace ________p1 and _________p1 with __UNIQUE_ID(rcu)

:::::: TO: Chun-Hung Tseng <henrybear327@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
