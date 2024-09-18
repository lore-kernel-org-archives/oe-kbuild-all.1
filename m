Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD4AD21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 05:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726636741; cv=none; b=O4nxkg4PaWCvm9iOUO8RHSge5YTNl/ylIlsvUFpXIQ+4p7+YYj26tzwfK2xr/ZjPtkJG4keaz8R4XWdpf9R4en39N6+o3Ud2ygQ+VyIR4Yr7jnFOKPMmH0WuiK1tmLdjU9WyIOOSB8WDOJlqgk1+KjBxX7n/0n4roXyUw/X8AOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726636741; c=relaxed/simple;
	bh=SDUE4fWrrncA1lVOglZXO/h2NwzDlR+gNU2GqxwZdPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p++u8H4ywGa1V36RCSV6uA4HRxNqLO2bXMr1UlxxCLRwt5prEhOmkdC2+qCDcBS8WxEt8KCaFxAgWVEjXFYFku7RqkzHThFUrkpJaI+1mPZph7+fAR2FbKpyKh3mmjMaNjsPmYpdyHwMX/PLdAyvs6Cq7QEKigfOlHxvMr5U/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9F4HgC0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9F4HgC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726636740; x=1758172740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SDUE4fWrrncA1lVOglZXO/h2NwzDlR+gNU2GqxwZdPs=;
  b=N9F4HgC01gU+coJTBPVP8/em9x7hv4PbUOF1wl702mJTaA5/ZlrZdGbh
   aIlp36FQI0JBKa+NBeYBCD4FiXSIigtG7BvhPKgOKgBJyRXAcY8qe8Ovx
   irzgal9uwYSYZ7DoZUxV/UHSxi4BipvkG22LEC5qHhuRsq+7CDH//UN6U
   A9cTojcHlag1Un502xImIlAWNraTaIiWN0C1RIHzFf/W+0BrNKHY6PRKL
   XIiJwIJWcFH+yvcL0231vPPYV9C641XIQvSOQeY0JGHfigXmdbDXvcJgC
   O0KMNGNpwjxceexTb6Ba3mhcZfNlMyY2J99XmmM+S7LOonWC8ffP461PC
   w==;
X-CSE-ConnectionGUID: pRQYXHziTLSFJ/AsnfS3HQ==
X-CSE-MsgGUID: RzOwLazQQYyWifAEOs/9Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687313"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25687313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 22:19:00 -0700
X-CSE-ConnectionGUID: ExpYtvH+QrWkC2kgTj0rnw==
X-CSE-MsgGUID: L2NT5etaQxa/B4Vvu2gzjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="100255846"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Sep 2024 22:18:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqn5b-000BtQ-2U;
	Wed, 18 Sep 2024 05:18:55 +0000
Date: Wed, 18 Sep 2024 13:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/28533]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more
 than once.
Message-ID: <202409181303.Acn1Sfd6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   92b88e0e59c946d552fb3d375d60e775a4151ea2
commit: 6e3f7375acdcf714d1fcbae1238cd39cc9391560 [1511/28533] drm/mediatek: config component output by device node port
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181303.Acn1Sfd6-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.

vim +11 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  > 11	#include <linux/of_platform.h>
    12	#include <linux/pm_runtime.h>
    13	#include <linux/dma-mapping.h>
    14	
    15	#include <drm/drm_atomic.h>
    16	#include <drm/drm_atomic_helper.h>
    17	#include <drm/drm_drv.h>
    18	#include <drm/drm_fb_helper.h>
    19	#include <drm/drm_gem.h>
    20	#include <drm/drm_gem_cma_helper.h>
    21	#include <drm/drm_of.h>
    22	#include <drm/drm_probe_helper.h>
    23	#include <drm/drm_vblank.h>
    24	#include <linux/component.h>
    25	#include <linux/iommu.h>
    26	#include <linux/of.h>
    27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
  > 29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
