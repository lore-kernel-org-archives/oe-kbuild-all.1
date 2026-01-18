Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028343321BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744859; cv=none; b=IS44EMLo18mJhJvWRffAtCSePDsYeL694bKxRhrh86BTfvqN1iFKqh3MekT2pWMJFyL9f+yJo9dSdsoRXUVXbor7EpOzH0kkwJqwtX8SMVpVu5nmy5vGfn0wsjfQXDO0c2cP0U6++YP1lTDYV4BNSQU13Z2Aq+TfcSraKoMMcEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744859; c=relaxed/simple;
	bh=7vhcowvgZqSSA1LGeLUWk60NF/bc3C6UABA+bGXVCmo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ePRxz0x8VDcv7c0v4Kq3SlYuyFm7hJS/BLs5SGyuYNkJQLERcYQoR6Y6jgq2mSJEOvay4wkKXRcZgOX9HOmRiBkvWXgtSYaLuQ2WVdZa2vdUKBsGlZ/eI4iOtYDUrE5fG51xzDKpXCPXoJxkVXaYa/aqSmL5D4MBb/gmEnRYYOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GU4kYzFF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GU4kYzFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768744857; x=1800280857;
  h=date:from:to:cc:subject:message-id;
  bh=7vhcowvgZqSSA1LGeLUWk60NF/bc3C6UABA+bGXVCmo=;
  b=GU4kYzFFA/QWv9irWhQgKVyfNwPwAeP0xhWr4uy5IKVByNMi2pV7LVKX
   oU3fViH7JFw2lWslbrkDq+QXH+wsWmJDK9NxiyjYW79XGCBkuPt6WgBq0
   Fmze4awYeUdXEaviqG5i69uOnJlu2E+cCBKgqd2W6lS3QWNrTL67eEVHc
   SjIP3Wgfi4YY4p/wrJxJxyuf59H2g5wKU3GKv/OGC1UMin6tAZ5s6Uwt4
   UHB8eiZQ2QzzjSInz6JtIAGZsPzm4fkKzP1Th7+O1j3C1EDqLd1YSUWpl
   MbPsZjiMPBIna8gdwBK7s4Cy3i4crmL1zpf0cH2cjqGGfkahkjqY8p7iG
   Q==;
X-CSE-ConnectionGUID: Dm2DVYChQleWKGJZDG0X6g==
X-CSE-MsgGUID: 3U44h1mnRz6qYrr/ejgneg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="68991459"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="68991459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 06:00:56 -0800
X-CSE-ConnectionGUID: /vhyBKiRRO2D1255Y6Lcbg==
X-CSE-MsgGUID: wKRRzpzMSWWOBo9FSxcJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205548134"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jan 2026 06:00:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhTKm-00000000MzQ-35Fz;
	Sun, 18 Jan 2026 14:00:52 +0000
Date: Sun, 18 Jan 2026 22:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Asad Kamal <asad.kamal@amd.com>
Subject: 
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c:909:3-4: Unneeded
 semicolon
Message-ID: <202601182157.r1AfndME-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: b480f573a8abd8f98474496fcf1eec86bf954002 drm/amd/pm: Use gpu metrics 1.9 for SMUv13.0.12
date:   3 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260118/202601182157.r1AfndME-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182157.r1AfndME-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c:909:3-4: Unneeded semicolon

