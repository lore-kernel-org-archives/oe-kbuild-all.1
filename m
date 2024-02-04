Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E017963D5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707025274; cv=none; b=l13LoyxpwcD5NSWqQwPS6fwZnuxAFbYBPZI5E8TjVqJFG83SQBZX3L67EGU1iGI04XnOzhkV8GQEONCcp1pMPyrzSb2FGPuPR/WQnWDebjb8//vJKJsq6wtVHeriW2YVsvrt/MM6d6vLsGseDIdCFIX56IBziCSDlS+aFnTkgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707025274; c=relaxed/simple;
	bh=kketQHRhERxSxP8PwaxkMc84TsXPYBOMEH0z99ZQxNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLwYnoCaIWl16D/3TKHn/AiaBLfJHnZNJbOPe3H8khCNUTbhhSUT5KL97CUuoAbH5wYZGKH1nm8c1WslNTHG1yQP2EKc3nPYLHT3oCJO0ugll2EiDSQwiD1FUypKVuxNo9d10cKywVx+RUAFHgshG43gv9bjRdHcuZQh0+xqo2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfWu3Gb1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfWu3Gb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707025272; x=1738561272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kketQHRhERxSxP8PwaxkMc84TsXPYBOMEH0z99ZQxNk=;
  b=CfWu3Gb1hXX1UlfJW0RO3Sc/KwbobrdasTX8dlMViwD7lLIPpk1R4i8T
   9qKO2Dcdfe6kLJOcGP3xHz/rEFNtpptbAniExxGoe65Ot2RJYn0d7aAbv
   JgPE3pn9dzbdVxamcEAv2a55mLjzyxXf9qw8rhD7bd+SwxVAuqZ3ZezVH
   MMym+2m7Z0ScbR26/IQvg1LMspuDdHELAArp8o428TQa8Y1LkBtS5fqNu
   0cHXa5607eFP8xV5knYK4P7kT0N0pZaAr4ki1ZaNoYmu1Qznm2EnvIYZS
   13+QnFCiRpisq5E4qWeXCZkH+TAuad/U9t1e6BDjlHwL50K5fyh7Hp6M1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="22840314"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="22840314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 21:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="37863922"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2024 21:41:10 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWVFb-000632-1p;
	Sun, 04 Feb 2024 05:41:07 +0000
Date: Sun, 4 Feb 2024 13:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:pr/339 6/16] drivers/video/fbdev/core/fbcon.c:477:33: error:
 'fb_center_logo' undeclared; did you mean 'fb_prepare_logo'?
