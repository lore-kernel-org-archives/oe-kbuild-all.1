Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D23AD58
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746145398; cv=none; b=b6z7t28+4QgSWmIB5W/fIIyJZDFQPc0pu85VXwsi4ZyDOUcusfIXyClCep59eICpZNAGcWZUOiPMpMqGW1JMgG6zmsuH4lPtMgkxmQ8lCiJxdcGcwzjxgd7Uq+KPiKFCReKhbIE016QHdwOBTYw91gQ7/ydGVquMLwLRLlxRgMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746145398; c=relaxed/simple;
	bh=BNGXCCwiMrH1+E2q3ffakM8L2HQ3DyxcTJtXHEWOEO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWo5IVQPXB6zJg0DRuVEpD4ZLmUX6zfRTEv3vP5yWyvx9p/8OZXF25iGbvY7Edz5KSVvYbsGSAkYdRqMOMtf3ywx3RtmrdZ42FAse2ERmceXENP3q3dyCoLdzJs6D7Ig/1SAwkQ6ip5qNlMBwUKYpvTV+GIgm12LkiHQ5uUwA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amSDqgfd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amSDqgfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746145396; x=1777681396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNGXCCwiMrH1+E2q3ffakM8L2HQ3DyxcTJtXHEWOEO0=;
  b=amSDqgfd6QO+X3XRORDH8NCQaNrD3msQ4rzNRpMsyoebt7eYKq/WGP0R
   iHvtuUcb0t3iYD/1Y4PvJW4RJy/rxiw/fzhbw3jP8cNLQiwvaPSYj7sTd
   ZUb1Orfexq3M4si/Uh7Iuu6FjSxdJ7C/al6RjkgjnkLfc3nOPZsWT90o3
   99oK8c8fumoRbXcTdBu1jNZGMVpiPUufWmz/4ntQUPdvREh0CvUFOV1uP
   Ml+fG8nXIbYuaJddBItN1iQdTFjRlZ9f0PZi8bwtBC0tQ6PdWXgmGmAmR
   jHi19UxBuKiYUhmymxQzVf+D3hELIB5TjFMWvhqUifAr055UghHSRlR+N
   w==;
X-CSE-ConnectionGUID: jaSMejFqR7SjSwIX8eHmgQ==
X-CSE-MsgGUID: dYF/UAxsRP6sZIiEDf+6Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47741288"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47741288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 17:23:15 -0700
X-CSE-ConnectionGUID: ASRHD0vYT7qCCasndTRQ0Q==
X-CSE-MsgGUID: GM1WnmxfSRadrEM+DL/T7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139697245"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 May 2025 17:23:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAeBL-0004T2-0q;
	Fri, 02 May 2025 00:23:11 +0000
Date: Fri, 2 May 2025 08:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:1071:12: error:
 'sxe_resume' defined but not used
Message-ID: <202505020850.kZitpRTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2882/2882] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-122-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020850.kZitpRTl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020850.kZitpRTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020850.kZitpRTl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:6: error: no previous prototype for 'sxe_allow_inval_mac' [-Werror=missing-prototypes]
      70 | bool sxe_allow_inval_mac(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:1071:12: error: 'sxe_resume' defined but not used [-Werror=unused-function]
    1071 | static int sxe_resume(struct device *dev)
         |            ^~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:1038:12: error: 'sxe_suspend' defined but not used [-Werror=unused-function]
    1038 | static int sxe_suspend(struct device *dev)
         |            ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:543:12: error: 'sxevf_resume' defined but not used [-Werror=unused-function]
     543 | static s32 sxevf_resume(struct device *dev)
         |            ^~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/sxe_resume +1071 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c

  1036	
  1037	#ifdef CONFIG_PM
> 1038	static int sxe_suspend(struct device *dev)
  1039	{
  1040		struct pci_dev *pdev = to_pci_dev(dev);
  1041		int ret;
  1042		bool wol_enable;
  1043		struct sxe_adapter *adapter = pci_get_drvdata(pdev);
  1044		struct sxe_hw *hw = &adapter->hw;
  1045	
  1046		ret = __sxe_shutdown(pdev, &wol_enable);
  1047	
  1048		cancel_work_sync(&adapter->monitor_ctxt.work);
  1049		cancel_work_sync(&adapter->hdc_ctxt.time_sync_work);
  1050	
  1051		sxe_hdc_channel_destroy(hw);
  1052		if (ret) {
  1053			LOG_ERROR_BDF("driver shutdown err:%d\n", ret);
  1054			goto l_ret;
  1055		}
  1056	
  1057		LOG_DEBUG_BDF("pci dev[%p], wol_enable:%s\n", pdev,
  1058			      wol_enable ? "yes" : "no");
  1059	
  1060		if (wol_enable) {
  1061			pci_prepare_to_sleep(pdev);
  1062		} else {
  1063			pci_wake_from_d3(pdev, false);
  1064			pci_set_power_state(pdev, PCI_D3hot);
  1065		}
  1066	
  1067	l_ret:
  1068		return ret;
  1069	}
  1070	
> 1071	static int sxe_resume(struct device *dev)
  1072	{
  1073		struct pci_dev *pdev = to_pci_dev(dev);
  1074		struct sxe_adapter *adapter = pci_get_drvdata(pdev);
  1075		struct net_device *netdev = adapter->netdev;
  1076		s32 ret;
  1077	#ifdef SXE_WOL_CONFIGURE
  1078		struct sxe_hw *hw = &adapter->hw;
  1079	#endif
  1080	
  1081		pci_set_power_state(pdev, PCI_D0);
  1082		pci_restore_state(pdev);
  1083	
  1084		pci_save_state(pdev);
  1085	
  1086		ret = pci_enable_device_mem(pdev);
  1087		if (ret) {
  1088			LOG_DEV_ERR("cannot enable pci device from suspend\n");
  1089			goto l_ret;
  1090		}
  1091	
  1092		/* in order to force CPU ordering */
  1093		smp_mb__before_atomic();
  1094		clear_bit(SXE_DISABLED, &adapter->state);
  1095		pci_set_master(pdev);
  1096	
  1097		pci_wake_from_d3(pdev, false);
  1098	
  1099		sxe_hdc_available_set(1);
  1100	
  1101		sxe_reset(adapter);
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
