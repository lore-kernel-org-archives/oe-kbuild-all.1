Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A936292936
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 01:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769133110; cv=none; b=N+nTg8R/BlB6Y1QpxHpBoZoVQqOmk3hvDkjZV8pYe/YOVDP6BvuVjaU0TD/jjJExSesdCntwP1yic9qWv/BxHZsE9jBPwBwi7XE4BlAtCHSjXxrR+WUXHufKVYeRt19bDxvsQDxK08OnigYfCsiYT3xPc7QQazxkfWaYji+1jHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769133110; c=relaxed/simple;
	bh=EZ2zoflW4axc9b8YizkWpQVDYgVPPoESuFVc/JFxIFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bK6rq4IeYJRcqW19aY/lQktB2enrhQxGGt3ID/6i9eNGGLOSlyckqMvQm19AtA2Bow825Pn4Rua/uEI+5oAYO1MpuTECl44e/8/DCSbabKfRndCH60iUIggBHDYISQwBGICOCnFfUXmkbHJyg+UIVG8kOrwUBNViX474CVseE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdbiJABW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdbiJABW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769133093; x=1800669093;
  h=date:from:to:cc:subject:message-id;
  bh=EZ2zoflW4axc9b8YizkWpQVDYgVPPoESuFVc/JFxIFo=;
  b=JdbiJABWcDqgfGXKP58uPwguscpQC67hlAjpbM4GPtKGA13kpQ9zG+UP
   3beF81PVk8cYesL1+/nlLhdNZd0ehnGjkFK1VA3V9I0iwSKghT6wY4XVu
   w7Dfl5EzjWEowPHRS52cC9yVc4N1AZD8O4p4Sb4wxB5UNnuT6tNbK/Wuc
   yhyr0+VsQkRxaHPKpszekPTFvaOiIUKcf/4tXgYfWEJSkdv1P3OHBcJfP
   KPGGzYVOYFe5kr7Qd2KE0wGocJH6e/4umEkCaMbnSmEfJEUCFi4kNEh75
   8cCJjZNcfxehPaduY7k9FNR82cpLpt8UVAHgEK62s2IbUnVF724REFR9h
   w==;
X-CSE-ConnectionGUID: iVeAACvsTuq0NqBPwRdV5Q==
X-CSE-MsgGUID: el+MGqR6Qk+KMrO2xeVWwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81826177"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81826177"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 17:51:30 -0800
X-CSE-ConnectionGUID: qX8soPd/Tcui4uVdWX75Hw==
X-CSE-MsgGUID: oDHDaic4SGWyE6bJmYFtbg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2026 17:51:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj6Kb-00000000TQ2-2sLD;
	Fri, 23 Jan 2026 01:51:25 +0000
Date: Fri, 23 Jan 2026 09:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 4572/9290]
 drivers/staging/fbtft/fbtft-core.c:368:16: error: no member named 'dev' in
 'struct fb_info'
Message-ID: <202601230916.VpgbAIF5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chintan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
commit: bc9f9cb85a7d49e8d58ab326cb56616166201940 [4572/9290] staging: fbtft: Make FB_DEVICE dependency optional
config: powerpc64-randconfig-r053-20260123 (https://download.01.org/0day-ci/archive/20260123/202601230916.VpgbAIF5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230916.VpgbAIF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230916.VpgbAIF5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-core.c:368:16: error: no member named 'dev' in 'struct fb_info'
     368 |         dev_dbg(info->dev,
         |                 ~~~~  ^
   drivers/staging/fbtft/fbtft-core.c:394:16: error: no member named 'dev' in 'struct fb_info'
     394 |         dev_dbg(info->dev, "%s(blank=%d)\n",
         |                 ~~~~  ^
   drivers/staging/fbtft/fbtft-core.c:796:20: error: no member named 'dev' in 'struct fb_info'
     796 |         dev_info(fb_info->dev,
         |                  ~~~~~~~  ^
   3 errors generated.


vim +368 drivers/staging/fbtft/fbtft-core.c

c296d5f9957c03 Thomas Petazzoni        2014-12-31  360  
1ba539d53b2de2 Bhanusree Pola          2019-02-25  361  static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
1ba539d53b2de2 Bhanusree Pola          2019-02-25  362  			      unsigned int green, unsigned int blue,
1ba539d53b2de2 Bhanusree Pola          2019-02-25  363  			      unsigned int transp, struct fb_info *info)
c296d5f9957c03 Thomas Petazzoni        2014-12-31  364  {
1c41494adf7aa6 Ming Yang               2016-07-17  365  	unsigned int val;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  366  	int ret = 1;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  367  
b38c760ab0e1d7 Madhusudhanan Ravindran 2015-06-01 @368  	dev_dbg(info->dev,
c296d5f9957c03 Thomas Petazzoni        2014-12-31  369  		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
c296d5f9957c03 Thomas Petazzoni        2014-12-31  370  		__func__, regno, red, green, blue, transp);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  371  
c296d5f9957c03 Thomas Petazzoni        2014-12-31  372  	switch (info->fix.visual) {
c296d5f9957c03 Thomas Petazzoni        2014-12-31  373  	case FB_VISUAL_TRUECOLOR:
c296d5f9957c03 Thomas Petazzoni        2014-12-31  374  		if (regno < 16) {
c296d5f9957c03 Thomas Petazzoni        2014-12-31  375  			u32 *pal = info->pseudo_palette;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  376  
c296d5f9957c03 Thomas Petazzoni        2014-12-31  377  			val  = chan_to_field(red,   &info->var.red);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  378  			val |= chan_to_field(green, &info->var.green);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  379  			val |= chan_to_field(blue,  &info->var.blue);
c296d5f9957c03 Thomas Petazzoni        2014-12-31  380  
c296d5f9957c03 Thomas Petazzoni        2014-12-31  381  			pal[regno] = val;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  382  			ret = 0;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  383  		}
c296d5f9957c03 Thomas Petazzoni        2014-12-31  384  		break;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  385  	}
c296d5f9957c03 Thomas Petazzoni        2014-12-31  386  	return ret;
c296d5f9957c03 Thomas Petazzoni        2014-12-31  387  }
c296d5f9957c03 Thomas Petazzoni        2014-12-31  388  

:::::: The code at line 368 was first introduced by commit
:::::: b38c760ab0e1d7e051f13e31771514b5809de222 staging: fbtft: replace fbtft_dev_dbg with standard dev_dbg call

:::::: TO: Madhusudhanan Ravindran <mravindr@visteon.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
