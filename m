Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD8347D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hs/HlnUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698450243; x=1729986243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHmaC+UW3d+GdOOG9tQZyekU2o3ZXjv6uuShlecHoXU=;
  b=Hs/HlnUO2wyu6yGspAbRNemIr9aNwOFcLMtFGEJnwO/BQDA7PD8gy2Ds
   D2fLNVWcMRy2Q9Ub8KURBJOBypL7oSsArK73PDTgStEgjPksI6kBRYkei
   T2DOdmKgU0GANIxIm1HYUDh7U601SOw7FutyjRHEV0GEDYQjgA98UFiJh
   ez4XsAFOyMLi8cFVmnl9gWxsjgkKbk9fnq7v80cQOtVHMwK23hC63dpON
   GphAprQ+QNgKJ0j6dGjfNeUqfQiwEePhd7+BebAKHFe6e/eFMj5E2CYZo
   0PyfgqfxAezRHLphJHE5wz4x4Qu68YCc094dNwVhrsvm0t0ArfobTj4Im
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="697865"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="697865"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 16:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="933233664"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="933233664"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Oct 2023 16:44:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwWUg-000BHr-1Y;
	Fri, 27 Oct 2023 23:43:58 +0000
Date: Sat, 28 Oct 2023 07:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 8/14]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6365:6: warning:
 no previous declaration for 'amdgpu_dm_connector_funcs_force'
Message-ID: <202310280734.O4sTUxKG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   43687fc30e87bae87e23591557473682303a6e65
commit: 43dc8a0869e8a553da76e60f129dbc0d07b3f9b0 [8/14] UPSTREAM: drm/amd/display: implement force function in amdgpu_dm_connector_funcs
config: x86_64-randconfig-016-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280734.O4sTUxKG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280734.O4sTUxKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280734.O4sTUxKG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6365:6: warning: no previous declaration for 'amdgpu_dm_connector_funcs_force' [-Wmissing-declarations]
    void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/amdgpu_dm_connector_funcs_force +6365 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6364	
> 6365	void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
  6366	{
  6367		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
  6368		struct dc_link *dc_link = aconnector->dc_link;
  6369		struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
  6370		struct edid *edid;
  6371	
  6372		if (!connector->edid_override)
  6373			return;
  6374	
  6375		drm_edid_override_connector_update(&aconnector->base);
  6376		edid = aconnector->base.edid_blob_ptr->data;
  6377		aconnector->edid = edid;
  6378	
  6379		/* Update emulated (virtual) sink's EDID */
  6380		if (dc_em_sink && dc_link) {
  6381			memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
  6382			memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
  6383			dm_helpers_parse_edid_caps(
  6384				dc_link,
  6385				&dc_em_sink->dc_edid,
  6386				&dc_em_sink->edid_caps);
  6387		}
  6388	}
  6389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
