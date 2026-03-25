Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895BA329C7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472320; cv=none; b=Ic3VQxtKMFx3SPiUEuADeLn4yoeAZ/JEUalHiRpVYLjnX5pf4kWltsWrAp/wOkw6FpzaTdwWrKkE33gWTRwh6pvvHHDYAovxlzMm8wXEkFuCtnCfiZOpqAviL+zFUD4i8PRjsh5KVof9D+4/FGnzhQNs7J4y+ZLL3DOy4bemaiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472320; c=relaxed/simple;
	bh=2wuq2tq+AQKGU/GHYhWu8oViurzdyNL2Dl/jqwBXbWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bxMKafl9r5k93z1bsEWVYwZVhhNYJZIshfrMALGi4ht/6/I/GwM5qpx6Q0aGd+bWKUFbvh+LNWd7tf6r3SEG6hJ0KQsJ0O9HjavPHFIsHPCtUtNb/u3Djo/sCJnZ/GXjz1m+lCREOv142TU7Vl5XCC63LZyqEwENLxoTo0JSYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Enov6ne1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Enov6ne1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774472319; x=1806008319;
  h=date:from:to:cc:subject:message-id;
  bh=2wuq2tq+AQKGU/GHYhWu8oViurzdyNL2Dl/jqwBXbWg=;
  b=Enov6ne1QP29lT08gUif5M4PiIeQ2S4XdDyUxVcWaQ3rZkIb+dc+Ydaf
   e4J9r37oWwzRv0n77FEFHMmStqwNahZVOWv/1FMOT1JPnu9cQt/YWBR4N
   vcOChRWQrefU4m51DcHQR9VElT88EvDaWCoRiWBDX/dH88hYamnj/+fgK
   6RTdEpxMrVT2G28iyXYs0mFx8g6LU5KIzChI2PSvdnp1YNYi46o+6KXOY
   2+e2+TSQ6Gjs+11DLs+NJ0NZqE1tygC0G/YIkI5kKV98TxoFPa8F+4yfU
   KK9/ynY9OAr6aoiQuS+KCLMdXN706JJSTmqpVAj944ivmFbr3Q9Fh5MCi
   w==;
X-CSE-ConnectionGUID: 9Zz9Sn/MTk+XVZlXq1y2Ew==
X-CSE-MsgGUID: whXzcmYLSliV9iRH0CoixA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74702348"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74702348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 13:58:36 -0700
X-CSE-ConnectionGUID: LJuurgTGSs2Vvsk9UrcwMg==
X-CSE-MsgGUID: 6TcVWO7cS9uG0/rICOoisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="262719571"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2026 13:58:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5VJA-000000007ij-01Yd;
	Wed, 25 Mar 2026 20:58:32 +0000
Date: Thu, 26 Mar 2026 04:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 218/218]
 drivers/video/fbdev/core/fbcon.c:1036:13: warning: variable 'cap' set but not
 used
Message-ID: <202603260427.WcNiZhw4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Helge,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   11d64ee60c8304d3468e4ced34971775c95e3429
commit: 57e8859acc6024ca9041f7fa58a0afed2ed6ea87 [218/218] fbcon: Add option to enable legacy hardware acceleration
config: i386-randconfig-017-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260427.WcNiZhw4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260427.WcNiZhw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260427.WcNiZhw4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_init':
>> drivers/video/fbdev/core/fbcon.c:1036:13: warning: variable 'cap' set but not used [-Wunused-but-set-variable]
    1036 |         int cap, ret;
         |             ^~~
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
   drivers/video/fbdev/core/fbcon.c:3370:21: warning: variable 'pending' set but not used [-Wunused-but-set-variable]
    3370 |                 int pending = 0;
         |                     ^~~~~~~


