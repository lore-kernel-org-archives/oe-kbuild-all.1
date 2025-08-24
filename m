Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A11F3B9E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 23:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756078759; cv=none; b=jOwv44jB47MR1ZuDoE1XmUNEqIGVC7v1SKhMaEOpenFXhnaEvWRWj62n5Rfnfu40TLHJhs2+RgXpPh2ZcCIzvs8+r2wL4SIXt2AR9MX8Ez35DmAfHrfCFETdgX8a5k0ZiRdvOSvXb3tSJb7q5HQAYdxZb4ECXa3Ci/Ur9IvHMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756078759; c=relaxed/simple;
	bh=WF0W/KE7bTeGqvIreLp4hlVzMbaqlBhpUM7gp5jDulo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1GaTI5WTnwpmQgiT0IWptvfIJVexXccWOR87x3cv1sVk+AWmV2CJVPMKD0hh047gZ48G75YLx1X5dSX+NB9Ty9d1SXKVlytcPRWbXRZJ5aviL/f6XppnTRI8JFOP8lWraqFrDzFqBzIyx+0gFj2FXcDwSMU5i9h1G6uZQLWnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j95vpvZc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j95vpvZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756078757; x=1787614757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WF0W/KE7bTeGqvIreLp4hlVzMbaqlBhpUM7gp5jDulo=;
  b=j95vpvZcIi9x0ffCjT1SgHPQxkuD1Bn5fjKkyjgrHWrK1/tLmoUhEEfv
   aQxfDWy1oBPXbWbnNXiEUeqE6NXNzNnm+2fbXj2D9nh5r1d2aqvJje1+C
   DsVjassX9XTHNpyiNw14gj1Hm5XTLlINK1hvx4NXd3Rq7JbocG0QOn1xw
   p5/2ITIBAun0AJpZrIfXqIWj6+zM2L+sF92C7lmwxHM246xEQW8Onc1GD
   nhsxp9I8T3DuYg+8EGiBbADbYicB1Wyas7UtZrv6jluOcBuBaFZfRtR7e
   cRdgQ4GkZPQ1o7bJ+NrW1ucbQEO+n3Y3ag4VUtepQ51VhWUBh3lPIAxxH
   g==;
X-CSE-ConnectionGUID: 46ljPnfgTkKndCWPi8qXrg==
X-CSE-MsgGUID: dLyhF/8/SKqCGJbF59H/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="60918497"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60918497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 16:39:17 -0700
X-CSE-ConnectionGUID: OCsDfnTjT6mpehXhUuybog==
X-CSE-MsgGUID: fDD0G7P/RR2oWDsyrFSr3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173433881"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2025 16:39:16 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqKIs-0002Fr-0Z;
	Sun, 24 Aug 2025 23:39:14 +0000
Date: Mon, 25 Aug 2025 01:39:13 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2/2]
 drivers/net/ethernet/intel/iavf/iavf_main.c:3784: warning: Function
 parameter or member 'dev_d' not described in 'iavf_suspend'
Message-ID: <202508250150.JQSXabEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vaibhav,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e4601d0bb216a56336728892a74ca28f26967193
commit: 029ced5cce896fc0ee3dd0b7600cdbca028a868c [2/2] iavf: use generic power management
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250825/202508250150.JQSXabEm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250150.JQSXabEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250150.JQSXabEm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/iavf/iavf_main.c:2586: warning: Function parameter or member 'adapter' not described in 'iavf_del_all_cloud_filters'
   drivers/net/ethernet/intel/iavf/iavf_main.c:2611: warning: Function parameter or member 'type_data' not described in '__iavf_setup_tc'
   drivers/net/ethernet/intel/iavf/iavf_main.c:2611: warning: Excess function parameter 'type_date' description in '__iavf_setup_tc'
   drivers/net/ethernet/intel/iavf/iavf_main.c:2706: warning: Function parameter or member 'f' not described in 'iavf_parse_cls_flower'
   drivers/net/ethernet/intel/iavf/iavf_main.c:2706: warning: Excess function parameter 'cls_flower' description in 'iavf_parse_cls_flower'
   drivers/net/ethernet/intel/iavf/iavf_main.c:3079: warning: Function parameter or member 'adapter' not described in 'iavf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/iavf_main.c:3079: warning: Function parameter or member 'cls_flower' not described in 'iavf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/iavf_main.c:3079: warning: Excess function parameter 'netdev' description in 'iavf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/iavf_main.c:3079: warning: Excess function parameter 'type_data' description in 'iavf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/iavf_main.c:3131: warning: Function parameter or member 'type_data' not described in 'iavf_setup_tc'
   drivers/net/ethernet/intel/iavf/iavf_main.c:3131: warning: Excess function parameter 'type_date' description in 'iavf_setup_tc'
