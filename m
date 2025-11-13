Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B1C2DFF3F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009604; cv=none; b=cXysDiwPzh29TfycaM9R+Ezi02ua14us7//KdQeIetzVBLpauo/usGEUhCBW8ZqaresZRA1S0TVJ5yvqqCSiCJeomTk+gqtiObIBfsK9jOVPqdSTKAJD2+1j7Zne0EvL1TQVWXjGWN9LWp0Vb7+9wWJEHRwb8myneCkxPO/KQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009604; c=relaxed/simple;
	bh=H2QGgJ5G3BzBHLThUj63XRh7c4ddp7+qQ5KSc4wx0J4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxatYoQWCfEciMOVNzaD/xSncyKj63nMgnRcyUroohAJNv0xAWz7gR25roJsYZwEiyW5cQ9Xfw2CvdhpTFsU/kPnzPtFgzFXVxOz31t9Y4QS9N7P4jLEo2Bxr6s3KabukpzjyS86Oe60BeXUAGQVKUytkRGFZGFiXS4OXJ2pqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ8qDvZv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJ8qDvZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009604; x=1794545604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2QGgJ5G3BzBHLThUj63XRh7c4ddp7+qQ5KSc4wx0J4=;
  b=GJ8qDvZv0BFtWKBrvPGksr1tZU8czKpFxpF9n31bV8mkvtjHqir/67j6
   Hniggbn9csppEQ1/dvtDSvLkW28JWCh3sD/aHZvR2k9dWfkAUq3RKYOyk
   SSTPCC5YEfri58ge8l6MkYnWzdBTzxhPtQ5eLZ7cGgRyMDVdBjpsHuNpt
   bT0dkgUWySqqHwC++por7gopH8sJZ2KTa2/bDdwcKnsG5FfkrNZuw4GKi
   rmb9vSX2yRnQALV5DfkVMNoF9rYthCxWtt1BEddO17S43Ov80DeAQm36p
   V42SRM3dek6RKl6WZQDQe5fDxJIyRonbydZ8saoERK07JdQ5S2qzt2x7B
   A==;
X-CSE-ConnectionGUID: dusYvI2DQneNwCZ3WfSTtg==
X-CSE-MsgGUID: hQCz2JdlRoijxyFy5ildcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480065"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:23 -0800
X-CSE-ConnectionGUID: H7VFW59ORhCZ3aMFFbgVfw==
X-CSE-MsgGUID: BNycB/95Q+ypoqxNtZvcKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415461"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004u5-1T;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:total_cpus 1/2] include/linux/rcutiny.h:58:9: error: implicit
 declaration of function 'might_sleep'
Message-ID: <202511131016.UXAXet0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux total_cpus
head:   57f6e7cf466e27e510bbc03cc2a5b067622f9673
commit: 3a8c8f12c46acd1541dbea31afaa96e8c4bf8177 [1/2] smp: include cpumask_types.h
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131016.UXAXet0w-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131016.UXAXet0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131016.UXAXet0w-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/smp.h: In function 'on_each_cpu':
   include/linux/smp.h:71:55: error: 'cpu_online_mask' undeclared (first use in this function)
      71 |         on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/smp.h:71:55: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/smp.h: In function 'on_each_cpu_cond':
   include/linux/smp.h:105:60: error: 'cpu_online_mask' undeclared (first use in this function)
     105 |         on_each_cpu_cond_mask(cond_func, func, info, wait, cpu_online_mask);
         |                                                            ^~~~~~~~~~~~~~~
   In file included from include/linux/rcupdate.h:291,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/ptrace.h:7,
                    from arch/alpha/kernel/asm-offsets.c:12:
   include/linux/rcutiny.h: In function 'cond_synchronize_rcu':
>> include/linux/rcutiny.h:58:9: error: implicit declaration of function 'might_sleep' [-Wimplicit-function-declaration]
      58 |         might_sleep();
         |         ^~~~~~~~~~~
   In file included from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9:
   include/linux/uaccess.h: In function '__copy_from_user':
>> include/linux/uaccess.h:115:9: error: implicit declaration of function 'might_fault' [-Wimplicit-function-declaration]
     115 |         might_fault();
         |         ^~~~~~~~~~~
   In file included from include/linux/cpumask.h:11,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/sched/user.h:7,
                    from include/linux/cred.h:18,
                    from include/linux/sched/signal.h:10:
   include/linux/kernel.h: At top level:
>> include/linux/kernel.h:151:20: warning: conflicting types for 'might_fault'; have 'void(void)'
     151 | static inline void might_fault(void) { }
         |                    ^~~~~~~~~~~
>> include/linux/kernel.h:151:20: error: static declaration of 'might_fault' follows non-static declaration
   include/linux/uaccess.h:115:9: note: previous implicit declaration of 'might_fault' with type 'void(void)'
     115 |         might_fault();
         |         ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1302: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/might_sleep +58 include/linux/rcutiny.h

91a967fd6934abc Paul E. McKenney 2022-07-28  55  
765a3f4fed708ae Paul E. McKenney 2014-03-14  56  static inline void cond_synchronize_rcu(unsigned long oldstate)
765a3f4fed708ae Paul E. McKenney 2014-03-14  57  {
765a3f4fed708ae Paul E. McKenney 2014-03-14 @58  	might_sleep();
b6fe4917ae4353b Paul E. McKenney 2022-08-04  59  }
b6fe4917ae4353b Paul E. McKenney 2022-08-04  60  

:::::: The code at line 58 was first introduced by commit
:::::: 765a3f4fed708ae429ee095914a7897acb3a65bd rcu: Provide grace-period piggybacking API

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
