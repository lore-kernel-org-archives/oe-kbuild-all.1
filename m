Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD248A41
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 03:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728704934; cv=none; b=qkipCGThXjeJzAAOlIL65q53fyqUuV9Azq0g7wSGJNfaEEIXBTwogRVMz1Cm9LA5nGKlwZvzrunB1ci72ZMTqhJLun7Qk3HxjG2g8q+o1Rnr8ZjYm8WLX2Wf0THoOpsu306a37NrMwpAm7ACpTsVex7MqiFjNY5IgMf8wCP3IA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728704934; c=relaxed/simple;
	bh=MLZ2krUtgwvrEmzNbcMhRbMbdaHRXtzMtZmnIqTUmuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGsXO7SvuvWPQEdQk2liIbWKJNjiFrt+5SMxMuGTcZMOBJNEhpe0gWm+U1KUTQuiX5JVvGho8tLJ5uxqVYyKdU0GykERL7MKf7tdXczoubz50td4ROXbKdtjaDT4GmS9BfjajqixggxnVnMgZoi1UNCDnvDNGSwgXvfU+F6Y910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VW8nG1ga; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VW8nG1ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728704933; x=1760240933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLZ2krUtgwvrEmzNbcMhRbMbdaHRXtzMtZmnIqTUmuA=;
  b=VW8nG1gaMg9lJdmuJ4/RFjIcAoidD7ICVu/paeA8F4jftUE5zwaOsqfA
   PQhOy23XPUqyZrNT70uhVs6HWszZzlbgZhoyzqESz28aziXndfvpITgu0
   qYpzprOMiLVs417Q4s/SU+6pQopfI4qRyNIwPi653jfRAxdKq1ktCjnoy
   Ih8RfRpzfckOF/Gaw4imhG+dIO+BsN72Hdjf4nHmekVtkWKkGtOV/jsKV
   8l9lyPdo5nKq4vih5nNBnxG+0i81nIlKNzSoBQgvim6EFAzuz6HFMSFSW
   JKU/8vXbv5C2RPwsdcz39IiOcYyuWASyUooo3b7Bq19vxtY6VM9rWvQML
   w==;
X-CSE-ConnectionGUID: vNoylYBBRB2aQe/y03kkDQ==
X-CSE-MsgGUID: O1HB0w+TTSmRT8BPwkRGGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50658014"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="50658014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 20:48:52 -0700
X-CSE-ConnectionGUID: cE632iSHQFGbqmDtEauGLw==
X-CSE-MsgGUID: TjCmuQnsR6uUVucbA5qE5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77906769"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 20:48:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szT7Y-000D1D-2K;
	Sat, 12 Oct 2024 03:48:48 +0000
Date: Sat, 12 Oct 2024 11:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14726/22157]
 drivers/gpu/drm/evdi/evdi_drm_drv.c:31:23: sparse: sparse: symbol
 'evdi_painter_ioctls' was not declared. Should it be static?
Message-ID: <202410121141.U4zfrLR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   02f7b4a245a8145dae0565f010ac1e00d499e6d5
commit: 68a6e4bd917d9ecc99d9aae5887bf346532ffda1 [14726/22157] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: i386-randconfig-062-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121141.U4zfrLR8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121141.U4zfrLR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121141.U4zfrLR8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/evdi/evdi_drm_drv.c:31:23: sparse: sparse: symbol 'evdi_painter_ioctls' was not declared. Should it be static?
--
>> drivers/gpu/drm/evdi/evdi_cursor.c:234:36: sparse: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/evdi/evdi_gem.c:290:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *vmapping @@
   drivers/gpu/drm/evdi/evdi_gem.c:290:60: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/evdi/evdi_gem.c:290:60: sparse:     got void *vmapping
--
>> drivers/gpu/drm/evdi/evdi_painter.c:961:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *edid_data @@     got unsigned char const *[noderef] edid @@
   drivers/gpu/drm/evdi/evdi_painter.c:961:49: sparse:     expected void const [noderef] __user *edid_data
   drivers/gpu/drm/evdi/evdi_painter.c:961:49: sparse:     got unsigned char const *[noderef] edid
>> drivers/gpu/drm/evdi/evdi_painter.c:1334:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char const *[noderef] buffer @@
   drivers/gpu/drm/evdi/evdi_painter.c:1334:54: sparse:     expected void const [noderef] __user *from
   drivers/gpu/drm/evdi/evdi_painter.c:1334:54: sparse:     got unsigned char const *[noderef] buffer
>> drivers/gpu/drm/evdi/evdi_painter.c:961:46: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/evdi/evdi_painter.c:1334:51: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/evdi/evdi_painter.c:1334:51: sparse: sparse: dereference of noderef expression

vim +/evdi_painter_ioctls +31 drivers/gpu/drm/evdi/evdi_drm_drv.c

    30	
  > 31	struct drm_ioctl_desc evdi_painter_ioctls[] = {
    32		DRM_IOCTL_DEF_DRV(EVDI_CONNECT, evdi_painter_connect_ioctl, EVDI_DRM_UNLOCKED),
    33		DRM_IOCTL_DEF_DRV(EVDI_REQUEST_UPDATE, evdi_painter_request_update_ioctl, EVDI_DRM_UNLOCKED),
    34		DRM_IOCTL_DEF_DRV(EVDI_GRABPIX, evdi_painter_grabpix_ioctl, EVDI_DRM_UNLOCKED),
    35		DRM_IOCTL_DEF_DRV(EVDI_DDCCI_RESPONSE, evdi_painter_ddcci_response_ioctl, EVDI_DRM_UNLOCKED),
    36		DRM_IOCTL_DEF_DRV(EVDI_ENABLE_CURSOR_EVENTS, evdi_painter_enable_cursor_events_ioctl, EVDI_DRM_UNLOCKED),
    37	};
    38	
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
