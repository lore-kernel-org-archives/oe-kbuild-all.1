Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F4C26A087
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313087; cv=none; b=dDd/JK/0kXCoeTqj7pOvDCglex+Q04DwTIbuLwPVGFZ1qvHm0N66qfHXLHm0IkXbukyOWWWYb0yhbyG+Qu4EDxMWQlFLpNuB/Yss9AVt79++Wi/LR2PkU0OEQHn/bcn3DqaHn+ATOT0nxn9ADEct0S3+IST7cYKSDmpsR7jMSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313087; c=relaxed/simple;
	bh=CmqoqyByWBNnEyDUT9tSzlIpJJdBAVXuVHodHyYY3mY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPS+TiZCePizMgYZyXzMME4FjVAa505BGBO7+E8ehQh0dCvvXKRZ0kAn4dB5oVKEtSRIL2MChZp3sL6GWWNHMzpt5j6N1ESfUwp1AVRTlsY5Q7QoWCmzr42JQv/miSX4G7VK5l3Dpq36sd9w/IZU9wxns7tnaQ1zCqmDdNO1wVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWJfY16f; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWJfY16f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739313085; x=1770849085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmqoqyByWBNnEyDUT9tSzlIpJJdBAVXuVHodHyYY3mY=;
  b=DWJfY16fbrVWJboJZTpPKJI1+/esVsZmbXQijASna/BLrPFjfqGDuB+U
   QFxuFzI8EuCF09GFYQ/g2UGhlKpfZni0s1E57tdyeyNPq3NMuqRMBmaCt
   LpVOY1nm6SrQ5i0maIszYIhkcluCs2+M7AK7No31i8y0emSew3vPTF+MH
   uigU9S8R88o4QcOllDR4PdH04UC4+RCIW7t9cy1gvdXqAM6yr7IoA9zeJ
   RlIpeS19FbPW2DulBuYXf28Ap/kfOBi0d9/mic8TquD0eleX9haAI1XTK
   upSJRF/K916kfkrOAbVfhau5vs6ieeNqIWWHJLYgffEDNJROiPBtqfvVr
   A==;
X-CSE-ConnectionGUID: U7qaRtgBQVO3tU354v3d3g==
X-CSE-MsgGUID: Wh+6gBSOSnyaPD66IboQLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57486822"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57486822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 14:31:14 -0800
X-CSE-ConnectionGUID: 7lD+IT6XQ9iIw5Xp/+MbhQ==
X-CSE-MsgGUID: 1zjIErfYRAGrFMG2nzSihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113121964"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 14:31:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thymc-0014mR-23;
	Tue, 11 Feb 2025 22:31:10 +0000
Date: Wed, 12 Feb 2025 06:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 229/229]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:3370:12: warning: variable 'data' set
 but not used
Message-ID: <202502120603.J6VilCJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   69fc64873274f4b1c5a6c4617cc39b8d59fafbdf
commit: 8fd26707ff2ec98f3a31cafc54c74a1399171b24 [229/229] CHROMIUM: drm/mediatek: Add dp and dp_intf base
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120603.J6VilCJI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120603.J6VilCJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120603.J6VilCJI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_video_config_v2':
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:3370:12: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3370 |         u8 data;
         |            ^~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: At top level:
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4043:18: warning: initialized field overwritten [-Woverride-init]
    4043 |         .reset = drm_atomic_helper_connector_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4043:18: note: (near initialization for 'mtk_dp_con_funcs.reset')
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_bridge_atomic_get_input_bus_fmts_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4285:43: warning: variable 'state' set but not used [-Wunused-but-set-variable]
    4285 |         struct drm_dp_mst_topology_state *state;
         |                                           ^~~~~
--
>> drivers/gpu/drm/mediatek/mtk_dpi_v2.c:175: warning: Function parameter or member 'use_version_2' not described in 'mtk_dpi_conf'


