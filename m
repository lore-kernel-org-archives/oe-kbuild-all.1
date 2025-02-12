Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC23C2F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739320108; cv=none; b=nVzSvsa+dzUaKpHmfQuhh+BljOwc+RS/2QJXmaiuyMfmyHHMKPC1QIvaD9JZPD6TLSLpuJRdrF5ZTw9yIIdWQUyTiQAeaC+xVzdqB4OgeHfYtJWjhxBX1WJGVb8ribIJjGgrMj1B2CwW+zyJu9JQZ3PBIn1xed9hHsN+lsRQ318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739320108; c=relaxed/simple;
	bh=QgScht0fVgp4U2AGEvcVln1UC9ov3Er97sSVfmi2qrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slFbndt7vYYfAVwuSbd987ujSCAftK5bxg+BI/BhPx0vcO/3jZTlwV40pAU5a98kLF2QciwE/QJEHBIQPcuDPb9ZTgCY3A4kZT5i6RJ6wBYGFebhteU7k4SDINJABWIqkItKmBsH44M+byrNkOPEgp+6PZsS1B/V8Swir58dXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/Aaq/s0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/Aaq/s0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739320106; x=1770856106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgScht0fVgp4U2AGEvcVln1UC9ov3Er97sSVfmi2qrg=;
  b=e/Aaq/s0WBYLSOeIY5r6URY7wnLe7XGgvWbOnhSuV+dPFouaG7PCYkIw
   Rk1oGEO+yZMTtvF8Hxz1bGOSKKjemxBwi1Eg09e7S/VGpSuDXRmJZVgeG
   xy9tJTr3+eFcDamPZZy+2gkBrwCJZHB4qtQgu/a4h3zhkmV8w8B7ZygEl
   qtLA8BRKl9d7LNqlJhoRDGyPODZLRWMetI1osaip/wV+IG4gJXzsAaxcl
   GENxq0txvDabvBcfBZYMd3nmn8QzsLkapzoq32H6OljN7zZGJtnSfrcD5
   p5O2bZRsJXKsKWGKm3QOnaEgq0tNQ2yaAogP6eKyEY9f1LdTMTZ/gFoR9
   w==;
X-CSE-ConnectionGUID: Wf8Ifg+7TWuFpPCpxG4Q7w==
X-CSE-MsgGUID: KW8xAVmCSqqnqsblAXi8Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39660056"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39660056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 16:28:25 -0800
X-CSE-ConnectionGUID: qOsczjmOQCmsXz0du8E6pw==
X-CSE-MsgGUID: a8oQGl9vQqOYQyfG2r8RRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112527940"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Feb 2025 16:28:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti0c2-0014sh-1c;
	Wed, 12 Feb 2025 00:28:22 +0000
Date: Wed, 12 Feb 2025 08:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 229/229]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:3909:6: warning: no previous prototype
 for function 'mtk_dp_hdcp_enable'
Message-ID: <202502120836.fGw8EZZL-lkp@intel.com>
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
commit: 218314d73d3257a1468ad9c3f9355adffca0445a [229/229] CHROMIUM: drm/mediatek: Add dp HDCP support for SST mode
config: arm64-randconfig-003-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120836.fGw8EZZL-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120836.fGw8EZZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120836.fGw8EZZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3374:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           u8 data;
              ^
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:3909:6: warning: no previous prototype for function 'mtk_dp_hdcp_enable' [-Wmissing-prototypes]
   void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
        ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
   ^
   static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5665:3: error: call to undeclared function 'mtk_dp_suspend_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_dp_suspend_v2(dev);
                   ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5668:3: error: call to undeclared function 'mtk_dp_resume_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_dp_resume_v2(dev);
                   ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5668:3: note: did you mean 'mtk_dp_read_v2'?
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:319:5: note: 'mtk_dp_read_v2' declared here
   u32 mtk_dp_read_v2(struct mtk_dp *mtk_dp, u32 offset)
       ^
   2 warnings and 2 errors generated.


vim +/mtk_dp_hdcp_enable +3909 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  3908	
> 3909	void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
  3910	{
  3911		if (!mtk_dp->training_info.cable_plug_in || !mtk_dp->dp_ready) {
  3912			dev_dbg(mtk_dp->dev, "cable_plug_in:%d, dp_ready:%d",
  3913			       mtk_dp->training_info.cable_plug_in, mtk_dp->dp_ready);
  3914			return;
  3915		}
  3916	
  3917		dev_dbg(mtk_dp->dev, "[HDCP] dp start HDCP work\n");
  3918		queue_work(mtk_dp->hdcp_workqueue, &mtk_dp->hdcp_work);
  3919	}
  3920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
