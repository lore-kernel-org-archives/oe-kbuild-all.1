Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487C20321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpK4PskI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697065254; x=1728601254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=alNFoPoaB7B5h+y0+4ZARmt2+Yb/cxmDaPEwRLBTh94=;
  b=KpK4PskILPHcIXNzXx40lPYkWn5cq4YPkYuAHovz7pEZmTenCbUlYiKn
   wp903VvS8avEPQYCJuD4QQihEK8Vw0SRCym92x7MGijhtsUJV6XgkivPV
   Fh/IcZokFIePkob5xRb/n8W1JL39pv3YrcePLnC6b4xmguhn38bgmf39j
   gWzfIb4GP0Kp+MDwbgIoTNPRcalLgVd9kRGolVxRInHU4m04wR2f21G/g
   z8biovBDXj9Ts8lkWiRdiEgglyl4oCRIRQIJ2/9/xNorzM43ejgclPXrC
   cl5YHiRDrgUl03wX/ZlapdMVUi+6wu5ZcHMLT1yurCEyNENudPY7A7sZp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451279070"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="451279070"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="703916667"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="703916667"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Oct 2023 16:00:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqiC8-0002p7-2f;
	Wed, 11 Oct 2023 23:00:48 +0000
Date: Thu, 12 Oct 2023 07:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Roman Li <roman.li@amd.com>
Subject: [agd5f:drm-next 530/569]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:5421:55:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202310120705.7bxMj48z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   219223eca4d8b39486107c62a52c9667016aa3b9
commit: 7966f319c66d9468623c6a6a017ecbc0dd79be75 [530/569] drm/amd/display: Introduce DML2
config: x86_64-randconfig-123-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120705.7bxMj48z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120705.7bxMj48z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120705.7bxMj48z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:5421:55: sparse: sparse: Using plain integer as NULL pointer

