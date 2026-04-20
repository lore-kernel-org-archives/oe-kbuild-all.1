Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04173164A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692707; cv=none; b=GpvVIF+lHefwYQ69Tl7Epfm8eaqZL2U3WEH3fXSXt5/s8O3YZYgEQiAyFNC+wB5wPI43ehxCgt3k/aRORyfjDaYc6UuRSU2Ux4sl3O19lOR5oD5e6Vo/cOeSTMpoWRT3uwTJs/W/3pV4wSVEEoyV0MyUtoHZjFpoi7W8QUflex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692707; c=relaxed/simple;
	bh=FTD1aHTYawtMrCvcwCn7qrQimtLFz8N7P9QTRAeihPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DNpe6b0lI5Jv4acCt6j8v23H/qhqJj5Z0+64m5oDG59yCY+B9p8iMWuCaoI944KxRxMEtmVIAYI2MiT3qZ+kLHYcQlW7lElQPSqJtSe4MPC9ncBRNeOsriYMcM88HKHY+Z8nlSwi1YHj5aftm9BZmnR/iEcTBC1PMVDO4NSBXjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0/nII5c; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0/nII5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776692705; x=1808228705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTD1aHTYawtMrCvcwCn7qrQimtLFz8N7P9QTRAeihPY=;
  b=m0/nII5c/opN9YwIv+gyQkMhWRxOFOCKR9ECfB+T7NtXNHTQ6yfiCUWH
   PDJKZhLlIh7CIdgokJZniWcbQqkBkfcAXCnkcRMmtGKFnpIO0fhdylMNK
   QC5DyeJW2sdgMsuFrWvUanHILd5xNZIJwv0NzICXKv/lvSc4zruHD81wU
   EI6c45q2MPbaMiLgaV88ZBd3ZhZlUinCB2N2+oTJraBCE3dIJh/PwaqGw
   KO21KcfaCx5ilpzA/clGTSF9ggJVrz2lqd1VgGIZWTgfdD5HV35oi2CUA
   rvpsu4RiDOF9+SIrPgp+kVY7vdOxo0aSzYTKVtGJa9KKMqqrcFBJg3bgc
   Q==;
X-CSE-ConnectionGUID: BiEzb0ptSxaKxMfFhyOPxQ==
X-CSE-MsgGUID: eHrZZx55Sf2q4yG6s6ZgsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77483494"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77483494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 06:45:04 -0700
X-CSE-ConnectionGUID: u9otFlftQ2aF9B68g7an6Q==
X-CSE-MsgGUID: Ah1CPosQTbCsexOwThv2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="229042655"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Apr 2026 06:45:03 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEovs-000000002QW-1yii;
	Mon, 20 Apr 2026 13:45:00 +0000
Date: Mon, 20 Apr 2026 21:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:submit/dyndbg-classmap-foundation 55/65]
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:21:1: warning: parameter
 names (without types) in function declaration
Message-ID: <202604202102.4L7GDng3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git submit/dyndbg-classmap-foundation
head:   2d70490631040349cc146532e1238a579f148957
commit: a90642ac412013292f8acac1501e4ace018e5238 [55/65] drm/hibmc: Register DRM classmap
config: x86_64-randconfig-076-20260420 (https://download.01.org/0day-ci/archive/20260420/202604202102.4L7GDng3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604202102.4L7GDng3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604202102.4L7GDng3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:21:1: warning: data definition has no type or storage class
      21 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:21:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Werror=implicit-int]
>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:21:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +21 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c

    17	
    18	#include <drm/clients/drm_client_setup.h>
    19	#include <drm/drm_atomic_helper.h>
    20	#include <drm/drm_drv.h>
  > 21	DRM_CLASSMAP_USE(drm_debug_classes);
    22	#include <drm/drm_fbdev_ttm.h>
    23	#include <drm/drm_gem_framebuffer_helper.h>
    24	#include <drm/drm_gem_vram_helper.h>
    25	#include <drm/drm_managed.h>
    26	#include <drm/drm_module.h>
    27	#include <drm/drm_vblank.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
