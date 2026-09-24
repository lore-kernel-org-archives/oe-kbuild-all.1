Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688040BCB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230954; cv=none; b=j9KBHAU1y/f9CDE+mFobBjWs4HMqp6se7HQOuYx7CidMUTL7huGD+WzThnVNk40PZU/qqjDalmTHH3jSbyD0iFQ8I0CZptbeeQGI0FxVBoCPql56UUodpWfvCVa2edJCoehpMYStrxxru/JbQHOgQ+IvukDCaga4stnZVhTLE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230954; c=relaxed/simple;
	bh=QNx0y0VouCPKeMXNYjtcggo+T6AfXcLj+HvYZeRBesQ=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/wLU3oZO4lupZOAczgmHFZbtw14tbVZ9wPsJRqlWDuYh2snZCwL+J51uhBZtpUJ2fD9GkhcXjzR6HnlHlp65U8zbwcKgAgJwKLAWr/JBLE27rF3IeZXLuHgbOnH0fvRnOkUV5sOofLgLQYSUwU44gBKaIi8Fu923100/fSb4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSXpAzFU; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSXpAzFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790230952; x=1821766952;
  h=date:from:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=QNx0y0VouCPKeMXNYjtcggo+T6AfXcLj+HvYZeRBesQ=;
  b=GSXpAzFUN07KmYlu+vPXQVlXl6Q9MvQarICM1qOkOrw8ZIJsQe5evpon
   Ha7GCE6rde+tuEXL4p9eer5yxmfm/ZfHd6c9HhF17t7ZjRn5FWm69oABo
   tG6YLB3HJzxj3efgy7HmfAgIxS0A0kYRYKy0eDhGmAXBEnat3Y5jeSm7A
   DOX7Gd5tgi6Lww6o9XxssIkR9ASfKi/cSUyAnL1aPXtvyklNE6lkC0BSZ
   1lRF5h4pcUH+aDP8CIqINCanT/FaIoBJcTCz2QsbPslI0lzBdVEJrjqH/
   7uoV4KG5bAQV3orC+ZIjXX6JIO2hbq+tky79LVjb2lY+MPryyPI6OvX8E
   g==;
X-CSE-ConnectionGUID: kOPnxc3PRq6Znz2UZlRotQ==
X-CSE-MsgGUID: iWDVDCkkSNS2wK/mxrs0tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1479687"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="1479687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:22:32 -0700
X-CSE-ConnectionGUID: +XN2HeFzTmyOkYHX6hYv+w==
X-CSE-MsgGUID: aPEu2ml5QG2aBJxRdjTGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="282029934"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 23:22:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9cqi-00000000IIE-3IBR
	for oe-kbuild-all@lists.linux.dev;
	Thu, 24 Sep 2026 06:22:28 +0000
Date: Thu, 24 Sep 2026 14:22:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609241435.RWeVa1oI-lkp@intel.com>
References: <202609241435.RWeVa1oI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202609241435.RWeVa1oI-lkp@intel.com>

Hi John,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/John-Keeping/media-rockchip-rga-fix-rotation-on-rev0-hardware/20260923-115131
base:   
patch link:    https://lore.kernel.org/r/202609241435.RWeVa1oI-lkp%40intel.com
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260924/202609241435.RWeVa1oI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241435.RWeVa1oI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241435.RWeVa1oI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/rockchip/rga/rga-hw.c: In function 'rga_cmd_set_trans_info':
>> drivers/media/platform/rockchip/rga/rga-hw.c:161:30: warning: unused variable 'rga' [-Wunused-variable]
     161 |         struct rockchip_rga *rga = ctx->rga;
         |                              ^~~


vim +/rga +161 drivers/media/platform/rockchip/rga/rga-hw.c

