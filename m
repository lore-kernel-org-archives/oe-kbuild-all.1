Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540B130AD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718250518; cv=none; b=fRUtTzPaQozMG6Q31jNgZ8suhCm4ILf/+zPahSriDxxaed2ldLI3oRJCuBm1yqmMxSYXlUdABNSpXfacOydtVOZUfpLAwJG2duoc+cM0jtq1oMTGeng93MlPEqZAiPs3pzZMwr+fABqwTZIumw0YzhFBdjJxmsU8g10LYEB3cxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718250518; c=relaxed/simple;
	bh=ZUc9wRRzFfAFsQgud2PHllNsCgPayEcSb0j+mlnwuPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxRDitiijrhtMmOOOO0ey3tw6VeuAcpfqXzrV9aG2k/GPuQR/eyW0EPaknUbRIAAORIYW7ysE8BAZxtrxD+mPSvx0nKoga8LMXKXlJkRQDCnJngR3oh4te9cGhf9FfbeCubLymVjldo1HjNbTb3XW+MEZ/HowZkQRg1x3itSjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLC/8tya; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLC/8tya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718250517; x=1749786517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUc9wRRzFfAFsQgud2PHllNsCgPayEcSb0j+mlnwuPk=;
  b=NLC/8tyaPF6PiwktBiE9RQ8Gq5ilxHFlmEGbG5/up/Av5SI0GF6emLvA
   DVIZXe6kEFwY3eXoiCUT6BoqSwI7LGxVNRcp6yKrdm5VSmeUn+jNDo3PY
   zWV2sA8fiLavv9HbgnBZdhZwKu2BLz+5aBUOMxx86116MyKRWklKTqeIF
   RMhC0nMdhkWauhDUEZL2PtPoMtnpxk1cu96pCi9NwO46CNe5D1ow/cJcN
   chQs25aKdUx9nhl0N34rqP3ke7fDPn6Fn6WfnSyQeJiSx4UigAuC1hZS8
   9UMVn9iYhWwXNxxHRvqHPDQUxwAeUkzDXPxh2skErSkWxtmAJ/8nanm+L
   A==;
X-CSE-ConnectionGUID: s7kMuHa6QOGW5MAVbf0IeA==
X-CSE-MsgGUID: 2uGb3ei9SGm0aE1WHUsGFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14767898"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14767898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:48:31 -0700
X-CSE-ConnectionGUID: 8Xl/P43mSN6BmdI2z4phqw==
X-CSE-MsgGUID: 6xcl9fTXRpy5fzNYOO5MJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="63178582"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2024 20:48:29 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbRr-0002Bm-1o;
	Thu, 13 Jun 2024 03:48:27 +0000
Date: Thu, 13 Jun 2024 11:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:20240612_pierre_louis_bossart_asoc_sof_pci_intel_add_pantherlake_support
 48/51] include/linux/pci.h:1063:51: error: 'PCI_DEVICE_ID_INTEL_HDA_PTL'
 undeclared here (not in a function); did you mean
 'PCI_DEVICE_ID_INTEL_HDA_MTL'?
Message-ID: <202406131144.L6gW0I47-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20240612_pierre_louis_bossart_asoc_sof_pci_intel_add_pantherlake_support
head:   95daa00008c78b884a616b34968595d355bec9d1
commit: 9af8c628136b4261930b64a6521ddda1d29962ec [48/51] ASoC: SOF: Intel: add initial support for PTL
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240613/202406131144.L6gW0I47-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131144.L6gW0I47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131144.L6gW0I47-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/intel/pci-ptl.c:23:35: error: 'snd_soc_acpi_intel_ptl_machines' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_mtl_machines'?
      23 |         .machines               = snd_soc_acpi_intel_ptl_machines,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_acpi_intel_mtl_machines
   sound/soc/sof/intel/pci-ptl.c:24:35: error: 'snd_soc_acpi_intel_ptl_sdw_machines' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_mtl_sdw_machines'?
      24 |         .alt_machines           = snd_soc_acpi_intel_ptl_sdw_machines,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   snd_soc_acpi_intel_mtl_sdw_machines
   In file included from sound/soc/sof/intel/pci-ptl.c:10:
