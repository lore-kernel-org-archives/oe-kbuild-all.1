Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7F4FBE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717031262; cv=none; b=Tj6Nz7fUEh5IWooYSGPsqqHyZAFPQkSRlr2s8jpQNHKJ98LzSRX0iyHlkOHfC2jGEbNTYHQpooBFBm2HdYXK7bXPfaiRd3gZv6SVNXgvu8TsL4wwWsQ/10yOcpnyIfq/AqAnNTrQiP/wYw+IOS2ESPNfCgQ+MWroou/66v3j+HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717031262; c=relaxed/simple;
	bh=brx6C6fw/LorbWNXk+acMQrSZmUN8zWLEXU53wWF12A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f769C/3Z3knTNaL2YB2xCGzqknOttPK/9SpWy3UyEacSzeyvnER/Zqo8Q6fK7BRylE3HDWJsUeAVP4GhW2W/ILQs+YBd5nLO8MpiaE7sROgMYmQ3bnbNdsJHKfB1/wYR8VqmsIotSL9ofvPUrELxq6s2cTkQ1XNAX58Gyt+7sPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWPq8wox; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWPq8wox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717031261; x=1748567261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brx6C6fw/LorbWNXk+acMQrSZmUN8zWLEXU53wWF12A=;
  b=aWPq8woxuOENCoXK7tWYSBZgmue1KGqiLK5N0VpSmersWaPEXzaU4eYa
   HLVTW1FSY1Q/NcEdYQrClGKOn5SkLQhYiueOTgviSomBKsTVAr6FlvU2N
   ZAkOn/wrJD8LlHimQOOE6p62j6OdGHYd+gBCPk7jZuiL0+Wsc6jWFpAQd
   bOa2H/020a4qR/BJ3oxG21C25/dd9M9otcRmOU3C9AepFVm9Wa3X5/dmc
   LVpnfy8AQQvZlHtgP9PbI3xslPf5Q3HnlS/AuNY/I0cBQlV6H2C/WpqwT
   HPr7RFmQU6r5fbJy5xKNKVzyDf+uINX9orSHdA7DqHHIiAT6ew7RFY8Lp
   g==;
X-CSE-ConnectionGUID: BHnctBCmT5mmx193iS89YA==
X-CSE-MsgGUID: 7luN+oNVT6uAhesMWbqlGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="11770389"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="11770389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 18:07:40 -0700
X-CSE-ConnectionGUID: 2OIELilSRgaDy1ItU9sVfw==
X-CSE-MsgGUID: Gin7q0PkSOO1yvIkVnXZ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40540039"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 18:07:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCUGV-000EOn-39;
	Thu, 30 May 2024 01:07:35 +0000
Date: Thu, 30 May 2024 09:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/9] pci: pcie: Drop priv_data from struct
 pcie_device and use dev_get/set_drvdata() instead.
