Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECBEC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 01:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674610592; x=1706146592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LFzBm4yzBDNMg4g99GDsgfKmbHaH5/NAwLVRlojbpaM=;
  b=GhQfaH8zKmeLWVb7vqoKFrBv3atf9TAoO7GBXeUPScK28DqvwP9LQ3i4
   J09BkxassURykp8IxtgFrV+7RyCIdt8Bm7RxFr4CMTGQmddnPxA9XHMYw
   zWnpk0jfn2EPM+e7sgFZ2l2sflEbbAcjGc+hseBcYbShvBdZ5oT0CYgDM
   fkNEPRo5IJyuHX5c57LyazUOoMA+ubD0k9YPEZ9C/09boaY/NtXzhTGYj
   zJcOixVcuexS20RXK1W05ku+oatH7kVwLVrOIEi/+QzlWYZ8uwKv67sEK
   aq3eGEOV9Jr/4/bbjeClMDDyaaiXjLgVx+PrGbh58P8xmNRC/bcrdHceo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="327713653"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="327713653"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 17:36:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612247350"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="612247350"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2023 17:36:29 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKUiC-0006w8-2D;
	Wed, 25 Jan 2023 01:36:28 +0000
Date: Wed, 25 Jan 2023 09:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	George Shen <George.Shen@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [agd5f:drm-next 298/312]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6:
 warning: no previous prototype for 'link_dp_trace_set_edp_power_timestamp'
Message-ID: <202301250916.IZypzvnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   f732e2b3c6b3882e0648a4e44ff4eafaf998ad47
commit: bc33f5e5f05ba44e48909e2cfc5a97475ec69a4d [298/312] drm/amd/display: create accessories, hwss and protocols sub folders in link
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230125/202301250916.IZypzvnO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout bc33f5e5f05ba44e48909e2cfc5a97475ec69a4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6: warning: no previous prototype for 'link_dp_trace_set_edp_power_timestamp' [-Wmissing-prototypes]
     148 | void link_dp_trace_set_edp_power_timestamp(struct dc_link *link,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:158:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweron_timestamp' [-Wmissing-prototypes]
     158 | uint64_t link_dp_trace_get_edp_poweron_timestamp(struct dc_link *link)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:163:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweroff_timestamp' [-Wmissing-prototypes]
     163 | uint64_t link_dp_trace_get_edp_poweroff_timestamp(struct dc_link *link)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_link.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c: In function 'perform_link_training_with_retries':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
    1585 |                                 bool result;
         |                                      ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:33:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
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
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c: In function 'dp_wa_power_up_0010FA':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:278:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
     278 |         union dp_downstream_port_present ds_port = { 0 };
         |                                          ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c: In function 'dpcd_set_source_specific_data':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1294:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
    1294 |                 enum dc_status result_write_min_hblank = DC_NOT_SUPPORTED;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:37:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
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
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/link_dp_trace_set_edp_power_timestamp +148 drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c

   147	
 > 148	void link_dp_trace_set_edp_power_timestamp(struct dc_link *link,
   149			bool power_up)
   150	{
   151		if (!power_up)
   152			/*save driver power off time stamp*/
   153			link->dp_trace.edp_trace_power_timestamps.poweroff = dm_get_timestamp(link->dc->ctx);
   154		else
   155			link->dp_trace.edp_trace_power_timestamps.poweron = dm_get_timestamp(link->dc->ctx);
   156	}
   157	
 > 158	uint64_t link_dp_trace_get_edp_poweron_timestamp(struct dc_link *link)
   159	{
   160		return link->dp_trace.edp_trace_power_timestamps.poweron;
   161	}
   162	
 > 163	uint64_t link_dp_trace_get_edp_poweroff_timestamp(struct dc_link *link)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
