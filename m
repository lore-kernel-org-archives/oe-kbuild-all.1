Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36421B7E6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707042389; cv=none; b=CGftug7yLZg40aLS7PrudFSCEBw0029fs4fPm2bKiWRPHrgB+a+Fh5BKlpurHYrxWZPsGeS/AjVxXaedZBaFBr+qmhxLsqiTLW8YRvC3CRSJO5pjV/0HLnfyF5PAo6ipQHpp3Qlp81gmWr/8Iac/CqSyu3QLE/gY0ZAgSW3BDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707042389; c=relaxed/simple;
	bh=pwhN9oWwHaCUSHAboadQEcESFRWbGj1KZ3RY9ZVp5T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JpMg4GAA3fTR6Ke0PdQ7cnS5uQWeqIKdIV1jgnH9PShvLq2TCwSzqXrlPWxLx68yd+w0IEtt+z7jNHZ5HEhDbetZTbWa1Y8Pm5KrBBLorHWfv1g722V6/lqMd1ZiV8wViKUI2z5tgXGQZE047jC8aEiy6WM0kQ1VzSMCbjoDs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVXSFDNd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVXSFDNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707042387; x=1738578387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwhN9oWwHaCUSHAboadQEcESFRWbGj1KZ3RY9ZVp5T0=;
  b=BVXSFDNdTzaYp3MNgDinZut5aH8KRyz4WgYbK7UuyC8L1936erNg3c0m
   RtNRiWdeDxFq/TDm/7ke0NiMcfxX7EvspVLnxoJhjJiPFZ4CHlJJhDuDT
   x66lOXaJwDmqxeYN1jS5yExJux5XssJS7Y45P9GwFMtz2hVXFaQPVD+lm
   n7hEm6hXTPc3Jlyjbtlz9Bter6mbsY2YN+2ONHqaOZIGOoFHlOk42Pdc4
   1kiEnQeStPUKXgOfXB77L5LkB8pC2NXKcYVagazeMOkGVHgafsdodycNC
   MTK0yygycbI9H39mk0YNr4JHLiO8ft4TEUE24+lc1W0Qsztj2c9Fx5Ed3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="299203"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="299203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 02:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5094558"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2024 02:26:25 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWZhd-0006FA-0z;
	Sun, 04 Feb 2024 10:26:21 +0000
Date: Sun, 4 Feb 2024 18:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:pr/339 6/16] drivers/video/fbdev/core/fbcon.c:477:5: error: use
 of undeclared identifier 'fb_center_logo'
Message-ID: <202402041809.zMGfNuay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel pr/339
head:   c178ea136b21f7814d3ee52d508d4acd2e3cf93f
commit: 6e3d1052d6a5a242fc1769fa2fcec7707c38ba98 [6/16] Update fbcon.c
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240204/202402041809.zMGfNuay-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041809.zMGfNuay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041809.zMGfNuay-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c:117:17: warning: no previous prototype for function 'fbcon_info_from_console' [-Wmissing-prototypes]
   struct fb_info *fbcon_info_from_console(int console) {
                   ^
   drivers/video/fbdev/core/fbcon.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct fb_info *fbcon_info_from_console(int console) {
   ^
   static 
   drivers/video/fbdev/core/fbcon.c:280:5: warning: no previous prototype for function 'get_color' [-Wmissing-prototypes]
   int get_color(struct vc_data *vc, struct fb_info *info,
       ^
   drivers/video/fbdev/core/fbcon.c:280:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_color(struct vc_data *vc, struct fb_info *info,
   ^
   static 
>> drivers/video/fbdev/core/fbcon.c:477:5: error: use of undeclared identifier 'fb_center_logo'
                                   fb_center_logo = true;
                                   ^
>> drivers/video/fbdev/core/fbcon.c:484:5: error: use of undeclared identifier 'fb_logo_count'
                                   fb_logo_count = simple_strtol(options, &options, 0);
                                   ^
   drivers/video/fbdev/core/fbcon.c:981:14: error: no member named 'vc_decor' in 'struct vc_data'
                   cols = vc->vc_decor.twidth / vc->vc_font.width;
                          ~~  ^
   drivers/video/fbdev/core/fbcon.c:982:14: error: no member named 'vc_decor' in 'struct vc_data'
                   rows = vc->vc_decor.theight / vc->vc_font.height;
                          ~~  ^
   drivers/video/fbdev/core/fbcon.c:2066:43: error: no member named 'vc_decor' in 'struct vc_data'
                   y_diff < 0 || y_diff > virt_fh) && !vc->vc_decor.state) {
                                                       ~~  ^
   drivers/video/fbdev/core/fbcon.c:2173:17: error: no member named 'vc_decor' in 'struct vc_data'
                   if (!vc_curr->vc_decor.theme ||
                        ~~~~~~~  ^
   drivers/video/fbdev/core/fbcon.c:2174:15: error: no member named 'vc_decor' in 'struct vc_data'
                           strcmp(vc->vc_decor.theme, vc_curr->vc_decor.theme) ||
                                  ~~  ^
   drivers/video/fbdev/core/fbcon.c:2174:40: error: no member named 'vc_decor' in 'struct vc_data'
                           strcmp(vc->vc_decor.theme, vc_curr->vc_decor.theme) ||
                                                      ~~~~~~~  ^
   drivers/video/fbdev/core/fbcon.c:2490:15: error: no member named 'vc_decor' in 'struct vc_data'
                           cols = vc->vc_decor.twidth;
                                  ~~  ^
   drivers/video/fbdev/core/fbcon.c:2491:15: error: no member named 'vc_decor' in 'struct vc_data'
                           rows = vc->vc_decor.theight;
                                  ~~  ^
   drivers/video/fbdev/core/fbcon.c:2700:45: error: no member named 'bgdecor' in 'struct fb_info'
                      info->var.bits_per_pixel == 8 && info->bgdecor.cmap.red != NULL)
                                                       ~~~~  ^
   drivers/video/fbdev/core/fbcon.c:2701:22: error: no member named 'bgdecor' in 'struct fb_info'
                   fb_set_cmap(&info->bgdecor.cmap, info);
                                ~~~~  ^
   2 warnings and 12 errors generated.


vim +/fb_center_logo +477 drivers/video/fbdev/core/fbcon.c

890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16  473  
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16  474  		if (!strncmp(options, "logo-pos:", 9)) {
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16  475  			options += 9;
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16  476  			if (!strcmp(options, "center"))
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16 @477  				fb_center_logo = true;
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16  478  			continue;
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-01-16  479  		}
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27  480  
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27  481  		if (!strncmp(options, "logo-count:", 11)) {
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27  482  			options += 11;
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27  483  			if (*options)
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27 @484  				fb_logo_count = simple_strtol(options, &options, 0);
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27  485  			continue;
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin    2019-08-27  486  		}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  487  	}
9b41046cd0ee0a drivers/video/console/fbcon.c    OGAWA Hirofumi 2006-03-31  488  	return 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  489  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  490  

:::::: The code at line 477 was first introduced by commit
:::::: 890d14d2d4b57ff5a149309da3ed36c8a529987f fbdev: fbmem: convert CONFIG_FB_LOGO_CENTER into a cmd line option

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