vim +5421 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c

  5335	
  5336	static void CalculateOutputLink(
  5337			dml_float_t PHYCLKPerState,
  5338			dml_float_t PHYCLKD18PerState,
  5339			dml_float_t PHYCLKD32PerState,
  5340			dml_float_t Downspreading,
  5341			dml_bool_t IsMainSurfaceUsingTheIndicatedTiming,
  5342			enum dml_output_encoder_class Output,
  5343			enum dml_output_format_class OutputFormat,
  5344			dml_uint_t HTotal,
  5345			dml_uint_t HActive,
  5346			dml_float_t PixelClockBackEnd,
  5347			dml_float_t ForcedOutputLinkBPP,
  5348			dml_uint_t DSCInputBitPerComponent,
  5349			dml_uint_t NumberOfDSCSlices,
  5350			dml_float_t AudioSampleRate,
  5351			dml_uint_t AudioSampleLayout,
  5352			enum dml_odm_mode ODMModeNoDSC,
  5353			enum dml_odm_mode ODMModeDSC,
  5354			enum dml_dsc_enable DSCEnable,
  5355			dml_uint_t OutputLinkDPLanes,
  5356			enum dml_output_link_dp_rate OutputLinkDPRate,
  5357	
  5358			// Output
  5359			dml_bool_t *RequiresDSC,
  5360			dml_bool_t *RequiresFEC,
  5361			dml_float_t *OutBpp,
  5362			enum dml_output_type_and_rate__type *OutputType,
  5363			enum dml_output_type_and_rate__rate *OutputRate,
  5364			dml_uint_t *RequiredSlots)
  5365	{
  5366		dml_bool_t LinkDSCEnable;
  5367		dml_uint_t dummy;
  5368		*RequiresDSC = false;
  5369		*RequiresFEC = false;
  5370		*OutBpp = 0;
  5371	
  5372		*OutputType = dml_output_type_unknown;
  5373		*OutputRate = dml_output_rate_unknown;
  5374	
  5375		if (IsMainSurfaceUsingTheIndicatedTiming) {
  5376			if (Output == dml_hdmi) {
  5377				*RequiresDSC = false;
  5378				*RequiresFEC = false;
  5379				*OutBpp = TruncToValidBPP(dml_min(600, PHYCLKPerState) * 10, 3, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, false, Output,
  5380										OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, &dummy);
  5381				//OutputTypeAndRate = "HDMI";
  5382				*OutputType = dml_output_type_hdmi;
  5383	
  5384			} else if (Output == dml_dp || Output == dml_dp2p0 || Output == dml_edp) {
  5385				if (DSCEnable == dml_dsc_enable) {
  5386					*RequiresDSC = true;
  5387					LinkDSCEnable = true;
  5388					if (Output == dml_dp || Output == dml_dp2p0) {
  5389						*RequiresFEC = true;
  5390					} else {
  5391						*RequiresFEC = false;
  5392					}
  5393				} else {
  5394					*RequiresDSC = false;
  5395					LinkDSCEnable = false;
  5396					if (Output == dml_dp2p0) {
  5397						*RequiresFEC = true;
  5398					} else {
  5399						*RequiresFEC = false;
  5400					}
  5401				}
  5402				if (Output == dml_dp2p0) {
  5403					*OutBpp = 0;
  5404					if ((OutputLinkDPRate == dml_dp_rate_na || OutputLinkDPRate == dml_dp_rate_uhbr10) && PHYCLKD32PerState >= 10000 / 32) {
  5405						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 10000, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5406													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5407						if (*OutBpp == 0 && PHYCLKD32PerState < 13500 / 32 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
  5408							*RequiresDSC = true;
  5409							LinkDSCEnable = true;
  5410							*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 10000, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5411														OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5412						}
  5413						//OutputTypeAndRate = Output & " UHBR10";
  5414						*OutputType = dml_output_type_dp2p0;
  5415						*OutputRate = dml_output_rate_dp_rate_uhbr10;
  5416					}
  5417					if ((OutputLinkDPRate == dml_dp_rate_na || OutputLinkDPRate == dml_dp_rate_uhbr13p5) && *OutBpp == 0 && PHYCLKD32PerState >= 13500 / 32) {
  5418						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 13500, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5419													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5420	
> 5421						if (OutBpp == 0 && PHYCLKD32PerState < 20000 / 32 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
  5422							*RequiresDSC = true;
  5423							LinkDSCEnable = true;
  5424							*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 13500, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5425													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5426						}
  5427						//OutputTypeAndRate = Output & " UHBR13p5";
  5428						*OutputType = dml_output_type_dp2p0;
  5429						*OutputRate = dml_output_rate_dp_rate_uhbr13p5;
  5430					}
  5431					if ((OutputLinkDPRate == dml_dp_rate_na || OutputLinkDPRate == dml_dp_rate_uhbr20) && *OutBpp == 0 && PHYCLKD32PerState >= 20000 / 32) {
  5432						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 20000, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5433												OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5434						if (*OutBpp == 0 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
  5435							*RequiresDSC = true;
  5436							LinkDSCEnable = true;
  5437							*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 20000, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5438													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5439						}
  5440						//OutputTypeAndRate = Output & " UHBR20";
  5441						*OutputType = dml_output_type_dp2p0;
  5442						*OutputRate = dml_output_rate_dp_rate_uhbr20;
  5443					}
  5444				} else { // output is dp or edp
  5445					*OutBpp = 0;
  5446					if ((OutputLinkDPRate == dml_dp_rate_na || OutputLinkDPRate == dml_dp_rate_hbr) && PHYCLKPerState >= 270) {
  5447						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 2700, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5448												OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5449						if (*OutBpp == 0 && PHYCLKPerState < 540 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
  5450							*RequiresDSC = true;
  5451							LinkDSCEnable = true;
  5452							if (Output == dml_dp) {
  5453								*RequiresFEC = true;
  5454							}
  5455							*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 2700, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5456													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5457						}
  5458						//OutputTypeAndRate = Output & " HBR";
  5459						*OutputType = (Output == dml_dp) ? dml_output_type_dp : dml_output_type_edp;
  5460						*OutputRate = dml_output_rate_dp_rate_hbr;
  5461					}
  5462					if ((OutputLinkDPRate == dml_dp_rate_na || OutputLinkDPRate == dml_dp_rate_hbr2) && *OutBpp == 0 && PHYCLKPerState >= 540) {
  5463						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 5400, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5464												OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5465	
  5466						if (*OutBpp == 0 && PHYCLKPerState < 810 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
  5467							*RequiresDSC = true;
  5468							LinkDSCEnable = true;
  5469							if (Output == dml_dp) {
  5470								*RequiresFEC = true;
  5471							}
  5472							*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 5400, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5473													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5474						}
  5475						//OutputTypeAndRate = Output & " HBR2";
  5476						*OutputType = (Output == dml_dp) ? dml_output_type_dp : dml_output_type_edp;
  5477						*OutputRate = dml_output_rate_dp_rate_hbr2;
  5478					}
  5479					if ((OutputLinkDPRate == dml_dp_rate_na || OutputLinkDPRate == dml_dp_rate_hbr3) && *OutBpp == 0 && PHYCLKPerState >= 810) { // VBA_ERROR, vba code doesn't have hbr3 check
  5480						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 8100, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5481												OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5482	
  5483						if (*OutBpp == 0 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
  5484							*RequiresDSC = true;
  5485							LinkDSCEnable = true;
  5486							if (Output == dml_dp) {
  5487								*RequiresFEC = true;
  5488							}
  5489							*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 8100, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
  5490													OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
  5491						}
  5492						//OutputTypeAndRate = Output & " HBR3";
  5493						*OutputType = (Output == dml_dp) ? dml_output_type_dp : dml_output_type_edp;
  5494						*OutputRate = dml_output_rate_dp_rate_hbr3;
  5495					}
  5496				}
  5497			}
  5498		}
  5499	}
  5500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
