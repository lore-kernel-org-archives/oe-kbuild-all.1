Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E199C511E64
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864078; cv=none; b=BOoud1zieqvTizWSpfLpUCx7u9j/9gmMcVVn9DMNO2ZX2ud7dheLHWSNRIReaO4SUTxW2kdSW1ZZX/rNEjeDV1W8YHRbD7f2Lr0AafXf9eeACrSurvr7QjFkMD7UWhCOcPt3gyVzbkXq2wxzQitFW6Mhpv6sd3Ypaeqxhky4o3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864078; c=relaxed/simple;
	bh=X12dfxzTXRXAX0eOdANTuM+RVEiR2NtutMXaGB5RTUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K5XQ1/kex60NEQSj9M0mP+ZC2IuZiwLrOXS4aoSoo0NLi6PSOEHpLgfeftADeQV/5CxRScxglXBX9mIiZlLUeK2D6O6E0OQdVUGtqUfSVYM7SaNvcGWCjGIfMUsRqiwfOP04WHrv4qUVtN06mdWUELKceaKZLrht44qJXmgOOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHUydxUq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHUydxUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788864076; x=1820400076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X12dfxzTXRXAX0eOdANTuM+RVEiR2NtutMXaGB5RTUs=;
  b=fHUydxUqTQPo0M3iguFQ9oHpJXwa5sfFDdvXd6THpDQZhxGkUbL4C97c
   k58OY7ewlDRPei8jvsP/zmpnFmyKHB6gYgVCMZFyARWqyBw80RvdLiO+/
   3IVpGwNmGSfvZaf6bo2zZBN0LK3ef/EuQdRkw4Gt+JZpXkUdy9GXeQJdX
   c1IpTX6jPrWpP24fIFk/e1+ooB0s5EJLxuEc9nkmC+rs5tq0JRxU3SwmA
   aG+EH0RbjuBRnpRsm5LnHOX2BiQN8tSSfo0rqLdeKCvq17W5LJekK066Y
   d/vDgp1oIxTrePu4JTm1HeDDs8y+epbK10oJnt38bL4PRyfQ1PUiuvv8p
   Q==;
X-CSE-ConnectionGUID: m6JQpVGzQfeOKxRYBEPYxQ==
X-CSE-MsgGUID: WXHzGrmGTDGhaUnIxo4+HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89386672"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89386672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:41:15 -0700
X-CSE-ConnectionGUID: 5bBhEJEvQRaRJlV/Gr9ZGg==
X-CSE-MsgGUID: PF6omM79RIq7XVCqWgvdDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274754668"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2026 03:41:14 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3tGJ-000000001zt-1n4Y;
	Tue, 08 Sep 2026 10:41:11 +0000
Date: Tue, 08 Sep 2026 18:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-lock 2/4]
 kernel/time/hrtimer.c:320:52: error: incompatible type for argument 1 of
 '_raw_spin_lock_irqsave'
Message-ID: <202609081816.7aFgE54E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-lock
head:   929ed6fb9972b15666115778f182b6d7d18af374
commit: de331d3928f5e7a5bb244f52a4dd7845a0d2b6c5 [2/4] hrtimer: Remove the return value from lock_hrtimer_base()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609081816.7aFgE54E-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081816.7aFgE54E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081816.7aFgE54E-lkp@intel.com/

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
   include/linux/spinlock.h:246:48: note: in definition of macro 'raw_spin_lock_irqsave'
     246 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   In file included from include/linux/spinlock.h:307:
   include/linux/spinlock_api_smp.h:34:65: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'raw_spinlock_t' {aka 'struct raw_spinlock'}
      34 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
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
