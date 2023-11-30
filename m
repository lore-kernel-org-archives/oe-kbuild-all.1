Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B247A7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoK5ijDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701351509; x=1732887509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+EEVQvLYpv0En6BDi5RUFWMjYZ6PAlnzmbQ0DRgyIQ=;
  b=eoK5ijDeA7dhKf4sIEjgasYaPvHUlX3QYKS71Dl+8Rf9xvJ6Vt1aG0Gb
   ft8daToaS7kIwPAMtrsGDlejgyHJXjoP2hqdhui3xQxm60NzTZfEfLGJI
   WAEAOiGtWYWaL7p379NFQH3h7OZITNuEc/pk0ffHYReiVGcqxADC3FXpA
   0d1IeZeP6QkLkZvBaca4WaFh0yAUaMBh6ldo7NRS8p2Mf0JBgNH4Y1t+j
   ut+RYo2FpbsGICXfeD/8/9Nh8KgGuJFDqkMimZ6QPxXY9OMZod5D5NTFI
   B3d985tUbGjWprtciNtyJxyqWucH0ieu3qQfx6FpSGEmCDqly6/jnlkTa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373509279"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="373509279"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719128180"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="719128180"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 05:38:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8hFH-00023O-2E;
	Thu, 30 Nov 2023 13:38:23 +0000
Date: Thu, 30 Nov 2023 21:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alvin Lee <alvin.lee2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Samson Tam <samson.tam@amd.com>
Subject: [linux-next:master 3881/4102]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c:3148:1:
 warning: the frame size of 2176 bytes is larger than 2048 bytes
Message-ID: <202311302107.hUDXVyWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cd3fe06ff81cfb3a969acb12a56796cff5af23d
commit: 75a3371e8ffdab2e504f4326daab60f8fb15fdf1 [3881/4102] drm/amd/display: Increase num voltage states to 40
config: x86_64-randconfig-102-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302107.hUDXVyWT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302107.hUDXVyWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302107.hUDXVyWT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c: In function 'dml32_UseMinimumDCFCLK':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c:3148:1: warning: the frame size of 2176 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    3148 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +3148 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c

dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2920  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2921  void dml32_UseMinimumDCFCLK(
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2922  		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2923  		bool DRRDisplay[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2924  		bool SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2925  		unsigned int MaxInterDCNTileRepeaters,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2926  		unsigned int MaxPrefetchMode,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2927  		double DRAMClockChangeLatencyFinal,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2928  		double FCLKChangeLatency,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2929  		double SREnterPlusExitTime,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2930  		unsigned int ReturnBusWidth,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2931  		unsigned int RoundTripPingLatencyCycles,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2932  		unsigned int ReorderingBytes,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2933  		unsigned int PixelChunkSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2934  		unsigned int MetaChunkSize,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2935  		bool GPUVMEnable,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2936  		unsigned int GPUVMMaxPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2937  		bool HostVMEnable,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2938  		unsigned int NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2939  		double HostVMMinPageSize,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2940  		unsigned int HostVMMaxNonCachedPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2941  		bool DynamicMetadataVMEnabled,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2942  		bool ImmediateFlipRequirement,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2943  		bool ProgressiveToInterlaceUnitInOPP,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2944  		double MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2945  		double PercentOfIdealSDPPortBWReceivedAfterUrgLatency,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2946  		unsigned int VTotal[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2947  		unsigned int VActive[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2948  		unsigned int DynamicMetadataTransmittedBytes[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2949  		unsigned int DynamicMetadataLinesBeforeActiveRequired[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2950  		bool Interlace[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2951  		double RequiredDPPCLKPerSurface[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2952  		double RequiredDISPCLK[][2],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2953  		double UrgLatency[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2954  		unsigned int NoOfDPP[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2955  		double ProjectedDCFClkDeepSleep[][2],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2956  		double MaximumVStartup[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2957  		unsigned int TotalNumberOfActiveDPP[][2],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2958  		unsigned int TotalNumberOfDCCActiveDPP[][2],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2959  		unsigned int dpte_group_bytes[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2960  		double PrefetchLinesY[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2961  		double PrefetchLinesC[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2962  		unsigned int swath_width_luma_ub_all_states[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2963  		unsigned int swath_width_chroma_ub_all_states[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2964  		unsigned int BytePerPixelY[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2965  		unsigned int BytePerPixelC[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2966  		unsigned int HTotal[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2967  		double PixelClock[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2968  		double PDEAndMetaPTEBytesPerFrame[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2969  		double DPTEBytesPerRow[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2970  		double MetaRowBytes[][2][DC__NUM_DPP__MAX],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2971  		bool DynamicMetadataEnable[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2972  		double ReadBandwidthLuma[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2973  		double ReadBandwidthChroma[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2974  		double DCFCLKPerState[],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2975  		/* Output */
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2976  		double DCFCLKState[][2])
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2977  {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2978  	unsigned int i, j, k;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2979  	unsigned int     dummy1;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2980  	double dummy2, dummy3;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2981  	double   NormalEfficiency;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2982  	double   TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2983  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2984  	NormalEfficiency = PercentOfIdealSDPPortBWReceivedAfterUrgLatency / 100.0;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2985  	for  (i = 0; i < DC__VOLTAGE_STATES; ++i) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2986  		for  (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2987  			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2988  			double PrefetchPixelLinesTime[DC__NUM_DPP__MAX];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2989  			double DCFCLKRequiredForPeakBandwidthPerSurface[DC__NUM_DPP__MAX];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2990  			double DynamicMetadataVMExtraLatency[DC__NUM_DPP__MAX];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2991  			double MinimumTWait = 0.0;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2992  			double DPTEBandwidth;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2993  			double DCFCLKRequiredForAverageBandwidth;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2994  			unsigned int ExtraLatencyBytes;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2995  			double ExtraLatencyCycles;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2996  			double DCFCLKRequiredForPeakBandwidth;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2997  			unsigned int NoOfDPPState[DC__NUM_DPP__MAX];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2998  			double MinimumTvmPlus2Tr0;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  2999  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3000  			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3001  			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3002  				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3003  						+ NoOfDPP[i][j][k] * DPTEBytesPerRow[i][j][k]
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3004  								/ (15.75 * HTotal[k] / PixelClock[k]);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3005  			}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3006  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3007  			for (k = 0; k <= NumberOfActiveSurfaces - 1; ++k)
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3008  				NoOfDPPState[k] = NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3009  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3010  			DPTEBandwidth = TotalMaxPrefetchFlipDPTERowBandwidth[i][j];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3011  			DCFCLKRequiredForAverageBandwidth = dml_max(ProjectedDCFClkDeepSleep[i][j], DPTEBandwidth / NormalEfficiency / ReturnBusWidth);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3012  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3013  			ExtraLatencyBytes = dml32_CalculateExtraLatencyBytes(ReorderingBytes,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3014  					TotalNumberOfActiveDPP[i][j], PixelChunkSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3015  					TotalNumberOfDCCActiveDPP[i][j], MetaChunkSize, GPUVMEnable, HostVMEnable,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3016  					NumberOfActiveSurfaces, NoOfDPPState, dpte_group_bytes, 1, HostVMMinPageSize,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3017  					HostVMMaxNonCachedPageTableLevels);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3018  			ExtraLatencyCycles = RoundTripPingLatencyCycles + __DML_ARB_TO_RET_DELAY__
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3019  					+ ExtraLatencyBytes / NormalEfficiency / ReturnBusWidth;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3020  			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3021  				double DCFCLKCyclesRequiredInPrefetch;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3022  				double PrefetchTime;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3023  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3024  				PixelDCFCLKCyclesRequiredInPrefetch[k] = (PrefetchLinesY[i][j][k]
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3025  						* swath_width_luma_ub_all_states[i][j][k] * BytePerPixelY[k]
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3026  						+ PrefetchLinesC[i][j][k] * swath_width_chroma_ub_all_states[i][j][k]
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3027  								* BytePerPixelC[k]) / NormalEfficiency
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3028  						/ ReturnBusWidth;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3029  				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k]
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3030  						+ PDEAndMetaPTEBytesPerFrame[i][j][k] / NormalEfficiency
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3031  								/ NormalEfficiency / ReturnBusWidth
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3032  								* (GPUVMMaxPageTableLevels > 2 ? 1 : 0)
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3033  						+ 2 * DPTEBytesPerRow[i][j][k] / NormalEfficiency / NormalEfficiency
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3034  								/ ReturnBusWidth
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3035  						+ 2 * MetaRowBytes[i][j][k] / NormalEfficiency / ReturnBusWidth
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3036  						+ PixelDCFCLKCyclesRequiredInPrefetch[k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3037  				PrefetchPixelLinesTime[k] = dml_max(PrefetchLinesY[i][j][k], PrefetchLinesC[i][j][k])
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3038  						* HTotal[k] / PixelClock[k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3039  				DynamicMetadataVMExtraLatency[k] = (GPUVMEnable == true &&
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3040  						DynamicMetadataEnable[k] == true && DynamicMetadataVMEnabled == true) ?
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3041  						UrgLatency[i] * GPUVMMaxPageTableLevels *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3042  						(HostVMEnable == true ? HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3043  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3044  				MinimumTWait = dml32_CalculateTWait(MaxPrefetchMode,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3045  						UseMALLForPStateChange[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3046  						SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3047  						DRRDisplay[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3048  						DRAMClockChangeLatencyFinal,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3049  						FCLKChangeLatency,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3050  						UrgLatency[i],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3051  						SREnterPlusExitTime);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3052  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3053  				PrefetchTime = (MaximumVStartup[i][j][k] - 1) * HTotal[k] / PixelClock[k] -
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3054  						MinimumTWait - UrgLatency[i] *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3055  						((GPUVMMaxPageTableLevels <= 2 ? GPUVMMaxPageTableLevels :
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3056  						GPUVMMaxPageTableLevels - 2) *  (HostVMEnable == true ?
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3057  						HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1) -
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3058  						DynamicMetadataVMExtraLatency[k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3059  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3060  				if (PrefetchTime > 0) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3061  					double ExpectedVRatioPrefetch;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3062  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3063  					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k] / (PrefetchTime *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3064  							PixelDCFCLKCyclesRequiredInPrefetch[k] /
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3065  							DCFCLKCyclesRequiredInPrefetch);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3066  					DCFCLKRequiredForPeakBandwidthPerSurface[k] = NoOfDPPState[k] *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3067  							PixelDCFCLKCyclesRequiredInPrefetch[k] /
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3068  							PrefetchPixelLinesTime[k] *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3069  							dml_max(1.0, ExpectedVRatioPrefetch) *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3070  							dml_max(1.0, ExpectedVRatioPrefetch / 4);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3071  					if (HostVMEnable == true || ImmediateFlipRequirement == true) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3072  						DCFCLKRequiredForPeakBandwidthPerSurface[k] =
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3073  								DCFCLKRequiredForPeakBandwidthPerSurface[k] +
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3074  								NoOfDPPState[k] * DPTEBandwidth / NormalEfficiency /
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3075  								NormalEfficiency / ReturnBusWidth;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3076  					}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3077  				} else {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3078  					DCFCLKRequiredForPeakBandwidthPerSurface[k] = DCFCLKPerState[i];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3079  				}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3080  				if (DynamicMetadataEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3081  					double TSetupPipe;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3082  					double TdmbfPipe;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3083  					double TdmsksPipe;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3084  					double TdmecPipe;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3085  					double AllowedTimeForUrgentExtraLatency;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3086  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3087  					dml32_CalculateVUpdateAndDynamicMetadataParameters(
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3088  							MaxInterDCNTileRepeaters,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3089  							RequiredDPPCLKPerSurface[i][j][k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3090  							RequiredDISPCLK[i][j],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3091  							ProjectedDCFClkDeepSleep[i][j],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3092  							PixelClock[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3093  							HTotal[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3094  							VTotal[k] - VActive[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3095  							DynamicMetadataTransmittedBytes[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3096  							DynamicMetadataLinesBeforeActiveRequired[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3097  							Interlace[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3098  							ProgressiveToInterlaceUnitInOPP,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3099  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3100  							/* output */
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3101  							&TSetupPipe,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3102  							&TdmbfPipe,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3103  							&TdmecPipe,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3104  							&TdmsksPipe,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3105  							&dummy1,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3106  							&dummy2,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3107  							&dummy3);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3108  					AllowedTimeForUrgentExtraLatency = MaximumVStartup[i][j][k] * HTotal[k] /
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3109  							PixelClock[k] - MinimumTWait - TSetupPipe - TdmbfPipe -
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3110  							TdmecPipe - TdmsksPipe - DynamicMetadataVMExtraLatency[k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3111  					if (AllowedTimeForUrgentExtraLatency > 0)
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3112  						DCFCLKRequiredForPeakBandwidthPerSurface[k] =
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3113  								dml_max(DCFCLKRequiredForPeakBandwidthPerSurface[k],
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3114  								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3115  					else
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3116  						DCFCLKRequiredForPeakBandwidthPerSurface[k] = DCFCLKPerState[i];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3117  				}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3118  			}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3119  			DCFCLKRequiredForPeakBandwidth = 0;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3120  			for (k = 0; k <= NumberOfActiveSurfaces - 1; ++k) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3121  				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth +
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3122  						DCFCLKRequiredForPeakBandwidthPerSurface[k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3123  			}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3124  			MinimumTvmPlus2Tr0 = UrgLatency[i] * (GPUVMEnable == true ?
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3125  					(HostVMEnable == true ? (GPUVMMaxPageTableLevels + 2) *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3126  					(HostVMMaxNonCachedPageTableLevels + 1) - 1 : GPUVMMaxPageTableLevels + 1) : 0);
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3127  			for (k = 0; k < NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3128  				double MaximumTvmPlus2Tr0PlusTsw;
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3129  
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3130  				MaximumTvmPlus2Tr0PlusTsw = (MaximumVStartup[i][j][k] - 2) * HTotal[k] /
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3131  						PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3132  				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3133  					DCFCLKRequiredForPeakBandwidth = DCFCLKPerState[i];
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3134  				} else {
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3135  					DCFCLKRequiredForPeakBandwidth = dml_max3(DCFCLKRequiredForPeakBandwidth,
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3136  							2 * ExtraLatencyCycles / (MaximumTvmPlus2Tr0PlusTsw -
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3137  								MinimumTvmPlus2Tr0 -
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3138  								PrefetchPixelLinesTime[k] / 4),
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3139  							(2 * ExtraLatencyCycles +
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3140  								PixelDCFCLKCyclesRequiredInPrefetch[k]) /
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3141  								(MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3142  				}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3143  			}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3144  			DCFCLKState[i][j] = dml_min(DCFCLKPerState[i], 1.05 *
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3145  					dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3146  		}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3147  	}
dda4fb85e433f7 Aurabindo Pillai 2022-02-21 @3148  }
dda4fb85e433f7 Aurabindo Pillai 2022-02-21  3149  

:::::: The code at line 3148 was first introduced by commit
:::::: dda4fb85e433f761eedaed0005a2bc20d705d504 drm/amd/display: DML changes for DCN32/321

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
