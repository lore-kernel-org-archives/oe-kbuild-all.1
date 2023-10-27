Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477D3FB20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 21:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7mJT7PD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698441899; x=1729977899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDc70UySZLbXTyIgl5P/bDR1qx8d3mwfTL90mupLEFg=;
  b=E7mJT7PDZ90PVB+ebSRIkIY5iQY+pHw01pIi6DlW0L+hGZYSK2hg9Gtq
   Y9BM7SAAIXEIVXdRBk8R0kzr7ef5B11ltogS2zmGx6ULd4dlIZ2mU5mrt
   iGg94WvurJ/CNyR0H2eHibEpOcQT5NYzE8HjrSQC2pqgxBW2YpmFBa3AK
   48GDaYU3NO5TpAdIgQRNBo9D1Wp0LrLiC53sC3lJJKpF0L2CJSgzM2zh9
   9yt2tTRQKZJm5Amu905c2sicFAeDnHPW03N1IfqhHxn0FVbFWiqsD4mYK
   pCwgrgBrAti9OnTN+VMNjYA0OacfFMyGE4xh0E0JJvggOX/IC5+uQ8caj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="368067500"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="368067500"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 14:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="1006866420"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="1006866420"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2023 14:24:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwUK7-000BCx-1e;
	Fri, 27 Oct 2023 21:24:55 +0000
Date: Sat, 28 Oct 2023 05:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 8/12]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6365:6: warning:
 no previous prototype for 'amdgpu_dm_connector_funcs_force'
Message-ID: <202310280554.fPJIgwZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   9600f33d056764b4ab3ca9c9f45f3a450a600156
commit: 43dc8a0869e8a553da76e60f129dbc0d07b3f9b0 [8/12] UPSTREAM: drm/amd/display: implement force function in amdgpu_dm_connector_funcs
config: i386-buildonly-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280554.fPJIgwZ8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280554.fPJIgwZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280554.fPJIgwZ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6365:6: warning: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Wmissing-prototypes]
    6365 | void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