vim +909 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c

   774	
   775	void smu_v13_0_12_get_gpu_metrics(struct smu_context *smu, void **table,
   776					  void *smu_metrics,
   777					  struct smu_v13_0_6_gpu_metrics *gpu_metrics)
   778	{
   779		struct amdgpu_device *adev = smu->adev;
   780		int ret = 0, xcc_id, inst, i, j;
   781		u8 num_jpeg_rings_gpu_metrics;
   782		MetricsTable_t *metrics;
   783	
   784		metrics = (MetricsTable_t *)smu_metrics;
   785	
   786		gpu_metrics->temperature_hotspot =
   787			SMUQ10_ROUND(metrics->MaxSocketTemperature);
   788		/* Individual HBM stack temperature is not reported */
   789		gpu_metrics->temperature_mem =
   790			SMUQ10_ROUND(metrics->MaxHbmTemperature);
   791		/* Reports max temperature of all voltage rails */
   792		gpu_metrics->temperature_vrsoc =
   793			SMUQ10_ROUND(metrics->MaxVrTemperature);
   794	
   795		gpu_metrics->average_gfx_activity =
   796			SMUQ10_ROUND(metrics->SocketGfxBusy);
   797		gpu_metrics->average_umc_activity =
   798			SMUQ10_ROUND(metrics->DramBandwidthUtilization);
   799	
   800		gpu_metrics->mem_max_bandwidth =
   801			SMUQ10_ROUND(metrics->MaxDramBandwidth);
   802	
   803		gpu_metrics->curr_socket_power =
   804			SMUQ10_ROUND(metrics->SocketPower);
   805		/* Energy counter reported in 15.259uJ (2^-16) units */
   806		gpu_metrics->energy_accumulator = metrics->SocketEnergyAcc;
   807	
   808		for (i = 0; i < MAX_GFX_CLKS; i++) {
   809			xcc_id = GET_INST(GC, i);
   810			if (xcc_id >= 0)
   811				gpu_metrics->current_gfxclk[i] =
   812					SMUQ10_ROUND(metrics->GfxclkFrequency[xcc_id]);
   813	
   814			if (i < MAX_CLKS) {
   815				gpu_metrics->current_socclk[i] =
   816					SMUQ10_ROUND(metrics->SocclkFrequency[i]);
   817				inst = GET_INST(VCN, i);
   818				if (inst >= 0) {
   819					gpu_metrics->current_vclk0[i] =
   820						SMUQ10_ROUND(metrics->VclkFrequency[inst]);
   821					gpu_metrics->current_dclk0[i] =
   822						SMUQ10_ROUND(metrics->DclkFrequency[inst]);
   823				}
   824			}
   825		}
   826	
   827		gpu_metrics->current_uclk = SMUQ10_ROUND(metrics->UclkFrequency);
   828	
   829		/* Total accumulated cycle counter */
   830		gpu_metrics->accumulation_counter = metrics->AccumulationCounter;
   831	
   832		/* Accumulated throttler residencies */
   833		gpu_metrics->prochot_residency_acc = metrics->ProchotResidencyAcc;
   834		gpu_metrics->ppt_residency_acc = metrics->PptResidencyAcc;
   835		gpu_metrics->socket_thm_residency_acc = metrics->SocketThmResidencyAcc;
   836		gpu_metrics->vr_thm_residency_acc = metrics->VrThmResidencyAcc;
   837		gpu_metrics->hbm_thm_residency_acc = metrics->HbmThmResidencyAcc;
   838	
   839		/* Clock Lock Status. Each bit corresponds to each GFXCLK instance */
   840		gpu_metrics->gfxclk_lock_status = metrics->GfxLockXCDMak >> GET_INST(GC, 0);
   841	
   842		gpu_metrics->pcie_link_width = metrics->PCIeLinkWidth;
   843		gpu_metrics->pcie_link_speed =
   844			pcie_gen_to_speed(metrics->PCIeLinkSpeed);
   845		gpu_metrics->pcie_bandwidth_acc =
   846			SMUQ10_ROUND(metrics->PcieBandwidthAcc[0]);
   847		gpu_metrics->pcie_bandwidth_inst =
   848			SMUQ10_ROUND(metrics->PcieBandwidth[0]);
   849		gpu_metrics->pcie_l0_to_recov_count_acc = metrics->PCIeL0ToRecoveryCountAcc;
   850		gpu_metrics->pcie_replay_count_acc = metrics->PCIenReplayAAcc;
   851		gpu_metrics->pcie_replay_rover_count_acc =
   852			metrics->PCIenReplayARolloverCountAcc;
   853		gpu_metrics->pcie_nak_sent_count_acc = metrics->PCIeNAKSentCountAcc;
   854		gpu_metrics->pcie_nak_rcvd_count_acc = metrics->PCIeNAKReceivedCountAcc;
   855		gpu_metrics->pcie_lc_perf_other_end_recovery = metrics->PCIeOtherEndRecoveryAcc;
   856	
   857		gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
   858	
   859		gpu_metrics->gfx_activity_acc = SMUQ10_ROUND(metrics->SocketGfxBusyAcc);
   860		gpu_metrics->mem_activity_acc = SMUQ10_ROUND(metrics->DramBandwidthUtilizationAcc);
   861	
   862		for (i = 0; i < NUM_XGMI_LINKS; i++) {
   863			j = amdgpu_xgmi_get_ext_link(adev, i);
   864			if (j < 0 || j >= NUM_XGMI_LINKS)
   865				continue;
   866			gpu_metrics->xgmi_read_data_acc[j] =
   867				SMUQ10_ROUND(metrics->XgmiReadDataSizeAcc[i]);
   868			gpu_metrics->xgmi_write_data_acc[j] =
   869				SMUQ10_ROUND(metrics->XgmiWriteDataSizeAcc[i]);
   870			ret = amdgpu_get_xgmi_link_status(adev, i);
   871			if (ret >= 0)
   872				gpu_metrics->xgmi_link_status[j] = ret;
   873		}
   874	
   875		num_jpeg_rings_gpu_metrics = NUM_JPEG_RINGS_GPU_METRICS(gpu_metrics);
   876		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
   877			inst = GET_INST(VCN, i);
   878	
   879			for (j = 0; j < num_jpeg_rings_gpu_metrics; ++j) {
   880				gpu_metrics->jpeg_busy[(i * num_jpeg_rings_gpu_metrics) +
   881						       j] =
   882					SMUQ10_ROUND(
   883						metrics->JpegBusy[(inst *
   884								   NUM_JPEG_RINGS_FW) +
   885								  j]);
   886			}
   887			gpu_metrics->vcn_busy[i] = SMUQ10_ROUND(metrics->VcnBusy[inst]);
   888		}
   889	
   890		for (i = 0; i < NUM_XCC(adev->gfx.xcc_mask); ++i) {
   891			inst = GET_INST(GC, i);
   892			gpu_metrics->gfx_busy_inst[i] =
   893				SMUQ10_ROUND(metrics->GfxBusy[inst]);
   894			gpu_metrics->gfx_busy_acc[i] =
   895				SMUQ10_ROUND(metrics->GfxBusyAcc[inst]);
   896			if (smu_v13_0_6_cap_supported(smu,
   897						      SMU_CAP(HST_LIMIT_METRICS))) {
   898				gpu_metrics
   899					->gfx_below_host_limit_ppt_acc[i] = SMUQ10_ROUND(
   900					metrics->GfxclkBelowHostLimitPptAcc[inst]);
   901				gpu_metrics
   902					->gfx_below_host_limit_thm_acc[i] = SMUQ10_ROUND(
   903					metrics->GfxclkBelowHostLimitThmAcc[inst]);
   904				gpu_metrics->gfx_low_utilization_acc[i] = SMUQ10_ROUND(
   905					metrics->GfxclkLowUtilizationAcc[inst]);
   906				gpu_metrics->gfx_below_host_limit_total_acc
   907					[i] = SMUQ10_ROUND(
   908					metrics->GfxclkBelowHostLimitTotalAcc[inst]);
 > 909			};
   910		}
   911	
   912		gpu_metrics->xgmi_link_width = metrics->XgmiWidth;
   913		gpu_metrics->xgmi_link_speed = metrics->XgmiBitrate;
   914	
   915		gpu_metrics->firmware_timestamp = metrics->Timestamp;
   916	}
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
