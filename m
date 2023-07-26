Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A2139B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690354315; x=1721890315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CQQa/7jWJ/InRx71WMcgapCtkpN0pPSeYJqgVhttgQ=;
  b=LULGYLdC404YKn7b8AL+O/Myd4c/NXAh0perW4xBkzMS6gVfNFI5qpC8
   t0u6DRZoKw32RuzKfoIsMELnVXnEPSkxjS4VfNgJIuRCgoQXr5Z2gqyPz
   W1ywKcqiPPNHs7PCojJGRPohxl1+6rnxOCgqYzuHyp7yY6MWFrNW5w+6Z
   hzK3yrUR9fTBYaoMxVLfgAaENstog4vytnbB679vwHtv8EEWCavRadF3U
   iJjuO1FRXHyahWJlJRNnPbIam0N45RYV44Y/TXGRaP2m+8lfrO5hYI5Ez
   AzwJHyKI8Z/ikSlOCJr+biFjQ6n5xlrBLs4CRi+mD69cuB4rCrc8mF6wO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454311624"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="454311624"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869767005"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 23:51:55 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOYNF-0000kN-0d;
	Wed, 26 Jul 2023 06:51:53 +0000
Date: Wed, 26 Jul 2023 14:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 339/358]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:56:14:
 error: implicit declaration of function 'drm_edid_encode_panel_id'
Message-ID: <202307261407.dE9yUGgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   643df3563d38a49189f970269b48469e47dd5a20
commit: 8f7c09f3bcf832aba1db312efbb8b75c5f315c71 [339/358] drm/amd/display: Add monitor specific edid quirk
config: riscv-randconfig-r042-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261407.dE9yUGgL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261407.dE9yUGgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261407.dE9yUGgL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c: In function 'apply_edid_quirks':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:56:14: error: implicit declaration of function 'drm_edid_encode_panel_id' [-Werror=implicit-function-declaration]
      56 |         case drm_edid_encode_panel_id('S', 'A', 'M', 0x0E5E):
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:56:9: error: case label does not reduce to an integer constant
      56 |         case drm_edid_encode_panel_id('S', 'A', 'M', 0x0E5E):
         |         ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:57:9: error: case label does not reduce to an integer constant
      57 |         case drm_edid_encode_panel_id('S', 'A', 'M', 0x7053):
         |         ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:58:9: error: case label does not reduce to an integer constant
      58 |         case drm_edid_encode_panel_id('S', 'A', 'M', 0x71AC):
         |         ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:60:39: error: 'struct dc_panel_patch' has no member named 'disable_fams'
      60 |                 edid_caps->panel_patch.disable_fams = true;
         |                                       ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c: In function 'dm_dtn_log_append_v':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:402:9: warning: function 'dm_dtn_log_append_v' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     402 |         n = vsnprintf(NULL, 0, msg, args);
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:432:17: warning: function 'dm_dtn_log_append_v' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     432 |                 args);
         |                 ^~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:35:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_edid_encode_panel_id +56 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

    49	
    50	static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
    51	{
    52		uint32_t panel_id = edid_extract_panel_id(edid);
    53	
    54		switch (panel_id) {
    55		/* Workaround for some monitors which does not work well with FAMS */
  > 56		case drm_edid_encode_panel_id('S', 'A', 'M', 0x0E5E):
    57		case drm_edid_encode_panel_id('S', 'A', 'M', 0x7053):
    58		case drm_edid_encode_panel_id('S', 'A', 'M', 0x71AC):
    59			DRM_DEBUG_DRIVER("Disabling FAMS on monitor with panel id %X\n", panel_id);
  > 60			edid_caps->panel_patch.disable_fams = true;
    61			break;
    62		default:
    63			return;
    64		}
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
