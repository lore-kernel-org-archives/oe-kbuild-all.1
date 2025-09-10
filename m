Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297523BCEF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524664; cv=none; b=E0G/O//qG9Id99Uz0RqdFKrofRV5DmNERuXynSlQanzijIOlMA//ChI5cdZiKU4xjdC3CWbmI0FOx/CqnPm7Qrft533sP37c+64NOP0qmKHiX9eVjmZ025P/cNlWigjuW/LlhtZgCrcYr/m5wVD9MJEr57WgB+tey3jE5/6kBcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524664; c=relaxed/simple;
	bh=u+RA/EJQOgmXkB2Ji+LO9jhZfBEoM6aFDPAWhKf5btE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVhgH81EvtzqMkXcfS0av5cw5VWfASGya30BYfP6UVZjSYjofZ7YFuyJHOZ3tzZf1088HcZfFizbMY/ul1lsn08lLvnid7I4Z60jpC1UkxE2gGrphy9p8JjTCjGkb7RQAZwdUG6ggYbM1jRTMfiEru2HGqhw8qam4BR3uGuFx9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2s2iRnR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2s2iRnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757524663; x=1789060663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+RA/EJQOgmXkB2Ji+LO9jhZfBEoM6aFDPAWhKf5btE=;
  b=n2s2iRnR2CoQj0ppRAw5LXt0nEBVw2c7g63ITtaUOtER5CnvqgPYKtlb
   X4Oi7UvmXOxWf+ra9r148oki+4gnywtwKgv/0ZG/SMSRJroraT5NwgkW6
   onFt1hq/H3vARGTSnL+br2sXZ+X2TAjJr01c8CYG81SMZ4YfdYcc4kNei
   EPCaQbjaVmFCMyGPwcgvkC5ztSxZCA6leHjt+QNIVNbITMMKkb+WdWhvt
   dSP8n9GSPxr6H/uSQY1frk4GHUDkpGFTlzzND2jhxBCZ2LkAsXiimGc68
   UlmxSyZp1KiI7fxOhgpSt58D7oF4242WggwYCMggxlRXaYk7mxAs+QD7C
   g==;
X-CSE-ConnectionGUID: x0z0PjoRRJezHwjZB4GkSw==
X-CSE-MsgGUID: 6pHb4QqERKigUSK7MKDO5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59537618"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59537618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 10:17:43 -0700
X-CSE-ConnectionGUID: YPJmEbG4Q7mePQRvINVbRQ==
X-CSE-MsgGUID: 2z7sanUST6SKUwI0LRmDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="178649057"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 10:17:41 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwORu-0006A9-2n;
	Wed, 10 Sep 2025 17:17:38 +0000
Date: Thu, 11 Sep 2025 01:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/auto-cleanup 208/210]
 sound/sparc/amd7930.c:357:45: error: 'flags' undeclared
Message-ID: <202509110130.PlGyYo4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/auto-cleanup
head:   f29244cff0185975fee4f55293cca61cfd83af3e
commit: db8ed7441c876cac679db2869b87b26633c89bde [208/210] ALSA: sparc/amd7930: Use guard() for spin locks
config: sparc64-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110130.PlGyYo4k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110130.PlGyYo4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110130.PlGyYo4k-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/sparc/amd7930.c: In function 'amd7930_enable_ints':
>> sound/sparc/amd7930.c:357:45: error: 'flags' undeclared (first use in this function)
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
   sound/sparc/amd7930.c:357:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/module.h:17,
                    from sound/sparc/amd7930.c:33:
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   sound/sparc/amd7930.c:357:9: note: in expansion of macro 'guard'
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   sound/sparc/amd7930.c: In function 'amd7930_disable_ints':
   sound/sparc/amd7930.c:365:45: error: 'flags' undeclared (first use in this function)
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   sound/sparc/amd7930.c:365:9: note: in expansion of macro 'guard'
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
--
   amd7930.c: In function 'amd7930_enable_ints':
   amd7930.c:357:45: error: 'flags' undeclared (first use in this function)
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
   amd7930.c:357:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/module.h:17,
                    from amd7930.c:33:
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   amd7930.c:357:9: note: in expansion of macro 'guard'
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   amd7930.c: In function 'amd7930_disable_ints':
   amd7930.c:365:45: error: 'flags' undeclared (first use in this function)
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   amd7930.c:365:9: note: in expansion of macro 'guard'
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~


vim +/flags +357 sound/sparc/amd7930.c

   353	
   354	/* Enable chip interrupts.  The amd->lock is not held.  */
   355	static __inline__ void amd7930_enable_ints(struct snd_amd7930 *amd)
   356	{
 > 357		guard(spinlock_irqsave)(&amd->lock, flags);
   358		sbus_writeb(AMR_INIT, amd->regs + AMD7930_CR);
   359		sbus_writeb(AM_INIT_ACTIVE, amd->regs + AMD7930_DR);
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
