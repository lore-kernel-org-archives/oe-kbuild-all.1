Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFB3016F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671565; cv=none; b=H124aN1N4/x16t0euoDYxyQObyhfDq7aBWtA0DyQY+wMc6AUK2Bo/umgqNvMsPwDqmRCpOj7GooIVy/s9dPaVsqplbHcHUI/ls3S6OMYQ2t368bdOs52q0xPND8IqF0YGk2NYQLgb3ta87QYV9ksoPHPX8+mds3E+d8rkBZXujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671565; c=relaxed/simple;
	bh=u0QrbCp22T5WZPI0IqiMKGNlHbZbfyCrB/cGyQPJ2Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ig6PstaRKkFYJZmjD32B/Z5RPA9q80K0Uqa72D8jzVRV/7YLf1BJRFfsVN3EXLUfKKXXLzoz2Mta/WwyWT2Ko+QfL5tua9JyeMF6uzj3AAKdy1Otd3WqN+OVPWZ+NgZexxW6GI0GhyTVzt/AXV8e/PmczIBJn9vHhD9k2GTWASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGNGcsmZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGNGcsmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776671564; x=1808207564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0QrbCp22T5WZPI0IqiMKGNlHbZbfyCrB/cGyQPJ2Ag=;
  b=UGNGcsmZYu1rOrXSKBFEXSjo/eNWU+QUSvp8nPrECFKLVqxXYdLRVzI0
   ZjQtU/16AZPQ1+P/E9QmZ6rbZa7Fz8eWIoX8shzMLTviBTQ5u+AwMwybG
   vmhVj1ExJ3lThaT/weFS3I7aVF3UlIOVhmY7PYhPNVIAfcrOWeuhgbs9+
   m6H7eo0zYhQeHsp6j7lhYc+r1i/VTRVx6qQNdA5r0CJqAgBHLNesXFJUu
   askzoHBnRuUcCxoZV+yTSNiaBmdfdgWWKQKRfpkClk0/AQAC/Ehpxxb4d
   vjrwAVc6V/D7K4aHYhKMTrD1FC5+pywBB/gaBIcXmzDTKOIu6N9qPGF5s
   g==;
X-CSE-ConnectionGUID: H2WovgldSMeq+va79U6psA==
X-CSE-MsgGUID: KAO7YV3yTX6RX2ePwzIreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77594291"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77594291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 00:52:40 -0700
X-CSE-ConnectionGUID: qyrGmVaaSaGx3zipyujpcQ==
X-CSE-MsgGUID: FdxXKaqbQPylFa4B7UW9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="227315027"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Apr 2026 00:52:38 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEjQq-000000002G0-0Yws;
	Mon, 20 Apr 2026 07:52:36 +0000
Date: Mon, 20 Apr 2026 15:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:submit/dyndbg-classmap-foundation 56/65]
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: warning: data definition has
 no type or storage class
Message-ID: <202604201509.rQgPbHkD-lkp@intel.com>
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
commit: 5d847645d23e37b2124a11822d6dad274ddd1534 [56/65] drm/imx: Register DRM classmap
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260420/202604201509.rQgPbHkD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201509.rQgPbHkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604201509.rQgPbHkD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: warning: data definition has no type or storage class
      20 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Wimplicit-int]
   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +20 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c

    15	
    16	#include <drm/clients/drm_client_setup.h>
    17	#include <drm/drm_atomic.h>
    18	#include <drm/drm_atomic_helper.h>
    19	#include <drm/drm_drv.h>
  > 20	DRM_CLASSMAP_USE(drm_debug_classes);
    21	#include <drm/drm_dumb_buffers.h>
    22	#include <drm/drm_fbdev_dma.h>
    23	#include <drm/drm_fourcc.h>
    24	#include <drm/drm_gem_dma_helper.h>
    25	#include <drm/drm_gem_framebuffer_helper.h>
    26	#include <drm/drm_managed.h>
    27	#include <drm/drm_of.h>
    28	#include <drm/drm_probe_helper.h>
    29	#include <drm/drm_vblank.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
