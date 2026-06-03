Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC525A2A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780459539; cv=none; b=Ti2xdTuVtEcu6Q/YrZRNJEMLOqnCd0a66muEtHe/Rf4zqGW9XzIsMIMohfQIoi+8GDlMbIQ4LeHz1zDINMMu0+xpQxkaFNl7fbCOx5/z6oKoarGVs674n0nV/VZaRL8FU3icsPeiogtNVK6ubf+Dc8Ocis+bDx4fYjw1H8WcuGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780459539; c=relaxed/simple;
	bh=znn5GNv9rLnRMyw6nWzfg/CTSaHpa4PD1ZL87BrpqY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mYU8z1QMsVRvIM0TJ24KTyTetp/tDfseV7WUiNZOH9/N6l2sw9P44KNYGtsFfMU23BSO6K3JATuUJ1jVrpPT15Kbkpu3vjSaCGlR56V5enVtN7zQRP/qD2eR+RmMx4Ea8NHVf1mECM3utPjtrL0YLllMjHmVu3e5pCbZFGOm0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYry4yBM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYry4yBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780459538; x=1811995538;
  h=date:from:to:cc:subject:message-id;
  bh=znn5GNv9rLnRMyw6nWzfg/CTSaHpa4PD1ZL87BrpqY0=;
  b=fYry4yBMw54QhPrUXUUwdQRIgVhiZWiC1aSxKGTnrKFWpFcSCLsTcFGW
   DCVRl9X1j7yuBJ8sLBYnwfh9tUvBOpLEHXsZcabwi20IzAJ25d7eC7tus
   q1z5enc40o2HtG0uuEuOOcKpYTcMIWBKW3MZ4ykJ1m0nwhz/oubsWJisN
   5xOPxxsPmj+WLWL3PyeoU79DSimf8mhX/Zah0DZpC3SGl1yyMv8fp4t9e
   Om/IS4bxPZOumh4aahORi9myelPMxacPWAhbHFDkZlANGbNTXK1bF9VTS
   0gFaVY6x+Rc2m6VvLGpGAUL6FAAwZrfw5df3kJRvFG+psnOwKLTBX4NoJ
   A==;
X-CSE-ConnectionGUID: 1uH6FLCgQDOrQpTz0Mti1Q==
X-CSE-MsgGUID: rc70aFeOSTKPZCZLIVbnBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81382801"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81382801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 21:05:38 -0700
X-CSE-ConnectionGUID: ciO7KK4WRlCgdaYkdOmidA==
X-CSE-MsgGUID: 1sQcLFPWQlS8FkUuU0wQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="267981305"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jun 2026 21:05:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUcrF-000000001wn-3MnM;
	Wed, 03 Jun 2026 04:05:33 +0000
Date: Wed, 03 Jun 2026 06:04:56 +0200
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:irq/constify 8/8] kernel/irq/ipi.c:317:33:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <202606030655.Xukct6QH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/constify
head:   2e8b4859e87ef8229ab12228b5e484171084a127
commit: 2e8b4859e87ef8229ab12228b5e484171084a127 [8/8] genirq/chip: Constify the 'chip' field in irq_data
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260603/202606030655.Xukct6QH-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030655.Xukct6QH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030655.Xukct6QH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/ipi.c: In function 'ipi_send_single':
>> kernel/irq/ipi.c:317:33: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     317 |         struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
         |                                 ^~~~
   kernel/irq/ipi.c: In function 'ipi_send_mask':
   kernel/irq/ipi.c:338:33: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     338 |         struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
         |                                 ^~~~


vim +/const +317 kernel/irq/ipi.c

3b8e29a82dd16c Qais Yousef  2015-12-08  304  
3b8e29a82dd16c Qais Yousef  2015-12-08  305  /**
3b8e29a82dd16c Qais Yousef  2015-12-08  306   * ipi_send_single - Send an IPI to a single CPU
3b35e7e6daef5a Randy Dunlap 2021-08-10  307   * @virq:	Linux IRQ number from irq_reserve_ipi()
3b8e29a82dd16c Qais Yousef  2015-12-08  308   * @cpu:	destination CPU, must in the destination mask passed to
3b8e29a82dd16c Qais Yousef  2015-12-08  309   *		irq_reserve_ipi()
3b8e29a82dd16c Qais Yousef  2015-12-08  310   *
3b35e7e6daef5a Randy Dunlap 2021-08-10  311   * Return: %0 on success or negative error number on failure.
3b8e29a82dd16c Qais Yousef  2015-12-08  312   */
3b8e29a82dd16c Qais Yousef  2015-12-08  313  int ipi_send_single(unsigned int virq, unsigned int cpu)
3b8e29a82dd16c Qais Yousef  2015-12-08  314  {
3b8e29a82dd16c Qais Yousef  2015-12-08  315  	struct irq_desc *desc = irq_to_desc(virq);
3b8e29a82dd16c Qais Yousef  2015-12-08  316  	struct irq_data *data = desc ? irq_desc_get_irq_data(desc) : NULL;
3b8e29a82dd16c Qais Yousef  2015-12-08 @317  	struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
3b8e29a82dd16c Qais Yousef  2015-12-08  318  
3b8e29a82dd16c Qais Yousef  2015-12-08  319  	if (WARN_ON_ONCE(ipi_send_verify(chip, data, NULL, cpu)))
3b8e29a82dd16c Qais Yousef  2015-12-08  320  		return -EINVAL;
3b8e29a82dd16c Qais Yousef  2015-12-08  321  
3b8e29a82dd16c Qais Yousef  2015-12-08  322  	return __ipi_send_single(desc, cpu);
3b8e29a82dd16c Qais Yousef  2015-12-08  323  }
3b8e29a82dd16c Qais Yousef  2015-12-08  324  EXPORT_SYMBOL_GPL(ipi_send_single);
3b8e29a82dd16c Qais Yousef  2015-12-08  325  

:::::: The code at line 317 was first introduced by commit
:::::: 3b8e29a82dd16c1f2061e0b955a71cd36eeb061b genirq: Implement ipi_send_mask/single()

:::::: TO: Qais Yousef <qais.yousef@imgtec.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
