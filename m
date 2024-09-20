Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D16B14D44F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726841758; cv=none; b=Q0Zy/HdwrpovwrVvkkTX0t+ewAaNPcPrwvLSTkZPiQdArhNHqk62cT0yMQlWUQXRiI6usQH4AF63Lfz0WmQFtgFipU9oSKUA78VqGNaW0oDRL27gT8dVpcPOvILYeVmhMO6voqm6whR8kKWgSPcrrvNOmeDi+Il+hUMenrZ30zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726841758; c=relaxed/simple;
	bh=YulM7aGdOy3QNT3kr7r2E5cGOSS/e4AHc4t2PFDVzhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mA2ziYP2pe5XZZRfJu4Cnpbx7Xw2Eq/8zSEiGxUZMX5CX3fdUvcAxXX6L+2ERHOYP08KfdIdrPHp9Li4DAqkN4MjbRb3GqZhYC4M7ftR2sDk7aGHPglRS1I8IS3TYq3AtLIcums8e/ZrtKdI/yrc1DJtn9WSZBNYHTjNkp7gCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acxl+kjt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acxl+kjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726841756; x=1758377756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YulM7aGdOy3QNT3kr7r2E5cGOSS/e4AHc4t2PFDVzhY=;
  b=acxl+kjtZmKaVHJbSj6rRJRmRpPGlGWyFHjXHp5EgCsN+T5QUPfkjbFA
   dtK+YmodEoopv0mUAgS8PRUOwtZGvrpAaol24BZaaTXCY4QBrN6LElI6I
   mnAAKCBjnzq2/bnRq09fwNcRekfwyvJQFfGebUg/InQwx3Yq0y1GDFbD0
   M6Xotpk/qqp1SkhZHun4cd8lzQf9SJEfKvlQwMfC4INhfOQoZugXDMBka
   1q5Oj1VCB5rUg3y1Hb2GUkwOUkJ4xGeBiKvwolkNJLfqLu3iXFPlzU3b/
   04bHNsKWPqUKEmm27TeDYg57B7Jmb+2OBw1zd2zTutRcPu/1Vj5Vnsr2t
   w==;
X-CSE-ConnectionGUID: kMypbtxuQRylFPGLLn8kSg==
X-CSE-MsgGUID: ijLLzkggQ1ioJ+VPnm0Qig==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="26033594"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="26033594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:15:55 -0700
X-CSE-ConnectionGUID: cPH02ioyQ2CtQpWU3ujIlw==
X-CSE-MsgGUID: TD8kBq0fSDKxiUJBKhGGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75078340"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2024 07:15:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sreQK-000EWP-0U;
	Fri, 20 Sep 2024 14:15:52 +0000
Date: Fri, 20 Sep 2024 22:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/28533]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than
 once.
Message-ID: <202409202259.Y8Uldebp-lkp@intel.com>
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
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202259.Y8Uldebp-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.

vim +8 drivers/gpu/drm/mediatek/mtk_drm_drv.c

   > 8	#include <linux/iommu.h>
     9	#include <linux/module.h>
    10	#include <linux/of_address.h>
    11	#include <linux/of_platform.h>
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
  > 25	#include <linux/iommu.h>
    26	#include <linux/of.h>
    27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
    29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
