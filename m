Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4D146A69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727447730; cv=none; b=gw2JgRM+LAx++7MQeY+GZ1SLfpweMyIfN6LBndxn9wKI1AXaaLIAzxP/j55a/Ko21HT669I7mtkDNIwy+5Y63to5cArehauhloeCeirjyoKGDZYh9nty80G/JGqF3fgh0lA3y6D6iIrPHRT42vpbQ6mFAF2DBGuUb598yObJGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727447730; c=relaxed/simple;
	bh=jFmTs5mHPiuWeAfRn2QKmjnFMyC2quKWix9bUgDYiwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGmOF+kFXicIZ8t9+VaWTMCcugCvlJigUg0i5V5o6TDzQHvU63B6pNit8SffAnMT7JxWj+gXqHsppf54E1zz44W4YrcSkuoGUphedvr9dx1bfOPU/1t8AeonuPElmb/XworGxNgnw28J9jq6KWPHjEkla+8zWStZK39XVqt+uD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gyl4V0I8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gyl4V0I8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727447728; x=1758983728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jFmTs5mHPiuWeAfRn2QKmjnFMyC2quKWix9bUgDYiwg=;
  b=Gyl4V0I8qgGqS29IR7HS+2gIrkUEc0sEgqhxE/Lpx6uZjo2cY6xSXXVX
   +BqBsLx1eqnziJmgOYntQCUciFsvF02Dr5lJ38T6n9R8G9psAqNxEn8ex
   t2JxVlCDCioVBU4pQKhjhae8zJwUZxRLuQLIbspuusji+qQKHgD3BkSX8
   Z6jtXkAuihPVSKih8uVCNF2OMag354hbNvV5T3yQK15mzfM5Ss4q7w+BS
   Bbr5jQhZfRTl+gkDxQkeybOTg3kpjMRx2WhP4pb3+2r9LwKIsPX6q3yMq
   337FDfPCeC5IY5fGJPjngmRuzMqk6/OmD/zJ0x935yQS1u3IOP/TD9+XC
   A==;
X-CSE-ConnectionGUID: Bl1LaD+SSuqfvOHT9I/ciA==
X-CSE-MsgGUID: Qk3zdLhLQBGyyFfAziimbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26102264"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26102264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:35:27 -0700
X-CSE-ConnectionGUID: EZryOY5QTSGz+mx74OkrUA==
X-CSE-MsgGUID: fLjNw9MvSpK25SJUiRWknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72712094"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 07:35:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suC43-000MEv-2K;
	Fri, 27 Sep 2024 14:35:23 +0000
Date: Fri, 27 Sep 2024 22:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 240/1001]
 drivers/gpu/drm/xlnx/xlnx_mixer.c:2218:9: warning: 'strncpy' specified bound
 4 equals destination size
Message-ID: <202409272220.80Xmq3zM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 657334ac2c6a9bac0c609ee6b3b233e10eeda587 [240/1001] drm: xlnx: mixer: Initial video mixer driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409272220.80Xmq3zM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272220.80Xmq3zM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272220.80Xmq3zM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_mixer.c: In function 'xlnx_mix_parse_dt_bg_video_fmt':
>> drivers/gpu/drm/xlnx/xlnx_mixer.c:2218:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
    2218 |         strncpy((char *)&layer->hw_config.vid_fmt, vformat, 4);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/xlnx_mixer.c: In function 'xlnx_mix_of_init_layer':
   drivers/gpu/drm/xlnx/xlnx_mixer.c:2495:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
    2495 |         strncpy((char *)&layer->hw_config.vid_fmt, vformat, 4);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +2218 drivers/gpu/drm/xlnx/xlnx_mixer.c

  2196	
  2197	static int xlnx_mix_parse_dt_bg_video_fmt(struct device_node *node,
  2198						  struct xlnx_mix_hw *mixer_hw)
  2199	{
  2200		struct device_node *layer_node;
  2201		struct xlnx_mix_layer_data *layer;
  2202		const char *vformat;
  2203	
  2204		layer_node = of_get_child_by_name(node, "layer_0");
  2205		layer = &mixer_hw->layer_data[XVMIX_MASTER_LAYER_IDX];
  2206	
  2207		/* Set default values */
  2208		layer->hw_config.can_alpha = false;
  2209		layer->hw_config.can_scale = false;
  2210		layer->hw_config.min_width = XVMIX_LAYER_WIDTH_MIN;
  2211		layer->hw_config.min_height = XVMIX_LAYER_HEIGHT_MIN;
  2212	
  2213		if (of_property_read_string(layer_node, "xlnx,vformat",
  2214					    &vformat)) {
  2215			DRM_ERROR("No xlnx,vformat value for layer 0 in dts\n");
  2216			return -EINVAL;
  2217		}
> 2218		strncpy((char *)&layer->hw_config.vid_fmt, vformat, 4);
  2219		layer->hw_config.is_streaming =
  2220			of_property_read_bool(layer_node, "xlnx,layer-streaming");
  2221		if (of_property_read_u32(node, "xlnx,bpc", &mixer_hw->bg_layer_bpc)) {
  2222			DRM_ERROR("Failed to get bits per component (bpc) prop\n");
  2223			return -EINVAL;
  2224		}
  2225		if (of_property_read_u32(layer_node, "xlnx,layer-max-width",
  2226					 &layer->hw_config.max_width)) {
  2227			DRM_ERROR("Failed to get screen width prop\n");
  2228			return -EINVAL;
  2229		} else if (layer->hw_config.max_width > XVMIX_DISP_MAX_WIDTH ||
  2230			   layer->hw_config.max_width < XVMIX_DISP_MIN_WIDTH) {
  2231			DRM_ERROR("Invalid width in dt");
  2232			return -EINVAL;
  2233		}
  2234	
  2235		mixer_hw->max_layer_width = layer->hw_config.max_width;
  2236		if (of_property_read_u32(layer_node, "xlnx,layer-max-height",
  2237					 &layer->hw_config.max_height)) {
  2238			DRM_ERROR("Failed to get screen height prop\n");
  2239			return -EINVAL;
  2240		} else if (layer->hw_config.max_height > XVMIX_DISP_MAX_HEIGHT ||
  2241			   layer->hw_config.max_height < XVMIX_DISP_MIN_HEIGHT) {
  2242			DRM_ERROR("Invalid height in dt");
  2243			return -EINVAL;
  2244		}
  2245	
  2246		mixer_hw->max_layer_height = layer->hw_config.max_height;
  2247		layer->id = XVMIX_LAYER_MASTER;
  2248	
  2249		return 0;
  2250	}
  2251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
