Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472F4DD6FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002674; cv=none; b=fSwbSRiWplTe9o53AOtUy8ktO5mLuYy0XDk3bdeMDwdjU3k/1b8zI+DkC324Y0I1Ko0ZAlVZOLJc3AzcIKw7qxu18tl0mSKhUKfW7Pqrevic+3o2QF6aV4TFE3vliTAEf5XgRFpt3zqwMbizp24ogjcGufRHdlq+W9mtotyPJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002674; c=relaxed/simple;
	bh=2pl1RcSUpDUH7ziGvwaL2ddIc9NAwjdeE6a51zLvNhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uXHsQPCKLMadXOsRdhaEXGfTFF1m0bwR9EaNCxlFpgCoGpfF2eQNkOPDv4l52GdQCyhAy2wbeG1bf3mYtIrwgEL0o+/fSie8YKBl1IJxSgSo6XLgBbxEM5uG30H3nHVSdT3Z65TSDBsBf17wyaG4OQeFtr3lYpC6c15mxomRrBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkCSzn9D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkCSzn9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783002668; x=1814538668;
  h=date:from:to:cc:subject:message-id;
  bh=2pl1RcSUpDUH7ziGvwaL2ddIc9NAwjdeE6a51zLvNhk=;
  b=dkCSzn9DO1HpOS+GmUPb5taQI18DaJaDLj3LNY65obSQegwnGu+h+TcW
   pwjsAsuppHgf6JR4VIK6pzzMmk+WYQJ2wVwNnAOir98bu32EAbc5BzgsG
   bAuGJh0QYqFuvowYwyHdoroGqBUXxBjAjc/bngwaB2WkPuV/1qEuxZyic
   tyeWLKIJsKejSj9fHDFR1hQEJa/22DwrmBwrXBHvmHq9bb5sqFfp17oNB
   ZV0yWFuTysDIZxacW0+kToqJlzn0yTMTo4rXY+SNFn01UC2T4tMWzbFaP
   w8dWVkI397xZ9eOrSJxNJusRtvRoPv+3pY7/Br9n1Oxqpv7OPqgaD8jVl
   w==;
X-CSE-ConnectionGUID: 1TxaHwBiQzmYVcO+df+uRA==
X-CSE-MsgGUID: Sh7Cx7hVSoOXRmzF5g83pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101181519"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101181519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:31:07 -0700
X-CSE-ConnectionGUID: 0BgXWZGwSs+ONzGs0S16xg==
X-CSE-MsgGUID: 5VxusMVDT+2ARm4Q2+VNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257764592"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2026 07:31:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfIRT-00000000ArR-31It;
	Thu, 02 Jul 2026 14:31:03 +0000
Date: Thu, 02 Jul 2026 22:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/zen-sauce 5/31] kernel/irq/proc.c:351:26: warning:
 'sprintf' may write a terminating nul past the end of the destination
Message-ID: <202607022201.O35ByhT1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/zen-sauce
head:   420dbda6d6b42784ca35e6b0596fd8e68c23b219
commit: 5861478705930fcd22feba6f7952c0a546f6586b [5/31] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: openrisc-randconfig-r061-20260702 (https://download.01.org/0day-ci/archive/20260702/202607022201.O35ByhT1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022201.O35ByhT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022201.O35ByhT1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/proc.c: In function 'init_irq_proc':
>> kernel/irq/proc.c:351:26: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     351 |         sprintf(name, "%u", irq);
         |                          ^
   In function 'register_irq_proc',
       inlined from 'init_irq_proc' at kernel/irq/proc.c:439:3:
   kernel/irq/proc.c:351:9: note: 'sprintf' output between 2 and 11 bytes into a destination of size 10
     351 |         sprintf(name, "%u", irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +351 kernel/irq/proc.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  330  
2c6927a38f65b5 Yinghai Lu      2008-08-19  331  void register_irq_proc(unsigned int irq, struct irq_desc *desc)
^1da177e4c3f41 Linus Torvalds  2005-04-16  332  {
95c2b175346548 Ben Hutchings   2015-09-26  333  	static DEFINE_MUTEX(register_lock);
c1a80386965e9f Thomas Gleixner 2017-06-20  334  	void __maybe_unused *irqp = (void *)(unsigned long) irq;
^1da177e4c3f41 Linus Torvalds  2005-04-16  335  	char name [MAX_NAMELEN];
^1da177e4c3f41 Linus Torvalds  2005-04-16  336  
95c2b175346548 Ben Hutchings   2015-09-26  337  	if (!root_irq_dir || (desc->irq_data.chip == &no_irq_chip))
^1da177e4c3f41 Linus Torvalds  2005-04-16  338  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  339  
95c2b175346548 Ben Hutchings   2015-09-26  340  	/*
95c2b175346548 Ben Hutchings   2015-09-26  341  	 * irq directories are registered only when a handler is
95c2b175346548 Ben Hutchings   2015-09-26  342  	 * added, not when the descriptor is created, so multiple
95c2b175346548 Ben Hutchings   2015-09-26  343  	 * tasks might try to register at the same time.
95c2b175346548 Ben Hutchings   2015-09-26  344  	 */
659ff9c9d77b8a Thomas Gleixner 2025-04-29  345  	guard(mutex)(&register_lock);
95c2b175346548 Ben Hutchings   2015-09-26  346  
95c2b175346548 Ben Hutchings   2015-09-26  347  	if (desc->dir)
659ff9c9d77b8a Thomas Gleixner 2025-04-29  348  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  349  
^1da177e4c3f41 Linus Torvalds  2005-04-16  350  	/* create /proc/irq/1234 */
47af06c9d31fe5 Andy Shevchenko 2025-05-09 @351  	sprintf(name, "%u", irq);
08678b0841267c Yinghai Lu      2008-08-19  352  	desc->dir = proc_mkdir(name, root_irq_dir);
c82a43d40b9320 Cyrill Gorcunov 2009-10-26  353  	if (!desc->dir)
659ff9c9d77b8a Thomas Gleixner 2025-04-29  354  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  355  

:::::: The code at line 351 was first introduced by commit
:::::: 47af06c9d31fe558493de4e04f9a07847dc4992f genirq: Consistently use '%u' format specifier for unsigned int variables

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
