Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B166B3E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537924; cv=none; b=ENHbmudSMjOtJ0WIaRfWgO8SiykiDqVCHN0KqIZusRMkgdRFCHw+qCIgR/eCWpuad1bDEVEhYyPcIg975xCdAnqnwQvC7cMRyyosueitU9ob7hAvawmkcEGIl+ORsx/XUcJAQwh5tnCcbOMhZ7p+O3nE4g7ovzv+IMJpUgFVgSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537924; c=relaxed/simple;
	bh=KSQZck7O6mUu4QVxAA8rXMqkGE1XWItAIOWVLb15cuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0PADDsGrr23V6K29xceuMKqjhGoXeKUxzigMk/dEPfw8HdfkFN/KRb3RSyELZ5k6KlvkoIJeS4qZbZnWi2oNHrq66+K8mEy+eH2D4TSrbn0P8dTNumCKfcAW6NyhWvdRbhAP4hnhQKSunGV+i8/3rFmta2IXDw8E+yomidNok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtcGHJ8S; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtcGHJ8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706537922; x=1738073922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSQZck7O6mUu4QVxAA8rXMqkGE1XWItAIOWVLb15cuw=;
  b=PtcGHJ8S1AwDfZ/RRQruJhtpJXec5AyhCv237rRY67HpYtENxURvPeKv
   m6LguBZHcL9hhqNSGZUtxMb5sNqKmZxM2g7NiTY22Hi38LhkPqHLpPzRB
   jzRM3XHzeaAcOiRCZz4W74pjdjMxSpSpyo3bmQ78AUct7JSRJFo2g6J5Z
   V+kKfR4+wm7jM2DcYPmRxkeIXDQeqLX9wFQM+o5r1YzWOOKwZOBV/gei/
   gBO3Oen+32akkWchq9VD55OTN0+agRNknzTZgUw3I/ylGLmnXdYCBQeuw
   t6ZcqoFK9l9hQI1W2n9Q8DADHQYjJaFINogqOgd7bLbVes7Yyiyj2Na2L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="406684176"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="406684176"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 06:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29527913"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2024 06:18:39 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUST6-0004Ko-0b;
	Mon, 29 Jan 2024 14:18:36 +0000
Date: Mon, 29 Jan 2024 22:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] drm/amd/display: fix null-pointer dereference on
 edid reading
Message-ID: <202401292240.ZOQBYHFf-lkp@intel.com>
References: <20240126163429.56714-2-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126163429.56714-2-mwen@igalia.com>

Hi Melissa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8-rc1]
[also build test WARNING on linus/master next-20240129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-fix-null-pointer-dereference-on-edid-reading/20240127-010342
base:   v6.8-rc1
patch link:    https://lore.kernel.org/r/20240126163429.56714-2-mwen%40igalia.com
patch subject: [RFC PATCH 1/2] drm/amd/display: fix null-pointer dereference on edid reading
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240129/202401292240.ZOQBYHFf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292240.ZOQBYHFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292240.ZOQBYHFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_connector_funcs_force':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6541:26: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6541 |         aconnector->edid = edid;
         |                          ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'create_eml_sink':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6600:26: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6600 |         aconnector->edid = edid;
         |                          ^


vim +/const +6541 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

14f04fa4834a51 Alex Deucher  2020-02-04  6519  
dae343b343ff74 Arnd Bergmann 2023-05-01  6520  static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
0ba4a784a14592 Alex Hung     2023-04-05  6521  {
0ba4a784a14592 Alex Hung     2023-04-05  6522  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
0ba4a784a14592 Alex Hung     2023-04-05  6523  	struct dc_link *dc_link = aconnector->dc_link;
0ba4a784a14592 Alex Hung     2023-04-05  6524  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
e8e134507fe4c2 Melissa Wen   2024-01-26  6525  	const struct drm_edid *drm_edid;
e8e134507fe4c2 Melissa Wen   2024-01-26  6526  	const struct edid *edid;
0ba4a784a14592 Alex Hung     2023-04-05  6527  
0e859faf8670a7 Alex Hung     2023-08-25  6528  	/*
0e859faf8670a7 Alex Hung     2023-08-25  6529  	 * Note: drm_get_edid gets edid in the following order:
0e859faf8670a7 Alex Hung     2023-08-25  6530  	 * 1) override EDID if set via edid_override debugfs,
0e859faf8670a7 Alex Hung     2023-08-25  6531  	 * 2) firmware EDID if set via edid_firmware module parameter
0e859faf8670a7 Alex Hung     2023-08-25  6532  	 * 3) regular DDC read.
0e859faf8670a7 Alex Hung     2023-08-25  6533  	 */
e8e134507fe4c2 Melissa Wen   2024-01-26  6534  	drm_edid = drm_edid_read(connector);
e8e134507fe4c2 Melissa Wen   2024-01-26  6535  
e8e134507fe4c2 Melissa Wen   2024-01-26  6536  	if (!drm_edid) {
0e859faf8670a7 Alex Hung     2023-08-25  6537  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
0ba4a784a14592 Alex Hung     2023-04-05  6538  		return;
0e859faf8670a7 Alex Hung     2023-08-25  6539  	}
e8e134507fe4c2 Melissa Wen   2024-01-26  6540  	edid = drm_edid_raw(drm_edid);
0ba4a784a14592 Alex Hung     2023-04-05 @6541  	aconnector->edid = edid;
0ba4a784a14592 Alex Hung     2023-04-05  6542  
0ba4a784a14592 Alex Hung     2023-04-05  6543  	/* Update emulated (virtual) sink's EDID */
0ba4a784a14592 Alex Hung     2023-04-05  6544  	if (dc_em_sink && dc_link) {
0ba4a784a14592 Alex Hung     2023-04-05  6545  		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
e8e134507fe4c2 Melissa Wen   2024-01-26  6546  		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);
0ba4a784a14592 Alex Hung     2023-04-05  6547  		dm_helpers_parse_edid_caps(
0ba4a784a14592 Alex Hung     2023-04-05  6548  			dc_link,
0ba4a784a14592 Alex Hung     2023-04-05  6549  			&dc_em_sink->dc_edid,
0ba4a784a14592 Alex Hung     2023-04-05  6550  			&dc_em_sink->edid_caps);
0ba4a784a14592 Alex Hung     2023-04-05  6551  	}
0ba4a784a14592 Alex Hung     2023-04-05  6552  }
0ba4a784a14592 Alex Hung     2023-04-05  6553  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
