Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4337C916
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735084; cv=none; b=sFRRb2jdG44I13I7uihcZIKT2/gsJFlhY8D9hoRi1Nk/RrsmLxXycXbsnTRi1kG0KRD3Bhyby6U1BtuuSGCPpkL6bRkmHec7DRY4fVdUqBlQj3boa8Yn8K2rWRUoWFqhmV52t0AQOvs34lYNMn3jOQqCRsaEcEsc+xR3P1Bs988=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735084; c=relaxed/simple;
	bh=agafZVusHVS5rpHbTZHUxx3md1lHBg2Xv67HTkPAp5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pYJK1Nt3JJtWU71Gg9tot81W+1EqQ1abGtZfOD8QTJ8i0oaVslOrqW/lb7PFxxhpVbnsXXLvot+Aapg/QENijZN7Tt2QK3uUhDtjXuxTbVB1HMzxYjRxOstujobejw82vYLgfnnPSI7jouo2DzCzcs5JQft1TZEj5f16ZYfv/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJGokcMM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJGokcMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786735078; x=1818271078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agafZVusHVS5rpHbTZHUxx3md1lHBg2Xv67HTkPAp5E=;
  b=kJGokcMMNdQGG5F5bfkqzpii6+D/nTMarNnWwDIOm6+X/9Z35Q+MD4EH
   8AzTh1ByMf4LIUWOmAStP4n9O9aGGiUeqyPIm0aU1IEph+QGkB82yGRJf
   bRtgG7rNGa9GCVtYhAGOs4v3wo/cegNQVdQIW3nKXWyfGXJDuqkKudyWG
   NQYLrQSyOFYA/MVnsvVyGr5vo7EV218KYxlgKu6zWmIvVquSEj52vEaDe
   mwRaWgtGHmwBs8cz8j/1N8QI5I90UFIitsWfAdvv1Uur4VKHOjgNaks7K
   KfG6Pu/P9mFvIgyrlhVM0ce76pzrwyu219etUjl3ramE6ClohDypAso5U
   g==;
X-CSE-ConnectionGUID: NyEDmZusTZuOFDHZRdddJQ==
X-CSE-MsgGUID: QO3L6HrGQzy6KQM5i3CFyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87241397"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87241397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 12:17:57 -0700
X-CSE-ConnectionGUID: WiibScwMTzuEiuXikcKYcA==
X-CSE-MsgGUID: P1cRfUfbSoyJ9WgSeLyp8A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2026 12:17:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuxPc-00000000Zuw-2STU;
	Fri, 14 Aug 2026 19:17:52 +0000
Date: Sat, 15 Aug 2026 03:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [linux-next:master 11999/15183]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml2=5F0/dml21/inc/?=
 =?us-ascii?Q?bounding=5Fboxes/utm=5Fqos=5Fmodel=5Fdchub=5Fv2.h:66:undef?=
 =?us-ascii?Q?ined?= reference to `__udivdi3'
Message-ID: <202608150342.p7BAOsOA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2697ef8943c9985c14708a6429e21812693857b2
commit: 992694ad28584188725751f695a85661e8e3797a [11999/15183] drm/amd/display: Enable DCN6 sources compilation
config: i386-randconfig-054-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150342.p7BAOsOA-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150342.p7BAOsOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150342.p7BAOsOA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o: in function `dchub_v2_get_sop_total_available_bandwidth_KBps':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:66:(.text+0x6e): undefined reference to `__udivdi3'
>> ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:71:(.text+0x97): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:76:(.text+0xd0): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:79:(.text+0xf4): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o: in function `dchub_v2_is_qos_bandwidth_supported_by_sop':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:115:(.text+0x18a): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o:drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:117: more undefined references to `__udivdi3' follow


vim +66 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h

7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  53  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  54  static inline void dchub_v2_get_sop_total_available_bandwidth_KBps(
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  55  		const struct utm_qos_model *model,
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  56  		struct utm_qos_model_dchub_memory_path_bandwidth_v2 *total_available_bandwidth,
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  57  		uint8_t sop_index)
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  58  {
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  59  	const struct utm_soc_operating_point *sop = &model->sops[sop_index];
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  60  	const struct utm_qos_model_socbb *socbb = &model->socbb;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  61  	uint64_t dram_available_bandwidth_KBps_nominal;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  62  	uint64_t fabric_available_bandwidth_KBps_nominal;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  63  	uint64_t dram_available_bandwidth_KBps_urgent;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  64  	uint64_t fabric_available_bandwidth_KBps_urgent;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  65  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22 @66  	dram_available_bandwidth_KBps_nominal = (uint64_t) sop->uclk_khz
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  67  			* socbb->dram_channel_count
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  68  			* socbb->dram_channel_width_bytes
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  69  			* socbb->dram_transactions_per_clock
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  70  			* socbb->dram_derate_percent_nominal / 100;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22 @71  	dram_available_bandwidth_KBps_urgent = (uint64_t) sop->uclk_khz
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  72  			* socbb->dram_channel_count
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  73  			* socbb->dram_channel_width_bytes
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  74  			* socbb->dram_transactions_per_clock
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  75  			* socbb->dram_derate_percent_urgent / 100;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  76  	fabric_available_bandwidth_KBps_nominal = (uint64_t) sop->fclk_khz
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  77  			* socbb->fabric_datapath_to_dcn_data_return_bytes
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  78  			* socbb->fabric_derate_percent_nominal / 100;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  79  	fabric_available_bandwidth_KBps_urgent = (uint64_t) sop->fclk_khz
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  80  			* socbb->fabric_datapath_to_dcn_data_return_bytes
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  81  			* socbb->fabric_derate_percent_urgent / 100;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  82  
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  83  	total_available_bandwidth->nominal_bandwidth_KBps =
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  84  			dram_available_bandwidth_KBps_nominal < fabric_available_bandwidth_KBps_nominal ?
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  85  			(uint32_t) dram_available_bandwidth_KBps_nominal :
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  86  			(uint32_t) fabric_available_bandwidth_KBps_nominal;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  87  	total_available_bandwidth->urgent_bandwidth_KBps =
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  88  			dram_available_bandwidth_KBps_urgent < fabric_available_bandwidth_KBps_urgent ?
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  89  			(uint32_t) dram_available_bandwidth_KBps_urgent :
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  90  			(uint32_t) fabric_available_bandwidth_KBps_urgent;
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  91  }
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  92  

:::::: The code at line 66 was first introduced by commit
:::::: 7f7d7ea1fa515157162d0d21245925551ed103a1 drm/amd/display: Add new sources for DCN6

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
