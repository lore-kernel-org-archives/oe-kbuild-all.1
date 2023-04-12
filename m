Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D36FD2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681320927; x=1712856927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzZDM66wy2DXZ+RWGpz5d4IqjGq6pSOZptmSKEv0ZaU=;
  b=JJAcNq9tDMEVqY5Ixm9P1SceC73XxvfRaa6MXOBSJpFZJh44KtXvyJoc
   awoQjDvebpujICmRZOmoYC3Cy6SKX7waCgUqyK/kfPEkdrpxHbpK/cQH+
   v4qMjRLfhMhbXHqYGPCtXT8DJ0pqM8N5sN38jypZ255bNNEJPN3TVvUie
   Fky6o+voEYFvv6pFH+J7zirARTnQzDLYRnaETrWb0wn0h+dD5c/VNBPJG
   jyMjjAMoDSNUbw32bAsgePzKZFaz9iZxph6f0hS/bLg3fvFYNxGZijv4H
   D9aW4d8n+f6RArGvLJQgQV4VdAswouEbTfaTvFXHHbhzJw3HtY5OoWS+j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409109905"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="409109905"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 10:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800424003"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="800424003"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 10:35:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmeNL-000Xwz-28;
	Wed, 12 Apr 2023 17:35:19 +0000
Date: Thu, 13 Apr 2023 01:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jianqiang Chen <jianqiang.chen@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 572/1065]
 drivers/gpu/drm/xlnx/xlnx_mixer.c:2218:9: warning: 'strncpy' specified bound
 4 equals destination size
Message-ID: <202304130102.nORBEQgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 02962ad3ef06d0bea1f20e46903cc1e00a9e756e [572/1065] drm: xlnx: mixer: Correct the fourcc string copy
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304130102.nORBEQgd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/02962ad3ef06d0bea1f20e46903cc1e00a9e756e
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 02962ad3ef06d0bea1f20e46903cc1e00a9e756e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/xlnx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130102.nORBEQgd-lkp@intel.com/

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
https://github.com/intel/lkp-tests
