Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC8F647
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 06:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678255660; x=1709791660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFFP3o20VzEZR0VKvTF3GMamKMT++nEVHX8sNITFAlc=;
  b=m6CzOkzUdmKlnxnTSapMplg8bL3SJTb0nVcN0mcJx0mjjDpParqyYVMO
   aWSp/VgWagYZz/sjQeGQTlS9p13B8ewkUEc40NMNL6O81LrlUQ5i0MFPw
   OCLztAz9hPsjx5VeiOxfOtxEYE9OIOSojct7lIZ8P+gFgRH9I3stnRLzI
   Z2jgPmLggZP0TAqdR+FhrfREMYt2z2IDI6FC3LA9FpN6XwyOF0+txSGXx
   U6vNlLSG8KBLhnO9WHNl0qeyhb17+zChxK7WgA9OitxFEFt2lMDM6eyVg
   T537/jCgZSzzf+3x40QZU8PY+SnPdj+Tp5Ju2p5/xJMDdtMVDHn+LbT88
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336091223"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="336091223"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 22:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006181671"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="1006181671"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 22:07:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZmxc-0001v1-2L;
	Wed, 08 Mar 2023 06:07:36 +0000
Date: Wed, 8 Mar 2023 14:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [linux-next:master 1737/1915]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:297:13:
 warning: variable 'available' set but not used
