Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC154612D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXW1mgFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697922925; x=1729458925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehm7vAbce1ixXy11IZA50m9dNonUPCkrKeuYv9vr0QQ=;
  b=eXW1mgFia2FkyZu5vi8TTASIHapscZvRCNanNrdH5Rri6tvlKdXOZKCx
   xHFNTtrk/9onQhcWbl0M7BM9CWI5FRNO0JvxpgOQnd2UvQ9EHrgb27Xth
   nuO1sDpWKvjVE9sFuvJUc4haFu0y/UCLXC3i/+0lGtpgHxrDA/DfnFwlT
   KqwhGndy6iqEJhQjyV7Gblmp6rFC9z3UhYkpvJdUcJ1nMTRR1sVUj0kF5
   ccD6+cODALz94Lo2w35E39kmmMBjST7FUsXaAIslyQA0Oe1UPornB2RhP
   g2DDB+lXS9ea8QxbntCJPJyBmTAnVCRyM9J3LYfrC0z/3Vi7BAaaCcd1w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="386475972"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="386475972"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 14:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089062753"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089062753"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2023 14:15:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quJJZ-0005Eg-2O;
	Sat, 21 Oct 2023 21:15:21 +0000
Date: Sun, 22 Oct 2023 05:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Clark <robdclark@chromium.org>
Subject: [linux-next:master 9420/13906] a6xx_gmu.c:undefined reference to
 `qmp_put'
Message-ID: <202310220504.ziKtjGyK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: b9986846189cea87a9d93052cfab462c9e74f447 [9420/13906] drm/msm/a6xx: Fix up QMP handling
config: arm-randconfig-r022-20211019 (https://download.01.org/0day-ci/archive/20231022/202310220504.ziKtjGyK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220504.ziKtjGyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220504.ziKtjGyK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
   a6xx_gmu.c:(.text+0x3270): undefined reference to `qmp_send'
   arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_remove':
>> a6xx_gmu.c:(.text+0x37fc): undefined reference to `qmp_put'
   arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_init':
   a6xx_gmu.c:(.text+0x3f44): undefined reference to `qmp_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
