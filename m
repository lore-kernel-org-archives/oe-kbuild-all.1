Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E739EF1F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705811; cv=none; b=clJxq6wX7tK5Vog6Bo8ibPK2JbSJ2Zu11OYglezYukiond1XlqLgsGaJg7oKTX4nU7eBc9MEzRb77pEcxfxEw3WOegoOV33jMVlCyLNvzWeFDLgstqNu/4VzQx5Hvdepw68PKmrc4cpa5F91Rz5KIQ5oRGE7F/L9tLuIldksUX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705811; c=relaxed/simple;
	bh=RUEjuOoGIj8whWJpCP4MF0UsM2q7mvXFJp0OasE+LcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H/VDNggjClQ0IIJA1FWtpE1Y+Y8Su4mOcKT+MaBmH4ivaGzgPCaPIM+3/b4gup3wUdU4lEfwF1EM5AKFqjbErDn3iDSEUXH2GKGWndVq8KMI8O2bcA+9j1GJqRyo0CFM8gHKW52MTgQy/koKn7rF0KMOAzH5QUq7uQobqwpz1sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWwW8Zs+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWwW8Zs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776705810; x=1808241810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RUEjuOoGIj8whWJpCP4MF0UsM2q7mvXFJp0OasE+LcI=;
  b=cWwW8Zs+G6vnrsix+y7LfwNf8b9C7Yb7DD0Y9L0LLZWYz9Zg3+M3BRzZ
   uZlm0zOXeuUQQgTvwrjk2plumSeQNOLnq7UYLpc6cASRC7+lxxnqT9F1M
   7rHSsRNf3xd04VTCk/G0DEARoHpwso95PiV+wRYRizkTuyEGJuLVIBEJq
   suxBER3Zdi10VsECJ/W658o93RRQIAS2RZgu1E0cM2CndOzCdf44WpqxB
   8+Zhe4yqrrhXyNPH+1OhuXT3Emp/TaGzKBf0fxOlxUZ5pMvHvIDIuN/z+
   25WUYIEB0RpkpNDtDoY6LSkPviU/QYytyoS5W8A4uIarvJAfEPV3TE9JX
   w==;
X-CSE-ConnectionGUID: O+apLIPnR6+I8SHm+JZKfg==
X-CSE-MsgGUID: xb4R7WB3SfqsYgOr/D4iuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87931783"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="87931783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 10:23:29 -0700
X-CSE-ConnectionGUID: D4MOw5fxT5eyXXR/r9hh0A==
X-CSE-MsgGUID: 4zeSUEf6TCihYHK4nGW/+g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2026 10:23:27 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEsLF-000000002hS-07PH;
	Mon, 20 Apr 2026 17:23:25 +0000
Date: Tue, 21 Apr 2026 01:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:submit/dyndbg-classmap-foundation 56/65]
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: error: type defaults to 'int'
 in declaration of 'DRM_CLASSMAP_USE'
Message-ID: <202604210129.ELStMm9r-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260421/202604210129.ELStMm9r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210129.ELStMm9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210129.ELStMm9r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: warning: data definition has no type or storage class
      20 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Wimplicit-int]
>> drivers/gpu/drm/imx/ipuv3/imx-drm-core.c:20:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


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