Message-ID: <202405300829.VnGrvAsa-lkp@intel.com>
References: <20240529164103.31671-2-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529164103.31671-2-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus cxl/next linus/master cxl/pending v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/pci-pcie-Drop-priv_data-from-struct-pcie_device-and-use-dev_get-set_drvdata-instead/20240530-004705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240529164103.31671-2-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH 1/9] pci: pcie: Drop priv_data from struct pcie_device and use dev_get/set_drvdata() instead.
config: i386-randconfig-006-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300829.VnGrvAsa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300829.VnGrvAsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300829.VnGrvAsa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pcie/aer_inject.c: In function 'aer_inject':
>> drivers/pci/pcie/aer_inject.c:467:22: error: implicit declaration of function 'get_service_data' [-Werror=implicit-function-declaration]
     467 |                 if (!get_service_data(edev)) {
         |                      ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_service_data +467 drivers/pci/pcie/aer_inject.c

c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  318  
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  319  static int aer_inject(struct aer_error_inj *einj)
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  320  {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  321  	struct aer_error *err, *rperr;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  322  	struct aer_error *err_alloc = NULL, *rperr_alloc = NULL;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  323  	struct pci_dev *dev, *rpdev;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  324  	struct pcie_device *edev;
0e98db259fd876 drivers/pci/pcie/aer_inject.c     Keith Busch      2018-10-11  325  	struct device *device;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  326  	unsigned long flags;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  327  	unsigned int devfn = PCI_DEVFN(einj->dev, einj->fn);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  328  	int pos_cap_err, rp_pos_cap_err;
40294d8f143847 drivers/pci/pcie/aer/aer_inject.c Wanlong Gao      2011-04-04  329  	u32 sever, cor_mask, uncor_mask, cor_mask_orig = 0, uncor_mask_orig = 0;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  330  	int ret = 0;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  331  
28ef241f05c20c drivers/pci/pcie/aer/aer_inject.c Keith Busch      2016-01-12  332  	dev = pci_get_domain_bus_and_slot(einj->domain, einj->bus, devfn);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  333  	if (!dev)
1d0243559497b9 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2009-10-12  334  		return -ENODEV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  335  	rpdev = pcie_find_root_port(dev);
d292dd0eb3ac6c drivers/pci/pcie/aer_inject.c     Qiuxu Zhuo       2020-11-20  336  	/* If Root Port not found, try to find an RCEC */
d292dd0eb3ac6c drivers/pci/pcie/aer_inject.c     Qiuxu Zhuo       2020-11-20  337  	if (!rpdev)
d292dd0eb3ac6c drivers/pci/pcie/aer_inject.c     Qiuxu Zhuo       2020-11-20  338  		rpdev = dev->rcec;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  339  	if (!rpdev) {
d292dd0eb3ac6c drivers/pci/pcie/aer_inject.c     Qiuxu Zhuo       2020-11-20  340  		pci_err(dev, "Neither Root Port nor RCEC found\n");
e82b14bdd390c5 drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2013-03-20  341  		ret = -ENODEV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  342  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  343  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  344  
f0553ba08a1903 drivers/pci/pcie/aer/aer_inject.c Frederick Lawler 2018-03-22  345  	pos_cap_err = dev->aer_cap;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  346  	if (!pos_cap_err) {
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  347  		pci_err(dev, "Device doesn't support AER\n");
20ac75e563d09f drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  348  		ret = -EPROTONOSUPPORT;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  349  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  350  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  351  	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, &sever);
bd1f46deba6159 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2010-01-22  352  	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, &cor_mask);
bd1f46deba6159 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2010-01-22  353  	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK,
bd1f46deba6159 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2010-01-22  354  			      &uncor_mask);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  355  
f0553ba08a1903 drivers/pci/pcie/aer/aer_inject.c Frederick Lawler 2018-03-22  356  	rp_pos_cap_err = rpdev->aer_cap;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  357  	if (!rp_pos_cap_err) {
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  358  		pci_err(rpdev, "Root port doesn't support AER\n");
20ac75e563d09f drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  359  		ret = -EPROTONOSUPPORT;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  360  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  361  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  362  
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  363  	err_alloc =  kzalloc(sizeof(struct aer_error), GFP_KERNEL);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  364  	if (!err_alloc) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  365  		ret = -ENOMEM;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  366  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  367  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  368  	rperr_alloc =  kzalloc(sizeof(struct aer_error), GFP_KERNEL);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  369  	if (!rperr_alloc) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  370  		ret = -ENOMEM;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  371  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  372  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  373  
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  374  	if (aer_mask_override) {
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  375  		cor_mask_orig = cor_mask;
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  376  		cor_mask &= !(einj->cor_status);
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  377  		pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK,
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  378  				       cor_mask);
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  379  
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  380  		uncor_mask_orig = uncor_mask;
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  381  		uncor_mask &= !(einj->uncor_status);
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  382  		pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK,
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  383  				       uncor_mask);
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  384  	}
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  385  
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  386  	spin_lock_irqsave(&inject_lock, flags);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  387  
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  388  	err = __find_aer_error_by_dev(dev);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  389  	if (!err) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  390  		err = err_alloc;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  391  		err_alloc = NULL;
cc5d153a0ca794 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2009-10-12  392  		aer_error_init(err, einj->domain, einj->bus, devfn,
cc5d153a0ca794 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2009-10-12  393  			       pos_cap_err);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  394  		list_add(&err->list, &einjected);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  395  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  396  	err->uncor_status |= einj->uncor_status;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  397  	err->cor_status |= einj->cor_status;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  398  	err->header_log0 = einj->header_log0;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  399  	err->header_log1 = einj->header_log1;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  400  	err->header_log2 = einj->header_log2;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  401  	err->header_log3 = einj->header_log3;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  402  
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  403  	if (!aer_mask_override && einj->cor_status &&
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  404  	    !(einj->cor_status & ~cor_mask)) {
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  405  		ret = -EINVAL;
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  406  		pci_warn(dev, "The correctable error(s) is masked by device\n");
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  407  		spin_unlock_irqrestore(&inject_lock, flags);
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  408  		goto out_put;
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  409  	}
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  410  	if (!aer_mask_override && einj->uncor_status &&
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  411  	    !(einj->uncor_status & ~uncor_mask)) {
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  412  		ret = -EINVAL;
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  413  		pci_warn(dev, "The uncorrectable error(s) is masked by device\n");
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  414  		spin_unlock_irqrestore(&inject_lock, flags);
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  415  		goto out_put;
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  416  	}
b49bfd32901625 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-17  417  
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  418  	rperr = __find_aer_error_by_dev(rpdev);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  419  	if (!rperr) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  420  		rperr = rperr_alloc;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  421  		rperr_alloc = NULL;
cc5d153a0ca794 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2009-10-12  422  		aer_error_init(rperr, pci_domain_nr(rpdev->bus),
cc5d153a0ca794 drivers/pci/pcie/aer/aer_inject.c Andrew Patterson 2009-10-12  423  			       rpdev->bus->number, rpdev->devfn,
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  424  			       rp_pos_cap_err);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  425  		list_add(&rperr->list, &einjected);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  426  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  427  	if (einj->cor_status) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  428  		if (rperr->root_status & PCI_ERR_ROOT_COR_RCV)
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  429  			rperr->root_status |= PCI_ERR_ROOT_MULTI_COR_RCV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  430  		else
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  431  			rperr->root_status |= PCI_ERR_ROOT_COR_RCV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  432  		rperr->source_id &= 0xffff0000;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  433  		rperr->source_id |= (einj->bus << 8) | devfn;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  434  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  435  	if (einj->uncor_status) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  436  		if (rperr->root_status & PCI_ERR_ROOT_UNCOR_RCV)
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  437  			rperr->root_status |= PCI_ERR_ROOT_MULTI_UNCOR_RCV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  438  		if (sever & einj->uncor_status) {
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  439  			rperr->root_status |= PCI_ERR_ROOT_FATAL_RCV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  440  			if (!(rperr->root_status & PCI_ERR_ROOT_UNCOR_RCV))
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  441  				rperr->root_status |= PCI_ERR_ROOT_FIRST_FATAL;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  442  		} else
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  443  			rperr->root_status |= PCI_ERR_ROOT_NONFATAL_RCV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  444  		rperr->root_status |= PCI_ERR_ROOT_UNCOR_RCV;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  445  		rperr->source_id &= 0x0000ffff;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  446  		rperr->source_id |= ((einj->bus << 8) | devfn) << 16;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  447  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  448  	spin_unlock_irqrestore(&inject_lock, flags);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  449  
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  450  	if (aer_mask_override) {
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  451  		pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK,
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  452  				       cor_mask_orig);
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  453  		pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK,
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  454  				       uncor_mask_orig);
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  455  	}
457d9d088b026e drivers/pci/pcie/aer/aer_inject.c Prarit Bhargava  2011-01-11  456  
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  457  	ret = pci_bus_set_aer_ops(dev->bus);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  458  	if (ret)
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  459  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  460  	ret = pci_bus_set_aer_ops(rpdev->bus);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  461  	if (ret)
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  462  		goto out_put;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  463  
0e98db259fd876 drivers/pci/pcie/aer_inject.c     Keith Busch      2018-10-11  464  	device = pcie_port_find_device(rpdev, PCIE_PORT_SERVICE_AER);
0e98db259fd876 drivers/pci/pcie/aer_inject.c     Keith Busch      2018-10-11  465  	if (device) {
0e98db259fd876 drivers/pci/pcie/aer_inject.c     Keith Busch      2018-10-11  466  		edev = to_pcie_device(device);
46256f83d0d066 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-11 @467  		if (!get_service_data(edev)) {
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  468  			pci_warn(edev->port, "AER service is not initialized\n");
20ac75e563d09f drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  469  			ret = -EPROTONOSUPPORT;
46256f83d0d066 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-11  470  			goto out_put;
46256f83d0d066 drivers/pci/pcie/aer/aer_inject.c Youquan,Song     2009-12-11  471  		}
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  472  		pci_info(edev->port, "Injecting errors %08x/%08x into device %s\n",
8e47e15e917fca drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  473  			 einj->cor_status, einj->uncor_status, pci_name(dev));
9ae05225378524 drivers/pci/pcie/aer_inject.c     Thomas Gleixner  2020-03-06  474  		ret = irq_inject_interrupt(edev->irq);
96b45ea5dc1942 drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  475  	} else {
9cc6f75b27e76d drivers/pci/pcie/aer_inject.c     Frederick Lawler 2019-05-07  476  		pci_err(rpdev, "AER device not found\n");
20ac75e563d09f drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  477  		ret = -ENODEV;
96b45ea5dc1942 drivers/pci/pcie/aer/aer_inject.c Jean Delvare     2016-02-18  478  	}
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  479  out_put:
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  480  	kfree(err_alloc);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  481  	kfree(rperr_alloc);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  482  	pci_dev_put(dev);
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  483  	return ret;
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  484  }
c465def6bfe834 drivers/pci/pcie/aer/aer_inject.c Huang Ying       2009-06-15  485  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
