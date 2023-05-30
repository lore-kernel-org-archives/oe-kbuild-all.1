Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB5200BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685485189; x=1717021189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFhmy4q+ABxfxeV/a2hu0k0jfwPZdisOCpsg1onMbNo=;
  b=nH+ohiq495HZ7jt6Q0Cpat3a2x0vpQLVmc9MCzeuHDZmZVK9M3GR+JUi
   YK+vBGJZiCT7YVT7yIEke6/1SyP2+DSpXo12dauZMj34xndRGdhRDyGC1
   OmhmZWhTN2IVygN1hAeT3/ZlCvMt7hrse4ihIr03O0fw+l9eObKuJSF4v
   UBPA5RxLPUM05PAYay9dDqVV76orKtQi3eaWNuiIjXwAA623xht6bYLkP
   kWDbHSZHULrr/8HJXvKJSdXHYrNWNV03SOroO3Z3sh3BZqVBbz05gJ41B
   I9MH6DC8Guh0Q2n+SYiIEE9qjkO8WrdPdXZvS78oI6vFcVDdQoxJ7OaPJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353906127"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="353906127"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 15:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="776521626"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="776521626"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 May 2023 15:19:48 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q47gx-0000rj-1O;
	Tue, 30 May 2023 22:19:47 +0000
Date: Wed, 31 May 2023 06:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 19/45]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6152:6: warning:
 no previous prototype for 'amdgpu_dm_connector_funcs_force'
Message-ID: <202305310642.Zc8HU9Cq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   c82dcb7c1acf692dc0ce2af433ca6666ced28623
commit: 275d3581ae02811e0e976c0797b152e306dd5dcf [19/45] FROMGIT: drm/amd/display: implement force function in amdgpu_dm_connector_funcs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230531/202305310642.Zc8HU9Cq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 275d3581ae02811e0e976c0797b152e306dd5dcf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310642.Zc8HU9Cq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6152:6: warning: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Wmissing-prototypes]
    6152 | void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/trace_events.h:21,
                    from include/trace/define_trace.h:102,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_trace.h:670,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:41:
   arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' defined but not used [-Wunused-const-variable=]
     126 | static const unsigned int arc_pmu_cache_map[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
         |                           ^~~~~~~~~~~~~~~~~
   arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' defined but not used [-Wunused-const-variable=]
      91 | static const char * const arc_pmu_ev_hw_map[] = {
         |                           ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link_enc_cfg.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:32:
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


vim +/amdgpu_dm_connector_funcs_force +6152 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6151	
> 6152	void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
  6153	{
  6154		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
  6155		struct dc_link *dc_link = aconnector->dc_link;
  6156		struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
  6157		struct edid *edid;
  6158	
  6159		if (!connector->edid_override)
  6160			return;
  6161	
  6162		drm_edid_override_connector_update(&aconnector->base);
  6163		edid = aconnector->base.edid_blob_ptr->data;
  6164		aconnector->edid = edid;
  6165	
  6166		/* Update emulated (virtual) sink's EDID */
  6167		if (dc_em_sink && dc_link) {
  6168			memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
  6169			memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
  6170			dm_helpers_parse_edid_caps(
  6171				dc_link,
  6172				&dc_em_sink->dc_edid,
  6173				&dc_em_sink->edid_caps);
  6174		}
  6175	}
  6176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
