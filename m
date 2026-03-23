Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5725A2B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278795; cv=none; b=TKDPp0ujRsI7a2zj7Ki1E+5SaYS8CMogJslxuACejBiCfVqbpjp60pG14jYlTkWbo8TqCfnmlQl5lwSIqRDX8yv5fOqfmQjbKc9tl2f00AgVhYc5b7V36IZb69WhzhEayczUFckKQHianhPZWnvcNbMnLv1uxu6EN4T+XcWli/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278795; c=relaxed/simple;
	bh=Jy0TSW8FEl0SBn7CiICMsJJPPz2Ozb+fZtrSRPy9H38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U9i8ekDHJGBAZhr8RoYUkqlMICaSspctAoY1mAYOTOrhFUaA0a4kBXIkezigrE/WcJgZG88nKtvpE3Xa0Tx/Jcz0ZTIYR4uYM8f+AACcq9qztOGhfZFRu77gAa2uyBTgXm9iI/HIZXyf41nTQInP5pGfS63DcTob9TzHDxnv3LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJGciq7a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJGciq7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774278793; x=1805814793;
  h=date:from:to:cc:subject:message-id;
  bh=Jy0TSW8FEl0SBn7CiICMsJJPPz2Ozb+fZtrSRPy9H38=;
  b=fJGciq7auvFtCox/6SF6yUYHejrlzaMN2g+4GCFK96UvioEt5XcoGooN
   oapKW8eEYVItKI8C+8/ll5shc7yAuIH+FQeo+bndBC0HOd89MgVpIfHtz
   3VI4e4Fvuer4tLU7KQ/u0NSyghTWvLa/0SID+dNGOfXyUoEI0CxJJpK6W
   BJ3KXBCjPzFQ7Ft3eq2IPH4GflMCRokshGLAS+11RnBgeX9tZzuCQjJao
   xSpgAd9FLMROLbhhmUNRRBvpu3FPh73UGUMYecQpV/gv+VbnXlCnIWM46
   ia8UAp5gMCnn7JonlhRt+v9uVTGs3kKa004ypYkNvj5eOvsAr/ZsYMLhH
   g==;
X-CSE-ConnectionGUID: fo4dO7mRQIegrfnATM8j+w==
X-CSE-MsgGUID: b1HYPkzLS5ORLbcNGStXoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85973496"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85973496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:13:12 -0700
X-CSE-ConnectionGUID: 2SZwYR68S6qbSttHPWSADg==
X-CSE-MsgGUID: TdiLtx3vSOyl7klHN1zqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247806348"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 08:13:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4gxp-000000001hl-08X3;
	Mon, 23 Mar 2026 15:13:09 +0000
Date: Mon, 23 Mar 2026 23:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 drivers/block/zram/zram_drv.c:282:13: warning: 'zram_can_store_page' defined
 but not used
Message-ID: <202603232339.6gddZV86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   037660b116cb733997f7aac8aa34d76a7da7905e
commit: 160a4092db67397d85b790f102f375ae0e045257 [5/5] ANDROID: zram: Add ZRAM_ANDROID_IOC_PROCESS_PREFETCH ioctl
config: i386-randconfig-004-20260323 (https://download.01.org/0day-ci/archive/20260323/202603232339.6gddZV86-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232339.6gddZV86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232339.6gddZV86-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/zram/zram_drv.c:282:13: warning: 'zram_can_store_page' defined but not used [-Wunused-function]
     282 | static bool zram_can_store_page(struct zram *zram)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/zram_can_store_page +282 drivers/block/zram/zram_drv.c

   281	
 > 282	static bool zram_can_store_page(struct zram *zram)
   283	{
   284		unsigned long alloced_pages;
   285	
   286		alloced_pages = zs_get_total_pages(zram->mem_pool);
   287		update_used_max(zram, alloced_pages);
   288	
   289		return !zram->limit_pages || alloced_pages <= zram->limit_pages;
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
