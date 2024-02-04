Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA274138C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 03:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707018884; cv=none; b=VpouMd0Cm/MSyi/UgQxVYkyAVomqsNeDn5Jc1Xz5txwjIK2A1Dvoi9JBmkDqtefqgFxyV+n+i5u0TawNstTHmdyGz8YyzjIoPb/bcZn6TtrqsUI7iIHz4MGVktNsv9ZcjznrjQapYNFW6JaZ2Nr3sLtlLLsQp2ez/MSrySMif5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707018884; c=relaxed/simple;
	bh=SSwriqjTSj7JZEbE6JLPDI6Ref6tmyh+a+OO6kYsVs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSGdkxcTjZ+rd0RA2t3v3zBt4R4jWISFirTbd+Q2f+ivSWur5pyM3CRaYna7PPozSjYr+JRviKbvv98jcnnNVbMJJKLeZWCqFwPxOZURjHARL57F2UJKAI69rei6RwnvhbCzxnl9CKsbNn5WT6Dfig3R8fESdUo0kxvm/f3spg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLtmFTPF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLtmFTPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707018882; x=1738554882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSwriqjTSj7JZEbE6JLPDI6Ref6tmyh+a+OO6kYsVs8=;
  b=ZLtmFTPFQAYinYZcLc5VgmBExnWRyqd+8h6wIzdDNOKdH5ha0XWRQRAn
   gfa/EXTyA6oMEmOS+nGLXl6OzQrmv2QKoTBkE+rzn8HNAiTjIB16T8veL
   8tFwuQmLR//NntTVqVgaWNKA/PbDDejRQwhUOxDaDt9ZbZyngCiNTiv+7
   Ze6p6DRs1zW0xGf6rALYmXeJE0w2H9vNrqNE50aM12XHbexQePXnfFvrq
   i3FYlNvZYNKWVq7t1stFZjd2sbkqU26PkqKlrkEQQsbQUVdW83u7v2mvy
   +KQl9n8KyYf4usC+Mr1sGvE2wxpJUODI3pYkMgGE+Rh3P0wWWRok9unAC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="256973"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="256973"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 19:54:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="37850367"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2024 19:54:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWTaY-0005zM-2w;
	Sun, 04 Feb 2024 03:54:38 +0000
Date: Sun, 4 Feb 2024 11:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:pr/339 6/16] drivers/video/fbdev/core/fbcon.c:280:5: warning:
 no previous prototype for function 'get_color'
