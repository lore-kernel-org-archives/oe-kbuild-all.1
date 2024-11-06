Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CFE208225
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918144; cv=none; b=e7qjeKU81qHl18UiCL+d88Asmb+1avJ9F/DnwuKU/7LKSqVIun0vhG+2X2vIVQaMOfso5nsl+tW/dPYwBGtDyaRJJkbmy5kEuOJJZlaTk5HyG/n+6f1MMeAsGK1NGg5MNXsZhlPDMpfZJNB9k0xexOIl5elB3L+LEGkvp8rK0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918144; c=relaxed/simple;
	bh=BYTlL92JoK/wmNFgNwBEcxJdvTqiFbMexJP4RtZNe08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPNsZY75kDeZj8FigBxfQsgWMreNRyMVU3Gt1rtR1TgiPpz2w5gTSXloaRJQusMGNp8Vg0cND9Un+fI5Zuxrkb+AkrgcoIvOpxAcvccUpxpeVOZ3I3TzAtPBkoURvYUWxwgLZhPtYs+UkMFqsxcgsc111IP4vwlvakt3OOj84PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6p+00y3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6p+00y3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730918135; x=1762454135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYTlL92JoK/wmNFgNwBEcxJdvTqiFbMexJP4RtZNe08=;
  b=G6p+00y3YxA8XKgH4fTp0Og+PFiRpG9nR/X6eQjg6Ak5PLoxmBrqL+8Q
   osF/IRwAuSZdkeCp8/Bvro6lETgFBmLUARiUSjcVGKeZGSRMqOcPIaNyO
   8vkGTAZdcEpQWHj4Sc1K7KJaTkqefGvgFb5sLQ0SiI3YYe5fkCvPVjq9U
   sgLlW0/JvxtMmoKg5Z4jrUc+E6qP8VAnxj3SfUq+HMns6og/GUl3hRdaB
   OhmFPlp8qC//PRZjaVtf8STizs074VtSzEXZHxyBDvk4TZROCegYdHEL3
   f9FvyXqK319DhPjUDOiyWmjZJ7QAE+DRyXWdhY/kVsmW7HVwzPBTmIQwu
   Q==;
X-CSE-ConnectionGUID: LePBmsLSQu2hrkOJ5qPjLQ==
X-CSE-MsgGUID: BYkMLeM3RnO95p/95WVxuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30957235"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30957235"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 10:35:32 -0800
X-CSE-ConnectionGUID: HjGwovRATZWVygGi1pet2A==
X-CSE-MsgGUID: BaZ4thpdSWqJTnpF3vIYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89231677"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 10:35:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ksK-000pHc-2j;
	Wed, 06 Nov 2024 18:35:28 +0000
Date: Thu, 7 Nov 2024 02:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 161/520]
 drivers/ufs/host/ufs-mediatek.c:930:33: error: use of undeclared identifier
 'MTK_RPM_AUTOSUSPEND_DELAY_MS'
Message-ID: <202411070248.PUdM0w1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: a67371b02fc00533e7b784e40c977eb89079ac14 [161/520] BACKPORT: scsi: ufs: mediatek: UFS mtk sip command reconstruct
config: arm64-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070248.PUdM0w1Y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070248.PUdM0w1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070248.PUdM0w1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ufs/host/ufs-mediatek.c:18:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2239:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ufs/host/ufs-mediatek.c:930:33: error: use of undeclared identifier 'MTK_RPM_AUTOSUSPEND_DELAY_MS'
     930 |         shost->rpm_autosuspend_delay = MTK_RPM_AUTOSUSPEND_DELAY_MS;
         |                                        ^
   1 warning and 1 error generated.


vim +/MTK_RPM_AUTOSUSPEND_DELAY_MS +930 drivers/ufs/host/ufs-mediatek.c