>> drivers/net/ethernet/intel/iavf/iavf_main.c:3784: warning: Function parameter or member 'dev_d' not described in 'iavf_suspend'
>> drivers/net/ethernet/intel/iavf/iavf_main.c:3784: warning: Excess function parameter 'pdev' description in 'iavf_suspend'
>> drivers/net/ethernet/intel/iavf/iavf_main.c:3784: warning: Excess function parameter 'state' description in 'iavf_suspend'
>> drivers/net/ethernet/intel/iavf/iavf_main.c:3814: warning: Function parameter or member 'dev_d' not described in 'iavf_resume'
>> drivers/net/ethernet/intel/iavf/iavf_main.c:3814: warning: Excess function parameter 'pdev' description in 'iavf_resume'


vim +3784 drivers/net/ethernet/intel/iavf/iavf_main.c

5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3775  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3776  /**
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3777   * iavf_suspend - Power management suspend routine
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3778   * @pdev: PCI device information struct
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3779   * @state: unused
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3780   *
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3781   * Called when the system (VM) is entering sleep/suspend.
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3782   **/
029ced5cce896f drivers/net/ethernet/intel/iavf/iavf_main.c     Vaibhav Gupta    2020-06-29  3783  static int __maybe_unused iavf_suspend(struct device *dev_d)
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21 @3784  {
029ced5cce896f drivers/net/ethernet/intel/iavf/iavf_main.c     Vaibhav Gupta    2020-06-29  3785  	struct net_device *netdev = dev_get_drvdata(dev_d);
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3786  	struct iavf_adapter *adapter = netdev_priv(netdev);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3787  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3788  	netif_device_detach(netdev);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3789  
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3790  	while (test_and_set_bit(__IAVF_IN_CRITICAL_TASK,
9b2aef128bff37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Keller     2017-10-27  3791  				&adapter->crit_section))
9b2aef128bff37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Keller     2017-10-27  3792  		usleep_range(500, 1000);
9b2aef128bff37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Keller     2017-10-27  3793  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3794  	if (netif_running(netdev)) {
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3795  		rtnl_lock();
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3796  		iavf_down(adapter);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3797  		rtnl_unlock();
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3798  	}
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3799  	iavf_free_misc_irq(adapter);
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3800  	iavf_reset_interrupt_capability(adapter);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3801  
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3802  	clear_bit(__IAVF_IN_CRITICAL_TASK, &adapter->crit_section);
9b2aef128bff37 drivers/net/ethernet/intel/i40evf/i40evf_main.c Jacob Keller     2017-10-27  3803  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3804  	return 0;
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3805  }
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3806  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3807  /**
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3808   * iavf_resume - Power management resume routine
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3809   * @pdev: PCI device information struct
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3810   *
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3811   * Called when the system (VM) is resumed from sleep/suspend.
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3812   **/
029ced5cce896f drivers/net/ethernet/intel/iavf/iavf_main.c     Vaibhav Gupta    2020-06-29  3813  static int __maybe_unused iavf_resume(struct device *dev_d)
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21 @3814  {
029ced5cce896f drivers/net/ethernet/intel/iavf/iavf_main.c     Vaibhav Gupta    2020-06-29  3815  	struct pci_dev *pdev = to_pci_dev(dev_d);
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3816  	struct iavf_adapter *adapter = pci_get_drvdata(pdev);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3817  	struct net_device *netdev = adapter->netdev;
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3818  	u32 err;
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3819  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3820  	pci_set_master(pdev);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3821  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3822  	rtnl_lock();
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3823  	err = iavf_set_interrupt_capability(adapter);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3824  	if (err) {
f2a1c3680c1d9e drivers/net/ethernet/intel/i40evf/i40evf_main.c Vasily Averin    2015-07-07  3825  		rtnl_unlock();
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3826  		dev_err(&pdev->dev, "Cannot enable MSI-X interrupts.\n");
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3827  		return err;
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3828  	}
129cf89e585676 drivers/net/ethernet/intel/iavf/i40evf_main.c   Jesse Brandeburg 2018-09-14  3829  	err = iavf_request_misc_irq(adapter);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3830  	rtnl_unlock();
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3831  	if (err) {
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3832  		dev_err(&pdev->dev, "Cannot get interrupt vector.\n");
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3833  		return err;
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3834  	}
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3835  
fdd4044ffdc831 drivers/net/ethernet/intel/iavf/iavf_main.c     Jakub Pawlak     2019-05-14  3836  	queue_work(iavf_wq, &adapter->reset_task);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3837  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3838  	netif_device_attach(netdev);
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3839  
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3840  	return err;
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3841  }
5eae00c57f5e42 drivers/net/ethernet/intel/i40evf/i40evf_main.c Greg Rose        2013-12-21  3842  

:::::: The code at line 3784 was first introduced by commit
:::::: 5eae00c57f5e42bf201023471917da213c4946d6 i40evf: main driver core

:::::: TO: Greg Rose <gregory.v.rose@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
