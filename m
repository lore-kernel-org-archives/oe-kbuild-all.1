Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BEF7F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 05:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676008708; x=1707544708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F9050IoeyKXMUyG/kEa3x+cg3OfZeCI31b04/a4BuZ0=;
  b=EIMCw1pfk/E4gBqlb4es5NL7MIPBwSgzme0R8p+vTPBAyMO4jVGGi8BV
   uCN97DnQRwx9h6VTBr+TUrx5sQ4opb+kZrE1iUq9wp+lj7Oegbp9jwH+T
   ftb5lBOhkaDTYBatq3dDTBwY3Nc8O/i0Bws+GOTQpzJTRpzG4VyVkKKj9
   FICzNyljANeVsMyxnU3vWfcTs+Nr3mvut/Z39Qww8RwdEiwOkkKp3byay
   UOJM6O3PnaAFl+lLL8IWBrAnHmHMkqm7iqTPDmbEXBbtyb3sG2W2YdYSz
   oV4lbD9ahoH6mBegXGEI52IclYZwpEePPAU41IJ+1s0hqlmB0nbWYYgGE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318362108"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="318362108"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="791852774"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="791852774"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Feb 2023 21:58:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQMQT-0005ba-2s;
	Fri, 10 Feb 2023 05:58:25 +0000
Date: Fri, 10 Feb 2023 13:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jingwen Zhu <Jingwen.Zhu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Subject: [linux-next:master 6415/11577]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:90:6:
 warning: no previous prototype for 'should_disable_otg'
Message-ID: <202302101311.HcpZnVFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20f513df926fac0594a3b65f79d856bd64251861
commit: 7cf5ceb30d4d527d763ae78c5405e3faca1fb8b1 [6415/11577] drm/amd/display: avoid disable otg when dig was disabled
config: arm64-buildonly-randconfig-r002-20230209 (https://download.01.org/0day-ci/archive/20230210/202302101311.HcpZnVFl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7cf5ceb30d4d527d763ae78c5405e3faca1fb8b1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7cf5ceb30d4d527d763ae78c5405e3faca1fb8b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101311.HcpZnVFl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:90:6: warning: no previous prototype for 'should_disable_otg' [-Wmissing-prototypes]
      90 | bool should_disable_otg(struct pipe_ctx *pipe)
         |      ^~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/resource.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/clk_mgr_internal.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:29:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:142:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     142 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:139:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     139 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/dccg.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:28:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/should_disable_otg +90 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c

    89	
  > 90	bool should_disable_otg(struct pipe_ctx *pipe)
    91	{
    92		bool ret = true;
    93	
    94		if (pipe->stream->link->link_enc && pipe->stream->link->link_enc->funcs->is_dig_enabled &&
    95				pipe->stream->link->link_enc->funcs->is_dig_enabled(pipe->stream->link->link_enc))
    96			ret = false;
    97		return ret;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
