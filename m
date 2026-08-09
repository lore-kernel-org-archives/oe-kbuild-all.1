Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD054199920
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 02:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786241640; cv=none; b=YYoBl9QsUDkn8Dtu7UUSHXr1pE4zHXxteRSMu0Opzy6qiqANxJ5Tt07YIVzJEyVr2L1zdMCblbbsHKj7+x3kUO531RVxraH0B1w/Q9CRspPQdw+jjmhOKWcWgO/qZrDcPHpjmk/kJZ/VHh6HaWbjFPsStD9/ZgBnE7/8PQtC21A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786241640; c=relaxed/simple;
	bh=bPYpD6Ozcb2pJqJcgziwi1FtPQjyFwEWiqH/A5NFkv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MZHYCtWfaxc9cnRwhYe8ZfCn9K5MVZt+8Qmn+NqzfR9dwMjmmQapGt4Ru85bx1mJ1qT/KOK4sxarRlKIOCCWodxQMX4K1hUT88xl37fgOuCu6t/V/2dMAwAlur02N7aeb3mX3M0iaCcT3JOl2w1yPeWm+peZ3ajIAld77DIoPTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBu03RQV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBu03RQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786241638; x=1817777638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPYpD6Ozcb2pJqJcgziwi1FtPQjyFwEWiqH/A5NFkv4=;
  b=KBu03RQV7fnsP0rvfk0TScwV4ZZ9bC/6MPEchxx/WQoSIXSCkPerfYw+
   ONyHXUZcrem9Pk8ilrMkeNKUZcbbG9tpnr8nNXOqk+nKWq+W6iwE/z09b
   UVIO6kHdP33DsFbSfcPZfNgOFWFesgtYASNcVS24UQoILsltom6OV9FeG
   l6VMG/DtMjxw/12cw54XhNWB5pCod57BI9NDm8LDgsN8Zb/bEpqBNS3nQ
   dAobc08z70FS5erjf4dyNdmS4tTiGih05j6lLWOrgDt/LPTjLiHOhjiHr
   N8JUUTHZGpQbj8Tdbr6zfJ9pPEbZufOlhK+32kHg6PgwRj+kWGJRImznJ
   Q==;
X-CSE-ConnectionGUID: HPsC27RzSkS0JhFk2J4qrw==
X-CSE-MsgGUID: 5iTHaNSeRhalBJ2Lb3lCnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86653421"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="86653421"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 19:13:57 -0700
X-CSE-ConnectionGUID: F46i4HVORfGgak9rah5Krg==
X-CSE-MsgGUID: 65iSHlZHQSqWFVT3QdJFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="262763875"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2026 19:13:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wst2v-000000005EM-0GB7;
	Sun, 09 Aug 2026 02:13:53 +0000
Date: Sun, 09 Aug 2026 04:13:49 +0200
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next-7.3 244/308]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml2=5F0/dml21/inc/?=
 =?us-ascii?Q?bounding=5Fboxes/utm=5Fqos=5Fmodel=5Fdchub=5Fv2.h:71:undef?=
 =?us-ascii?Q?ined?= reference to `__udivdi3'
Message-ID: <202608090429.Kk1nckMl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: 992694ad28584188725751f695a85661e8e3797a [244/308] drm/amd/display: Enable DCN6 sources compilation
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260809/202608090429.Kk1nckMl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608090429.Kk1nckMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608090429.Kk1nckMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o: in function `dchub_v2_get_sop_total_available_bandwidth_KBps':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:71:(.text+0x61): undefined reference to `__udivdi3'
>> ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:79:(.text+0x9d): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:66:(.text+0xc0): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:76:(.text+0xe2): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o: in function `dchub_v2_is_qos_bandwidth_supported_by_sop':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:115:(.text+0x16d): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o:drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h:117: more undefined references to `__udivdi3' follow


vim +71 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/inc/bounding_boxes/utm_qos_model_dchub_v2.h

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
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22  66  	dram_available_bandwidth_KBps_nominal = (uint64_t) sop->uclk_khz
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
7f7d7ea1fa5151 Aurabindo Pillai 2026-07-22 @79  	fabric_available_bandwidth_KBps_urgent = (uint64_t) sop->fclk_khz
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

:::::: The code at line 71 was first introduced by commit
:::::: 7f7d7ea1fa515157162d0d21245925551ed103a1 drm/amd/display: Add new sources for DCN6

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
