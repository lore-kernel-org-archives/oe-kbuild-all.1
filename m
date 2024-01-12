Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7686DCF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7jG4yBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705070031; x=1736606031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpu28g5kbhbu73T5vRQl9AzerwjMeDIMTY2oHI1Lk3E=;
  b=R7jG4yBsvYVZUPxMOllvvsuSmlopAsBGi905+CVuI+z9VUA/fDjBYVt4
   Y/MQR8D12NCf3WJ9tmmrJqcYTtlcdlzIDhoKS0BVDYe+PyNYbiKFJB35H
   AnNBlGPr20LMqSs85e1NrHS4bg1AZZMyGS5i6E0cnmiVLSPMPh0CirvSb
   FNTx6DWl3AigB0RJKWmRpmSo0UrYVOwY+gsnUysgf5X6Eha3ZjGCX4C6z
   wFTFsFztTsjFJSPWXT8LeVS2XaR+SnmJP96X2IiQlpWWGiVWUcktR5QRD
   A6Movl54R9XIKF801YnM+rphNme9S+5s3XO0XP8HTG7VEkq2YpVEPZ9Jb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12546943"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="12546943"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 06:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="873377898"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="873377898"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2024 06:33:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOIbJ-0009ZY-10;
	Fri, 12 Jan 2024 14:33:41 +0000
Date: Fri, 12 Jan 2024 22:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13563/21544]
 drivers/net/ethernet/huawei/hinic/hinic_lld.c:448:6: warning: no previous
 prototype for 'hinic_init_syncfw_timer'
Message-ID: <202401122240.5DLc6adX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: ea97c0ef77bd1c50f8220020daabacfb7cd463cc [13563/21544] net/hinic: Synchronize time to firmware every hour
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240112/202401122240.5DLc6adX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122240.5DLc6adX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122240.5DLc6adX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:448:6: warning: no previous prototype for 'hinic_init_syncfw_timer' [-Wmissing-prototypes]
     448 | void hinic_init_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:463:6: warning: no previous prototype for 'hinic_destroy_syncfw_timer' [-Wmissing-prototypes]
     463 | void hinic_destroy_syncfw_timer(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:555:5: warning: no previous prototype for 'hinic_version_cmp' [-Wmissing-prototypes]
     555 | int hinic_version_cmp(char *ver1, char *ver2)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1150:7: warning: no previous prototype for 'hinic_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
    1150 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1303:6: warning: no previous prototype for 'hinic_get_card_func_info_by_card_name' [-Wmissing-prototypes]
    1303 | void hinic_get_card_func_info_by_card_name(const char *chip_name,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1899:6: warning: no previous prototype for 'hinic_event_process' [-Wmissing-prototypes]
    1899 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2357:6: warning: no previous prototype for 'cfg_order_reg' [-Wmissing-prototypes]
    2357 | void cfg_order_reg(struct hinic_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~


vim +/hinic_init_syncfw_timer +448 drivers/net/ethernet/huawei/hinic/hinic_lld.c

   447	
 > 448	void hinic_init_syncfw_timer(struct hinic_pcidev *pci_adapter)
   449	{
   450		if (hinic_get_func_mode(pci_adapter->hwdev) != FUNC_MOD_NORMAL_HOST ||
   451		    hinic_func_type(pci_adapter->hwdev) != TYPE_PPF)
   452			return;
   453	
   454		timer_setup(&pci_adapter->syncfw_time_timer,
   455			    hinic_syncfw_timer_handler, 0);
   456	
   457		pci_adapter->syncfw_time_timer.expires =
   458			jiffies + msecs_to_jiffies(HINIC_SYNFW_TIME_PERIOD);
   459	
   460		add_timer(&pci_adapter->syncfw_time_timer);
   461	}
   462	
 > 463	void hinic_destroy_syncfw_timer(struct hinic_pcidev *pci_adapter)
   464	{
   465		if (hinic_get_func_mode(pci_adapter->hwdev) != FUNC_MOD_NORMAL_HOST ||
   466		    hinic_func_type(pci_adapter->hwdev) != TYPE_PPF)
   467			return;
   468	
   469		del_timer_sync(&pci_adapter->syncfw_time_timer);
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