vim +/data +3370 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  3365	
  3366	static void mtk_dp_video_config_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
  3367	{
  3368		struct dp_timing_parameter *dp_timing = &mtk_dp->info[encoder_id].dp_output_timing;
  3369		struct videomode vm = {0};
> 3370		u8 data;
  3371	
  3372		if (!mtk_dp->dp_ready) {
  3373			dev_err(mtk_dp->dev, "%s, DP is not ready\n", __func__);
  3374			return;
  3375		}
  3376	
  3377		data = mtk_dp->dsc_enable[encoder_id];
  3378	
  3379		mtk_dp_mn_overwrite_v2(mtk_dp, encoder_id, false, 0x0, 0x8000);
  3380	
  3381		vm.hactive = mtk_dp->mode[encoder_id].hdisplay;
  3382		vm.hfront_porch = mtk_dp->mode[encoder_id].hsync_start - mtk_dp->mode[encoder_id].hdisplay;
  3383		vm.hsync_len = mtk_dp->mode[encoder_id].hsync_end - mtk_dp->mode[encoder_id].hsync_start;
  3384		vm.hback_porch = mtk_dp->mode[encoder_id].htotal - mtk_dp->mode[encoder_id].hsync_end;
  3385		vm.vactive = mtk_dp->mode[encoder_id].vdisplay;
  3386		vm.vfront_porch = mtk_dp->mode[encoder_id].vsync_start - mtk_dp->mode[encoder_id].vdisplay;
  3387		vm.vsync_len = mtk_dp->mode[encoder_id].vsync_end - mtk_dp->mode[encoder_id].vsync_start;
  3388		vm.vback_porch = mtk_dp->mode[encoder_id].vtotal - mtk_dp->mode[encoder_id].vsync_end;
  3389		vm.pixelclock = mtk_dp->mode[encoder_id].clock * 1000;
  3390	
  3391		dp_timing->frame_rate = mtk_dp->mode[encoder_id].clock * 1000 /
  3392					mtk_dp->mode[encoder_id].htotal / mtk_dp->mode[encoder_id].vtotal;
  3393		dp_timing->htt = mtk_dp->mode[encoder_id].htotal;
  3394		dp_timing->hbp = vm.hback_porch;
  3395		dp_timing->hsw = vm.hsync_len;
  3396		dp_timing->hsp = mtk_dp->mode[encoder_id].flags & DRM_MODE_FLAG_PHSYNC;
  3397		dp_timing->hfp = vm.hfront_porch;
  3398		dp_timing->hde = vm.hactive;
  3399		dp_timing->vtt = mtk_dp->mode[encoder_id].vtotal;
  3400		dp_timing->vbp = vm.vback_porch;
  3401		dp_timing->vsw = vm.vsync_len;
  3402		dp_timing->vsp = mtk_dp->mode[encoder_id].flags & DRM_MODE_FLAG_PVSYNC;
  3403		dp_timing->vfp = vm.vfront_porch;
  3404		dp_timing->vde = vm.vactive;
  3405	
  3406		dev_dbg(mtk_dp->dev, "frame_rate:%d\n", dp_timing->frame_rate);
  3407		dev_dbg(mtk_dp->dev, "htt:%d\n", dp_timing->htt);
  3408		dev_dbg(mtk_dp->dev, "hbp:%d\n", dp_timing->hbp);
  3409		dev_dbg(mtk_dp->dev, "hsw:%d\n", dp_timing->hsw);
  3410		dev_dbg(mtk_dp->dev, "hsp:%d\n", dp_timing->hsp);
  3411		dev_dbg(mtk_dp->dev, "hfp:%d\n", dp_timing->hfp);
  3412		dev_dbg(mtk_dp->dev, "hde:%d\n", dp_timing->hde);
  3413		dev_dbg(mtk_dp->dev, "vtt:%d\n", dp_timing->vtt);
  3414		dev_dbg(mtk_dp->dev, "vbp:%d\n", dp_timing->vbp);
  3415		dev_dbg(mtk_dp->dev, "vsw:%d\n", dp_timing->vsw);
  3416		dev_dbg(mtk_dp->dev, "vsp:%d\n", dp_timing->vsp);
  3417		dev_dbg(mtk_dp->dev, "vfp:%d\n", dp_timing->vfp);
  3418		dev_dbg(mtk_dp->dev, "vde:%d\n", dp_timing->vde);
  3419	
  3420		mtk_dp_mn_calculate_v2(mtk_dp, encoder_id);
  3421	
  3422		/* interlace not support */
  3423		dp_timing->video_ip_mode = DP_VIDEO_PROGRESSIVE;
  3424		mtk_dp_msa_set_v2(mtk_dp, encoder_id);
  3425	
  3426		mtk_dp_set_misc_v2(mtk_dp, encoder_id);
  3427		if (mtk_dp->info[encoder_id].pattern_gen)
  3428			mtk_dp_pg_type_sel_v2(mtk_dp, encoder_id,
  3429					      DP_PG_VERTICAL_COLOR_BAR,
  3430					      DP_PG_PURECOLOR_BLUE,
  3431					      0xfff,
  3432					      DP_PG_LOCATION_ALL);
  3433	
  3434		if (!mtk_dp->dsc_enable[encoder_id]) {
  3435			mtk_dp_color_set_depth_v2(mtk_dp, encoder_id, mtk_dp->info[encoder_id].depth);
  3436			mtk_dp_color_set_format_v2(mtk_dp, encoder_id, mtk_dp->info[encoder_id].format);
  3437		}
  3438	}
  3439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
