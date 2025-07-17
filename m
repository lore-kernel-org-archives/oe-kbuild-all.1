Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC91E0E14
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784171; cv=none; b=RC2imNI/3itHz5T0AE4qTU6YAvLn3C+1lz/b7rJn6k/LuBGU9QS1ZmIYG3bGzDMeifClOJENKPhi/Pjw7GsGYZbLI4ucHpi8vETVwVrvdV/LEkluFKp/H8EEVLrlFGkIqDFEiEoY7qxNkDNdtY4m0aiMv9oHhNpVUj8NVy/AXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784171; c=relaxed/simple;
	bh=0Tse8GHd77bof5pmdIXzeDDuT0ORqPZRxD7NIWarrbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZ3M4jDK06iSjCoAWOgIgzSuos2lr1b5mR8TfB3VYFh7JD0fCf9Km1NLYCYD8cYN6LF0g20NK5bQLcfsny282lbPpuc0LqDZqjNeyrf8FjiSqzpkUPIlTT1FKsH721NJSUMgTG4jqI1zTKkjRINd9lh61nEOeP6HW1VgFxSIPM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWAG+wPr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWAG+wPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752784171; x=1784320171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Tse8GHd77bof5pmdIXzeDDuT0ORqPZRxD7NIWarrbo=;
  b=RWAG+wPrDcNQZEPvpWjMmtkKuFYZ7B/dsK+wHf4IhxKLk7BU4dizm8z4
   UVqujO3PR0hU6XnkIhjbwB7ro9029ZHJULS2XvCGfohUddaKwbo3wKMmS
   DCkqhM8VqrjGxT/G1DrjyYhr8Lyd26wGP6xybzTbue68IgVo39J87ZRL2
   LYQoAQkn0BXmYzt+oxbcoYaBgwtWNYAaiBtRUTZsz8Rg+rSye3dmKVcb4
   NQDejUu1wY94cZBDXPZF2yfd1Au11VMbMfd17Q+Si0eLgPReCgnU8tujm
   rZytUAS/V0P3AYIVuS/mwfwLscO5p7WE+ADCNfyJKPo8hYwuuvnorXz1x
   A==;
X-CSE-ConnectionGUID: bR9SlKpGQSqu8KC2xjrhrA==
X-CSE-MsgGUID: WxQ1FUiqT12eaU3U1oQLNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55199010"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55199010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 13:29:30 -0700
X-CSE-ConnectionGUID: iAAENXxjQPyEzhyOkpHB+A==
X-CSE-MsgGUID: 2a7OGkMITOWjNZw1w+FECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="158583070"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 13:29:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucVEM-000E07-10;
	Thu, 17 Jul 2025 20:29:26 +0000
Date: Fri, 18 Jul 2025 04:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v2 20/29]
 drivers/pci/pci-driver.c:405:1: warning: label 'out' defined but not used
Message-ID: <202507180431.PV6cAB1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   57ab96f90be8847755ecda5bbeb0b543dcf20c31
commit: 0ea1df67a7813df4fca333efe6cff8d866f06c31 [20/29] PCI: Remove superfluous HK_TYPE_WQ check
config: i386-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180431.PV6cAB1e-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180431.PV6cAB1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180431.PV6cAB1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pci-driver.c: In function 'pci_call_probe':
>> drivers/pci/pci-driver.c:405:1: warning: label 'out' defined but not used [-Wunused-label]
     405 | out:
         | ^~~


vim +/out +405 drivers/pci/pci-driver.c

