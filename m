Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4A448BBD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248539; cv=none; b=jo0exNvSe9mHZAzAuWTRrXOziVpqi5DmWWA9x3Fbv5urKmCW1LMuvQ+Ca9L0Kxyjg2SfQ0SenuJMWvpzoy85n6AsCdXY4P35FpxcNOtZb4/hk+FfA4Txvi2YvQdnZ53JQMeRGXGJmGbishOao83+R7NO1oPGFIhObIf6Zk398tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248539; c=relaxed/simple;
	bh=2zF514hUTelmmIY7H893inEHvaMPlEUTCDpR7K1YvPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m9wZgLw6wkjm1AMF/4PObqzv+b5YqyB5Ae5i1x4rWbw+QhCDZTFnFusfXsTgUVmWQxF4N15qHl76gGr4cd4i67ddaP/c9/Q2eatclMjhLfsAk82ZtQtfe5/X7XzHUdvIy9JjWpmE/PLMCKgEo8PQAf/jtelceFBMNjAtnYHZNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J54wOt0v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J54wOt0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785248537; x=1816784537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2zF514hUTelmmIY7H893inEHvaMPlEUTCDpR7K1YvPc=;
  b=J54wOt0vAS603iGKVVPysnH4Q/CKQXY9EiRx8230XCUiIoZPo0Dm5bzM
   6tbU3syBJnJSMMnrWpYcZ8sDznm9Pbc4CfCNpGOhgwcQtUtNeN+Uyygwn
   OpStlSv2ECtm8m/6i0o+j8J4NPriGRB91deWgRs7qUCw9jDfIvq4lHuaw
   6Ps+zSJ3Pq2rFSCNwJeCs9pIL9+KRlq4tBSp+Lm/HchKjYcOT+1bYehLV
   ihdIk1uB0K7Gh6iOOTB16+L+lGPuscEI7kHCBndxiZ5Uec6E5TIJNtEgL
   845OVmwgLPVTfWhgpz/D6evXdkYSf5ZN/eoh5JfeyIFPTLyGUo2Ry+l+8
   Q==;
X-CSE-ConnectionGUID: qpVWTYVWS2ieyvDKOff7Wg==
X-CSE-MsgGUID: HznZvtA7Rje5FMnddzc6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86023036"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="86023036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:22:17 -0700
X-CSE-ConnectionGUID: P5aw9uUvSL21Yr4fthSAoQ==
X-CSE-MsgGUID: I0JttK7dREaBk9TBEZudmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="259149750"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Jul 2026 07:22:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woihB-00000000eR1-0bbB;
	Tue, 28 Jul 2026 14:22:13 +0000
Date: Tue, 28 Jul 2026 22:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-lock 2/4]
 kernel/time/hrtimer.c:320:52: error: incompatible type for argument 1 of
 '_raw_spin_lock_irqsave'
Message-ID: <202607282244.90bJ0M2c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-lock
head:   830403610079844461b6f172c28d34c16082bfd6
commit: c63eaa23a081dc19e1880b3b26bd521b6d083bd4 [2/4] ret
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607282244.90bJ0M2c-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282244.90bJ0M2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282244.90bJ0M2c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:38,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   kernel/time/hrtimer.c: In function 'lock_hrtimer_base':
>> kernel/time/hrtimer.c:320:52: error: incompatible type for argument 1 of '_raw_spin_lock_irqsave'
     320 |         raw_spin_lock_irqsave(timer->base->cpu_base->lock, *flags);
         |                               ~~~~~~~~~~~~~~~~~~~~~^~~~~~
         |                                                    |
         |                                                    raw_spinlock_t {aka struct raw_spinlock}
   include/linux/spinlock.h:245:48: note: in definition of macro 'raw_spin_lock_irqsave'
     245 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   In file included from include/linux/spinlock.h:302,
                    from include/linux/sched.h:38,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/spinlock_api_smp.h:32:65: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'raw_spinlock_t' {aka 'struct raw_spinlock'}
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                                                 ~~~~~~~~~~~~~~~~^~~~


vim +/_raw_spin_lock_irqsave +320 kernel/time/hrtimer.c

   316	
   317	static inline void lock_hrtimer_base(const struct hrtimer *timer, unsigned long *flags)
   318		__acquires(&timer->base->cpu_base->lock)
   319	{
 > 320		raw_spin_lock_irqsave(timer->base->cpu_base->lock, *flags);
   321	}
   322	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
