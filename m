Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BAB282F1E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924038; cv=none; b=B/kkzHqRi6bp4xDiAYGb5M9/+WV+LNRpML0Spe6ePBMta5spdcLkwETNrvpysEKno7Z1wg54rti3Ua7AyY61EPtwNCNX14dXx1wGxIilBIdWZWLt3ZWXVmsUQ17S5o2kYRgda8kjOLEQI5XhkF1czF8fLpOMv2TBw7CWK1dkw6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924038; c=relaxed/simple;
	bh=dk5EuCAUpfs886P8L6/pybS5B0uYWxc0neYtz5WKauA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dwNY0VnPcrZnULSl6Io6YZ+Or7YDtS1emOP9OCAh6+GsyjBAl0MUlEQf7xAbObp4t2LQg7ZR+2DEYjyyBEnK1QTRnHgjg8nlOO645QO32X5mr6g66zc39mBkWTy1TwxwzCOoUsETfUrh+O3fTU6QGRiUZj3GO8fctcCBE75VWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKcIQzxV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKcIQzxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790924035; x=1822460035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dk5EuCAUpfs886P8L6/pybS5B0uYWxc0neYtz5WKauA=;
  b=dKcIQzxVbFv5DXGy8Jqc1io+S1RtGQapTmqf093vA+A4NPTlTMssfn+5
   cl73Vjsqlh2k9lxB3hSe7iOzBGBljhckkXQh5XI9rd5DbusEs1bwY5F0F
   ozuovSGsNRf9ZElAQYjkH4zRKFzKZ77JwK+1FyuIIMLD3isTAXTvJVYNC
   3hFd25iU9NHbH+zZ4S+WbTMIwL6GRl6foHczqRcNqcYh2fni4BGHPi2+6
   ZD7VCBKYo0QORvKxxWFCae0iL/uZO6piSRfTymNPxnUwlUDlfxdjyGWeZ
   cJbzDmpd3THtTJ1liRs85buBDdKGvzSvieswCtLb5AQleuV9sapIoiYys
   g==;
X-CSE-ConnectionGUID: VpIGdGMXSrGOu8UdlAAa/w==
X-CSE-MsgGUID: Rz/6ylwrRPm0Diu01Hd7zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90643707"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90643707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 23:53:55 -0700
X-CSE-ConnectionGUID: wb7+luhRS6OASKIoR//nQg==
X-CSE-MsgGUID: vfWw0fVxT7e7F0hli1/nkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284250782"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2026 23:53:51 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCX9R-000000000Rb-04tx;
	Fri, 02 Oct 2026 06:53:49 +0000
Date: Fri, 02 Oct 2026 08:52:50 +0200
From: kernel test robot <lkp@intel.com>
To: Alvin Lee <Alvin.Lee2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [linux-next:master 678/13246] Warning:
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml2=5F0/dml21/sr?=
 =?us-ascii?Q?c/dml2=5Fcore/dml2=5Fcore=5Fdcn6=5Fcalcs=5Fdchub.c:218?=
 function parameter 'copy_width' not described in
 'calculate_tile_aligned_size'
Message-ID: <202610020825.cduaAr2m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: c16d07698fce2e7a0557c4569d426a36eaa8e958 [678/13246] drm/amd/display: Update alt-ch size calculations
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20261002/202610020825.cduaAr2m-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020825.cduaAr2m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020825.cduaAr2m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:98 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'p' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'plane_idx' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'chroma' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'out' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:131 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'p' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'chroma' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'stream_idx' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'plane_idx' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'pre_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'rec_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:169 Cannot find identifier on line:
    * ************************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_first_hdl' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_first_hdl' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_hdl_delta' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_hdl_delta' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'prefetch_swaths' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'total_swaths' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp0_dst_lines' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp1_dst_lines' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'vtotal' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:206 Cannot find identifier on line:
     * *******************************************************************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'copy_width' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'copy_height' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'tile_width' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'tile_height' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'byte_per_pixel' not described in 'calculate_tile_aligned_size'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:299 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:312 function parameter 'p' not described in 'calculate_alt_copy_time_us'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:345 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'p' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'svp_dst_lines' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'plane_idx' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'chroma' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 Excess function parameter 'input' description in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:397 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'p' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'plane_idx' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'chroma' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'out' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:98 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'p' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'plane_idx' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'chroma' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:107 function parameter 'out' not described in 'get_plane_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:131 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'p' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'chroma' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'stream_idx' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'plane_idx' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'pre_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:142 function parameter 'rec_first_hdl_out' not described in 'compute_pre_rec_first_hdl'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:169 Cannot find identifier on line:
    * ************************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_first_hdl' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_first_hdl' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'pre_hdl_delta' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'rec_hdl_delta' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'prefetch_swaths' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'total_swaths' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp0_dst_lines' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'svp1_dst_lines' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:187 function parameter 'vtotal' not described in 'calculate_copy_swaths'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:206 Cannot find identifier on line:
     * *******************************************************************************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'copy_width' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'copy_height' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'tile_width' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'tile_height' not described in 'calculate_tile_aligned_size'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:218 function parameter 'byte_per_pixel' not described in 'calculate_tile_aligned_size'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:299 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:312 function parameter 'p' not described in 'calculate_alt_copy_time_us'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:345 Cannot find identifier on line:
    * *****************************************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'p' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'svp_dst_lines' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'plane_idx' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 function parameter 'chroma' not described in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:365 Excess function parameter 'input' description in 'calculate_ub_copy_size_per_plane_per_dpp_per_svp'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:397 Cannot find identifier on line:
    * ***********************************************************************************************************
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'p' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'plane_idx' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'chroma' not described in 'calculate_swath_params'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c:411 function parameter 'out' not described in 'calculate_swath_params'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
