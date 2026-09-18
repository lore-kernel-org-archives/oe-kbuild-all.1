Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1104F34F279
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 01:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789694521; cv=none; b=dajU/E6Os/HadKm9ky5CX8RwwxwUerVE01zklfQfbbtIqrImFq3xb3MUL66I9tzLh6vI0uZizl05wgDxMKaU4S0EpwBLsfrL4reAl/zIoKczcedbswzYKGaiZTux3W+3/q6XECI+76EzlejpwPp4gfYGI5Tirm+gYF5TIJktxus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789694521; c=relaxed/simple;
	bh=TEG131QYdI3KRDkitHIca8Mp8mtoPzs2nCO481qgBIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B6D3gbeZCBdzxghh3ocD84TiIpsLCQMGg6DptmFDMqxOeMqX0TShVlllKsOkCpjgjfSDcp1sixoI4+wul7JbUxQckNtoOfA1JGFtb131hhNqP/aUK6Nrvv7slRN1TvtregB+/DHZLQjLRx0xUBLHRF7aMkY0Bw7aH/auFZ/7Epg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+Cnwp4p; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+Cnwp4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789694517; x=1821230517;
  h=date:from:to:cc:subject:message-id;
  bh=TEG131QYdI3KRDkitHIca8Mp8mtoPzs2nCO481qgBIA=;
  b=a+Cnwp4pdQHNTZQzGFatCaL06vcbdcdKWFdk91E0yUtvy/5I7PXuIB9T
   3bKrFzRhOMTFtkspTbelZeLkbjvEwgcq4ktfatCwJ8KaXfVfso0Za0bFa
   bSHWvIY9Rv5to/pWzz2Aa/sA+ZC+EolhnaeW9r5bLGTjFzW9Er/FkkWuB
   znDg8qIPdMxIRFl3GgHzHyGgeHTj52eaGGy7jLgsWeb7qKs4MS84DDGMK
   4qVkL3JHyUNdUlKsxFjssd1gtAJenVMI/6dv7hZTsltNRKxGef5B7nILn
   BuC7Fdwr7kevz/c0TxrC9ToCXvTH5i1itMl0rKaAILNL4MlF5wWfYzmyi
   Q==;
X-CSE-ConnectionGUID: u3EC/gwgRsi37ShVos+Hzg==
X-CSE-MsgGUID: nxUYHRoLQBiHJVpoRKqHAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77735620"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77735620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 18:21:54 -0700
X-CSE-ConnectionGUID: bIY3iSZnTkuQ9l8y8Wxdkw==
X-CSE-MsgGUID: XwTgHtVBSYKNPQouP1zd1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276089261"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2026 18:21:53 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7NIV-000000000tY-0A2d;
	Fri, 18 Sep 2026 01:21:51 +0000
Date: Fri, 18 Sep 2026 03:21:16 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_baseline_v1 7/7] drivers/pci/pcie/aer.c:436:29:
 error: expected ')' before 'pcie_clear_device_status'
Message-ID: <202609180302.SV9jbPDD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux aer_baseline_v1
head:   c03892987cf6c02922172ccd72a517bd7790d3b1
commit: c03892987cf6c02922172ccd72a517bd7790d3b1 [7/7] PCI/AER: Enable baseline capability error reporting
config: arc-randconfig-r2103-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180302.SV9jbPDD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180302.SV9jbPDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180302.SV9jbPDD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pcie/aer.c: In function 'pci_aer_init':
>> drivers/pci/pcie/aer.c:436:29: error: expected ')' before 'pcie_clear_device_status'
     if (pcie_aer_is_native(dev)
        ~                       ^
                                )
      pcie_clear_device_status(dev);
      ~~~~~~~~~~~~~~~~~~~~~~~~   
>> drivers/pci/pcie/aer.c:443:1: error: expected expression before '}' token
    }
    ^
   At top level:
   drivers/pci/pcie/aer.c:264:12: warning: 'pci_enable_pcie_error_reporting' defined but not used [-Wunused-function]
    static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +436 drivers/pci/pcie/aer.c

   395	
   396	void pci_aer_init(struct pci_dev *dev)
   397	{
   398		int n;
   399	
   400		if (!pci_is_pcie(dev))
   401			return;
   402	
   403		dev->aer_info = kzalloc_obj(*dev->aer_info);
   404		if (!dev->aer_info)
   405			return;
   406	
   407		ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
   408				     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
   409		ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
   410				     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
   411	
   412		dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
   413		if (!dev->aer_cap)
   414			goto enable;
   415	
   416		/*
   417		 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
   418		 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
   419		 * Collectors also implement PCI_ERR_ROOT_COMMAND (PCIe r6.0, sec
   420		 * 7.8.4.9).
   421		 */
   422		n = pcie_cap_has_rtctl(dev) ? 5 : 4;
   423		pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ERR, sizeof(u32) * n);
   424	
   425		/*
   426		 * Advisory Non-Fatal Errors are masked by default (PCIe r7.0, sec
   427		 * 7.8.4.6).
   428		 */
   429		if (pcie_aer_is_native(dev) && dev->devcap & PCI_EXP_DEVCAP_RBER)
   430			pci_clear_and_set_config_dword(dev,
   431						       dev->aer_cap + PCI_ERR_COR_MASK,
   432						       PCI_ERR_COR_ADV_NFAT, 0);
   433	
   434		pci_aer_clear_status(dev);
   435	enable:
 > 436		if (pcie_aer_is_native(dev)
   437			pcie_clear_device_status(dev);
   438	
   439		if (pci_aer_available())
   440			pci_enable_pcie_error_reporting(dev);
   441	
   442		pcie_set_ecrc_checking(dev);
 > 443	}
   444	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
