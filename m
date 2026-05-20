Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A436405A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298425; cv=none; b=fDDAUU87drovYrhrmSvty9nSC0dB0fRxeHQbKtzfWqtk4DZRk6Ul+HEFfu/6abI61h40fdLS/nj3///zDc5FXXyDjhZGgH2KgdVyaYTh3Dqwwtlcj035BZIF6r1euCfmd/EFvNDhOixVQ0SX1hbyLReRk0HOo0LJvTD32ZDmWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298425; c=relaxed/simple;
	bh=xG50iyCpFzzaIuSimCjte6z5jlPy7Ws31tds1cg/+mY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iA2GYgT/BGdqnV2iZidaRLlzF49z+pKVICSuJKMXYnUknPesIhXyxj+jt1+05Kzcs+8P/BqtNHXusHT+4sRiJDZcHW/rtXfuD/Xrjwa1XsF+RvN2gAx4pY7bJGmicUEqDTil23gPGhOGcZVNC57N7D95KF4VtKEAqyTP69/gtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYHOjAm0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYHOjAm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779298423; x=1810834423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xG50iyCpFzzaIuSimCjte6z5jlPy7Ws31tds1cg/+mY=;
  b=WYHOjAm0InhaMVrrwz+P8C5J3vq6bBIAH8ckhAWEg+U+z10xDg4V/seA
   HXlqbbv6qxoFVZsGEetmNyYFHwZRo3eo5g6Shu/BMPiFaWun3ASpNGOHg
   7o0rsHVZsAHAAiobLoEbR9p2kaCTorEC9/SqWGe5qRHc7RGRrdfCrY9X0
   BRiSs0e37V/Hbm4bsguxP932jAdVGtk5v36G/hz7NhS4ZOkkGnGEF94aV
   WjprSli2wbFWEhu0bN0HyUklV2bakmDSkkYJJt5IEZhFpxANSJRmZieP9
   /fLkcrJWdgNuJ81eAI24QXP+/y/h4++97xoVCQt80wLRlUBYpKMRWMvZt
   Q==;
X-CSE-ConnectionGUID: 7F5YntvsS+mFPTjUURtDDQ==
X-CSE-MsgGUID: vSoRPGDBTJ+AeNavUBmTsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79356267"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="79356267"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 10:32:51 -0700
X-CSE-ConnectionGUID: y+hXzSvxRSGNVFx5EXdF1A==
X-CSE-MsgGUID: AhUFoWBtTZiSqn0mRqY/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="237648347"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 10:32:49 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPkmI-000000003cb-1YE2;
	Wed, 20 May 2026 17:32:28 +0000
Date: Thu, 21 May 2026 01:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Rahman =?utf-8?Q?Mahmutovi=C4=87"?= <mahmutovicrahman5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [linux-next:master 5907/6922]
 drivers/video/fbdev/sunxvr2500.c:109:29: error: 'struct fb_info' has no
 member named 'dev'
Message-ID: <202605210159.lG6dgvU2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   687da68900cd1a46549f7d9430c7d40346cb86a0
commit: f918ad639c76838beeacd5ab2ef4b6f0f9d486a7 [5907/6922] fbdev: sunxvr2500: replace printk with device-aware logging functions
config: sparc-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260521/202605210159.lG6dgvU2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210159.lG6dgvU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210159.lG6dgvU2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:5,
                    from drivers/video/fbdev/sunxvr2500.c:10:
   drivers/video/fbdev/sunxvr2500.c: In function 's3d_set_fbinfo':
>> drivers/video/fbdev/sunxvr2500.c:109:29: error: 'struct fb_info' has no member named 'dev'
     109 |                 dev_err(info->dev, "Cannot allocate color map\n");
         |                             ^~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/video/fbdev/sunxvr2500.c:109:17: note: in expansion of macro 'dev_err'
     109 |                 dev_err(info->dev, "Cannot allocate color map\n");
         |                 ^~~~~~~


vim +109 drivers/video/fbdev/sunxvr2500.c

    71	
    72	static int s3d_set_fbinfo(struct s3d_info *sp)
    73	{
    74		struct fb_info *info = sp->info;
    75		struct fb_var_screeninfo *var = &info->var;
    76	
    77		info->fbops = &s3d_ops;
    78		info->screen_base = sp->fb_base;
    79		info->screen_size = sp->fb_size;
    80	
    81		info->pseudo_palette = sp->pseudo_palette;
    82	
    83		/* Fill fix common fields */
    84		strscpy(info->fix.id, "s3d", sizeof(info->fix.id));
    85	        info->fix.smem_start = sp->fb_base_phys;
    86	        info->fix.smem_len = sp->fb_size;
    87	        info->fix.type = FB_TYPE_PACKED_PIXELS;
    88		if (sp->depth == 32 || sp->depth == 24)
    89			info->fix.visual = FB_VISUAL_TRUECOLOR;
    90		else
    91			info->fix.visual = FB_VISUAL_PSEUDOCOLOR;
    92	
    93		var->xres = sp->width;
    94		var->yres = sp->height;
    95		var->xres_virtual = var->xres;
    96		var->yres_virtual = var->yres;
    97		var->bits_per_pixel = sp->depth;
    98	
    99		var->red.offset = 8;
   100		var->red.length = 8;
   101		var->green.offset = 16;
   102		var->green.length = 8;
   103		var->blue.offset = 24;
   104		var->blue.length = 8;
   105		var->transp.offset = 0;
   106		var->transp.length = 0;
   107	
   108		if (fb_alloc_cmap(&info->cmap, 256, 0)) {
 > 109			dev_err(info->dev, "Cannot allocate color map\n");
   110			return -ENOMEM;
   111		}
   112	
   113	        return 0;
   114	}
   115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
