Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53217946C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726399425; cv=none; b=DKzk1WgCaJ4XTwIScNfLVKu9bK5LRo0Bsy2Nv3gsyvByhypMQ5U2IEsRsGcZOk5jUwS7dgIdHAQUtGR/0BD2feBS2ZBxsZ8ApaPW4b0VF0txdEgIwY1xfEi++V87aB/vty/jINF07YJjVrnNjikLxSubwaHwuFIX6iCKKYHL/7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726399425; c=relaxed/simple;
	bh=y5pR8Ud9iBuGhaJLVc+yIg7Uqb+KYqs5DcAOfCWblGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uc5Y4JEzJzGi1sqaP1XIaGsmaqc28Tew87A8BfxbR1iT5ouDfa4NjcuopH7Uwz9gxDUv5RMouWf37ulJhi826MNXFGo160cbcaTVlhWFVHyHz35m9G22ctJNCcoM8lkoUs1fcdLRafcGKdDWYzX7SDNerbI8eAEG3wOuxJNwhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6VndRSb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6VndRSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726399423; x=1757935423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5pR8Ud9iBuGhaJLVc+yIg7Uqb+KYqs5DcAOfCWblGg=;
  b=A6VndRSbwbHGk8792/CHmjZyHmfRuduiHxOeaM9vtLYAFpkw0/EutkeF
   an8+GP+iYYsSc0SknRiMWdzyzrt2XTPGFDxh/0veK4MmnWKH9TwWL3NlT
   ysEoDybTw2i4xCuKeYKmVyZDoWVHboJVJgyhv1CCVnf1PJxXzYoZluRpX
   Kv5NL3tqf1okmhzx0CpMeq8Jc/0MCnyyrxE/OQfFW1StmKmJEF+ZKRUsX
   hB0qKMHW8sHjSO1ZItpjky2RnLgynBi3qUYDn+7a4S1Hm2NnydFhBQNQ+
   XH5SQnCPeQHrrNgQG50IOyuvZxqg+sG55blFOpwspigc5v2f9zWSyNZNt
   Q==;
X-CSE-ConnectionGUID: PDGgaNYzS/mrL5ooyFjNSQ==
X-CSE-MsgGUID: TJPymmvNRfqshrZc/wwTqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25122699"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25122699"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 04:23:42 -0700
X-CSE-ConnectionGUID: z0+RR+smSzmJ6buc0t4GQw==
X-CSE-MsgGUID: WL88LM4SQ9SMPBDKuOoqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="99453502"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Sep 2024 04:23:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spnLu-0008dS-2C;
	Sun, 15 Sep 2024 11:23:38 +0000
Date: Sun, 15 Sep 2024 19:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/28533]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more
 than once.
Message-ID: <202409151942.pSP63zHi-lkp@intel.com>
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
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151942.pSP63zHi-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.

vim +12 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  > 12	#include <linux/pm_runtime.h>
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
    29	#include <linux/of_platform.h>
  > 30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
