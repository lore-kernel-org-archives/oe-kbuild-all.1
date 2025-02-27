Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4E23FC7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667568; cv=none; b=XZt5opNR4/HmoRzU9ZzyFusqW9x89AqsBnI9RxfPtgpc09pc1sMxm1+qkCpcVBZuzTkpa1zhYx8lpgm78YSoxsc1VW57Ppta1oc+/uVbRnPZvelrKtX8YwwDcR6R56mmj5zSGjkM1KJX1wo5iYi2fFZdSMfd8IFzarh2xDOYfpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667568; c=relaxed/simple;
	bh=4PdarZtMXrFMo7Bv8e/WQbRPR4IbruYueiy2EIEQaK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASySW8VkdlpbqNp4GlVyOzOd97rNxiHFRZzrtUiFqC7jMoB2WINk3MMqxRK1Em7NUhSSPkC68OGnpasBFr+5LPD/+uYCEtj+NfgEiqAK2QqOQQx09YSwyBLhYqdB75Ug7Rx9vxA7bhfucuoW8G3nlYNUsv8iFKLmgJBZLcKG86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2/qDRbj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2/qDRbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740667566; x=1772203566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PdarZtMXrFMo7Bv8e/WQbRPR4IbruYueiy2EIEQaK8=;
  b=H2/qDRbjkPf5E8ywX8xsDxRH37yPX1F+TUV4RY5DD4Yjs/Jf6SXCre/+
   JXKRT4Y6YOoyz5yBVm8P2MbOTAYeWKVUplPDEczpOl/jvgx6dDijczAFX
   PgfDXURlbGTijlt1Xo5aa6QAxdRjPKwX4JaxE8V2PPXkg3/dZAPtRYgRs
   iKm5PprQXU6UDhngnVaaGPY9GOqO+pBBbmaKXqpJqY8f1ClV5J9k7h9P9
   1scmk1jouyat+n0GPqi20QKAhyX4NGefrUFcNRou0kiowInhsW01jzLm8
   nnAnAOgm1MrLpeS41uVz40b4yRdSRVVztFD9JNGYDq5XEWTgLks4M/1S0
   Q==;
X-CSE-ConnectionGUID: +lJTJVoFQOKxz2K0+WgoXA==
X-CSE-MsgGUID: +p6naQpHSsCgBq5CBOhaYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="29160337"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="29160337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:46:05 -0800
X-CSE-ConnectionGUID: V/XrdIpbTpmzMrlhR1H+pg==
X-CSE-MsgGUID: ITLfEbcxTSmkEyvFEMmEEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="122058260"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Feb 2025 06:46:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnf9F-000DVq-24;
	Thu, 27 Feb 2025 14:46:01 +0000
Date: Thu, 27 Feb 2025 22:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Asad Kamal <asad.kamal@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 5837/6931]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_12_ppt.c:464
 smu_v13_0_12_get_gpu_metrics() warn: inconsistent indenting
Message-ID: <202502272246.OISqUnC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: 0b4119d54b17618c2ddb04a2af5bf5ebe24121e3 [5837/6931] drm/amd/pm: Use separate metrics table for smu_v13_0_12
config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502272246.OISqUnC1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272246.OISqUnC1-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_12_ppt.c:464 smu_v13_0_12_get_gpu_metrics() warn: inconsistent indenting