0b2c2a71e6f07f Thomas Gleixner     2017-05-24  361  
d42c69972b853f Andi Kleen          2005-07-06  362  static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
d42c69972b853f Andi Kleen          2005-07-06  363  			  const struct pci_device_id *id)
d42c69972b853f Andi Kleen          2005-07-06  364  {
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  365  	int error, node, cpu;
873392ca514f87 Rusty Russell       2008-12-31  366  	struct drv_dev_and_id ddi = { drv, dev, id };
873392ca514f87 Rusty Russell       2008-12-31  367  
12c3156f10c5d8 Alexander Duyck     2013-11-18  368  	/*
12c3156f10c5d8 Alexander Duyck     2013-11-18  369  	 * Execute driver initialization on node where the device is
12c3156f10c5d8 Alexander Duyck     2013-11-18  370  	 * attached.  This way the driver likely allocates its local memory
12c3156f10c5d8 Alexander Duyck     2013-11-18  371  	 * on the right node.
12c3156f10c5d8 Alexander Duyck     2013-11-18  372  	 */
873392ca514f87 Rusty Russell       2008-12-31  373  	node = dev_to_node(&dev->dev);
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  374  	dev->is_probed = 1;
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  375  
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  376  	cpu_hotplug_disable();
12c3156f10c5d8 Alexander Duyck     2013-11-18  377  	/*
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  378  	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  379  	 * device is probed from work_on_cpu() of the Physical device.
12c3156f10c5d8 Alexander Duyck     2013-11-18  380  	 */
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  381  	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
9d42ea0d698404 Frederic Weisbecker 2022-02-07  382  	    pci_physfn_is_probed(dev)) {
4665b675d953ef Frederic Weisbecker 2025-05-14  383  		error = local_pci_probe(&ddi);
9d42ea0d698404 Frederic Weisbecker 2022-02-07  384  	} else {
4665b675d953ef Frederic Weisbecker 2025-05-14  385  		struct pci_probe_arg arg = { .ddi = &ddi };
4665b675d953ef Frederic Weisbecker 2025-05-14  386  
4665b675d953ef Frederic Weisbecker 2025-05-14  387  		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
9d42ea0d698404 Frederic Weisbecker 2022-02-07  388  
4665b675d953ef Frederic Weisbecker 2025-05-14  389  		rcu_read_lock();
0ea1df67a7813d Frederic Weisbecker 2025-07-16  390  		cpu = cpumask_any_and(cpumask_of_node(node),
04d4e665a60902 Frederic Weisbecker 2022-02-07  391  				      housekeeping_cpumask(HK_TYPE_DOMAIN));
9d42ea0d698404 Frederic Weisbecker 2022-02-07  392  
4665b675d953ef Frederic Weisbecker 2025-05-14  393  		if (cpu < nr_cpu_ids) {
4665b675d953ef Frederic Weisbecker 2025-05-14  394  			schedule_work_on(cpu, &arg.work);
4665b675d953ef Frederic Weisbecker 2025-05-14  395  			rcu_read_unlock();
4665b675d953ef Frederic Weisbecker 2025-05-14  396  			flush_work(&arg.work);
4665b675d953ef Frederic Weisbecker 2025-05-14  397  			error = arg.ret;
4665b675d953ef Frederic Weisbecker 2025-05-14  398  		} else {
4665b675d953ef Frederic Weisbecker 2025-05-14  399  			rcu_read_unlock();
4665b675d953ef Frederic Weisbecker 2025-05-14  400  			error = local_pci_probe(&ddi);
9d42ea0d698404 Frederic Weisbecker 2022-02-07  401  		}
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  402  
4665b675d953ef Frederic Weisbecker 2025-05-14  403  		destroy_work_on_stack(&arg.work);
4665b675d953ef Frederic Weisbecker 2025-05-14  404  	}
9d42ea0d698404 Frederic Weisbecker 2022-02-07 @405  out:
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  406  	dev->is_probed = 0;
0b2c2a71e6f07f Thomas Gleixner     2017-05-24  407  	cpu_hotplug_enable();
d42c69972b853f Andi Kleen          2005-07-06  408  	return error;
d42c69972b853f Andi Kleen          2005-07-06  409  }
d42c69972b853f Andi Kleen          2005-07-06  410  

:::::: The code at line 405 was first introduced by commit
:::::: 9d42ea0d6984044a82258f41d8407ee442687f30 pci: Decouple HK_FLAG_WQ and HK_FLAG_DOMAIN cpumask fetch

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
