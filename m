Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC42185B2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429980; cv=none; b=I6Qoj2KR7hDxbaLBUbCuQSpFIxuCQIWRWUa5ymrASPqKWkld3luTMMp1XDCYT++ODq/FbbSa5Knj5Zw/eFe0W3/VWJDL3FfD1d/YNCUOS8SO1FjJvwf6B21lPSI9b2dEgKunTcbw4kedpbM2T2GRXLdsqMV7jWzJOe8GoxA/o/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429980; c=relaxed/simple;
	bh=/EiyGIXWM1MQVROLCgi6Hy+a8Qim6DTg6n7D3w7TK+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPx1PhUHGZjLGtBKfSkcDcOJw763JCjrBNw83P05CRCMv8j32YzJamcU59g11+bcKu9YAtzsx/xJcVV7qtTxxsBD7QXg6/hwYwUzP1mpVpnx+5UfHIaE/xSwNCGRNinyveY2lsB5H/bn93eAFl3H8pwAr2lQ4qKxO2jp+riH18A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knqv5RPj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knqv5RPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736429978; x=1767965978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EiyGIXWM1MQVROLCgi6Hy+a8Qim6DTg6n7D3w7TK+A=;
  b=knqv5RPjAfSr3ddehLlsrhRdWD4fp9qiJtqUAGA1uBLnGlc/SrMAYvaM
   iIGO8WbwrmSbkKY/MdZdc/HWBF14rKc0ZeeNMf/tNfXK7X+RSM1T8M87F
   V0Q1rajxugeGBAkOz2BZWbCzeFjzKsNlsl9e+8Mu+yCjpyu8NjATGTQw0
   dnfnOvOjDlk91qXUlZoboYl6IUSOH8TQLKNzrnItwOFyyE2eTax6GqBce
   ViIiAobFI/tQFFB1/bhVcaLhBP4bAmbpFji2njhrwHu7mfzKj3Z0SYrjq
   2EvBE4dqPcFB2E7ri691g6VzDREqPV+qy+/ZFvH/kRFmyOTQ7dw43uQX/
   Q==;
X-CSE-ConnectionGUID: rrpf7MdWT7mG93qDA/YnmQ==
X-CSE-MsgGUID: /sFowoZaTBuR1QFwJM57rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36847416"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36847416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 05:39:37 -0800
X-CSE-ConnectionGUID: q2sLRbPyQV6CgHfjq6vpTw==
X-CSE-MsgGUID: pYZmrHZjSpWKqVaMv+ianQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103214675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2025 05:39:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVsl3-000Hbf-1J;
	Thu, 09 Jan 2025 13:39:33 +0000
Date: Thu, 9 Jan 2025 21:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_driver.c:335: warning: Function parameter or
 struct member 'pdev' not described in 'eeh_report_error'
Message-ID: <202501092113.9Nw6lqSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eea6e4b4dfb8859446177c32961c96726d0117be
commit: 2e25505147b8acf6510b9d5d951fd4c75f2e9bf2 powerpc/eeh: Fix crash when edev->pdev changes
date:   5 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250109/202501092113.9Nw6lqSZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092113.9Nw6lqSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092113.9Nw6lqSZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/eeh_driver.c:149: warning: Function parameter or struct member 'edev' not described in 'eeh_disable_irq'
   arch/powerpc/kernel/eeh_driver.c:149: warning: Excess function parameter 'dev' description in 'eeh_disable_irq'
   arch/powerpc/kernel/eeh_driver.c:172: warning: Function parameter or struct member 'edev' not described in 'eeh_enable_irq'
   arch/powerpc/kernel/eeh_driver.c:172: warning: Excess function parameter 'dev' description in 'eeh_enable_irq'
>> arch/powerpc/kernel/eeh_driver.c:335: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_error'
>> arch/powerpc/kernel/eeh_driver.c:361: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_mmio_enabled'
>> arch/powerpc/kernel/eeh_driver.c:381: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_reset'
>> arch/powerpc/kernel/eeh_driver.c:428: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_resume'
>> arch/powerpc/kernel/eeh_driver.c:454: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_failure'