Message-ID: <202303081432.D9JWIDY9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: 6455cb522191dac057d5cc4b3f24d5d3ae6a33ef [1737/1915] drm/amd/display: link link_dp_dpia_bw.o in makefile
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303081432.D9JWIDY9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6455cb522191dac057d5cc4b3f24d5d3ae6a33ef
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6455cb522191dac057d5cc4b3f24d5d3ae6a33ef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081432.D9JWIDY9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c: In function 'dc_link_handle_usb4_bw_alloc_response':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:297:13: warning: variable 'available' set but not used [-Wunused-but-set-variable]
     297 |         int available = 0;
         |             ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:29:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
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
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/available +297 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c

    37	
    38	// ------------------------------------------------------------------
    39	//					PRIVATE FUNCTIONS
    40	// ------------------------------------------------------------------
    41	/*
    42	 * Always Check the following:
    43	 *  - Is it USB4 link?
    44	 *  - Is HPD HIGH?
    45	 *  - Is BW Allocation Support Mode enabled on DP-Tx?
    46	 */
    47	static bool get_bw_alloc_proceed_flag(struct dc_link *tmp)
    48	{
    49		return (tmp && DISPLAY_ENDPOINT_USB4_DPIA == tmp->ep_type
    50				&& tmp->hpd_status
    51				&& tmp->dpia_bw_alloc_config.bw_alloc_enabled);
    52	}
    53	static void reset_bw_alloc_struct(struct dc_link *link)
    54	{
    55		link->dpia_bw_alloc_config.bw_alloc_enabled = false;
    56		link->dpia_bw_alloc_config.sink_verified_bw = 0;
    57		link->dpia_bw_alloc_config.sink_max_bw = 0;
    58		link->dpia_bw_alloc_config.estimated_bw = 0;
    59		link->dpia_bw_alloc_config.bw_granularity = 0;
    60		link->dpia_bw_alloc_config.response_ready = false;
    61	}
    62	static uint8_t get_bw_granularity(struct dc_link *link)
    63	{
    64		uint8_t bw_granularity = 0;
    65	
    66		core_link_read_dpcd(
    67				link,
    68				DP_BW_GRANULALITY,
    69				&bw_granularity,
    70				sizeof(uint8_t));
    71	
    72		switch (bw_granularity & 0x3) {
    73		case 0:
    74			bw_granularity = 4;
    75			break;
    76		case 1:
    77		default:
    78			bw_granularity = 2;
    79			break;
    80		}
    81	
    82		return bw_granularity;
    83	}
    84	static int get_estimated_bw(struct dc_link *link)
    85	{
    86		uint8_t bw_estimated_bw = 0;
    87	
    88		core_link_read_dpcd(
    89				link,
    90				ESTIMATED_BW,
    91				&bw_estimated_bw,
    92				sizeof(uint8_t));
    93	
    94		return bw_estimated_bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
    95	}
    96	static bool allocate_usb4_bw(int *stream_allocated_bw, int bw_needed, struct dc_link *link)
    97	{
    98		if (bw_needed > 0)
    99			*stream_allocated_bw += bw_needed;
   100	
   101		return true;
   102	}
   103	static bool deallocate_usb4_bw(int *stream_allocated_bw, int bw_to_dealloc, struct dc_link *link)
   104	{
   105		bool ret = false;
   106	
   107		if (*stream_allocated_bw > 0) {
   108			*stream_allocated_bw -= bw_to_dealloc;
   109			ret = true;
   110		} else {
   111			//Do nothing for now
   112			ret = true;
   113		}
   114	
   115		// Unplug so reset values
   116		if (!link->hpd_status)
   117			reset_bw_alloc_struct(link);
   118	
   119		return ret;
   120	}
   121	/*
   122	 * Read all New BW alloc configuration ex: estimated_bw, allocated_bw,
   123	 * granuality, Driver_ID, CM_Group, & populate the BW allocation structs
   124	 * for host router and dpia
   125	 */
   126	static void init_usb4_bw_struct(struct dc_link *link)
   127	{
   128		// Init the known values
   129		link->dpia_bw_alloc_config.bw_granularity = get_bw_granularity(link);
   130		link->dpia_bw_alloc_config.estimated_bw = get_estimated_bw(link);
   131	}
   132	static uint8_t get_lowest_dpia_index(struct dc_link *link)
   133	{
   134		const struct dc *dc_struct = link->dc;
   135		uint8_t idx = 0xFF;
   136	
   137		for (int i = 0; i < MAX_PIPES * 2; ++i) {
   138	
   139			if (!dc_struct->links[i] ||
   140					dc_struct->links[i]->ep_type != DISPLAY_ENDPOINT_USB4_DPIA)
   141				continue;
   142	
   143			if (idx > dc_struct->links[i]->link_index)
   144				idx = dc_struct->links[i]->link_index;
   145		}
   146	
   147		return idx;
   148	}
   149	/*
   150	 * Get the Max Available BW or Max Estimated BW for each Host Router
   151	 *
   152	 * @link: pointer to the dc_link struct instance
   153	 * @type: ESTIMATD BW or MAX AVAILABLE BW
   154	 *
   155	 * return: response_ready flag from dc_link struct
   156	 */
   157	static int get_host_router_total_bw(struct dc_link *link, uint8_t type)
   158	{
   159		const struct dc *dc_struct = link->dc;
   160		uint8_t lowest_dpia_index = get_lowest_dpia_index(link);
   161		uint8_t idx = (link->link_index - lowest_dpia_index) / 2, idx_temp = 0;
   162		struct dc_link *link_temp;
   163		int total_bw = 0;
   164	
   165		for (int i = 0; i < MAX_PIPES * 2; ++i) {
   166	
   167			if (!dc_struct->links[i] || dc_struct->links[i]->ep_type != DISPLAY_ENDPOINT_USB4_DPIA)
   168				continue;
   169	
   170			link_temp = dc_struct->links[i];
   171			if (!link_temp || !link_temp->hpd_status)
   172				continue;
   173	
   174			idx_temp = (link_temp->link_index - lowest_dpia_index) / 2;
   175	
   176			if (idx_temp == idx) {
   177	
   178				if (type == HOST_ROUTER_BW_ESTIMATED)
   179					total_bw += link_temp->dpia_bw_alloc_config.estimated_bw;
   180				else if (type == HOST_ROUTER_BW_ALLOCATED)
   181					total_bw += link_temp->dpia_bw_alloc_config.sink_allocated_bw;
   182			}
   183		}
   184	
   185		return total_bw;
   186	}
   187	/*
   188	 * Cleanup function for when the dpia is unplugged to reset struct
   189	 * and perform any required clean up
   190	 *
   191	 * @link: pointer to the dc_link struct instance
   192	 *
   193	 * return: none
   194	 */
   195	static bool dpia_bw_alloc_unplug(struct dc_link *link)
   196	{
   197		if (!link)
   198			return true;
   199	
   200		return deallocate_usb4_bw(&link->dpia_bw_alloc_config.sink_allocated_bw,
   201				link->dpia_bw_alloc_config.sink_allocated_bw, link);
   202	}
   203	void dc_link_set_usb4_req_bw_req(struct dc_link *link, int req_bw)
   204	{
   205		uint8_t requested_bw;
   206		uint32_t temp;
   207	
   208		// 1. Add check for this corner case #1
   209		if (req_bw > link->dpia_bw_alloc_config.estimated_bw)
   210			req_bw = link->dpia_bw_alloc_config.estimated_bw;
   211	
   212		temp = req_bw * link->dpia_bw_alloc_config.bw_granularity;
   213		requested_bw = temp / Kbps_TO_Gbps;
   214	
   215		// Always make sure to add more to account for floating points
   216		if (temp % Kbps_TO_Gbps)
   217			++requested_bw;
   218	
   219		// 2. Add check for this corner case #2
   220		req_bw = requested_bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
   221		if (req_bw == link->dpia_bw_alloc_config.sink_allocated_bw)
   222			return;
   223	
   224		if (core_link_write_dpcd(
   225			link,
   226			REQUESTED_BW,
   227			&requested_bw,
   228			sizeof(uint8_t)) == DC_OK)
   229			link->dpia_bw_alloc_config.response_ready = false; // Reset flag
   230	}
   231	/*
   232	 * Return the response_ready flag from dc_link struct
   233	 *
   234	 * @link: pointer to the dc_link struct instance
   235	 *
   236	 * return: response_ready flag from dc_link struct
   237	 */
   238	static bool get_cm_response_ready_flag(struct dc_link *link)
   239	{
   240		return link->dpia_bw_alloc_config.response_ready;
   241	}
   242	// ------------------------------------------------------------------
   243	//					PUBLIC FUNCTIONS
   244	// ------------------------------------------------------------------
   245	bool link_dp_dpia_set_dptx_usb4_bw_alloc_support(struct dc_link *link)
   246	{
   247		bool ret = false;
   248		uint8_t response = 0,
   249				bw_support_dpia = 0,
   250				bw_support_cm = 0;
   251	
   252		if (!(link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA && link->hpd_status))
   253			goto out;
   254	
   255		if (core_link_read_dpcd(
   256				link,
   257				DP_TUNNELING_CAPABILITIES,
   258				&response,
   259				sizeof(uint8_t)) == DC_OK)
   260			bw_support_dpia = (response >> 7) & 1;
   261	
   262		if (core_link_read_dpcd(
   263			link,
   264			USB4_DRIVER_BW_CAPABILITY,
   265			&response,
   266			sizeof(uint8_t)) == DC_OK)
   267			bw_support_cm = (response >> 7) & 1;
   268	
   269		/* Send request acknowledgment to Turn ON DPTX support */
   270		if (bw_support_cm && bw_support_dpia) {
   271	
   272			response = 0x80;
   273			if (core_link_write_dpcd(
   274					link,
   275					DPTX_BW_ALLOCATION_MODE_CONTROL,
   276					&response,
   277					sizeof(uint8_t)) != DC_OK) {
   278				DC_LOG_DEBUG("%s: **** FAILURE Enabling DPtx BW Allocation Mode Support ***\n",
   279						__func__);
   280			} else {
   281				// SUCCESS Enabled DPtx BW Allocation Mode Support
   282				link->dpia_bw_alloc_config.bw_alloc_enabled = true;
   283				DC_LOG_DEBUG("%s: **** SUCCESS Enabling DPtx BW Allocation Mode Support ***\n",
   284						__func__);
   285	
   286				ret = true;
   287				init_usb4_bw_struct(link);
   288			}
   289		}
   290	
   291	out:
   292		return ret;
   293	}
   294	void dc_link_handle_usb4_bw_alloc_response(struct dc_link *link, uint8_t bw, uint8_t result)
   295	{
   296		int bw_needed = 0;
 > 297		int available = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
