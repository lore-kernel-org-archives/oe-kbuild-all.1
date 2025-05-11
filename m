Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929033987
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 05:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746940511; cv=none; b=bBJEzDFsHhO6bNuZAWqudqhmsOaQpO0veqJauiP3bD0mMSKSvTftWxYqzHHQXp/q43qRy6fB8s1oL4E9piZH0KlWBJXT+QXG2MX0wsVeuAfP5YZHL/ISilzjvza9QS1XIFWzjgxNjnpArwqNBXNIQMC249+jJOrZyA0Zj7/HrH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746940511; c=relaxed/simple;
	bh=nT8if0Z4BKISQKkr0BR5dZanK2Em6DdYGrA9dWGi3xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kB64j9TPGc5vgzZ/gC1h1sgfpxgglMVY2XAq2o0R2Y9Drk59C/2rirvdhVAAqYCzWQnlrvnx3CjfC2SsRl0qO/TwaiCQqILCsfKjGmfRNH7IxUmT7Kkoak3Yjdk4rNE9rywv5Dvn1af9ZJ4r+0ffmoKTHqKPMxaWrkgdALMWceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BweTwss1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BweTwss1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746940509; x=1778476509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nT8if0Z4BKISQKkr0BR5dZanK2Em6DdYGrA9dWGi3xw=;
  b=BweTwss1iGGdMSARMolCGlDKygtVdWtIXPwwyV/JQkZjgHJ6jmtx1cm6
   W4aKDOS6vQmtjT1TJuEbU1bGV6d4P7D+GwveLjsHkt9+S+8F8Dg6YwcoO
   sbbbVy11a8N+0qX0Lp05f73LvYTPtWjOBw3DSiyJ3r0EwzLZPt9uImgdE
   7JX2yW32KEaFiHmd4a/edEetOLbmjeiCRmfDWmDUkNHGHukU2ySX3w7YZ
   Lw5CalHN+Qh+VBpes4lKM5TcDDL+lkoqNbhmhOcnyuq3+k1Y9HgUm5mrA
   SaF9K0uL6e5EzWsd8AHPaT3uYctirhmD7dOWPX8yhpVQByLFAhfIhgaF3
   g==;
X-CSE-ConnectionGUID: HEOmdg1BQPa4qiC87Z0RWQ==
X-CSE-MsgGUID: 3HnBZYiqRWyhLcvTTSC8Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="59742646"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="59742646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 22:15:09 -0700
X-CSE-ConnectionGUID: d5B/tAr6QS+J6X7CHEgZ4Q==
X-CSE-MsgGUID: Km1hlkIkTZ6H6plbKV0b9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="137042735"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 May 2025 22:15:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDz1l-000DbR-2p;
	Sun, 11 May 2025 05:15:05 +0000
Date: Sun, 11 May 2025 13:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2219/2219]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:543:12: error: unused
 function 'sxevf_resume'
Message-ID: <202505111315.WMDsDGlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   442ac780432f43fa8a38f46ec20260ff35d95ad5
commit: 0ba0ebb029b99864fa5963024535f48299373354 [2219/2219] !15589 [OLK-6.6] Ethernet: Supports Linkdata ethernet Controllers
config: arm64-randconfig-001-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111315.WMDsDGlI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111315.WMDsDGlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111315.WMDsDGlI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:543:12: error: unused function 'sxevf_resume' [-Werror,-Wunused-function]
     543 | static s32 sxevf_resume(struct device *dev)
         |            ^~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/sxevf_resume +543 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c

dd013ad487534c liujie_answer 2025-04-15  541  
dd013ad487534c liujie_answer 2025-04-15  542  #ifdef CONFIG_PM
dd013ad487534c liujie_answer 2025-04-15 @543  static s32 sxevf_resume(struct device *dev)
dd013ad487534c liujie_answer 2025-04-15  544  {
dd013ad487534c liujie_answer 2025-04-15  545  	struct pci_dev *pdev = to_pci_dev(dev);
dd013ad487534c liujie_answer 2025-04-15  546  	struct sxevf_adapter *adapter = pci_get_drvdata(pdev);
dd013ad487534c liujie_answer 2025-04-15  547  	struct net_device *netdev = adapter->netdev;
dd013ad487534c liujie_answer 2025-04-15  548  	s32 ret;
dd013ad487534c liujie_answer 2025-04-15  549  
dd013ad487534c liujie_answer 2025-04-15  550  	pci_restore_state(pdev);
dd013ad487534c liujie_answer 2025-04-15  551  	pci_save_state(pdev);
dd013ad487534c liujie_answer 2025-04-15  552  
dd013ad487534c liujie_answer 2025-04-15  553  	ret = pci_enable_device_mem(pdev);
dd013ad487534c liujie_answer 2025-04-15  554  	if (ret) {
dd013ad487534c liujie_answer 2025-04-15  555  		LOG_DEV_ERR("enable pci device from suspend fail.(err:%d)", ret);
dd013ad487534c liujie_answer 2025-04-15  556  		goto l_end;
dd013ad487534c liujie_answer 2025-04-15  557  	}
dd013ad487534c liujie_answer 2025-04-15  558  
dd013ad487534c liujie_answer 2025-04-15  559  	/* in order to force CPU ordering */
dd013ad487534c liujie_answer 2025-04-15  560  	smp_mb__before_atomic();
dd013ad487534c liujie_answer 2025-04-15  561  	clear_bit(SXEVF_DISABLED, &adapter->state);
dd013ad487534c liujie_answer 2025-04-15  562  	pci_set_master(pdev);
dd013ad487534c liujie_answer 2025-04-15  563  	sxevf_reset(adapter);
dd013ad487534c liujie_answer 2025-04-15  564  
dd013ad487534c liujie_answer 2025-04-15  565  	rtnl_lock();
dd013ad487534c liujie_answer 2025-04-15  566  	sxevf_ring_num_set(adapter);
dd013ad487534c liujie_answer 2025-04-15  567  	ret = sxevf_irq_ctxt_init(adapter);
dd013ad487534c liujie_answer 2025-04-15  568  	if (!ret && netif_running(netdev))
dd013ad487534c liujie_answer 2025-04-15  569  		ret = sxevf_open(netdev);
dd013ad487534c liujie_answer 2025-04-15  570  	rtnl_unlock();
dd013ad487534c liujie_answer 2025-04-15  571  
dd013ad487534c liujie_answer 2025-04-15  572  	if (ret) {
dd013ad487534c liujie_answer 2025-04-15  573  		LOG_ERROR_BDF("pci device resume fail.(err:%d)\n", ret);
dd013ad487534c liujie_answer 2025-04-15  574  		goto l_end;
dd013ad487534c liujie_answer 2025-04-15  575  	}
dd013ad487534c liujie_answer 2025-04-15  576  
dd013ad487534c liujie_answer 2025-04-15  577  	netif_device_attach(netdev);
dd013ad487534c liujie_answer 2025-04-15  578  
dd013ad487534c liujie_answer 2025-04-15  579  l_end:
dd013ad487534c liujie_answer 2025-04-15  580  	return ret;
dd013ad487534c liujie_answer 2025-04-15  581  }
dd013ad487534c liujie_answer 2025-04-15  582  #endif
dd013ad487534c liujie_answer 2025-04-15  583  

:::::: The code at line 543 was first introduced by commit
:::::: dd013ad487534c1838afc2f55efdb5daec15aace Ethernet: Linkdata: Supports Linkdata ethernet Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