vim +335 arch/powerpc/kernel/eeh_driver.c

77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  324  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  325  /**
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  326   * eeh_report_error - Report pci error to each device driver
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  327   * @edev: eeh device
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  328   * @driver: device's PCI driver
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  329   *
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  330   * Report an EEH error to each device driver.
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  331   */
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  332  static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  333  					    struct pci_dev *pdev,
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  334  					    struct pci_driver *driver)
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25 @335  {
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  336  	enum pci_ers_result rc;
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  337  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  338  	if (!driver->err_handler->error_detected)
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  339  		return PCI_ERS_RESULT_NONE;
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  340  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  341  	eeh_edev_info(edev, "Invoking %s->error_detected(IO frozen)",
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  342  		      driver->name);
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  343  	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
2a50f144fc6081 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2007-11-03  344  
67086e32b56481 arch/powerpc/kernel/eeh_driver.c            Wei Yang        2016-03-04  345  	edev->in_error = true;
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  346  	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  347  	return rc;
6a1ca373a16b0e arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  348  }
6a1ca373a16b0e arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  349  
6a1ca373a16b0e arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  350  /**
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  351   * eeh_report_mmio_enabled - Tell drivers that MMIO has been enabled
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  352   * @edev: eeh device
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  353   * @driver: device's PCI driver
6a1ca373a16b0e arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  354   *
638799b3358633 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2007-11-03  355   * Tells each device driver that IO ports, MMIO and config space I/O
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  356   * are now enabled.
6a1ca373a16b0e arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  357   */
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  358  static enum pci_ers_result eeh_report_mmio_enabled(struct eeh_dev *edev,
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  359  						   struct pci_dev *pdev,
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  360  						   struct pci_driver *driver)
6a1ca373a16b0e arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15 @361  {
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  362  	if (!driver->err_handler->mmio_enabled)
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  363  		return PCI_ERS_RESULT_NONE;
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  364  	eeh_edev_info(edev, "Invoking %s->mmio_enabled()", driver->name);
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  365  	return driver->err_handler->mmio_enabled(pdev);
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  366  }
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  367  
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  368  /**
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  369   * eeh_report_reset - Tell device that slot has been reset
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  370   * @edev: eeh device
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  371   * @driver: device's PCI driver
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  372   *
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  373   * This routine must be called while EEH tries to reset particular
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  374   * PCI device so that the associated PCI device driver could take
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  375   * some actions, usually to save data the driver needs so that the
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  376   * driver can work again while the device is recovered.
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  377   */
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  378  static enum pci_ers_result eeh_report_reset(struct eeh_dev *edev,
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  379  					    struct pci_dev *pdev,
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  380  					    struct pci_driver *driver)
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03 @381  {
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  382  	if (!driver->err_handler->slot_reset || !edev->in_error)
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  383  		return PCI_ERS_RESULT_NONE;
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  384  	eeh_edev_info(edev, "Invoking %s->slot_reset()", driver->name);
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  385  	return driver->err_handler->slot_reset(pdev);
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  386  }
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  387  
d6c4932fbf2421 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  388  static void *eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  389  {
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  390  	struct pci_dev *pdev;
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  391  
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  392  	if (!edev)
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  393  		return NULL;
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  394  
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  395  	/*
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  396  	 * The content in the config space isn't saved because
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  397  	 * the blocked config space on some adapters. We have
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  398  	 * to restore the initial saved config space when the
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  399  	 * EEH device is created.
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  400  	 */
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  401  	if (edev->pe && (edev->pe->state & EEH_PE_CFG_RESTRICTED)) {
80e65b009413e3 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-09-12  402  		if (list_is_last(&edev->entry, &edev->pe->edevs))
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  403  			eeh_pe_restore_bars(edev->pe);
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  404  
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  405  		return NULL;
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  406  	}
5a0cdbfd17b90a arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2016-04-27  407  
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  408  	pdev = eeh_dev_to_pci_dev(edev);
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  409  	if (!pdev)
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  410  		return NULL;
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  411  
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  412  	pci_restore_state(pdev);
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  413  	return NULL;
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  414  }
5cfb20b96f624e arch/powerpc/kernel/eeh_driver.c            Gavin Shan      2014-09-30  415  
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  416  /**
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  417   * eeh_report_resume - Tell device to resume normal operations
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  418   * @edev: eeh device
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  419   * @driver: device's PCI driver
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  420   *
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  421   * This routine must be called to notify the device driver that it
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  422   * could resume so that the device driver can do some initialization
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  423   * to make the recovered device work again.
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  424   */
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  425  static enum pci_ers_result eeh_report_resume(struct eeh_dev *edev,
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  426  					     struct pci_dev *pdev,
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  427  					     struct pci_driver *driver)
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03 @428  {
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  429  	if (!driver->err_handler->resume || !edev->in_error)
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  430  		return PCI_ERS_RESULT_NONE;
f0295e047fcf52 arch/powerpc/kernel/eeh_driver.c            Michael Neuling 2018-03-26  431  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  432  	eeh_edev_info(edev, "Invoking %s->resume()", driver->name);
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  433  	driver->err_handler->resume(pdev);
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  434  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  435  	pci_uevent_ers(edev->pdev, PCI_ERS_RESULT_RECOVERED);
856e1eb9bdd4bd arch/powerpc/kernel/eeh_driver.c            Bryant G. Ly    2018-01-05  436  #ifdef CONFIG_PCI_IOV
521ca5a9859a87 arch/powerpc/kernel/eeh_driver.c            Juan J. Alvarez 2018-02-15  437  	if (eeh_ops->notify_resume && eeh_dev_to_pdn(edev))
856e1eb9bdd4bd arch/powerpc/kernel/eeh_driver.c            Bryant G. Ly    2018-01-05  438  		eeh_ops->notify_resume(eeh_dev_to_pdn(edev));
856e1eb9bdd4bd arch/powerpc/kernel/eeh_driver.c            Bryant G. Ly    2018-01-05  439  #endif
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  440  	return PCI_ERS_RESULT_NONE;
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  441  }
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  442  
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  443  /**
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-02-27  444   * eeh_report_failure - Tell device driver that device is dead.
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  445   * @edev: eeh device
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  446   * @driver: device's PCI driver
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  447   *
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  448   * This informs the device driver that the device is permanently
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  449   * dead, and that no further recovery attempts will be made on it.
cb5b562444c27c arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2006-09-15  450   */
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  451  static enum pci_ers_result eeh_report_failure(struct eeh_dev *edev,
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  452  					      struct pci_dev *pdev,
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  453  					      struct pci_driver *driver)
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03 @454  {
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  455  	enum pci_ers_result rc;
9b3c76f08122f5 arch/powerpc/platforms/pseries/eeh_driver.c Gavin Shan      2012-09-07  456  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  457  	if (!driver->err_handler->error_detected)
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  458  		return PCI_ERS_RESULT_NONE;
f0295e047fcf52 arch/powerpc/kernel/eeh_driver.c            Michael Neuling 2018-03-26  459  
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  460  	eeh_edev_info(edev, "Invoking %s->error_detected(permanent failure)",
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  461  		      driver->name);
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  462  	rc = driver->err_handler->error_detected(pdev,
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  463  						 pci_channel_io_perm_failure);
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  464  
2e25505147b8ac arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2019-08-16  465  	pci_uevent_ers(pdev, PCI_ERS_RESULT_DISCONNECT);
20b344971433da arch/powerpc/kernel/eeh_driver.c            Sam Bobroff     2018-05-25  466  	return rc;
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  467  }
77bd7415610161 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas   2005-11-03  468  

:::::: The code at line 335 was first introduced by commit
:::::: 20b344971433da7bcd19265e5dc00a4d0df5e77e powerpc/eeh: Refactor report functions

:::::: TO: Sam Bobroff <sbobroff@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
