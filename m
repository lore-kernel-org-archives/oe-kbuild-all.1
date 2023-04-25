Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840C7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682411669; x=1713947669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EEbpDHkafvys3D1PdwlEbiuRYizUJSr8nsGEE3eDsbU=;
  b=Ri/dBaAw7wQfvO0SYgkXlrwstsLdJO4irxv6WTCYcYPESHjeqn/yu/g3
   o18fD2vJNSbFy7RiunN6e1/AIRftquU6zGvIU+wkCEiamh1rVdmbQTuO2
   bZ4VmIzw0CPNs5zwRtgXW6Rs1Z7wtUIomJcfg8uxzGsKBC/ZlTPszjOeS
   VFj8xnxRSxw3rbWSowEWY7gHnLxPbu9GDHw4/ppnJWU+xJy0O7wDG6CiX
   f6rjjLV/AvIkPa+LSXgzUPQ0clipQgJ02c7sx+VlVa89ewSo7PVAcMMm5
   urbJqDm+uk0z6FwJYYUOVgMozTbLiCb6FB3H5FWVPW13uxc2UxGn/dWnf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374646869"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="374646869"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782754347"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="782754347"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2023 01:34:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prE82-000jDM-0g;
	Tue, 25 Apr 2023 08:34:26 +0000
Date: Tue, 25 Apr 2023 16:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hersen Wu <hersenxs.wu@amd.com>,
	Wenchieh Chien <wenchieh.chien@amd.com>
Subject: [agd5f:drm-next 121/143]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6349:6: warning:
 no previous prototype for 'amdgpu_dm_connector_funcs_force'
Message-ID: <202304251640.JClqTim9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   6d3435e2e3031a3541f5e23bba4d54eff78eb9fa
commit: 0ba4a784a14592abed41873e339eab78ceb6e230 [121/143] drm/amd/display: implement force function in amdgpu_dm_connector_funcs
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304251640.JClqTim9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 0ba4a784a14592abed41873e339eab78ceb6e230
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251640.JClqTim9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6349:6: warning: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Wmissing-prototypes]
    6349 | void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'create_eml_sink':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6405:21: warning: variable 'count' set but not used [-Wunused-but-set-variable]
    6405 |                 int count;
         |                     ^~~~~


vim +/amdgpu_dm_connector_funcs_force +6349 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6348	
> 6349	void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
  6350	{
  6351		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
  6352		struct dc_link *dc_link = aconnector->dc_link;
  6353		struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
  6354		struct edid *edid;
  6355	
  6356		if (!connector->edid_override)
  6357			return;
  6358	
  6359		drm_edid_override_connector_update(&aconnector->base);
  6360		edid = aconnector->base.edid_blob_ptr->data;
  6361		aconnector->edid = edid;
  6362	
  6363		/* Update emulated (virtual) sink's EDID */
  6364		if (dc_em_sink && dc_link) {
  6365			memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
  6366			memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
  6367			dm_helpers_parse_edid_caps(
  6368				dc_link,
  6369				&dc_em_sink->dc_edid,
  6370				&dc_em_sink->edid_caps);
  6371		}
  6372	}
  6373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
