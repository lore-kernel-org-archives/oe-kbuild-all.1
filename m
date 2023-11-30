Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC923C695
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCKPI8l4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701350306; x=1732886306;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dCSF5ItIsToBZtXffNomS2JV2i6whHAEBBU6YwuzBcU=;
  b=SCKPI8l4SE2f41PJ8SlBzHoaJoCTOoM80Ee6JCXX7B/MgHnd8h0xS6nd
   VBI8U6figmxhnarOEDJDkcacdnjmRicfpnT8hEUbv1Val+0QraAQklMmw
   ivDYmk6AaEbadoLToLiOJmqtOUktQ1YvgUUqcuobMXpTUHQnWjavdn9AB
   fkG7Pq2c1fIMEXCkEyOD/Wc2ac6gZ1KpOijO/Wniy4BXeTYOY/ZT5ur1C
   yhMptMz1Vh38TEjkTZpt9J+D6lMS5Rjw8c8fNuNMIYI74Rj+0YEe1Zulm
   sTTLpGPUk18tpgQUWASfLbEd/JnimLhUcn9ZHOemVi3EBCBl8+nzIn3Pu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="201583"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="201583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="17396302"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 05:18:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gvp-00020i-2u;
	Thu, 30 Nov 2023 13:18:18 +0000
Date: Thu, 30 Nov 2023 21:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alvin Lee <alvin.lee2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Samson Tam <samson.tam@amd.com>
Subject: [linux-next:master 3881/4102]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:7196:1:
 warning: the frame size of 2080 bytes is larger than 2048 bytes
Message-ID: <202311302122.n1qKWZpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cd3fe06ff81cfb3a969acb12a56796cff5af23d
commit: 75a3371e8ffdab2e504f4326daab60f8fb15fdf1 [3881/4102] drm/amd/display: Increase num voltage states to 40
config: x86_64-randconfig-074-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302122.n1qKWZpb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302122.n1qKWZpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302122.n1qKWZpb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function 'UseMinimumDCFCLK':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:7196:1: warning: the frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    7196 | }
         | ^
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c: In function 'UseMinimumDCFCLK':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:7287:1: warning: the frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    7287 | }
         | ^


vim +7196 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c

