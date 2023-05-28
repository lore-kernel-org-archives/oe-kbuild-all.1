Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E97C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685257801; x=1716793801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Md+DnmaAknh+uTTdKcPyWufo1Fdgux+pXlGu8MukcY=;
  b=EnRW/T12m3h6JO7OsX7XKy4u8pZOkd2AAL88Bw7goVYJYQk/U4SxzhYy
   TJ8WOJXPR3kRnm0AGEL0QZ9RVkDGeYHcNRCHpvUiQeKzhkfhXj41bWRZN
   jHCGkykfY3G+Wg2wVk3WkaKl9o3lwOp7itZxPfWhphp3IVbtQKr1zJ7jZ
   jAXARdPeT7qoiGSqDbpxdrYpFUb6MV/qOjkp0FFKxSDlHyYV7xfe/Nza8
   VktTEDj2kftBLvVuRhENKc53I32m9X7bvwgiWtirgYzVnNNop9K6dD7lR
   jeNWuIOhSgBfPbvca8Yengv7BilI8YwsjC7ftixgOZXYY/MKjF+/z86oE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420251233"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="420251233"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 00:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="1035818751"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="1035818751"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 May 2023 00:09:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3AXO-000KTs-1e;
	Sun, 28 May 2023 07:09:58 +0000
Date: Sun, 28 May 2023 15:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 19/42]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6152:6: warning:
 no previous prototype for function 'amdgpu_dm_connector_funcs_force'
Message-ID: <202305281534.9EmHS8HF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   429ad0976d865af5ae1a703a73346144d12e8d38
commit: 275d3581ae02811e0e976c0797b152e306dd5dcf [19/42] FROMGIT: drm/amd/display: implement force function in amdgpu_dm_connector_funcs
config: arm64-randconfig-r023-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281534.9EmHS8HF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 275d3581ae02811e0e976c0797b152e306dd5dcf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281534.9EmHS8HF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6152:6: warning: no previous prototype for function 'amdgpu_dm_connector_funcs_force' [-Wmissing-prototypes]
   void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
        ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
   ^
   static 
   1 warning generated.


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
