Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D3322E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687973573; x=1719509573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dnWzPfExhbshNDPQIUAoulQwTqJcg7XuV88po8XEsGU=;
  b=XfUEQOu1I8BUm1FFfR26ZbJaSaDRYBIyL7rkTvQjYNWHznkAcVNkQX3+
   8QpXY34kHk4MGX7Tsend8VTtxC293QNBTIL00H7PeFY6qo459+E1dEMXI
   G3ZyO/Msm0YzaCfPHt0kkR4Ht9XZQ/gEj43lc+GTcxBLTbA/FCkSMAf63
   qRiWbFhpjo6YctmsppjF46GgZ36D1Z7emyj9GP0rJFJcAAwriFTq+IgyS
   h4V13//AD9futbaFHb7Tn2vwgn++/rKSowYYdOPFIOw6AblhkKTUmybW3
   U11ztxStW2P7x33X+SsriYlEIVb1Pj04ffpHeB8dT8jKBtrxcYUuf5z1f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="361954867"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="361954867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 10:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="752344459"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="752344459"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jun 2023 10:32:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEZ29-000DPL-0O;
	Wed, 28 Jun 2023 17:32:49 +0000
Date: Thu, 29 Jun 2023 01:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:2133
 sienna_cichlid_update_pcie_parameters() warn: unsigned 'table_member1[0]' is
 never less than zero.
Message-ID: <202306290140.jvaRB2DW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6aeadf7896bff4ca230702daba8788455e6b866e
commit: 38e4ced804796c5725e2a52ec3601951552c4a97 drm/amd/pm: conditionally disable pcie lane switching for some sienna_cichlid SKUs
date:   3 weeks ago
config: openrisc-randconfig-m041-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290140.jvaRB2DW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290140.jvaRB2DW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290140.jvaRB2DW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:2133 sienna_cichlid_update_pcie_parameters() warn: unsigned 'table_member1[0]' is never less than zero.

vim +2133 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c

  2107	
  2108	static int sienna_cichlid_update_pcie_parameters(struct smu_context *smu,
  2109						 uint32_t pcie_gen_cap,
  2110						 uint32_t pcie_width_cap)
  2111	{
  2112		struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
  2113		struct smu_11_0_pcie_table *pcie_table = &dpm_context->dpm_tables.pcie_table;
  2114		uint32_t gen_speed_override, lane_width_override;
  2115		uint8_t *table_member1, *table_member2;
  2116		uint32_t min_gen_speed, max_gen_speed;
  2117		uint32_t min_lane_width, max_lane_width;
  2118		uint32_t smu_pcie_arg;
  2119		int ret, i;
  2120	
  2121		GET_PPTABLE_MEMBER(PcieGenSpeed, &table_member1);
  2122		GET_PPTABLE_MEMBER(PcieLaneCount, &table_member2);
  2123	
  2124		sienna_cichlid_get_override_pcie_settings(smu,
  2125							  &gen_speed_override,
  2126							  &lane_width_override);
  2127	
  2128		/* PCIE gen speed override */
  2129		if (gen_speed_override != 0xff) {
  2130			min_gen_speed = MIN(pcie_gen_cap, gen_speed_override);
  2131			max_gen_speed = MIN(pcie_gen_cap, gen_speed_override);
  2132		} else {
> 2133			min_gen_speed = MAX(0, table_member1[0]);
  2134			max_gen_speed = MIN(pcie_gen_cap, table_member1[1]);
  2135			min_gen_speed = min_gen_speed > max_gen_speed ?
  2136					max_gen_speed : min_gen_speed;
  2137		}
  2138		pcie_table->pcie_gen[0] = min_gen_speed;
  2139		pcie_table->pcie_gen[1] = max_gen_speed;
  2140	
  2141		/* PCIE lane width override */
  2142		if (lane_width_override != 0xff) {
  2143			min_lane_width = MIN(pcie_width_cap, lane_width_override);
  2144			max_lane_width = MIN(pcie_width_cap, lane_width_override);
  2145		} else {
  2146			min_lane_width = MAX(1, table_member2[0]);
  2147			max_lane_width = MIN(pcie_width_cap, table_member2[1]);
  2148			min_lane_width = min_lane_width > max_lane_width ?
  2149					 max_lane_width : min_lane_width;
  2150		}
  2151		pcie_table->pcie_lane[0] = min_lane_width;
  2152		pcie_table->pcie_lane[1] = max_lane_width;
  2153	
  2154		for (i = 0; i < NUM_LINK_LEVELS; i++) {
  2155			smu_pcie_arg = (i << 16 |
  2156					pcie_table->pcie_gen[i] << 8 |
  2157					pcie_table->pcie_lane[i]);
  2158	
  2159			ret = smu_cmn_send_smc_msg_with_param(smu,
  2160					SMU_MSG_OverridePcieParameters,
  2161					smu_pcie_arg,
  2162					NULL);
  2163			if (ret)
  2164				return ret;
  2165		}
  2166	
  2167		return 0;
  2168	}
  2169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
