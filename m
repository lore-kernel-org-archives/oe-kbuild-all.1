Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A11EBFE0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754851345; cv=none; b=QqZXYNyWnBnUfBq0LWVACcOdyAgu9ZbPxboLXjuRvq+tbc0AtK7jP4ePcm4OkZ4vSQGhqVKYTNZ2qlqNHv6TyzXggH/pMFTHqg7Wr+JdZK9BXTWmvQUceo053vUGN3jbR2DJMV107R8osWivbNgeaxOgIPGnjImwsbV4SBcuPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754851345; c=relaxed/simple;
	bh=/r/SmwmUuTHUq0Ns2O8AHbMfP7mSsVRuh+vn7s8VWd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Da3B8X6ufw1p5/oKtEnAmM+oBovANt7oAD+ejxGZiYqrSfmajWXFVJshTz5CmBaVnWOmVON+fE+GYplcK25y1r71/VyJZn5Ok7U+/5UFgxOSl9PWdPuyWqnKokVkQRsfq4cEkWU8h+AWZZZ0FMBvJzkFeH8xcOBEzS/gEyBU/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpkGtSJ6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpkGtSJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754851344; x=1786387344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/r/SmwmUuTHUq0Ns2O8AHbMfP7mSsVRuh+vn7s8VWd4=;
  b=MpkGtSJ6zzj1z4n80A+RrasOwCxnn0oybsRvf643YVYxusgMgTNJMLa1
   WHqFtXg3EulZSwwOyLN353uoR9Kx5EWOQWmZVaNVQFUi60AzLUCcb/jI8
   hzxVBINcZDXWHARL42GIl2rHc1cRZ/crqWzV0bk2McLKb8Qmhot/oiQQO
   7RVxCwjXqkys+MdtvIl9Bay4WZjMattd7guTqErJeVvC9NTUA06oiS5yU
   EEgh4oTpDbxq2/n6CFzA1zQJHAvYeFzqvRxLhTY96Pnw2LULsgIwHS/FN
   ALD3IR/SKmqoZ9MziE2RPxt+P3eSGJ0WT/2vx4cgIdnr0iUj8EirJ+oLM
   w==;
X-CSE-ConnectionGUID: CCoPSpjbTvCOTa3GirEp8A==
X-CSE-MsgGUID: B4Smo+HkTz6KJybvUXKDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68566858"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68566858"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 11:42:24 -0700
X-CSE-ConnectionGUID: m3egPRzVR+Kd2F4I02gqwA==
X-CSE-MsgGUID: 0VfUI+g1T3SfPMOTjwvrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196561755"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Aug 2025 11:42:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulAzf-0005PK-2o;
	Sun, 10 Aug 2025 18:42:11 +0000
Date: Mon, 11 Aug 2025 02:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/zen-sauce 5/31] kernel/irq/proc.c:348:26: warning:
 'sprintf' may write a terminating nul past the end of the destination
Message-ID: <202508110242.JcX5w974-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.16/zen-sauce
head:   08d11019f3924f192e1a68d7d2007f8ec7bdf889
commit: bbb5a430ae315840d98fda2561e462829f1182df [5/31] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: sparc-randconfig-r073-20250811 (https://download.01.org/0day-ci/archive/20250811/202508110242.JcX5w974-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110242.JcX5w974-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110242.JcX5w974-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/proc.c: In function 'init_irq_proc':
>> kernel/irq/proc.c:348:26: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     348 |         sprintf(name, "%u", irq);
         |                          ^
   In function 'register_irq_proc',
       inlined from 'init_irq_proc' at kernel/irq/proc.c:436:3:
   kernel/irq/proc.c:348:9: note: 'sprintf' output between 2 and 11 bytes into a destination of size 10
     348 |         sprintf(name, "%u", irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +348 kernel/irq/proc.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  327  
2c6927a38f65b5 Yinghai Lu      2008-08-19  328  void register_irq_proc(unsigned int irq, struct irq_desc *desc)
^1da177e4c3f41 Linus Torvalds  2005-04-16  329  {
95c2b175346548 Ben Hutchings   2015-09-26  330  	static DEFINE_MUTEX(register_lock);
c1a80386965e9f Thomas Gleixner 2017-06-20  331  	void __maybe_unused *irqp = (void *)(unsigned long) irq;
^1da177e4c3f41 Linus Torvalds  2005-04-16  332  	char name [MAX_NAMELEN];
^1da177e4c3f41 Linus Torvalds  2005-04-16  333  
95c2b175346548 Ben Hutchings   2015-09-26  334  	if (!root_irq_dir || (desc->irq_data.chip == &no_irq_chip))
^1da177e4c3f41 Linus Torvalds  2005-04-16  335  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  336  
95c2b175346548 Ben Hutchings   2015-09-26  337  	/*
95c2b175346548 Ben Hutchings   2015-09-26  338  	 * irq directories are registered only when a handler is
95c2b175346548 Ben Hutchings   2015-09-26  339  	 * added, not when the descriptor is created, so multiple
95c2b175346548 Ben Hutchings   2015-09-26  340  	 * tasks might try to register at the same time.
95c2b175346548 Ben Hutchings   2015-09-26  341  	 */
659ff9c9d77b8a Thomas Gleixner 2025-04-29  342  	guard(mutex)(&register_lock);
95c2b175346548 Ben Hutchings   2015-09-26  343  
95c2b175346548 Ben Hutchings   2015-09-26  344  	if (desc->dir)
659ff9c9d77b8a Thomas Gleixner 2025-04-29  345  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  346  
^1da177e4c3f41 Linus Torvalds  2005-04-16  347  	/* create /proc/irq/1234 */
47af06c9d31fe5 Andy Shevchenko 2025-05-09 @348  	sprintf(name, "%u", irq);
08678b0841267c Yinghai Lu      2008-08-19  349  	desc->dir = proc_mkdir(name, root_irq_dir);
c82a43d40b9320 Cyrill Gorcunov 2009-10-26  350  	if (!desc->dir)
659ff9c9d77b8a Thomas Gleixner 2025-04-29  351  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  352  

:::::: The code at line 348 was first introduced by commit
:::::: 47af06c9d31fe558493de4e04f9a07847dc4992f genirq: Consistently use '%u' format specifier for unsigned int variables

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
