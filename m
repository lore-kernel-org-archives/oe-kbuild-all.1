Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13DD3D75
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675695063; x=1707231063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qo9Hxt/WcT8jKhj/Ndl1FLt3yU4WsEv63B5VvvP1aaI=;
  b=OSPbbwjxeuy8SitlM1I79ouDtz7GVh53juljFErbQ7UYud0xnQOQPVD1
   bBe7+S2vs4Db4KvZo3GSzy9nOz9qnBUOPmUfFdVY0b01+llgE7Q1jeaeY
   E296qgyStZ7/cIV2jTIJ5hYZC8CWY1k3VmG0fhsfz0sZnuXAedde/coph
   4VLNqdbLVyWec0DVLi+2Y9L1udxWsi7jLQvlFjs0d65souEQo858bZYFu
   Et9CZg83u+TLPlBbgyMQKqHp0IfnPxC51eQBjYb0RHwHSkMk0jJ/TSEGU
   eH61kgwcQCpvkBJJH0Zv29sLi/v2C3shAwA6k+nnofHRK4HzoPrrl6+rj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415439627"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="415439627"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 06:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="755266044"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="755266044"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 06:51:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP2ph-0002cO-0E;
	Mon, 06 Feb 2023 14:51:01 +0000
Date: Mon, 6 Feb 2023 22:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>
Subject: [linux-next:master 4266/10565]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18:
 warning: variable 'cursor_bpp' set but not used
Message-ID: <202302062224.ByzeTXh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   129af770823407ee115a56c69a04b440fd2fbe61
commit: 238debcaebe44704887d403157a4d0bd6181fdd9 [4266/10565] drm/amd/display: Use DML for MALL SS and Subvp allocation calculations
config: arm64-randconfig-r011-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062224.ByzeTXh1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=238debcaebe44704887d403157a4d0bd6181fdd9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 238debcaebe44704887d403157a4d0bd6181fdd9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c: In function 'dcn32_helper_calculate_mall_bytes_for_cursor':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable 'cursor_bpp' set but not used [-Wunused-but-set-variable]
      62 |         uint32_t cursor_bpp = 4;
         |                  ^~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
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
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cursor_bpp +62 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c

    54	
    55	uint32_t dcn32_helper_calculate_mall_bytes_for_cursor(
    56			struct dc *dc,
    57			struct pipe_ctx *pipe_ctx,
    58			bool ignore_cursor_buf)
    59	{
    60		struct hubp *hubp = pipe_ctx->plane_res.hubp;
    61		uint32_t cursor_size = hubp->curs_attr.pitch * hubp->curs_attr.height;
  > 62		uint32_t cursor_bpp = 4;
    63		uint32_t cursor_mall_size_bytes = 0;
    64	
    65		switch (pipe_ctx->stream->cursor_attributes.color_format) {
    66		case CURSOR_MODE_MONO:
    67			cursor_size /= 2;
    68			cursor_bpp = 4;
    69			break;
    70		case CURSOR_MODE_COLOR_1BIT_AND:
    71		case CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA:
    72		case CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA:
    73			cursor_size *= 4;
    74			cursor_bpp = 4;
    75			break;
    76	
    77		case CURSOR_MODE_COLOR_64BIT_FP_PRE_MULTIPLIED:
    78		case CURSOR_MODE_COLOR_64BIT_FP_UN_PRE_MULTIPLIED:
    79			cursor_size *= 8;
    80			cursor_bpp = 8;
    81			break;
    82		}
    83	
    84		/* only count if cursor is enabled, and if additional allocation needed outside of the
    85		 * DCN cursor buffer
    86		 */
    87		if (pipe_ctx->stream->cursor_position.enable && (ignore_cursor_buf ||
    88				cursor_size > 16384)) {
    89			/* cursor_num_mblk = CEILING(num_cursors*cursor_width*cursor_width*cursor_Bpe/mblk_bytes, 1)
    90			 * Note: add 1 mblk in case of cursor misalignment
    91			 */
    92			cursor_mall_size_bytes = ((cursor_size + DCN3_2_MALL_MBLK_SIZE_BYTES - 1) /
    93					DCN3_2_MALL_MBLK_SIZE_BYTES + 1) * DCN3_2_MALL_MBLK_SIZE_BYTES;
    94		}
    95	
    96		return cursor_mall_size_bytes;
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
