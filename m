Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264F10E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676105350; x=1707641350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0eYsElxFplxakzbEckFq4E3JT1RlpltvszfRveNvyk=;
  b=A92Q3u7zCuaVxnhG0y2QjnQTiOOqMzuzu8wNrbx/4si7CcFMa4weOmpG
   Cy/HyAH0w2XfZbrL+FwsZHLprw7bN9U3DBY3OZohsFZ+3Nir92lkcSJGV
   +Uu0sQnz3v3VNgSa5MFYIJVhDM6vhkxV9Pjhdnh2NxhE7rOPkuAnpdfUc
   iR1euJWrIg+3yufZpYKhlViYOhKsPHOMt2kfObRm6KfXMA/E3xBFB2EVK
   y9dVt5CL8Rwa+E2XHKIg6TmhL8m/J0mo73quXW0CSifSUup15JBSmv2Jl
   cCyWnQlfNUZ84HEKrv+Rprib4uyogn5PSeqSqgRS/+QIoB4Xg5uJfSsoB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310229851"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="310229851"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 00:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="668302086"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="668302086"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Feb 2023 00:49:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQlZ8-0006Mr-1E;
	Sat, 11 Feb 2023 08:49:02 +0000
Date: Sat, 11 Feb 2023 16:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Chalmers <Wesley.Chalmers@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [linux-next:master 11247/12152]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning:
 no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear'
Message-ID: <202302111601.jtY4lKrA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: 8f0d304d21b351d65e8c434c5399a40231876ba1 [11247/12152] drm/amd/display: Do not commit pipe when updating DRR
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302111601.jtY4lKrA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8f0d304d21b351d65e8c434c5399a40231876ba1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8f0d304d21b351d65e8c434c5399a40231876ba1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111601.jtY4lKrA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
     294 | void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:32:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:143:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     143 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:140:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     140 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:138:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     138 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:135:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     135 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:133:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     133 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/reg_helper.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/optc3_wait_drr_doublebuffer_pending_clear +294 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c

   293	
 > 294	void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
   295	{
   296		struct optc *optc1 = DCN10TG_FROM_TG(optc);
   297	
   298		REG_WAIT(OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_PENDING, 0, 2, 100000); /* 1 vupdate at 5hz */
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
