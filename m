Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06CC944
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 20:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681851371; x=1713387371;
  h=date:from:cc:subject:message-id:mime-version;
  bh=au2iWSKeZo0AJkjiVfu2jYcOXdtRh88ZdvmovMbKtLQ=;
  b=RCSCf+BARBW2TxHHdN8w7mNhq3yIkbbisaylioD8F0/L33sf6E0Gz6rN
   TSfzuMnQmRDkmAUlrHED7SWR7PchJ55O4/ozGZDnC5nngGTXycwuMYLrN
   UA55p/ulCkoCXDfylxJ7O+EhC7pJLoDAk1IvkQNYhWVurCUQbv3/bzp8w
   JHFf3z/Mfj+V8AErQozblfQK3Z2hZJsJB66SNwHcU38pjTS0VlhRSvKJj
   RddsWHgoU2ePA/AjvisrxxG7oytK+VWcnpnIxZT2oT5OPpu2UpoGgXqQm
   Z/orBasRjOOOdw8M2pdLHtqqzokKDDcXK2EJzTR6S6/0J1/ghVqUR8mWx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431566017"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431566017"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 13:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691244424"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="691244424"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2023 13:56:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1posMy-000e2F-0S;
	Tue, 18 Apr 2023 20:56:08 +0000
Date: Wed, 19 Apr 2023 04:55:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 1942/2236]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:278:42:
 warning: variable 'ds_port' set but not used
Message-ID: <202304190450.wNnpgfQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   3fd2d2340000361c6df236099087eda85d92a97a
commit: ab5a903dfa844753668f8d490b6dc7b808649287 [1942/2236] drm/amd/display: move dp capability related logic to link_dp_capability
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190450.wNnpgfQg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/ab5a903dfa844753668f8d490b6dc7b808649287
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 6.1/linux
        git checkout ab5a903dfa844753668f8d490b6dc7b808649287
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190450.wNnpgfQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:233:21: warning: 'union hdmi_encoded_link_bw' declared inside parameter list will not be visible outside of this definition or declaration
     233 |         const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:233:42: error: parameter 2 ('hdmi_encoded_link_bw') has incomplete type
     233 |         const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:231:17: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     231 | static uint32_t intersect_frl_link_bw_support(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'dp_wa_power_up_0010FA':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:278:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
     278 |         union dp_downstream_port_present ds_port = { 0 };
         |                                          ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'get_active_converter_info':
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1125:76: error: storage size of 'hdmi_encoded_link_bw' isn't known
    1125 |                                                 union hdmi_encoded_link_bw hdmi_encoded_link_bw;
         |                                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1129:101: error: 'struct <anonymous>' has no member named 'MAX_ENCODED_LINK_BW_SUPPORT'
    1129 |                                                                                 hdmi_color_caps.bits.MAX_ENCODED_LINK_BW_SUPPORT);
         |                                                                                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1125:76: warning: unused variable 'hdmi_encoded_link_bw' [-Wunused-variable]
    1125 |                                                 union hdmi_encoded_link_bw hdmi_encoded_link_bw;
         |                                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'dpcd_set_source_specific_data':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1294:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
    1294 |                 enum dc_status result_write_min_hblank = DC_NOT_SUPPORTED;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'dp_retrieve_lttpr_cap':
   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1465:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
    1465 |                 return false;
         |                        ^~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:37:
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
   cc1: some warnings being treated as errors


vim +/ds_port +278 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c

   273	
   274	static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
   275			int length)
   276	{
   277		int retry = 0;
 > 278		union dp_downstream_port_present ds_port = { 0 };
   279	
   280		if (!link->dpcd_caps.dpcd_rev.raw) {
   281			do {
   282				dc_link_dp_receiver_power_ctrl(link, true);
   283				core_link_read_dpcd(link, DP_DPCD_REV,
   284								dpcd_data, length);
   285				link->dpcd_caps.dpcd_rev.raw = dpcd_data[
   286					DP_DPCD_REV -
   287					DP_DPCD_REV];
   288			} while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
   289		}
   290	
   291		ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
   292					 DP_DPCD_REV];
   293	
   294		if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER) {
   295			switch (link->dpcd_caps.branch_dev_id) {
   296			/* 0010FA active dongles (DP-VGA, DP-DLDVI converters) power down
   297			 * all internal circuits including AUX communication preventing
   298			 * reading DPCD table and EDID (spec violation).
   299			 * Encoder will skip DP RX power down on disable_output to
   300			 * keep receiver powered all the time.*/
   301			case DP_BRANCH_DEVICE_ID_0010FA:
   302			case DP_BRANCH_DEVICE_ID_0080E1:
   303			case DP_BRANCH_DEVICE_ID_00E04C:
   304				link->wa_flags.dp_keep_receiver_powered = true;
   305				break;
   306	
   307			/* TODO: May need work around for other dongles. */
   308			default:
   309				link->wa_flags.dp_keep_receiver_powered = false;
   310				break;
   311			}
   312		} else
   313			link->wa_flags.dp_keep_receiver_powered = false;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
