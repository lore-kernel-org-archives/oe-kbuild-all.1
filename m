Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103A79F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690357585; x=1721893585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Gqb9GNGNfSnXM5Bh+bNe6smLkEqnNa9+ujhUwk/73c=;
  b=Yu1I3a1XnQZ+EsywK8v6wW3lvgCGG0uvqtkyEsqhdmQyGIUtWmcYTgIi
   zKj9fYVIX7HrZwJC6OHBt8GOE1DS4A+ZMiNigGOBWNK9Lzz5QlG/idM3J
   W6M48pLAQYRmwsBuXZzxi0o3b4BJJTEoKFlPVraGVCjWf2K7jcZFm5hm5
   GEL+iOa4t2TwXfIaEblGxsD2LYVkFEGSPn2/DqaoIcJAMWd0KCIU+2juM
   wMm0V4oOdjYRb8yxgyLCy9TjLTJGXSOnmv7ubE6oFFtP2lN2SoDbHJz7J
   kaIAYDfuAcE63Iw8dZ6clsKwuwm+xGTpxjt2MicyUcsDpXL5fMjUhzYbD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="434204893"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="434204893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 00:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1057105443"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="1057105443"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 00:46:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOZDj-0000nT-0H;
	Wed, 26 Jul 2023 07:46:10 +0000
Date: Wed, 26 Jul 2023 15:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 107/134]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:56:14:
 error: implicit declaration of function 'drm_edid_encode_panel_id'
Message-ID: <202307261530.0cVj8G93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   87f4ba57f1150224de9c636607e1c320d21b5f48
commit: cc783092cc6e059fab59e48dc1f1bf9dc7d49903 [107/134] drm/amd/display: Add monitor specific edid quirk
config: arm-randconfig-r046-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261530.0cVj8G93-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261530.0cVj8G93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261530.0cVj8G93-lkp@intel.com/

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
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:60:40: error: 'struct dc_panel_patch' has no member named 'disable_fams'; did you mean 'disable_fec'?
      60 |                 edid_caps->panel_patch.disable_fams = true;
         |                                        ^~~~~~~~~~~~
         |                                        disable_fec
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