Message-ID: <202402041352.5JBSu09I-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041352.5JBSu09I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041352.5JBSu09I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041352.5JBSu09I-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c:117:17: warning: no previous prototype for 'fbcon_info_from_console' [-Wmissing-prototypes]
     117 | struct fb_info *fbcon_info_from_console(int console) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/core/fbcon.c:280:5: warning: no previous prototype for 'get_color' [-Wmissing-prototypes]
     280 | int get_color(struct vc_data *vc, struct fb_info *info,
         |     ^~~~~~~~~
   drivers/video/fbdev/core/fbcon.c: In function 'fb_console_setup':
>> drivers/video/fbdev/core/fbcon.c:477:33: error: 'fb_center_logo' undeclared (first use in this function); did you mean 'fb_prepare_logo'?
     477 |                                 fb_center_logo = true;
         |                                 ^~~~~~~~~~~~~~
         |                                 fb_prepare_logo
   drivers/video/fbdev/core/fbcon.c:477:33: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/video/fbdev/core/fbcon.c:484:33: error: 'fb_logo_count' undeclared (first use in this function); did you mean 'file_count'?
     484 |                                 fb_logo_count = simple_strtol(options, &options, 0);
         |                                 ^~~~~~~~~~~~~
         |                                 file_count
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_startup':
   drivers/video/fbdev/core/fbcon.c:981:28: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
     981 |                 cols = vc->vc_decor.twidth / vc->vc_font.width;
         |                            ^~~~~~~~
         |                            vc_decom
   drivers/video/fbdev/core/fbcon.c:982:28: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
     982 |                 rows = vc->vc_decor.theight / vc->vc_font.height;
         |                            ^~~~~~~~
         |                            vc_decom
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_resize':
   drivers/video/fbdev/core/fbcon.c:2066:57: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
    2066 |                 y_diff < 0 || y_diff > virt_fh) && !vc->vc_decor.state) {
         |                                                         ^~~~~~~~
         |                                                         vc_decom
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_switch':
   drivers/video/fbdev/core/fbcon.c:2173:31: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
    2173 |                 if (!vc_curr->vc_decor.theme ||
         |                               ^~~~~~~~
         |                               vc_decom
   drivers/video/fbdev/core/fbcon.c:2174:36: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
    2174 |                         strcmp(vc->vc_decor.theme, vc_curr->vc_decor.theme) ||
         |                                    ^~~~~~~~
         |                                    vc_decom
   drivers/video/fbdev/core/fbcon.c:2174:61: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
    2174 |                         strcmp(vc->vc_decor.theme, vc_curr->vc_decor.theme) ||
         |                                                             ^~~~~~~~
         |                                                             vc_decom
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_do_set_font':
   drivers/video/fbdev/core/fbcon.c:2490:36: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
    2490 |                         cols = vc->vc_decor.twidth;
         |                                    ^~~~~~~~
         |                                    vc_decom
   drivers/video/fbdev/core/fbcon.c:2491:36: error: 'struct vc_data' has no member named 'vc_decor'; did you mean 'vc_decom'?
    2491 |                         rows = vc->vc_decor.theight;
         |                                    ^~~~~~~~
         |                                    vc_decom
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_set_palette':
   drivers/video/fbdev/core/fbcon.c:2700:57: error: 'struct fb_info' has no member named 'bgdecor'
    2700 |                    info->var.bits_per_pixel == 8 && info->bgdecor.cmap.red != NULL)
         |                                                         ^~
   drivers/video/fbdev/core/fbcon.c:2701:34: error: 'struct fb_info' has no member named 'bgdecor'
    2701 |                 fb_set_cmap(&info->bgdecor.cmap, info);
         |                                  ^~


vim +477 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  279  
6e3d1052d6a5a2 drivers/video/fbdev/core/fbcon.c Citrizon           2024-02-01 @280  int get_color(struct vc_data *vc, struct fb_info *info,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  281  	      u16 c, int is_fg)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  282  {
b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  283  	int depth = fb_get_color_depth(&info->var, &info->fix);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  284  	int color = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  285  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  286  	if (console_blanked) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  287  		unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  288  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  289  		c = vc->vc_video_erase_char & charmask;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  290  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  291  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  292  	if (depth != 1)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  293  		color = (is_fg) ? attr_fgcol((vc->vc_hi_font_mask) ? 9 : 8, c)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  294  			: attr_bgcol((vc->vc_hi_font_mask) ? 13 : 12, c);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  295  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  296  	switch (depth) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  297  	case 1:
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  298  	{
91c4313206e440 drivers/video/console/fbcon.c    Thomas Pfaff       2008-02-06  299  		int col = mono_col(info);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  300  		/* 0 or 1 */
b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  301  		int fg = (info->fix.visual != FB_VISUAL_MONO01) ? col : 0;
b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  302  		int bg = (info->fix.visual != FB_VISUAL_MONO01) ? 0 : col;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  303  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  304  		if (console_blanked)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  305  			fg = bg;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  306  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  307  		color = (is_fg) ? fg : bg;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  308  		break;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  309  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  310  	case 2:
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  311  		/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  312  		 * Scale down 16-colors to 4 colors. Default 4-color palette
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  313  		 * is grayscale. However, simply dividing the values by 4
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  314  		 * will not work, as colors 1, 2 and 3 will be scaled-down
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  315  		 * to zero rendering them invisible.  So empirically convert
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  316  		 * colors to a sane 4-level grayscale.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  317  		 */
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  318  		switch (color) {
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  319  		case 0:
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  320  			color = 0; /* black */
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  321  			break;
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  322  		case 1 ... 6:
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  323  			color = 2; /* white */
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  324  			break;
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  325  		case 7 ... 8:
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  326  			color = 1; /* gray */
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  327  			break;
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  328  		default:
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  329  			color = 3; /* intense white */
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  330  			break;
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  331  		}
2cc38ed13f1b0f drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  332  		break;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  333  	case 3:
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  334  		/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  335  		 * Last 8 entries of default 16-color palette is a more intense
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  336  		 * version of the first 8 (i.e., same chrominance, different
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  337  		 * luminance).
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  338  		 */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  339  		color &= 7;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  340  		break;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  341  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  342  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  343  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  344  	return color;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  345  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  346  
c4028958b6ecad drivers/video/console/fbcon.c    David Howells      2006-11-22  347  static void fb_flashcursor(struct work_struct *work)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  348  {
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  349  	struct fbcon_ops *ops = container_of(work, struct fbcon_ops, cursor_work.work);
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  350  	struct fb_info *info;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  351  	struct vc_data *vc = NULL;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  352  	int c;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  353  	int mode;
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  354  	int ret;
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  355  
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  356  	/* FIXME: we should sort out the unbind locking instead */
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  357  	/* instead we just fail to flash the cursor if we can't get
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  358  	 * the lock instead of blocking fbcon deinit */
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  359  	ret = console_trylock();
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  360  	if (ret == 0)
d8636a2717bb3d drivers/video/console/fbcon.c    Dave Airlie        2012-08-21  361  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  362  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  363  	/* protected by console_lock */
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  364  	info = ops->info;
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  365  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  366  	if (ops->currcon != -1)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  367  		vc = vc_cons[ops->currcon].d;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  368  
6ca8dfd78187d8 drivers/video/console/fbcon.c    Jiri Slaby         2016-06-23  369  	if (!vc || !con_is_visible(vc) ||
409d6c95f9c68b drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  370  	    fbcon_info_from_console(vc->vc_num) != info ||
212f26398f63bc drivers/video/console/fbcon.c    Antonino A. Daplas 2006-10-03  371  	    vc->vc_deccm != 1) {
ac751efa6a0d70 drivers/video/console/fbcon.c    Torben Hohn        2011-01-25  372  		console_unlock();
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  373  		return;
5428b04405af1b drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  374  	}
5428b04405af1b drivers/video/console/fbcon.c    Antonino A. Daplas 2006-06-26  375  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  376  	c = scr_readw((u16 *) vc->vc_pos);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  377  	mode = (!ops->cursor_flash || ops->cursor_state.enable) ?
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  378  		CM_ERASE : CM_DRAW;
06a0df4d1b8b13 drivers/video/fbdev/core/fbcon.c Linus Torvalds     2020-09-08  379  	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  380  		    get_color(vc, info, c, 0));
ac751efa6a0d70 drivers/video/console/fbcon.c    Torben Hohn        2011-01-25  381  	console_unlock();
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  382  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  383  	queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  384  			   ops->cur_blink_jiffies);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  385  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  386  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  387  static void fbcon_add_cursor_work(struct fb_info *info)
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  388  {
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  389  	struct fbcon_ops *ops = info->fbcon_par;
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  390  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  391  	if (!fbcon_cursor_noblink)
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  392  		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  393  				   ops->cur_blink_jiffies);
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  394  }
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  395  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  396  static void fbcon_del_cursor_work(struct fb_info *info)
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  397  {
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  398  	struct fbcon_ops *ops = info->fbcon_par;
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  399  
3b0fb6ab25dda0 drivers/video/fbdev/core/fbcon.c Daniel Vetter      2022-04-05  400  	cancel_delayed_work_sync(&ops->cursor_work);
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  401  }
88fb2c6efba8d9 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-09-09  402  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  403  #ifndef MODULE
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  404  static int __init fb_console_setup(char *this_opt)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  405  {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  406  	char *options;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  407  	int i, j;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  408  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  409  	if (!this_opt || !*this_opt)
9b41046cd0ee0a drivers/video/console/fbcon.c    OGAWA Hirofumi     2006-03-31  410  		return 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  411  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  412  	while ((options = strsep(&this_opt, ",")) != NULL) {
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  413  		if (!strncmp(options, "font:", 5)) {
8d0268585b9c07 drivers/video/fbdev/core/fbcon.c Wolfram Sang       2022-08-18  414  			strscpy(fontname, options + 5, sizeof(fontname));
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  415  			continue;
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  416  		}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  417  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  418  		if (!strncmp(options, "scrollback:", 11)) {
50145474f6ef4a drivers/video/fbdev/core/fbcon.c Linus Torvalds     2020-09-07  419  			pr_warn("Ignoring scrollback size option\n");
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  420  			continue;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  421  		}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  422  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  423  		if (!strncmp(options, "map:", 4)) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  424  			options += 4;
623e71b035cb52 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  425  			if (*options) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  426  				for (i = 0, j = 0; i < MAX_NR_CONSOLES; i++) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  427  					if (!options[j])
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  428  						j = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  429  					con2fb_map_boot[i] =
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  430  						(options[j++]-'0') % FB_MAX;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  431  				}
623e71b035cb52 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  432  
4769a9a53b39f3 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-08-10  433  				fbcon_map_override();
623e71b035cb52 drivers/video/console/fbcon.c    Antonino A. Daplas 2007-07-17  434  			}
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  435  			continue;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  436  		}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  437  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  438  		if (!strncmp(options, "vc:", 3)) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  439  			options += 3;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  440  			if (*options)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  441  				first_fb_vc = simple_strtoul(options, &options, 10) - 1;
cad564ca557f8d drivers/video/fbdev/core/fbcon.c Helge Deller       2022-06-02  442  			if (first_fb_vc >= MAX_NR_CONSOLES)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  443  				first_fb_vc = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  444  			if (*options++ == '-')
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  445  				last_fb_vc = simple_strtoul(options, &options, 10) - 1;
cad564ca557f8d drivers/video/fbdev/core/fbcon.c Helge Deller       2022-06-02  446  			if (last_fb_vc < first_fb_vc || last_fb_vc >= MAX_NR_CONSOLES)
cad564ca557f8d drivers/video/fbdev/core/fbcon.c Helge Deller       2022-06-02  447  				last_fb_vc = MAX_NR_CONSOLES - 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  448  			fbcon_is_default = 0;
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  449  			continue;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  450  		}
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-11-08  451  
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-11-08  452  		if (!strncmp(options, "rotate:", 7)) {
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-11-08  453  			options += 7;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-11-08  454  			if (*options)
2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz     2008-02-06  455  				initial_rotation = simple_strtoul(options, &options, 0);
2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz     2008-02-06  456  			if (initial_rotation > 3)
2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz     2008-02-06  457  				initial_rotation = 0;
37773c4e7f6156 drivers/video/console/fbcon.c    Maarten ter Huurne 2014-10-09  458  			continue;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas 2005-11-08  459  		}
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  460  
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  461  		if (!strncmp(options, "margin:", 7)) {
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  462  			options += 7;
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  463  			if (*options)
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  464  				margin_color = simple_strtoul(options, &options, 0);
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  465  			continue;
74c1c8b3326a36 drivers/video/fbdev/core/fbcon.c David Lechner      2017-08-18  466  		}
83d83bebf40132 drivers/video/fbdev/core/fbcon.c Hans de Goede      2018-06-28  467  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
83d83bebf40132 drivers/video/fbdev/core/fbcon.c Hans de Goede      2018-06-28  468  		if (!strcmp(options, "nodefer")) {
83d83bebf40132 drivers/video/fbdev/core/fbcon.c Hans de Goede      2018-06-28  469  			deferred_takeover = false;
83d83bebf40132 drivers/video/fbdev/core/fbcon.c Hans de Goede      2018-06-28  470  			continue;
83d83bebf40132 drivers/video/fbdev/core/fbcon.c Hans de Goede      2018-06-28  471  		}
83d83bebf40132 drivers/video/fbdev/core/fbcon.c Hans de Goede      2018-06-28  472  #endif
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16  473  
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16  474  		if (!strncmp(options, "logo-pos:", 9)) {
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16  475  			options += 9;
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16  476  			if (!strcmp(options, "center"))
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16 @477  				fb_center_logo = true;
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16  478  			continue;
890d14d2d4b57f drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-01-16  479  		}
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27  480  
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27  481  		if (!strncmp(options, "logo-count:", 11)) {
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27  482  			options += 11;
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27  483  			if (*options)
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27 @484  				fb_logo_count = simple_strtol(options, &options, 0);
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27  485  			continue;
691f50ab274255 drivers/video/fbdev/core/fbcon.c Peter Rosin        2019-08-27  486  		}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  487  	}
9b41046cd0ee0a drivers/video/console/fbcon.c    OGAWA Hirofumi     2006-03-31  488  	return 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  489  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds     2005-04-16  490  

:::::: The code at line 477 was first introduced by commit
:::::: 890d14d2d4b57ff5a149309da3ed36c8a529987f fbdev: fbmem: convert CONFIG_FB_LOGO_CENTER into a cmd line option

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