e152a616c88653 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2023-07-01  868  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  869  /**
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  870   * ufs_mtk_init - find other essential mmio bases
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  871   * @hba: host controller instance
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  872   *
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  873   * Binds PHY with controller and powers up PHY enabling clocks
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  874   * and regulators.
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  875   *
3a17fefe0f1960 drivers/ufs/host/ufs-mediatek.c Bart Van Assche 2023-07-27  876   * Return: -EPROBE_DEFER if binding fails, returns negative error
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  877   * on phy power up failure and returns zero on success.
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  878   */
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  879  static int ufs_mtk_init(struct ufs_hba *hba)
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  880  {
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  881  	const struct of_device_id *id;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  882  	struct device *dev = hba->dev;
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  883  	struct ufs_mtk_host *host;
f7bcb2b9e8e32c drivers/ufs/host/ufs-mediatek.c Peter Wang      2024-01-31  884  	struct Scsi_Host *shost = hba->host;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  885  	int err = 0;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  886  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  887  	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  888  	if (!host) {
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  889  		err = -ENOMEM;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  890  		dev_info(dev, "%s: no memory for mtk ufs host\n", __func__);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  891  		goto out;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  892  	}
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  893  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  894  	host->hba = hba;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  895  	ufshcd_set_variant(hba, host);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  896  
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  897  	id = of_match_device(ufs_mtk_of_match, dev);
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  898  	if (!id) {
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  899  		err = -EINVAL;
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  900  		goto out;
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  901  	}
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  902  
ac8c2459091cd0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-10-29  903  	/* Initialize host capability */
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  904  	ufs_mtk_init_host_caps(hba);
590b0d2372fef0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-14  905  
e152a616c88653 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2023-07-01  906  	ufs_mtk_init_mcq_irq(hba);
e152a616c88653 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2023-07-01  907  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  908  	err = ufs_mtk_bind_mphy(hba);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  909  	if (err)
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  910  		goto out_variant_clear;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  911  
e0f9f862623cd8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-08  912  	ufs_mtk_init_reset(hba);
e0f9f862623cd8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-09-08  913  
e6d6ba8014e520 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-09-16  914  	/* Enable runtime autosuspend */
e6d6ba8014e520 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-09-16  915  	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
e6d6ba8014e520 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-09-16  916  
5d74e18edd7bdb drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-12-30  917  	/* Enable clock-gating */
5d74e18edd7bdb drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-12-30  918  	hba->caps |= UFSHCD_CAP_CLK_GATING;
5d74e18edd7bdb drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-12-30  919  
46426552e74fd3 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-07-12  920  	/* Enable inline encryption */
46426552e74fd3 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-07-12  921  	hba->caps |= UFSHCD_CAP_CRYPTO;
46426552e74fd3 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-07-12  922  
29060a629135a0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-05-08  923  	/* Enable WriteBooster */
29060a629135a0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-05-08  924  	hba->caps |= UFSHCD_CAP_WB_EN;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2022-08-03  925  
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2022-08-03  926  	/* Enable clk scaling*/
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2022-08-03  927  	hba->caps |= UFSHCD_CAP_CLK_SCALING;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2022-08-03  928  
f7bcb2b9e8e32c drivers/ufs/host/ufs-mediatek.c Peter Wang      2024-01-31  929  	/* Set runtime pm delay to replace default */
f7bcb2b9e8e32c drivers/ufs/host/ufs-mediatek.c Peter Wang      2024-01-31 @930  	shost->rpm_autosuspend_delay = MTK_RPM_AUTOSUSPEND_DELAY_MS;
f7bcb2b9e8e32c drivers/ufs/host/ufs-mediatek.c Peter Wang      2024-01-31  931  
46ec9592ffd679 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-12-22  932  	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
95cd364ccc975e drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2023-06-12  933  	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
3c9b49be666679 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2023-06-12  934  	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
f48b285ae658b5 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-05-09  935  	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
29060a629135a0 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-05-08  936  
bf8fab86ab791c drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-10-29  937  	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
bf8fab86ab791c drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-10-29  938  		hba->caps |= UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
bf8fab86ab791c drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-10-29  939  
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2022-08-03  940  	ufs_mtk_init_clocks(hba);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao      2022-08-03  941  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  942  	/*
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  943  	 * ufshcd_vops_init() is invoked after
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  944  	 * ufshcd_setup_clock(true) in ufshcd_hba_init() thus
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  945  	 * phy clock setup is skipped.
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  946  	 *
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  947  	 * Enable phy clocks specifically here.
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  948  	 */
cf137b3ea49a04 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-10-29  949  	ufs_mtk_mphy_power_on(hba, true);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  950  	ufs_mtk_setup_clocks(hba, true, POST_CHANGE);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  951  
aba3b0757b6cba drivers/scsi/ufs/ufs-mediatek.c Peter Wang      2021-09-06  952  	host->ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
aba3b0757b6cba drivers/scsi/ufs/ufs-mediatek.c Peter Wang      2021-09-06  953  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  954  	goto out;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  955  
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  956  out_variant_clear:
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  957  	ufshcd_set_variant(hba, NULL);
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  958  out:
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  959  	return err;
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  960  }
ddd90623ce26ea drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  961  

:::::: The code at line 930 was first introduced by commit
:::::: f7bcb2b9e8e32c3cdc4180aa482f942ccc0f6458 FROMLIST: ufs: host: mediatek: change default auto suspend timer

:::::: TO: Peter Wang <peter.wang@mediatek.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
