Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6046414AA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692286697; x=1723822697;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8RSighRheJrw15ri6u198SVs0AtkNdF2ZRjpHxN5F+Y=;
  b=F0CZjqbnpo6wQrfxHLiRDX/dVEP8ZqTCROIBWxD+eai15FrFXdMvW3Q9
   H5K8JQFp7q/rnUWkWEf0rFjUgZD89UkI70Ze60/8QYFZt+xeyuoSRO+JW
   ZEqtnaSW/ZtyhOEmu856GqReKsy6lMeKm5wBTvSpjqiVeKbb/0cU/K7+X
   eHnkKCmkqQKm9+zswalizjoXjZ+I6rDCsS63PRUCiZfz7VjacB0DZvWYh
   O5h34pf2iENhN3mfvN2FdzZrR3Pa0G5dnkeRfVbhuIPOnL9T3TEhtSG1l
   y4I7GZaYYuJ+mIFsuDqMVRqclIjnSK1cpABzK5RQ47nim1kes+YF/Bqhp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459204633"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="459204633"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764139359"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764139359"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 08:36:23 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWf2r-0001HT-2y;
	Thu, 17 Aug 2023 15:36:21 +0000
Date: Thu, 17 Aug 2023 23:36:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 1496/2351]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:599:
 warning: Function parameter or member 'dc' not described in
 'dcn32_can_support_mclk_switch_using_fw_based_vblank_stretch'
Message-ID: <202308172344.6ApYf6lT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   1250fc0938619046c0d5513aae318293a0563282
commit: d0fb274b016c0fd4a63ea671e426fcd6f4d29ef7 [1496/2351] drm/amd/display: Add FPO + VActive support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230817/202308172344.6ApYf6lT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172344.6ApYf6lT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172344.6ApYf6lT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:97: warning: Cannot understand  * ********************************************************************************************
    on line 97 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:264: warning: Cannot understand  * *******************************************************************************************
    on line 264 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:435: warning: Cannot understand  * *******************************************************************************************
    on line 435 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:475: warning: Cannot understand  * *******************************************************************************************
    on line 475 - I thought it was a doc line
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:599: warning: Function parameter or member 'dc' not described in 'dcn32_can_support_mclk_switch_using_fw_based_vblank_stretch'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:599: warning: Function parameter or member 'context' not described in 'dcn32_can_support_mclk_switch_using_fw_based_vblank_stretch'
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2787: warning: Cannot understand  * *******************************************************************************************
    on line 2787 - I thought it was a doc line
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2832: warning: Function parameter or member 'dc' not described in 'dcn32_assign_fpo_vactive_candidate'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2832: warning: Function parameter or member 'context' not described in 'dcn32_assign_fpo_vactive_candidate'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2832: warning: Function parameter or member 'fpo_candidate_stream' not described in 'dcn32_assign_fpo_vactive_candidate'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2861: warning: Function parameter or member 'dc' not described in 'dcn32_find_vactive_pipe'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2861: warning: Function parameter or member 'context' not described in 'dcn32_find_vactive_pipe'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:2861: warning: Function parameter or member 'vactive_margin_req_us' not described in 'dcn32_find_vactive_pipe'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +599 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c

   589	
   590	/**
   591	 * dcn32_can_support_mclk_switch_using_fw_based_vblank_stretch - Determines if config can support FPO
   592	 *
   593	 * @param [in]: dc - current dc state
   594	 * @param [in]: context - new dc state
   595	 *
   596	 * Return: Pointer to FPO stream candidate if config can support FPO, otherwise NULL
   597	 */
   598	struct dc_stream_state *dcn32_can_support_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc, const struct dc_state *context)
 > 599	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
