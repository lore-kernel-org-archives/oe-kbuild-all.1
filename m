Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB785330B3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774562655; cv=none; b=hSHpW/RzrjlyJkyikNW1MMJw5kPLKUAkExqXZMnV7eTzQxZ713JXs+dq4Bo/ba+yuc/NsJmof74ygaDaq+kXQe0WpyqPUQqa8NQgg6b7d9HY3oV8G5i1zvFodT0rSqVk/BGUgSal7GAERWH4GraV9gvj4m7LlY7onu6zINg9XR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774562655; c=relaxed/simple;
	bh=JFvRN9EfP21Phw/zIt9EexeVRZ0JfBrdBVXmCR2e8xQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/1YDpd1du5tC0rlRt1wG3QxreUtW9RL4UMvSYBHTNI16lwTfhVNyiCdyqcxsjLWmk/MqZ9zGfwz1rA9IZJJ3aIJlKke1XbBXeC+eNObRH8SMseb6EkuNxLR+jjTse09LPQbXjzT1UxBbr5ZqHAWJcHuyzc4gxk+rwBITVXMkbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUJqdulu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUJqdulu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774562654; x=1806098654;
  h=date:from:to:cc:subject:message-id;
  bh=JFvRN9EfP21Phw/zIt9EexeVRZ0JfBrdBVXmCR2e8xQ=;
  b=BUJqdulu6HTgmn+rUVTszVcEUfOVkMAtYEpfqgyRl0XoLtZGdiKvLXCe
   CFYlUARmKFdDAJ5gyfNeHEgxxpTuAh3P3bYfsFwMfknUjqXpp3TdkToGO
   IzQF9yE1uoyYoSV54hfTQgfPcFnsiKoosmE/R/lv2/pockgBAalBXqx4R
   t/e7QMx5+0QpPYR9KlJ1Yp8kLQ3n6baUTiZoICl/SxtUSPu6b4N9dEHbh
   6Si4cEkxsgGFmGVqLtxteJXYm8PXoAOZ1Ryhz0TNBWR/OlWjms6rcmFbk
   Ilu5ITqxhqZgBP6aGwPwr1jGuQyOxJsAJDkMQalaznuS4QTRn+goAJHR6
   w==;
X-CSE-ConnectionGUID: d56UKv5FTfKAvNmj+iigIA==
X-CSE-MsgGUID: Lq0cft0ERJa8jpwrBmiIpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85940430"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="85940430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 15:04:13 -0700
X-CSE-ConnectionGUID: QNcpl4pPSNevVQP3Ce8uSg==
X-CSE-MsgGUID: u7K6x1vQRre8KoxnWwJHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="229913933"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 15:04:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5soD-000000009Pl-2CU8;
	Thu, 26 Mar 2026 22:04:09 +0000
Date: Fri, 27 Mar 2026 06:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:484:77: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202603270633.YrC1g1Jr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   bafe8e3b5a0600313c165a27f64ef35bf7e032e0
commit: 17661e606e6d643e2e39af9470064c3d50da9834 [1/1] drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
config: arm64-randconfig-r123-20260325 (https://download.01.org/0day-ci/archive/20260327/202603270633.YrC1g1Jr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270633.YrC1g1Jr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270633.YrC1g1Jr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:484:77: sparse: sparse: Using plain integer as NULL pointer

vim +484 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   457	
   458	enum dmub_status dmub_srv_calc_mem_info(struct dmub_srv *dmub,
   459					       const struct dmub_srv_memory_params *params,
   460					       struct dmub_srv_fb_info *out)
   461	{
   462		uint8_t *cpu_base;
   463		uint64_t gpu_base;
   464		uint32_t i;
   465	
   466		if (!dmub->sw_init)
   467			return DMUB_STATUS_INVALID;
   468	
   469		memset(out, 0, sizeof(*out));
   470	
   471		if (params->region_info->num_regions != DMUB_NUM_WINDOWS)
   472			return DMUB_STATUS_INVALID;
   473	
   474		cpu_base = (uint8_t *)params->cpu_fb_addr;
   475		gpu_base = params->gpu_fb_addr;
   476	
   477		for (i = 0; i < DMUB_NUM_WINDOWS; ++i) {
   478			const struct dmub_region *reg =
   479				&params->region_info->regions[i];
   480	
   481			out->fb[i].cpu_addr = cpu_base + reg->base;
   482			out->fb[i].gpu_addr = gpu_base + reg->base;
   483	
 > 484			if (i == DMUB_WINDOW_4_MAILBOX && params->cpu_inbox_addr != 0) {
   485				out->fb[i].cpu_addr = (uint8_t *)params->cpu_inbox_addr + reg->base;
   486				out->fb[i].gpu_addr = params->gpu_inbox_addr + reg->base;
   487			}
   488	
   489			out->fb[i].size = reg->top - reg->base;
   490		}
   491	
   492		out->num_fb = DMUB_NUM_WINDOWS;
   493	
   494		return DMUB_STATUS_OK;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