>> include/linux/pci.h:1063:51: error: 'PCI_DEVICE_ID_INTEL_HDA_PTL' undeclared here (not in a function); did you mean 'PCI_DEVICE_ID_INTEL_HDA_MTL'?
    1063 |         .vendor = PCI_VENDOR_ID_##vend, .device = PCI_DEVICE_ID_##vend##_##dev, \
         |                                                   ^~~~~~~~~~~~~~
   sound/soc/sof/intel/pci-ptl.c:52:11: note: in expansion of macro 'PCI_DEVICE_DATA'
      52 |         { PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */
         |           ^~~~~~~~~~~~~~~


vim +1063 include/linux/pci.h

^1da177e4c3f415 Linus Torvalds     2005-04-16   967  
^1da177e4c3f415 Linus Torvalds     2005-04-16   968  /**
0aa0f5d1084ca1c Bjorn Helgaas      2017-12-02   969   * PCI_DEVICE - macro used to describe a specific PCI device
^1da177e4c3f415 Linus Torvalds     2005-04-16   970   * @vend: the 16 bit PCI Vendor ID
^1da177e4c3f415 Linus Torvalds     2005-04-16   971   * @dev: the 16 bit PCI Device ID
^1da177e4c3f415 Linus Torvalds     2005-04-16   972   *
^1da177e4c3f415 Linus Torvalds     2005-04-16   973   * This macro is used to create a struct pci_device_id that matches a
^1da177e4c3f415 Linus Torvalds     2005-04-16   974   * specific device.  The subvendor and subdevice fields will be set to
^1da177e4c3f415 Linus Torvalds     2005-04-16   975   * PCI_ANY_ID.
^1da177e4c3f415 Linus Torvalds     2005-04-16   976   */
^1da177e4c3f415 Linus Torvalds     2005-04-16   977  #define PCI_DEVICE(vend,dev) \
^1da177e4c3f415 Linus Torvalds     2005-04-16   978  	.vendor = (vend), .device = (dev), \
^1da177e4c3f415 Linus Torvalds     2005-04-16   979  	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
^1da177e4c3f415 Linus Torvalds     2005-04-16   980  
343b7258687ecfb Max Gurtovoy       2021-08-26   981  /**
343b7258687ecfb Max Gurtovoy       2021-08-26   982   * PCI_DEVICE_DRIVER_OVERRIDE - macro used to describe a PCI device with
343b7258687ecfb Max Gurtovoy       2021-08-26   983   *                              override_only flags.
343b7258687ecfb Max Gurtovoy       2021-08-26   984   * @vend: the 16 bit PCI Vendor ID
343b7258687ecfb Max Gurtovoy       2021-08-26   985   * @dev: the 16 bit PCI Device ID
343b7258687ecfb Max Gurtovoy       2021-08-26   986   * @driver_override: the 32 bit PCI Device override_only
343b7258687ecfb Max Gurtovoy       2021-08-26   987   *
343b7258687ecfb Max Gurtovoy       2021-08-26   988   * This macro is used to create a struct pci_device_id that matches only a
343b7258687ecfb Max Gurtovoy       2021-08-26   989   * driver_override device. The subvendor and subdevice fields will be set to
343b7258687ecfb Max Gurtovoy       2021-08-26   990   * PCI_ANY_ID.
343b7258687ecfb Max Gurtovoy       2021-08-26   991   */
343b7258687ecfb Max Gurtovoy       2021-08-26   992  #define PCI_DEVICE_DRIVER_OVERRIDE(vend, dev, driver_override) \
343b7258687ecfb Max Gurtovoy       2021-08-26   993  	.vendor = (vend), .device = (dev), .subvendor = PCI_ANY_ID, \
343b7258687ecfb Max Gurtovoy       2021-08-26   994  	.subdevice = PCI_ANY_ID, .override_only = (driver_override)
343b7258687ecfb Max Gurtovoy       2021-08-26   995  
cc6711b0bf36de0 Max Gurtovoy       2021-08-26   996  /**
cc6711b0bf36de0 Max Gurtovoy       2021-08-26   997   * PCI_DRIVER_OVERRIDE_DEVICE_VFIO - macro used to describe a VFIO
cc6711b0bf36de0 Max Gurtovoy       2021-08-26   998   *                                   "driver_override" PCI device.
cc6711b0bf36de0 Max Gurtovoy       2021-08-26   999   * @vend: the 16 bit PCI Vendor ID
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1000   * @dev: the 16 bit PCI Device ID
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1001   *
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1002   * This macro is used to create a struct pci_device_id that matches a
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1003   * specific device. The subvendor and subdevice fields will be set to
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1004   * PCI_ANY_ID and the driver_override will be set to
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1005   * PCI_ID_F_VFIO_DRIVER_OVERRIDE.
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1006   */
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1007  #define PCI_DRIVER_OVERRIDE_DEVICE_VFIO(vend, dev) \
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1008  	PCI_DEVICE_DRIVER_OVERRIDE(vend, dev, PCI_ID_F_VFIO_DRIVER_OVERRIDE)
cc6711b0bf36de0 Max Gurtovoy       2021-08-26  1009  
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1010  /**
0aa0f5d1084ca1c Bjorn Helgaas      2017-12-02  1011   * PCI_DEVICE_SUB - macro used to describe a specific PCI device with subsystem
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1012   * @vend: the 16 bit PCI Vendor ID
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1013   * @dev: the 16 bit PCI Device ID
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1014   * @subvend: the 16 bit PCI Subvendor ID
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1015   * @subdev: the 16 bit PCI Subdevice ID
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1016   *
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1017   * This macro is used to create a struct pci_device_id that matches a
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1018   * specific device with subsystem information.
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1019   */
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1020  #define PCI_DEVICE_SUB(vend, dev, subvend, subdev) \
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1021  	.vendor = (vend), .device = (dev), \
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1022  	.subvendor = (subvend), .subdevice = (subdev)
3d567e0e291c4ff Nithin Nayak Sujir 2012-11-14  1023  
^1da177e4c3f415 Linus Torvalds     2005-04-16  1024  /**
0aa0f5d1084ca1c Bjorn Helgaas      2017-12-02  1025   * PCI_DEVICE_CLASS - macro used to describe a specific PCI device class
^1da177e4c3f415 Linus Torvalds     2005-04-16  1026   * @dev_class: the class, subclass, prog-if triple for this device
^1da177e4c3f415 Linus Torvalds     2005-04-16  1027   * @dev_class_mask: the class mask for this device
^1da177e4c3f415 Linus Torvalds     2005-04-16  1028   *
^1da177e4c3f415 Linus Torvalds     2005-04-16  1029   * This macro is used to create a struct pci_device_id that matches a
^1da177e4c3f415 Linus Torvalds     2005-04-16  1030   * specific PCI class.  The vendor, device, subvendor, and subdevice
^1da177e4c3f415 Linus Torvalds     2005-04-16  1031   * fields will be set to PCI_ANY_ID.
^1da177e4c3f415 Linus Torvalds     2005-04-16  1032   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  1033  #define PCI_DEVICE_CLASS(dev_class,dev_class_mask) \
^1da177e4c3f415 Linus Torvalds     2005-04-16  1034  	.class = (dev_class), .class_mask = (dev_class_mask), \
^1da177e4c3f415 Linus Torvalds     2005-04-16  1035  	.vendor = PCI_ANY_ID, .device = PCI_ANY_ID, \
^1da177e4c3f415 Linus Torvalds     2005-04-16  1036  	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
^1da177e4c3f415 Linus Torvalds     2005-04-16  1037  
1597cacbe39802d Alan Cox           2006-12-04  1038  /**
0aa0f5d1084ca1c Bjorn Helgaas      2017-12-02  1039   * PCI_VDEVICE - macro used to describe a specific PCI device in short form
c1309040967e200 Mark Rustad        2014-03-31  1040   * @vend: the vendor name
c1309040967e200 Mark Rustad        2014-03-31  1041   * @dev: the 16 bit PCI Device ID
1597cacbe39802d Alan Cox           2006-12-04  1042   *
1597cacbe39802d Alan Cox           2006-12-04  1043   * This macro is used to create a struct pci_device_id that matches a
1597cacbe39802d Alan Cox           2006-12-04  1044   * specific PCI device.  The subvendor, and subdevice fields will be set
1597cacbe39802d Alan Cox           2006-12-04  1045   * to PCI_ANY_ID. The macro allows the next field to follow as the device
1597cacbe39802d Alan Cox           2006-12-04  1046   * private data.
1597cacbe39802d Alan Cox           2006-12-04  1047   */
c1309040967e200 Mark Rustad        2014-03-31  1048  #define PCI_VDEVICE(vend, dev) \
c1309040967e200 Mark Rustad        2014-03-31  1049  	.vendor = PCI_VENDOR_ID_##vend, .device = (dev), \
c1309040967e200 Mark Rustad        2014-03-31  1050  	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
1597cacbe39802d Alan Cox           2006-12-04  1051  
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1052  /**
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1053   * PCI_DEVICE_DATA - macro used to describe a specific PCI device in very short form
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1054   * @vend: the vendor name (without PCI_VENDOR_ID_ prefix)
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1055   * @dev: the device name (without PCI_DEVICE_ID_<vend>_ prefix)
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1056   * @data: the driver data to be filled
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1057   *
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1058   * This macro is used to create a struct pci_device_id that matches a
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1059   * specific PCI device.  The subvendor, and subdevice fields will be set
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1060   * to PCI_ANY_ID.
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1061   */
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1062  #define PCI_DEVICE_DATA(vend, dev, data) \
b72ae8cac0caff8 Andy Shevchenko    2018-07-29 @1063  	.vendor = PCI_VENDOR_ID_##vend, .device = PCI_DEVICE_ID_##vend##_##dev, \
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1064  	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0, \
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1065  	.driver_data = (kernel_ulong_t)(data)
b72ae8cac0caff8 Andy Shevchenko    2018-07-29  1066  

:::::: The code at line 1063 was first introduced by commit
:::::: b72ae8cac0caff86fe414fceb940655c2d1371c9 PCI: Add PCI_DEVICE_DATA() macro to fully describe device ID entry

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