Message-ID: <202402041141.d7ZJAV1J-lkp@intel.com>
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
config: i386-randconfig-002-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041141.d7ZJAV1J-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041141.d7ZJAV1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041141.d7ZJAV1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c:117:17: warning: no previous prototype for function 'fbcon_info_from_console' [-Wmissing-prototypes]
     117 | struct fb_info *fbcon_info_from_console(int console) {
         |                 ^
   drivers/video/fbdev/core/fbcon.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | struct fb_info *fbcon_info_from_console(int console) {
         | ^
         | static 
>> drivers/video/fbdev/core/fbcon.c:280:5: warning: no previous prototype for function 'get_color' [-Wmissing-prototypes]
     280 | int get_color(struct vc_data *vc, struct fb_info *info,
         |     ^
   drivers/video/fbdev/core/fbcon.c:280:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     280 | int get_color(struct vc_data *vc, struct fb_info *info,
         | ^
         | static 
   drivers/video/fbdev/core/fbcon.c:981:14: error: no member named 'vc_decor' in 'struct vc_data'
     981 |                 cols = vc->vc_decor.twidth / vc->vc_font.width;
         |                        ~~  ^
   drivers/video/fbdev/core/fbcon.c:982:14: error: no member named 'vc_decor' in 'struct vc_data'
     982 |                 rows = vc->vc_decor.theight / vc->vc_font.height;
         |                        ~~  ^
   drivers/video/fbdev/core/fbcon.c:2066:43: error: no member named 'vc_decor' in 'struct vc_data'
    2066 |                 y_diff < 0 || y_diff > virt_fh) && !vc->vc_decor.state) {
         |                                                     ~~  ^
   drivers/video/fbdev/core/fbcon.c:2173:17: error: no member named 'vc_decor' in 'struct vc_data'
    2173 |                 if (!vc_curr->vc_decor.theme ||
         |                      ~~~~~~~  ^
   drivers/video/fbdev/core/fbcon.c:2174:15: error: no member named 'vc_decor' in 'struct vc_data'
    2174 |                         strcmp(vc->vc_decor.theme, vc_curr->vc_decor.theme) ||
         |                                ~~  ^
   drivers/video/fbdev/core/fbcon.c:2174:40: error: no member named 'vc_decor' in 'struct vc_data'
    2174 |                         strcmp(vc->vc_decor.theme, vc_curr->vc_decor.theme) ||
         |                                                    ~~~~~~~  ^
   drivers/video/fbdev/core/fbcon.c:2490:15: error: no member named 'vc_decor' in 'struct vc_data'
    2490 |                         cols = vc->vc_decor.twidth;
         |                                ~~  ^
   drivers/video/fbdev/core/fbcon.c:2491:15: error: no member named 'vc_decor' in 'struct vc_data'
    2491 |                         rows = vc->vc_decor.theight;
         |                                ~~  ^
   drivers/video/fbdev/core/fbcon.c:2700:45: error: no member named 'bgdecor' in 'struct fb_info'
    2700 |                    info->var.bits_per_pixel == 8 && info->bgdecor.cmap.red != NULL)
         |                                                     ~~~~  ^
   drivers/video/fbdev/core/fbcon.c:2701:22: error: no member named 'bgdecor' in 'struct fb_info'
    2701 |                 fb_set_cmap(&info->bgdecor.cmap, info);
         |                              ~~~~  ^
   2 warnings and 10 errors generated.


vim +/get_color +280 drivers/video/fbdev/core/fbcon.c

   279	
 > 280	int get_color(struct vc_data *vc, struct fb_info *info,
   281		      u16 c, int is_fg)
   282	{
   283		int depth = fb_get_color_depth(&info->var, &info->fix);
   284		int color = 0;
   285	
   286		if (console_blanked) {
   287			unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
   288	
   289			c = vc->vc_video_erase_char & charmask;
   290		}
   291	
   292		if (depth != 1)
   293			color = (is_fg) ? attr_fgcol((vc->vc_hi_font_mask) ? 9 : 8, c)
   294				: attr_bgcol((vc->vc_hi_font_mask) ? 13 : 12, c);
   295	
   296		switch (depth) {
   297		case 1:
   298		{
   299			int col = mono_col(info);
   300			/* 0 or 1 */
   301			int fg = (info->fix.visual != FB_VISUAL_MONO01) ? col : 0;
   302			int bg = (info->fix.visual != FB_VISUAL_MONO01) ? 0 : col;
   303	
   304			if (console_blanked)
   305				fg = bg;
   306	
   307			color = (is_fg) ? fg : bg;
   308			break;
   309		}
   310		case 2:
   311			/*
   312			 * Scale down 16-colors to 4 colors. Default 4-color palette
   313			 * is grayscale. However, simply dividing the values by 4
   314			 * will not work, as colors 1, 2 and 3 will be scaled-down
   315			 * to zero rendering them invisible.  So empirically convert
   316			 * colors to a sane 4-level grayscale.
   317			 */
   318			switch (color) {
   319			case 0:
   320				color = 0; /* black */
   321				break;
   322			case 1 ... 6:
   323				color = 2; /* white */
   324				break;
   325			case 7 ... 8:
   326				color = 1; /* gray */
   327				break;
   328			default:
   329				color = 3; /* intense white */
   330				break;
   331			}
   332			break;
   333		case 3:
   334			/*
   335			 * Last 8 entries of default 16-color palette is a more intense
   336			 * version of the first 8 (i.e., same chrominance, different
   337			 * luminance).
   338			 */
   339			color &= 7;
   340			break;
   341		}
   342	
   343	
   344		return color;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
