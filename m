Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89959224D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 04:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767067346; cv=none; b=aooXnOjxAg1HZQt51s3cz6IAZdWAGeoJ2w+o7s0W4kZn02VRZjvSorl1n+SO6ZLq0qaTnPBdySQPLPiVKZIn2qwMwnWKFKXseKKVFh1xDBxwR8QwlExxIFs3/5NJlwnNWpuMr8RDi8i5/nNeMHfqmDV6Fgatmmr5IFcShSlbERM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767067346; c=relaxed/simple;
	bh=U4rvw1hEjsQTX7OSk0dtkMJwB2JNq7uqCUhQ/xlIu3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ItSF3XD6JVbTu1Bu0SRIXZbQzRlCydOJTQviwS0lNzlo0JvdLAoYn9hlzXfJh8Vs4IQ/4ou3iBQBsHnb/OQh3xcj3tkgNAFVLSJ4CZzQ4HrTfstAMqfmOvrKTGxj4dbi0hS7/2oYly7iwPC9hiLTunjYBC4PsJmn+PPse3qZJmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKB0OPiZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKB0OPiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767067345; x=1798603345;
  h=date:from:to:cc:subject:message-id;
  bh=U4rvw1hEjsQTX7OSk0dtkMJwB2JNq7uqCUhQ/xlIu3g=;
  b=eKB0OPiZ1auvo1FCG3uWTlYratGEQ6fg0ku9bsxDUwmCWp0dNEpdcz93
   /qu77v3m+Sa2MjKPDJP+zFgh+NbIpZCxUEbk/aKUkQFQ4JeeVF4EuELSm
   4F0jyc2LJP9IFEfc3NIU5lCMk8jvmcsiiKWlPbvh+3VPIJvB9OmXa6bKF
   G6AN+xh9VtzmmfkLp7ZjezDL1rYDKiW2XfcrhdDlXdcy58nQneQBuhkNu
   vrFhzQVJnV8qKjWwEcJkK1ftm/vj6uIkiMEZhiqPk6lwwx8xo3466fb97
   9B2Vz1WQQ9sE1u6j/ANqQXr0uojbhgulV9F6GtajStRJ/KV6yv8pbve3V
   w==;
X-CSE-ConnectionGUID: 9bZ8F3QSQH6HnjBINhdyDw==
X-CSE-MsgGUID: vX7BOmyKR7mOljHza2z7CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67861093"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="67861093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 20:02:24 -0800
X-CSE-ConnectionGUID: cguE+sTsQR+jCLnaC7XagQ==
X-CSE-MsgGUID: YYeP82TiTn+67mTp/Afzbw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Dec 2025 20:02:22 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaQw8-0000000003G-1QqJ;
	Tue, 30 Dec 2025 04:02:20 +0000
Date: Tue, 30 Dec 2025 12:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 0/15]
 drivers/gpu/drm/phytium/phytium_crtc.c:189:1: sparse: sparse: symbol
 'phytium_crtc_atomic_destroy_state' was not declared. Should it be static?
Message-ID: <202512301151.0nHQqquE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi xuyan,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f148785f0bb856bba8ceca2b699a2f102f22174a
commit: 3b4a5906fa714bdc9a15fc04374942888737eb4c [0/15] drm/phytium: Fix Phytium DRM build fail
config: x86_64-randconfig-123-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301151.0nHQqquE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301151.0nHQqquE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301151.0nHQqquE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/phytium/phytium_platform.c:35:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_platform.c:35:38: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_platform.c:35:38: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/phytium/phytium_platform.c:58:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:58:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_platform.c:58:21: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_platform.c:22:5: sparse: sparse: symbol 'phytium_platform_carveout_mem_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_platform.c:68:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_platform.c:68:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_platform.c:68:29: sparse:     got void *pool_virt_addr
>> drivers/gpu/drm/phytium/phytium_platform.c:63:6: sparse: sparse: symbol 'phytium_platform_carveout_mem_fini' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_platform.c:372:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/phytium/phytium_platform.c:380:10: sparse:   also defined here
--
>> drivers/gpu/drm/phytium/pe220x_dp.c:465:6: sparse: sparse: symbol 'pe220x_dp_hw_spread_is_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/pe220x_dp.c:470:5: sparse: sparse: symbol 'pe220x_dp_hw_reset' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/pe220x_dp.c:485:9: sparse: sparse: symbol 'pe220x_dp_hw_get_source_lane_count' was not declared. Should it be static?
--
>> drivers/gpu/drm/phytium/phytium_pci.c:20:5: sparse: sparse: symbol 'dc_msi_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:24:6: sparse: sparse: symbol 'phytium_pci_vram_hw_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:57:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_pci.c:57:46: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:57:46: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/phytium/phytium_pci.c:61:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *pool_virt_addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/phytium/phytium_pci.c:61:46: sparse:     expected void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:61:46: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/phytium/phytium_pci.c:88:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:88:38: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_pci.c:88:38: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:49:5: sparse: sparse: symbol 'phytium_pci_vram_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:98:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *pool_virt_addr @@
   drivers/gpu/drm/phytium/phytium_pci.c:98:46: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/phytium/phytium_pci.c:98:46: sparse:     got void *pool_virt_addr
   drivers/gpu/drm/phytium/phytium_pci.c:93:6: sparse: sparse: symbol 'phytium_pci_vram_fini' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_pci.c:115:5: sparse: sparse: symbol 'phytium_pci_dma_init' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_pci.c:163:6: sparse: sparse: symbol 'phytium_pci_dma_fini' was not declared. Should it be static?