f7e7b48e6d796d Jacob Chen            2017-10-11  158  
f7e7b48e6d796d Jacob Chen            2017-10-11  159  static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
f7e7b48e6d796d Jacob Chen            2017-10-11  160  {
f7e7b48e6d796d Jacob Chen            2017-10-11 @161  	struct rockchip_rga *rga = ctx->rga;
6f4e57d57c474b Sven Püschel          2026-05-21  162  	u32 *dest = ctx->cmdbuf_virt;
f7e7b48e6d796d Jacob Chen            2017-10-11  163  	unsigned int scale_dst_w, scale_dst_h;
558c248f930e68 Michael Tretter       2023-10-13  164  	unsigned int src_h, src_w, dst_h, dst_w;
f7e7b48e6d796d Jacob Chen            2017-10-11  165  	union rga_src_info src_info;
f7e7b48e6d796d Jacob Chen            2017-10-11  166  	union rga_dst_info dst_info;
f7e7b48e6d796d Jacob Chen            2017-10-11  167  	union rga_src_x_factor x_factor;
f7e7b48e6d796d Jacob Chen            2017-10-11  168  	union rga_src_y_factor y_factor;
f7e7b48e6d796d Jacob Chen            2017-10-11  169  	union rga_src_vir_info src_vir_info;
f7e7b48e6d796d Jacob Chen            2017-10-11  170  	union rga_src_act_info src_act_info;
f7e7b48e6d796d Jacob Chen            2017-10-11  171  	union rga_dst_vir_info dst_vir_info;
f7e7b48e6d796d Jacob Chen            2017-10-11  172  	union rga_dst_act_info dst_act_info;
918c4589a0e2bb Sven Püschel          2026-05-21  173  	u32 in_stride, out_stride;
d8427bb2efbb30 Sven Püschel          2026-05-21  174  	struct rga_fmt *in_fmt = ctx->in.fmt;
d8427bb2efbb30 Sven Püschel          2026-05-21  175  	struct rga_fmt *out_fmt = ctx->out.fmt;
f7e7b48e6d796d Jacob Chen            2017-10-11  176  
f7e7b48e6d796d Jacob Chen            2017-10-11  177  	src_h = ctx->in.crop.height;
f7e7b48e6d796d Jacob Chen            2017-10-11  178  	src_w = ctx->in.crop.width;
f7e7b48e6d796d Jacob Chen            2017-10-11  179  	dst_h = ctx->out.crop.height;
f7e7b48e6d796d Jacob Chen            2017-10-11  180  	dst_w = ctx->out.crop.width;
f7e7b48e6d796d Jacob Chen            2017-10-11  181  
f7e7b48e6d796d Jacob Chen            2017-10-11  182  	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  183  	dst_info.val = dest[(RGA_DST_INFO - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  184  	x_factor.val = dest[(RGA_SRC_X_FACTOR - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  185  	y_factor.val = dest[(RGA_SRC_Y_FACTOR - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  186  	src_vir_info.val = dest[(RGA_SRC_VIR_INFO - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  187  	src_act_info.val = dest[(RGA_SRC_ACT_INFO - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  188  	dst_vir_info.val = dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  189  	dst_act_info.val = dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >> 2];
f7e7b48e6d796d Jacob Chen            2017-10-11  190  
d8427bb2efbb30 Sven Püschel          2026-05-21  191  	src_info.data.format = in_fmt->hw_format;
d8427bb2efbb30 Sven Püschel          2026-05-21  192  	src_info.data.swap = in_fmt->color_swap;
d8427bb2efbb30 Sven Püschel          2026-05-21  193  	dst_info.data.format = out_fmt->hw_format;
d8427bb2efbb30 Sven Püschel          2026-05-21  194  	dst_info.data.swap = out_fmt->color_swap;
f7e7b48e6d796d Jacob Chen            2017-10-11  195  
0f879bab72f47e Paul Kocialkowski     2020-04-30  196  	/*
0f879bab72f47e Paul Kocialkowski     2020-04-30  197  	 * CSC mode must only be set when the colorspace families differ between
0f879bab72f47e Paul Kocialkowski     2020-04-30  198  	 * input and output. It must remain unset (zeroed) if both are the same.
0f879bab72f47e Paul Kocialkowski     2020-04-30  199  	 */
0f879bab72f47e Paul Kocialkowski     2020-04-30  200  
d8427bb2efbb30 Sven Püschel          2026-05-21  201  	if (RGA_COLOR_FMT_IS_YUV(in_fmt->hw_format) &&
d8427bb2efbb30 Sven Püschel          2026-05-21  202  	    RGA_COLOR_FMT_IS_RGB(out_fmt->hw_format)) {
dbf91b1ab6d956 Sven Püschel          2026-05-21  203  		switch (ctx->in.pix.colorspace) {
f7e7b48e6d796d Jacob Chen            2017-10-11  204  		case V4L2_COLORSPACE_REC709:
ded874ece29d3f Paul Kocialkowski     2020-04-30  205  			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
f7e7b48e6d796d Jacob Chen            2017-10-11  206  			break;
f7e7b48e6d796d Jacob Chen            2017-10-11  207  		default:
ded874ece29d3f Paul Kocialkowski     2020-04-30  208  			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT601_R0;
f7e7b48e6d796d Jacob Chen            2017-10-11  209  			break;
f7e7b48e6d796d Jacob Chen            2017-10-11  210  		}
f7e7b48e6d796d Jacob Chen            2017-10-11  211  	}
f7e7b48e6d796d Jacob Chen            2017-10-11  212  
d8427bb2efbb30 Sven Püschel          2026-05-21  213  	if (RGA_COLOR_FMT_IS_RGB(in_fmt->hw_format) &&
d8427bb2efbb30 Sven Püschel          2026-05-21  214  	    RGA_COLOR_FMT_IS_YUV(out_fmt->hw_format)) {
dbf91b1ab6d956 Sven Püschel          2026-05-21  215  		switch (ctx->out.pix.colorspace) {
f7e7b48e6d796d Jacob Chen            2017-10-11  216  		case V4L2_COLORSPACE_REC709:
f7e7b48e6d796d Jacob Chen            2017-10-11  217  			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
f7e7b48e6d796d Jacob Chen            2017-10-11  218  			break;
f7e7b48e6d796d Jacob Chen            2017-10-11  219  		default:
f7e7b48e6d796d Jacob Chen            2017-10-11  220  			dst_info.data.csc_mode = RGA_DST_CSC_MODE_BT601_R0;
f7e7b48e6d796d Jacob Chen            2017-10-11  221  			break;
f7e7b48e6d796d Jacob Chen            2017-10-11  222  		}
f7e7b48e6d796d Jacob Chen            2017-10-11  223  	}
f7e7b48e6d796d Jacob Chen            2017-10-11  224  
f7e7b48e6d796d Jacob Chen            2017-10-11  225  	if (ctx->vflip)
f7e7b48e6d796d Jacob Chen            2017-10-11  226  		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
f7e7b48e6d796d Jacob Chen            2017-10-11  227  
f7e7b48e6d796d Jacob Chen            2017-10-11  228  	if (ctx->hflip)
f7e7b48e6d796d Jacob Chen            2017-10-11  229  		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
f7e7b48e6d796d Jacob Chen            2017-10-11  230  
f7e7b48e6d796d Jacob Chen            2017-10-11  231  	switch (ctx->rotate) {
f7e7b48e6d796d Jacob Chen            2017-10-11  232  	case 90:
f7e7b48e6d796d Jacob Chen            2017-10-11  233  		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
f7e7b48e6d796d Jacob Chen            2017-10-11  234  		break;
f7e7b48e6d796d Jacob Chen            2017-10-11  235  	case 180:
f7e7b48e6d796d Jacob Chen            2017-10-11  236  		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
f7e7b48e6d796d Jacob Chen            2017-10-11  237  		break;
f7e7b48e6d796d Jacob Chen            2017-10-11  238  	case 270:
f7e7b48e6d796d Jacob Chen            2017-10-11  239  		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
f7e7b48e6d796d Jacob Chen            2017-10-11  240  		break;
f7e7b48e6d796d Jacob Chen            2017-10-11  241  	default:
f7e7b48e6d796d Jacob Chen            2017-10-11  242  		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
f7e7b48e6d796d Jacob Chen            2017-10-11  243  		break;
f7e7b48e6d796d Jacob Chen            2017-10-11  244  	}
f7e7b48e6d796d Jacob Chen            2017-10-11  245  
f7e7b48e6d796d Jacob Chen            2017-10-11  246  	/*
8b72c18d467fad Mauro Carvalho Chehab 2019-02-18  247  	 * Calculate the up/down scaling mode/factor.
f7e7b48e6d796d Jacob Chen            2017-10-11  248  	 *
f7e7b48e6d796d Jacob Chen            2017-10-11  249  	 * RGA used to scale the picture first, and then rotate second,
f7e7b48e6d796d Jacob Chen            2017-10-11  250  	 * so we need to swap the w/h when rotate degree is 90/270.
f7e7b48e6d796d Jacob Chen            2017-10-11  251  	 */
f7e7b48e6d796d Jacob Chen            2017-10-11  252  	if (src_info.data.rot_mode == RGA_SRC_ROT_MODE_90_DEGREE ||
f7e7b48e6d796d Jacob Chen            2017-10-11  253  	    src_info.data.rot_mode == RGA_SRC_ROT_MODE_270_DEGREE) {
f7e7b48e6d796d Jacob Chen            2017-10-11  254  		scale_dst_h = dst_w;
f7e7b48e6d796d Jacob Chen            2017-10-11  255  		scale_dst_w = dst_h;
f7e7b48e6d796d Jacob Chen            2017-10-11  256  	} else {
f7e7b48e6d796d Jacob Chen            2017-10-11  257  		scale_dst_w = dst_w;
f7e7b48e6d796d Jacob Chen            2017-10-11  258  		scale_dst_h = dst_h;
f7e7b48e6d796d Jacob Chen            2017-10-11  259  	}
f7e7b48e6d796d Jacob Chen            2017-10-11  260  
f7e7b48e6d796d Jacob Chen            2017-10-11  261  	if (src_w == scale_dst_w) {
f7e7b48e6d796d Jacob Chen            2017-10-11  262  		src_info.data.hscl_mode = RGA_SRC_HSCL_MODE_NO;
f7e7b48e6d796d Jacob Chen            2017-10-11  263  		x_factor.val = 0;
f7e7b48e6d796d Jacob Chen            2017-10-11  264  	} else if (src_w > scale_dst_w) {
f7e7b48e6d796d Jacob Chen            2017-10-11  265  		src_info.data.hscl_mode = RGA_SRC_HSCL_MODE_DOWN;
f7e7b48e6d796d Jacob Chen            2017-10-11  266  		x_factor.data.down_scale_factor =
f7e7b48e6d796d Jacob Chen            2017-10-11  267  			rga_get_scaling(src_w, scale_dst_w) + 1;
f7e7b48e6d796d Jacob Chen            2017-10-11  268  	} else {
f7e7b48e6d796d Jacob Chen            2017-10-11  269  		src_info.data.hscl_mode = RGA_SRC_HSCL_MODE_UP;
f7e7b48e6d796d Jacob Chen            2017-10-11  270  		x_factor.data.up_scale_factor =
f7e7b48e6d796d Jacob Chen            2017-10-11  271  			rga_get_scaling(src_w - 1, scale_dst_w - 1);
f7e7b48e6d796d Jacob Chen            2017-10-11  272  	}
f7e7b48e6d796d Jacob Chen            2017-10-11  273  
f7e7b48e6d796d Jacob Chen            2017-10-11  274  	if (src_h == scale_dst_h) {
f7e7b48e6d796d Jacob Chen            2017-10-11  275  		src_info.data.vscl_mode = RGA_SRC_VSCL_MODE_NO;
f7e7b48e6d796d Jacob Chen            2017-10-11  276  		y_factor.val = 0;
f7e7b48e6d796d Jacob Chen            2017-10-11  277  	} else if (src_h > scale_dst_h) {
f7e7b48e6d796d Jacob Chen            2017-10-11  278  		src_info.data.vscl_mode = RGA_SRC_VSCL_MODE_DOWN;
f7e7b48e6d796d Jacob Chen            2017-10-11  279  		y_factor.data.down_scale_factor =
f7e7b48e6d796d Jacob Chen            2017-10-11  280  			rga_get_scaling(src_h, scale_dst_h) + 1;
f7e7b48e6d796d Jacob Chen            2017-10-11  281  	} else {
f7e7b48e6d796d Jacob Chen            2017-10-11  282  		src_info.data.vscl_mode = RGA_SRC_VSCL_MODE_UP;
f7e7b48e6d796d Jacob Chen            2017-10-11  283  		y_factor.data.up_scale_factor =
f7e7b48e6d796d Jacob Chen            2017-10-11  284  			rga_get_scaling(src_h - 1, scale_dst_h - 1);
f7e7b48e6d796d Jacob Chen            2017-10-11  285  	}
f7e7b48e6d796d Jacob Chen            2017-10-11  286  
f7e7b48e6d796d Jacob Chen            2017-10-11  287  	/*
8b72c18d467fad Mauro Carvalho Chehab 2019-02-18  288  	 * Calculate the framebuffer virtual strides and active size,
f7e7b48e6d796d Jacob Chen            2017-10-11  289  	 * note that the step of vir_stride / vir_width is 4 byte words
f7e7b48e6d796d Jacob Chen            2017-10-11  290  	 */
918c4589a0e2bb Sven Püschel          2026-05-21  291  	in_stride = ctx->in.pix.plane_fmt[0].bytesperline;
918c4589a0e2bb Sven Püschel          2026-05-21  292  	src_vir_info.data.vir_stride = in_stride >> 2;
918c4589a0e2bb Sven Püschel          2026-05-21  293  	src_vir_info.data.vir_width = in_stride >> 2;
f7e7b48e6d796d Jacob Chen            2017-10-11  294  
f7e7b48e6d796d Jacob Chen            2017-10-11  295  	src_act_info.data.act_height = src_h - 1;
f7e7b48e6d796d Jacob Chen            2017-10-11  296  	src_act_info.data.act_width = src_w - 1;
f7e7b48e6d796d Jacob Chen            2017-10-11  297  
918c4589a0e2bb Sven Püschel          2026-05-21  298  	out_stride = ctx->out.pix.plane_fmt[0].bytesperline;
918c4589a0e2bb Sven Püschel          2026-05-21  299  	dst_vir_info.data.vir_stride = out_stride >> 2;
f7e7b48e6d796d Jacob Chen            2017-10-11  300  	dst_act_info.data.act_height = dst_h - 1;
f7e7b48e6d796d Jacob Chen            2017-10-11  301  	dst_act_info.data.act_width = dst_w - 1;
f7e7b48e6d796d Jacob Chen            2017-10-11  302  
558c248f930e68 Michael Tretter       2023-10-13  303  	dest[(RGA_SRC_X_FACTOR - RGA_MODE_BASE_REG) >> 2] = x_factor.val;
558c248f930e68 Michael Tretter       2023-10-13  304  	dest[(RGA_SRC_Y_FACTOR - RGA_MODE_BASE_REG) >> 2] = y_factor.val;
558c248f930e68 Michael Tretter       2023-10-13  305  	dest[(RGA_SRC_VIR_INFO - RGA_MODE_BASE_REG) >> 2] = src_vir_info.val;
558c248f930e68 Michael Tretter       2023-10-13  306  	dest[(RGA_SRC_ACT_INFO - RGA_MODE_BASE_REG) >> 2] = src_act_info.val;
558c248f930e68 Michael Tretter       2023-10-13  307  
558c248f930e68 Michael Tretter       2023-10-13  308  	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
558c248f930e68 Michael Tretter       2023-10-13  309  
558c248f930e68 Michael Tretter       2023-10-13  310  	dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >> 2] = dst_vir_info.val;
558c248f930e68 Michael Tretter       2023-10-13  311  	dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >> 2] = dst_act_info.val;
558c248f930e68 Michael Tretter       2023-10-13  312  
558c248f930e68 Michael Tretter       2023-10-13  313  	dest[(RGA_DST_INFO - RGA_MODE_BASE_REG) >> 2] = dst_info.val;
558c248f930e68 Michael Tretter       2023-10-13  314  }
558c248f930e68 Michael Tretter       2023-10-13  315  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
