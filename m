Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83714A4F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741350668; cv=none; b=UwRShHaV6zue8gJTTu8ASz+1WDfwgN+a5WimRWEveFbIyG6l/TyFM217zCVryWVdIEe7J4caBa/CywGWWpR63/pjOARCu7fcgQVtBtQK9E9ejCSfpTo8yv8g0en9Cy8WlAvsVv5tTG26uOSilCWG4IP0LaOms2HI+xZxzKIgxxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741350668; c=relaxed/simple;
	bh=dpCRN76oKxhQWOtxW3CFJtDv1z8q+T1LLtnFgy15kiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFzQaGvVffIuk05FSCxM+ZVZGFdCA8WsW8Q/StK2/+0MpTVFw4I1eV0jZS/peT1TXzUNVrILaZwv5fS5dfR9wh5DQ69U48jwMop4QaY80DHRdLtvHB4uF2DJgR00ZXmblGJ8AC+/TpvW9UTmNvsw8SAthb5n5vyclvdBNOFq+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyX9IcDJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyX9IcDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741350666; x=1772886666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dpCRN76oKxhQWOtxW3CFJtDv1z8q+T1LLtnFgy15kiE=;
  b=NyX9IcDJMRNFZHQ5/4mtRJB5dz5A6P0PZEUc6cTm+AMwevJoZErJMRoX
   bP6ANgpkmDx5K09ffpR1Emm38V99clL0tlYiWfsx7AVc4C6PGiPTH2JGn
   qBX76nxQ/qofYjr10GMeoLP6+HwDEDolLvRsYXXKH8t6VzQD2OquZo2At
   uGbnfEWCO6SlZnrDJqcNXscdC4DvhHlZocWOLyCIzDQdr9f1PYATAzNdX
   bECYF0EMZEgOGYGHdY5BVUQXk7v/oRjlrvvSMxsQ3OUwhwTat7jTpH3GK
   3DbnmPbZYTSQYFBIaVzCDTZkC3zxbyigGFy1P18kupszIyDi+cdsfpSms
   w==;
X-CSE-ConnectionGUID: 1Op9fRFmT+StzeHbJFvVuw==
X-CSE-MsgGUID: c8k+Qza7QfuWq12rKuZ5YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42274947"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42274947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:31:05 -0800
X-CSE-ConnectionGUID: SPcV756jR9+PtF5Q6KoaUw==
X-CSE-MsgGUID: up90lS0aRHu7HJcHsODaiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124230489"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2025 04:31:04 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWqz-0000Sl-34;
	Fri, 07 Mar 2025 12:31:01 +0000
Date: Fri, 7 Mar 2025 20:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU
 5.x+
Message-ID: <202503072004.KTOFOoOq-lkp@intel.com>
References: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>

Hi Jessica,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d3175a72cc07e90f81fb35841048a8a9b5134cb]

url:    https://github.com/intel-lab-lkp/linux/commits/Jessica-Zhang/drm-msm-dpu-Support-YUV-formats-on-writeback-for-DPU-5-x/20250306-111647
base:   6d3175a72cc07e90f81fb35841048a8a9b5134cb
patch link:    https://lore.kernel.org/r/20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c%40quicinc.com
patch subject: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503072004.KTOFOoOq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072004.KTOFOoOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072004.KTOFOoOq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:235:18: warning: 'wb2_formats_rgb' defined but not used [-Wunused-const-variable=]
     235 | static const u32 wb2_formats_rgb[] = {
         |                  ^~~~~~~~~~~~~~~


vim +/wb2_formats_rgb +235 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

dabfdd89eaa928 Vinod Polimera 2022-04-11  234  
8c16b988ba2d3d Abhinav Kumar  2023-12-12 @235  static const u32 wb2_formats_rgb[] = {
53324b99bd7b4d Abhinav Kumar  2022-04-26  236  	DRM_FORMAT_RGB565,
53324b99bd7b4d Abhinav Kumar  2022-04-26  237  	DRM_FORMAT_BGR565,
53324b99bd7b4d Abhinav Kumar  2022-04-26  238  	DRM_FORMAT_RGB888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  239  	DRM_FORMAT_ARGB8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  240  	DRM_FORMAT_RGBA8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  241  	DRM_FORMAT_ABGR8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  242  	DRM_FORMAT_XRGB8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  243  	DRM_FORMAT_RGBX8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  244  	DRM_FORMAT_XBGR8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  245  	DRM_FORMAT_ARGB1555,
53324b99bd7b4d Abhinav Kumar  2022-04-26  246  	DRM_FORMAT_RGBA5551,
53324b99bd7b4d Abhinav Kumar  2022-04-26  247  	DRM_FORMAT_XRGB1555,
53324b99bd7b4d Abhinav Kumar  2022-04-26  248  	DRM_FORMAT_RGBX5551,
53324b99bd7b4d Abhinav Kumar  2022-04-26  249  	DRM_FORMAT_ARGB4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  250  	DRM_FORMAT_RGBA4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  251  	DRM_FORMAT_RGBX4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  252  	DRM_FORMAT_XRGB4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  253  	DRM_FORMAT_BGR888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  254  	DRM_FORMAT_BGRA8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  255  	DRM_FORMAT_BGRX8888,
53324b99bd7b4d Abhinav Kumar  2022-04-26  256  	DRM_FORMAT_ABGR1555,
53324b99bd7b4d Abhinav Kumar  2022-04-26  257  	DRM_FORMAT_BGRA5551,
53324b99bd7b4d Abhinav Kumar  2022-04-26  258  	DRM_FORMAT_XBGR1555,
53324b99bd7b4d Abhinav Kumar  2022-04-26  259  	DRM_FORMAT_BGRX5551,
53324b99bd7b4d Abhinav Kumar  2022-04-26  260  	DRM_FORMAT_ABGR4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  261  	DRM_FORMAT_BGRA4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  262  	DRM_FORMAT_BGRX4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  263  	DRM_FORMAT_XBGR4444,
53324b99bd7b4d Abhinav Kumar  2022-04-26  264  };
53324b99bd7b4d Abhinav Kumar  2022-04-26  265  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