--
   drivers/gpu/drm/phytium/phytium_plane.c:30:6: sparse: sparse: symbol 'phytium_plane_destroy' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:72:1: sparse: sparse: symbol 'phytium_plane_atomic_set_property' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:81:24: sparse: sparse: symbol 'phytium_plane_atomic_duplicate_state' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_plane.c:103:1: sparse: sparse: symbol 'phytium_plane_atomic_destroy_state' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_plane.c:140:30: sparse: sparse: symbol 'phytium_plane_funcs' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_plane.c:543:37: sparse: sparse: symbol 'phytium_plane_helper_funcs' was not declared. Should it be static?
--
   drivers/gpu/drm/phytium/phytium_crtc.c:173:23: sparse: sparse: symbol 'phytium_crtc_atomic_duplicate_state' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_crtc.c:189:1: sparse: sparse: symbol 'phytium_crtc_atomic_destroy_state' was not declared. Should it be static?
--
   drivers/gpu/drm/phytium/phytium_dp.c:506:6: sparse: sparse: symbol 'phytium_dp_coding_8b10b_need_enable' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:523:6: sparse: sparse: symbol 'phytium_dp_scrambled_need_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:656:6: sparse: sparse: symbol 'phytium_dp_hw_enable_audio' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:825:6: sparse: sparse: symbol 'phytium_dp_hw_disable_video' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:836:6: sparse: sparse: symbol 'phytium_dp_hw_video_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:847:6: sparse: sparse: symbol 'phytium_dp_hw_enable_video' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:859:6: sparse: sparse: symbol 'phytium_dp_hw_config_video' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:951:6: sparse: sparse: symbol 'phytium_dp_hw_disable_output' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:963:6: sparse: sparse: symbol 'phytium_dp_hw_enable_output' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:975:6: sparse: sparse: symbol 'phytium_dp_hw_enable_input_source' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:986:6: sparse: sparse: symbol 'phytium_dp_hw_disable_input_source' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:996:6: sparse: sparse: symbol 'phytium_dp_hw_output_is_enable' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1033:6: sparse: sparse: symbol 'phytium_dp_hw_hpd_irq_setup' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1048:5: sparse: sparse: symbol 'phytium_dp_hw_init' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1226:6: sparse: sparse: symbol 'phytium_dp_dpcd_sink_dpms' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:1451:5: sparse: sparse: symbol 'phytium_dp_get_link_train_fallback_values' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1500:5: sparse: sparse: symbol 'phytium_dp_start_link_train' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1815:6: sparse: sparse: symbol 'phytium_dp_hpd_poll_handler' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:1962:6: sparse: sparse: symbol 'phytium_dp_fast_link_train' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2153:6: sparse: sparse: symbol 'phytium_dp_adjust_link_train_parameter' was not declared. Should it be static?
   drivers/gpu/drm/phytium/phytium_dp.c:2213:1: sparse: sparse: symbol 'phytium_encoder_mode_valid' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2269:6: sparse: sparse: symbol 'phytium_dp_encoder_destroy' was not declared. Should it be static?
>> drivers/gpu/drm/phytium/phytium_dp.c:2482:5: sparse: sparse: symbol 'phytium_get_encoder_crtc_mask' was not declared. Should it be static?

vim +/phytium_crtc_atomic_destroy_state +189 drivers/gpu/drm/phytium/phytium_crtc.c

b80df10f845813 lishuo 2024-01-31  187  
b80df10f845813 lishuo 2024-01-31  188  void
b80df10f845813 lishuo 2024-01-31 @189  phytium_crtc_atomic_destroy_state(struct drm_crtc *crtc,
b80df10f845813 lishuo 2024-01-31  190  					       struct drm_crtc_state *state)
b80df10f845813 lishuo 2024-01-31  191  {
b80df10f845813 lishuo 2024-01-31  192  	struct phytium_crtc_state *phytium_crtc_state =
b80df10f845813 lishuo 2024-01-31  193  					to_phytium_crtc_state(state);
b80df10f845813 lishuo 2024-01-31  194  
b80df10f845813 lishuo 2024-01-31  195  	phytium_crtc_state = to_phytium_crtc_state(state);
b80df10f845813 lishuo 2024-01-31  196  	__drm_atomic_helper_crtc_destroy_state(state);
b80df10f845813 lishuo 2024-01-31  197  	kfree(phytium_crtc_state);
b80df10f845813 lishuo 2024-01-31  198  }
b80df10f845813 lishuo 2024-01-31  199  

:::::: The code at line 189 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