vim +464 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_12_ppt.c

   331	
   332	ssize_t smu_v13_0_12_get_gpu_metrics(struct smu_context *smu, void **table)
   333	{
   334		struct smu_table_context *smu_table = &smu->smu_table;
   335		struct gpu_metrics_v1_7 *gpu_metrics =
   336			(struct gpu_metrics_v1_7 *)smu_table->gpu_metrics_table;
   337		int ret = 0, xcc_id, inst, i, j, k, idx;
   338		struct amdgpu_device *adev = smu->adev;
   339		u8 num_jpeg_rings_gpu_metrics;
   340		MetricsTable_t *metrics;
   341		struct amdgpu_xcp *xcp;
   342		u32 inst_mask;
   343	
   344		metrics = kzalloc(sizeof(MetricsTable_t), GFP_KERNEL);
   345		memcpy(metrics, smu_table->metrics_table, sizeof(MetricsTable_t));
   346	
   347		smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 7);
   348	
   349		gpu_metrics->temperature_hotspot =
   350			SMUQ10_ROUND(metrics->MaxSocketTemperature);
   351		/* Individual HBM stack temperature is not reported */
   352		gpu_metrics->temperature_mem =
   353			SMUQ10_ROUND(metrics->MaxHbmTemperature);
   354		/* Reports max temperature of all voltage rails */
   355		gpu_metrics->temperature_vrsoc =
   356			SMUQ10_ROUND(metrics->MaxVrTemperature);
   357	
   358		gpu_metrics->average_gfx_activity =
   359			SMUQ10_ROUND(metrics->SocketGfxBusy);
   360		gpu_metrics->average_umc_activity =
   361			SMUQ10_ROUND(metrics->DramBandwidthUtilization);
   362	
   363		gpu_metrics->mem_max_bandwidth =
   364			SMUQ10_ROUND(metrics->MaxDramBandwidth);
   365	
   366		gpu_metrics->curr_socket_power =
   367			SMUQ10_ROUND(metrics->SocketPower);
   368		/* Energy counter reported in 15.259uJ (2^-16) units */
   369		gpu_metrics->energy_accumulator = metrics->SocketEnergyAcc;
   370	
   371		for (i = 0; i < MAX_GFX_CLKS; i++) {
   372			xcc_id = GET_INST(GC, i);
   373			if (xcc_id >= 0)
   374				gpu_metrics->current_gfxclk[i] =
   375					SMUQ10_ROUND(metrics->GfxclkFrequency[xcc_id]);
   376	
   377			if (i < MAX_CLKS) {
   378				gpu_metrics->current_socclk[i] =
   379					SMUQ10_ROUND(metrics->SocclkFrequency[i]);
   380				inst = GET_INST(VCN, i);
   381				if (inst >= 0) {
   382					gpu_metrics->current_vclk0[i] =
   383						SMUQ10_ROUND(metrics->VclkFrequency[inst]);
   384					gpu_metrics->current_dclk0[i] =
   385						SMUQ10_ROUND(metrics->DclkFrequency[inst]);
   386				}
   387			}
   388		}
   389	
   390		gpu_metrics->current_uclk = SMUQ10_ROUND(metrics->UclkFrequency);
   391	
   392		/* Total accumulated cycle counter */
   393		gpu_metrics->accumulation_counter = metrics->AccumulationCounter;
   394	
   395		/* Accumulated throttler residencies */
   396		gpu_metrics->prochot_residency_acc = metrics->ProchotResidencyAcc;
   397		gpu_metrics->ppt_residency_acc = metrics->PptResidencyAcc;
   398		gpu_metrics->socket_thm_residency_acc = metrics->SocketThmResidencyAcc;
   399		gpu_metrics->vr_thm_residency_acc = metrics->VrThmResidencyAcc;
   400		gpu_metrics->hbm_thm_residency_acc = metrics->HbmThmResidencyAcc;
   401	
   402		/* Clock Lock Status. Each bit corresponds to each GFXCLK instance */
   403		gpu_metrics->gfxclk_lock_status = metrics->GfxLockXCDMak >> GET_INST(GC, 0);
   404	
   405		gpu_metrics->pcie_link_width = metrics->PCIeLinkWidth;
   406		gpu_metrics->pcie_link_speed =
   407			pcie_gen_to_speed(metrics->PCIeLinkSpeed);
   408		gpu_metrics->pcie_bandwidth_acc =
   409			SMUQ10_ROUND(metrics->PcieBandwidthAcc[0]);
   410		gpu_metrics->pcie_bandwidth_inst =
   411			SMUQ10_ROUND(metrics->PcieBandwidth[0]);
   412		gpu_metrics->pcie_l0_to_recov_count_acc = metrics->PCIeL0ToRecoveryCountAcc;
   413		gpu_metrics->pcie_replay_count_acc = metrics->PCIenReplayAAcc;
   414		gpu_metrics->pcie_replay_rover_count_acc =
   415			metrics->PCIenReplayARolloverCountAcc;
   416		gpu_metrics->pcie_nak_sent_count_acc = metrics->PCIeNAKSentCountAcc;
   417		gpu_metrics->pcie_nak_rcvd_count_acc = metrics->PCIeNAKReceivedCountAcc;
   418		gpu_metrics->pcie_lc_perf_other_end_recovery = metrics->PCIeOtherEndRecoveryAcc;
   419	
   420		gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
   421	
   422		gpu_metrics->gfx_activity_acc = SMUQ10_ROUND(metrics->SocketGfxBusyAcc);
   423		gpu_metrics->mem_activity_acc = SMUQ10_ROUND(metrics->DramBandwidthUtilizationAcc);
   424	
   425		for (i = 0; i < NUM_XGMI_LINKS; i++) {
   426			gpu_metrics->xgmi_read_data_acc[i] =
   427				SMUQ10_ROUND(metrics->XgmiReadDataSizeAcc[i]);
   428			gpu_metrics->xgmi_write_data_acc[i] =
   429				SMUQ10_ROUND(metrics->XgmiWriteDataSizeAcc[i]);
   430			ret = amdgpu_get_xgmi_link_status(adev, i);
   431			if (ret >= 0)
   432				gpu_metrics->xgmi_link_status[i] = ret;
   433		}
   434	
   435		gpu_metrics->num_partition = adev->xcp_mgr->num_xcps;
   436	
   437		num_jpeg_rings_gpu_metrics = NUM_JPEG_RINGS_GPU_METRICS(gpu_metrics);
   438		for_each_xcp(adev->xcp_mgr, xcp, i) {
   439			amdgpu_xcp_get_inst_details(xcp, AMDGPU_XCP_VCN, &inst_mask);
   440			idx = 0;
   441			for_each_inst(k, inst_mask) {
   442				/* Both JPEG and VCN has same instances */
   443				inst = GET_INST(VCN, k);
   444	
   445				for (j = 0; j < num_jpeg_rings_gpu_metrics; ++j) {
   446					gpu_metrics->xcp_stats[i].jpeg_busy
   447						[(idx * num_jpeg_rings_gpu_metrics) + j] =
   448						SMUQ10_ROUND(metrics->JpegBusy
   449								[(inst * NUM_JPEG_RINGS_FW) + j]);
   450				}
   451				gpu_metrics->xcp_stats[i].vcn_busy[idx] =
   452				       SMUQ10_ROUND(metrics->VcnBusy[inst]);
   453				idx++;
   454			}
   455	
   456			amdgpu_xcp_get_inst_details(xcp, AMDGPU_XCP_GFX, &inst_mask);
   457			idx = 0;
   458			for_each_inst(k, inst_mask) {
   459				inst = GET_INST(GC, k);
   460				gpu_metrics->xcp_stats[i].gfx_busy_inst[idx] =
   461					SMUQ10_ROUND(metrics->GfxBusy[inst]);
   462				gpu_metrics->xcp_stats[i].gfx_busy_acc[idx] =
   463					SMUQ10_ROUND(metrics->GfxBusyAcc[inst]);
 > 464					idx++;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