vim +/cap +1036 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1027  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1028  static void fbcon_init(struct vc_data *vc, int init)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1029  {
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1030  	struct fb_info *info;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1031  	struct fbcon_ops *ops;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1032  	struct vc_data **default_mode = vc->vc_display_fg;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1033  	struct vc_data *svc = *default_mode;
50233393f0cf9b drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1034  	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1035  	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
460f6b1a238d2e drivers/video/fbdev/core/fbcon.c Helge Deller              2022-02-02 @1036  	int cap, ret;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1037  
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1038  	if (WARN_ON(info_idx == -1))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1039  	    return;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2005-05-01  1040  
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1041  	if (con2fb_map[vc->vc_num] == -1)
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1042  		con2fb_map[vc->vc_num] = info_idx;
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1043  
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1044  	info = registered_fb[con2fb_map[vc->vc_num]];
460f6b1a238d2e drivers/video/fbdev/core/fbcon.c Helge Deller              2022-02-02  1045  	cap = info->flags;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2005-05-01  1046  
3c5a1b111373e6 drivers/video/fbdev/core/fbcon.c Andreas Schwab            2019-05-06  1047  	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2019-02-08  1048  		logo_shown = FBCON_LOGO_DONTSHOW;
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2019-02-08  1049  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1050  	if (vc != svc || logo_shown == FBCON_LOGO_DONTSHOW ||
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1051  	    (info->fix.type == FB_TYPE_TEXT))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1052  		logo = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1053  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1054  	if (var_to_display(p, &info->var, info))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1055  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1056  
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2007-07-17  1057  	if (!info->fbcon_par)
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2007-07-17  1058  		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2007-07-17  1059  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1060  	/* If we are not the first console on this
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1061  	   fb, copy the font from that console */
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1062  	t = &fb_display[fg_console];
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1063  	if (!p->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1064  		if (t->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1065  			struct vc_data *fvc = vc_cons[fg_console].d;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1066  
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1067  			vc->vc_font.data = (void *)(p->fontdata =
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1068  						    fvc->vc_font.data);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1069  			vc->vc_font.width = fvc->vc_font.width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1070  			vc->vc_font.height = fvc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1071  			p->userfont = t->userfont;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1072  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1073  			if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1074  				REFCOUNT(p->fontdata)++;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1075  		} else {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1076  			const struct font_desc *font = NULL;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1077  
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1078  			if (!fontname[0] || !(font = find_font(fontname)))
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1079  				font = get_default_font(info->var.xres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2007-05-08  1080  							info->var.yres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2007-05-08  1081  							info->pixmap.blit_x,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2007-05-08  1082  							info->pixmap.blit_y);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1083  			vc->vc_font.width = font->width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1084  			vc->vc_font.height = font->height;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1085  			vc->vc_font.data = (void *)(p->fontdata = font->data);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1086  			vc->vc_font.charcount = 256; /* FIXME  Need to
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1087  							support more fonts */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1088  		}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1089  	}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1090  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1091  	if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1092  		charcnt = FNTCHARCNT(p->fontdata);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1093  
b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas        2005-09-09  1094  	vc->vc_can_do_color = (fb_get_color_depth(&info->var, &info->fix)!=1);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1095  	vc->vc_complement_mask = vc->vc_can_do_color ? 0x7700 : 0x0800;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1096  	if (charcnt == 256) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1097  		vc->vc_hi_font_mask = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1098  	} else {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1099  		vc->vc_hi_font_mask = 0x100;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1100  		if (vc->vc_can_do_color)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1101  			vc->vc_complement_mask <<= 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1102  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1103  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1104  	if (!*svc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1105  		con_set_default_unimap(svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1106  	if (!*vc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1107  		con_copy_unimap(vc, svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1108  
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1109  	ops = info->fbcon_par;
f235f664a8afab drivers/video/console/fbcon.c    Scot Doyle                2015-10-09  1110  	ops->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1111  
2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz            2008-02-06  1112  	p->con_rotate = initial_rotation;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1113  	if (p->con_rotate == -1)
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1114  		p->con_rotate = info->fbcon_rotate_hint;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1115  	if (p->con_rotate == -1)
f2f4946b0adfd6 drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1116  		p->con_rotate = FB_ROTATE_UR;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1117  
b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-01-09  1118  	set_blitting_type(vc, info);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1119  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1120  	cols = vc->vc_cols;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1121  	rows = vc->vc_rows;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1122  	new_cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1123  	new_rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1124  	new_cols /= vc->vc_font.width;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1125  	new_rows /= vc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1126  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1127  	/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1128  	 * We must always set the mode. The mode of the previous console
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1129  	 * driver could be in the same resolution but we are using different
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1130  	 * hardware so we have to initialize the hardware.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1131  	 *
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1132  	 * We need to do it in fbcon_init() to prevent screen corruption.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1133  	 */
6ca8dfd78187d8 drivers/video/console/fbcon.c    Jiri Slaby                2016-06-23  1134  	if (con_is_visible(vc) && vc->vc_mode == KD_TEXT) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1135  		if (info->fbops->fb_set_par &&
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1136  		    !(ops->flags & FBCON_FLAGS_INIT)) {
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1137  			ret = info->fbops->fb_set_par(info);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1138  
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1139  			if (ret)
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1140  				printk(KERN_ERR "fbcon_init: detected "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1141  					"unhandled fb_set_par error, "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1142  					"error code %d\n", ret);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1143  		}
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1144  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1145  		ops->flags |= FBCON_FLAGS_INIT;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1146  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1147  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1148  	ops->graphics = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1149  

:::::: The code at line 1036 was first introduced by commit
:::::: 460f6b1a238d2ee1d69a4911f81ee1728242f0dd Revert "fbcon: Disable accelerated scrolling"

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