74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7036  
caf0f98dc280b5 Hamza Mahfooz       2023-06-05  7037  static noinline_for_stack void UseMinimumDCFCLK(
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7038  		struct display_mode_lib *mode_lib,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7039  		int MaxPrefetchMode,
33c3365ec690c3 Michel Dänzer       2021-12-09  7040  		int ReorderingBytes)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7041  {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7042  	struct vba_vars_st *v = &mode_lib->vba;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7043  	int dummy1, i, j, k;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7044  	double NormalEfficiency,  dummy2, dummy3;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7045  	double TotalMaxPrefetchFlipDPTERowBandwidth[DC__VOLTAGE_STATES][2];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7046  
33c3365ec690c3 Michel Dänzer       2021-12-09  7047  	NormalEfficiency = v->PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency / 100.0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7048  	for (i = 0; i < v->soc.num_states; ++i) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7049  		for (j = 0; j <= 1; ++j) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7050  			double PixelDCFCLKCyclesRequiredInPrefetch[DC__NUM_DPP__MAX];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7051  			double PrefetchPixelLinesTime[DC__NUM_DPP__MAX];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7052  			double DCFCLKRequiredForPeakBandwidthPerPlane[DC__NUM_DPP__MAX];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7053  			double DynamicMetadataVMExtraLatency[DC__NUM_DPP__MAX];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7054  			double MinimumTWait;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7055  			double NonDPTEBandwidth;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7056  			double DPTEBandwidth;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7057  			double DCFCLKRequiredForAverageBandwidth;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7058  			double ExtraLatencyBytes;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7059  			double ExtraLatencyCycles;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7060  			double DCFCLKRequiredForPeakBandwidth;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7061  			int NoOfDPPState[DC__NUM_DPP__MAX];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7062  			double MinimumTvmPlus2Tr0;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7063  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7064  			TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = 0;
33c3365ec690c3 Michel Dänzer       2021-12-09  7065  			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7066  				TotalMaxPrefetchFlipDPTERowBandwidth[i][j] = TotalMaxPrefetchFlipDPTERowBandwidth[i][j]
33c3365ec690c3 Michel Dänzer       2021-12-09  7067  						+ v->NoOfDPP[i][j][k] * v->DPTEBytesPerRow[i][j][k] / (15.75 * v->HTotal[k] / v->PixelClock[k]);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7068  			}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7069  
33c3365ec690c3 Michel Dänzer       2021-12-09  7070  			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
33c3365ec690c3 Michel Dänzer       2021-12-09  7071  				NoOfDPPState[k] = v->NoOfDPP[i][j][k];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7072  			}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7073  
33c3365ec690c3 Michel Dänzer       2021-12-09  7074  			MinimumTWait = CalculateTWait(MaxPrefetchMode, v->FinalDRAMClockChangeLatency, v->UrgLatency[i], v->SREnterPlusExitTime);
33c3365ec690c3 Michel Dänzer       2021-12-09  7075  			NonDPTEBandwidth = v->TotalVActivePixelBandwidth[i][j] + v->TotalVActiveCursorBandwidth[i][j] + v->TotalMetaRowBandwidth[i][j];
33c3365ec690c3 Michel Dänzer       2021-12-09  7076  			DPTEBandwidth = (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) ?
33c3365ec690c3 Michel Dänzer       2021-12-09  7077  					TotalMaxPrefetchFlipDPTERowBandwidth[i][j] : v->TotalDPTERowBandwidth[i][j];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7078  			DCFCLKRequiredForAverageBandwidth = dml_max3(
33c3365ec690c3 Michel Dänzer       2021-12-09  7079  					v->ProjectedDCFCLKDeepSleep[i][j],
33c3365ec690c3 Michel Dänzer       2021-12-09  7080  					(NonDPTEBandwidth + v->TotalDPTERowBandwidth[i][j]) / v->ReturnBusWidth
33c3365ec690c3 Michel Dänzer       2021-12-09  7081  							/ (v->MaxAveragePercentOfIdealFabricAndSDPPortBWDisplayCanUseInNormalSystemOperation / 100),
33c3365ec690c3 Michel Dänzer       2021-12-09  7082  					(NonDPTEBandwidth + DPTEBandwidth / NormalEfficiency) / NormalEfficiency / v->ReturnBusWidth);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7083  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7084  			ExtraLatencyBytes = CalculateExtraLatencyBytes(
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7085  					ReorderingBytes,
33c3365ec690c3 Michel Dänzer       2021-12-09  7086  					v->TotalNumberOfActiveDPP[i][j],
33c3365ec690c3 Michel Dänzer       2021-12-09  7087  					v->PixelChunkSizeInKByte,
33c3365ec690c3 Michel Dänzer       2021-12-09  7088  					v->TotalNumberOfDCCActiveDPP[i][j],
33c3365ec690c3 Michel Dänzer       2021-12-09  7089  					v->MetaChunkSize,
33c3365ec690c3 Michel Dänzer       2021-12-09  7090  					v->GPUVMEnable,
33c3365ec690c3 Michel Dänzer       2021-12-09  7091  					v->HostVMEnable,
33c3365ec690c3 Michel Dänzer       2021-12-09  7092  					v->NumberOfActivePlanes,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7093  					NoOfDPPState,
33c3365ec690c3 Michel Dänzer       2021-12-09  7094  					v->dpte_group_bytes,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7095  					1,
33c3365ec690c3 Michel Dänzer       2021-12-09  7096  					v->HostVMMinPageSize,
33c3365ec690c3 Michel Dänzer       2021-12-09  7097  					v->HostVMMaxNonCachedPageTableLevels);
33c3365ec690c3 Michel Dänzer       2021-12-09  7098  			ExtraLatencyCycles = v->RoundTripPingLatencyCycles + __DML_ARB_TO_RET_DELAY__ + ExtraLatencyBytes / NormalEfficiency / v->ReturnBusWidth;
33c3365ec690c3 Michel Dänzer       2021-12-09  7099  			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7100  				double DCFCLKCyclesRequiredInPrefetch;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7101  				double ExpectedPrefetchBWAcceleration;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7102  				double PrefetchTime;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7103  
33c3365ec690c3 Michel Dänzer       2021-12-09  7104  				PixelDCFCLKCyclesRequiredInPrefetch[k] = (v->PrefetchLinesY[i][j][k] * v->swath_width_luma_ub_all_states[i][j][k] * v->BytePerPixelY[k]
33c3365ec690c3 Michel Dänzer       2021-12-09  7105  						+ v->PrefetchLinesC[i][j][k] * v->swath_width_chroma_ub_all_states[i][j][k] * v->BytePerPixelC[k]) / NormalEfficiency / v->ReturnBusWidth;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7106  				DCFCLKCyclesRequiredInPrefetch = 2 * ExtraLatencyCycles / NoOfDPPState[k]
33c3365ec690c3 Michel Dänzer       2021-12-09  7107  						+ v->PDEAndMetaPTEBytesPerFrame[i][j][k] / NormalEfficiency / NormalEfficiency / v->ReturnBusWidth * (v->GPUVMMaxPageTableLevels > 2 ? 1 : 0)
33c3365ec690c3 Michel Dänzer       2021-12-09  7108  						+ 2 * v->DPTEBytesPerRow[i][j][k] / NormalEfficiency / NormalEfficiency / v->ReturnBusWidth
33c3365ec690c3 Michel Dänzer       2021-12-09  7109  						+ 2 * v->MetaRowBytes[i][j][k] / NormalEfficiency / v->ReturnBusWidth + PixelDCFCLKCyclesRequiredInPrefetch[k];
33c3365ec690c3 Michel Dänzer       2021-12-09  7110  				PrefetchPixelLinesTime[k] = dml_max(v->PrefetchLinesY[i][j][k], v->PrefetchLinesC[i][j][k]) * v->HTotal[k] / v->PixelClock[k];
33c3365ec690c3 Michel Dänzer       2021-12-09  7111  				ExpectedPrefetchBWAcceleration = (v->VActivePixelBandwidth[i][j][k] + v->VActiveCursorBandwidth[i][j][k])
33c3365ec690c3 Michel Dänzer       2021-12-09  7112  						/ (v->ReadBandwidthLuma[k] + v->ReadBandwidthChroma[k]);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7113  				DynamicMetadataVMExtraLatency[k] =
33c3365ec690c3 Michel Dänzer       2021-12-09  7114  						(v->GPUVMEnable == true && v->DynamicMetadataEnable[k] == true && v->DynamicMetadataVMEnabled == true) ?
33c3365ec690c3 Michel Dänzer       2021-12-09  7115  								v->UrgLatency[i] * v->GPUVMMaxPageTableLevels * (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) : 0;
33c3365ec690c3 Michel Dänzer       2021-12-09  7116  				PrefetchTime = (v->MaximumVStartup[i][j][k] - 1) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait
33c3365ec690c3 Michel Dänzer       2021-12-09  7117  						- v->UrgLatency[i]
33c3365ec690c3 Michel Dänzer       2021-12-09  7118  								* ((v->GPUVMMaxPageTableLevels <= 2 ? v->GPUVMMaxPageTableLevels : v->GPUVMMaxPageTableLevels - 2)
33c3365ec690c3 Michel Dänzer       2021-12-09  7119  										* (v->HostVMEnable == true ? v->HostVMMaxNonCachedPageTableLevels + 1 : 1) - 1)
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7120  						- DynamicMetadataVMExtraLatency[k];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7121  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7122  				if (PrefetchTime > 0) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7123  					double ExpectedVRatioPrefetch;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7124  					ExpectedVRatioPrefetch = PrefetchPixelLinesTime[k]
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7125  							/ (PrefetchTime * PixelDCFCLKCyclesRequiredInPrefetch[k] / DCFCLKCyclesRequiredInPrefetch);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7126  					DCFCLKRequiredForPeakBandwidthPerPlane[k] = NoOfDPPState[k] * PixelDCFCLKCyclesRequiredInPrefetch[k] / PrefetchPixelLinesTime[k]
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7127  							* dml_max(1.0, ExpectedVRatioPrefetch) * dml_max(1.0, ExpectedVRatioPrefetch / 4) * ExpectedPrefetchBWAcceleration;
33c3365ec690c3 Michel Dänzer       2021-12-09  7128  					if (v->HostVMEnable == true || v->ImmediateFlipRequirement[0] == dm_immediate_flip_required) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7129  						DCFCLKRequiredForPeakBandwidthPerPlane[k] = DCFCLKRequiredForPeakBandwidthPerPlane[k]
33c3365ec690c3 Michel Dänzer       2021-12-09  7130  								+ NoOfDPPState[k] * DPTEBandwidth / NormalEfficiency / NormalEfficiency / v->ReturnBusWidth;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7131  					}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7132  				} else {
33c3365ec690c3 Michel Dänzer       2021-12-09  7133  					DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7134  				}
33c3365ec690c3 Michel Dänzer       2021-12-09  7135  				if (v->DynamicMetadataEnable[k] == true) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7136  					double TSetupPipe;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7137  					double TdmbfPipe;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7138  					double TdmsksPipe;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7139  					double TdmecPipe;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7140  					double AllowedTimeForUrgentExtraLatency;
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7141  
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7142  					CalculateVupdateAndDynamicMetadataParameters(
33c3365ec690c3 Michel Dänzer       2021-12-09  7143  							v->MaxInterDCNTileRepeaters,
33c3365ec690c3 Michel Dänzer       2021-12-09  7144  							v->RequiredDPPCLK[i][j][k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7145  							v->RequiredDISPCLK[i][j],
33c3365ec690c3 Michel Dänzer       2021-12-09  7146  							v->ProjectedDCFCLKDeepSleep[i][j],
33c3365ec690c3 Michel Dänzer       2021-12-09  7147  							v->PixelClock[k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7148  							v->HTotal[k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7149  							v->VTotal[k] - v->VActive[k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7150  							v->DynamicMetadataTransmittedBytes[k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7151  							v->DynamicMetadataLinesBeforeActiveRequired[k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7152  							v->Interlace[k],
33c3365ec690c3 Michel Dänzer       2021-12-09  7153  							v->ProgressiveToInterlaceUnitInOPP,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7154  							&TSetupPipe,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7155  							&TdmbfPipe,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7156  							&TdmecPipe,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7157  							&TdmsksPipe,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7158  							&dummy1,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7159  							&dummy2,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7160  							&dummy3);
33c3365ec690c3 Michel Dänzer       2021-12-09  7161  					AllowedTimeForUrgentExtraLatency = v->MaximumVStartup[i][j][k] * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - TSetupPipe - TdmbfPipe - TdmecPipe
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7162  							- TdmsksPipe - DynamicMetadataVMExtraLatency[k];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7163  					if (AllowedTimeForUrgentExtraLatency > 0) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7164  						DCFCLKRequiredForPeakBandwidthPerPlane[k] = dml_max(
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7165  								DCFCLKRequiredForPeakBandwidthPerPlane[k],
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7166  								ExtraLatencyCycles / AllowedTimeForUrgentExtraLatency);
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7167  					} else {
33c3365ec690c3 Michel Dänzer       2021-12-09  7168  						DCFCLKRequiredForPeakBandwidthPerPlane[k] = v->DCFCLKPerState[i];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7169  					}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7170  				}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7171  			}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7172  			DCFCLKRequiredForPeakBandwidth = 0;
33c3365ec690c3 Michel Dänzer       2021-12-09  7173  			for (k = 0; k <= v->NumberOfActivePlanes - 1; ++k) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7174  				DCFCLKRequiredForPeakBandwidth = DCFCLKRequiredForPeakBandwidth + DCFCLKRequiredForPeakBandwidthPerPlane[k];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7175  			}
33c3365ec690c3 Michel Dänzer       2021-12-09  7176  			MinimumTvmPlus2Tr0 = v->UrgLatency[i]
33c3365ec690c3 Michel Dänzer       2021-12-09  7177  					* (v->GPUVMEnable == true ?
33c3365ec690c3 Michel Dänzer       2021-12-09  7178  							(v->HostVMEnable == true ?
33c3365ec690c3 Michel Dänzer       2021-12-09  7179  									(v->GPUVMMaxPageTableLevels + 2) * (v->HostVMMaxNonCachedPageTableLevels + 1) - 1 : v->GPUVMMaxPageTableLevels + 1) :
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7180  							0);
33c3365ec690c3 Michel Dänzer       2021-12-09  7181  			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7182  				double MaximumTvmPlus2Tr0PlusTsw;
33c3365ec690c3 Michel Dänzer       2021-12-09  7183  				MaximumTvmPlus2Tr0PlusTsw = (v->MaximumVStartup[i][j][k] - 2) * v->HTotal[k] / v->PixelClock[k] - MinimumTWait - DynamicMetadataVMExtraLatency[k];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7184  				if (MaximumTvmPlus2Tr0PlusTsw <= MinimumTvmPlus2Tr0 + PrefetchPixelLinesTime[k] / 4) {
33c3365ec690c3 Michel Dänzer       2021-12-09  7185  					DCFCLKRequiredForPeakBandwidth = v->DCFCLKPerState[i];
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7186  				} else {
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7187  					DCFCLKRequiredForPeakBandwidth = dml_max3(
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7188  							DCFCLKRequiredForPeakBandwidth,
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7189  							2 * ExtraLatencyCycles / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0 - PrefetchPixelLinesTime[k] / 4),
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7190  							(2 * ExtraLatencyCycles + PixelDCFCLKCyclesRequiredInPrefetch[k]) / (MaximumTvmPlus2Tr0PlusTsw - MinimumTvmPlus2Tr0));
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7191  				}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7192  			}
33c3365ec690c3 Michel Dänzer       2021-12-09  7193  			v->DCFCLKState[i][j] = dml_min(v->DCFCLKPerState[i], 1.05 * dml_max(DCFCLKRequiredForAverageBandwidth, DCFCLKRequiredForPeakBandwidth));
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7194  		}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7195  	}
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19 @7196  }
74458c081fcfb0 Nicholas Kazlauskas 2021-05-19  7197  

:::::: The code at line 7196 was first introduced by commit
:::::: 74458c081fcfb0423877e630de2746daefdb16e4 drm/amd/display: Add DCN3.1 DML calculation support

:::::: TO: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
