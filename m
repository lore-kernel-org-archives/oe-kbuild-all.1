Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8921459EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 04:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734063083; cv=none; b=FBKfWIiKDqZ8rIzKQGxgiknW9DCkVgprb9ewkKA3w3ajW0rvXor1k59EpTjrx5xS3WSUy6x/fBThxrau9jLA7buaspDY3wleCYZ9j8dl9We3eTRABPFEMuPbf3giKs9zRID2qZYgWVKQfPs69Luetu++up7GY03DF2SAjjk8hx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734063083; c=relaxed/simple;
	bh=y1MkgrcrSgpAo0/kP/oJmzlEOnjuHyZi+o2Y9PInqiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZXhzeiOyiWn0CkCCNgS9NYaq8LFaTs1mE4K6Xlys6/wGsbzs508h+z57z8x0fOnXpZYKDJ5TaSO2eKnf97AygxxpO6RUgbo6YBSLfm+TgmFiT3yYv1bxhXTd1M8ZG5Dr0oAEHNV+S3fQqvVscL+Wdg8xhGtLLPqIjJcJB/WBXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEHMvnXk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEHMvnXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734063080; x=1765599080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1MkgrcrSgpAo0/kP/oJmzlEOnjuHyZi+o2Y9PInqiY=;
  b=LEHMvnXkoTP6e/uoYp3U5xu0Ka6qJSZyqzAGj7RCozq6c//l+c2TpP5F
   T1gbJ80zsf96J4ptMNilVIrPVNOl0JGlV/Q4+aQs2k2W++GvQhcf5eeug
   v/jE4PfkOFrq8Y1VX5pmyj++3tnpC32+E3wC0Xz9VuUHGvJ0RyoSEHHES
   XESX9O/+mOqC4vp03Q9uHKi8yeWXBftPQjJ52nISFoRHN0Att4sqAqVNr
   fF4A7XeUDBFx25O2ZBwxBBH5krzzk5Bbq1OZfMSEyQIJExKnjCQWZYVp6
   qZhGWMxI6k16BVfKw/dYom43oG7OaS2um+Nq9TAPqdq5/00yhH0D51I3s
   w==;
X-CSE-ConnectionGUID: l1ikG8+fTJ6dbxmUL1oJtg==
X-CSE-MsgGUID: Y6ey8ok6RTO/pCwPtiUFJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34555433"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34555433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 20:11:20 -0800
X-CSE-ConnectionGUID: B3vaKllrQjSA4muUsjYQGw==
X-CSE-MsgGUID: UJ+QqvcFSkWy/QusgUZWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="101282992"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2024 20:11:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLx1I-000BgD-2D;
	Fri, 13 Dec 2024 04:11:16 +0000
Date: Fri, 13 Dec 2024 12:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 161/520]
 drivers/ufs/host/ufs-mediatek.c:930:40: error:
 'MTK_RPM_AUTOSUSPEND_DELAY_MS' undeclared
Message-ID: <202412131232.Ts8raZXx-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241213/202412131232.Ts8raZXx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131232.Ts8raZXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131232.Ts8raZXx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_init':
>> drivers/ufs/host/ufs-mediatek.c:930:40: error: 'MTK_RPM_AUTOSUSPEND_DELAY_MS' undeclared (first use in this function)
     930 |         shost->rpm_autosuspend_delay = MTK_RPM_AUTOSUSPEND_DELAY_MS;
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-mediatek.c:930:40: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


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
