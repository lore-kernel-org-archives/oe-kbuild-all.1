Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296620;
	b=FnxkFOm8rbvtNWtQu+mjHvDgwnJATmEF+dPR8kUfWT3qQ9fCcAoiu7JtfBWQ4YN2xl21
	 0m8T/kBftyeRB5dwQHdwkyX6gH/bVNUh4MxHvN2FsbZ0nHObGoeRbrqUrJyRhXeaVx0CV
	 fOIT70qQMNk83pwxbdKTDmmudImopv6v5GMCi3S/qQ2gtAfq7jTDXJGYoZJKv2wt2136I
	 TN0e0dgxn1+O7FphSTzQ6jvhRPJGOEPq4iZEaYWBhH/Ck2w/bGVWzfWfvyFJBC9zny9fA
	 /icrC8rEuhKv198mKONJft/duNIb/FLExKTS+hwRHbNpoVLTSFF3MY5+dI5jv3tMMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AWJM6hRyI1WFYLImEsFSGo6obGGmKMDZjgAIEswuHXU=;
	b=YKp33TXnM3225TZ+C4YFc/TSbE2gu0ao0DeMybtPF39+UO2tcz8GqETDTuOKHRUO7/VU
	 CNSGBEunP9dioDdjxpL1/Z/3jGKapzgUIQ5Qd6aGtXDsNfn/QLF3Dd6e1qprdklO7cjgL
	 D5MjYPML4CLLnS/wT1A9Lsv7q2McH1kXpilLmqa1566XLVz199MhWnGcz7yHY0DxlizIE
	 ObxT9QiSmE14ejimshjCpty4We5M7N1TFiDN3vZbbgS8hysSGAQee0yTi0JfaWa/VU/l8
	 VUgLpW0dwDvm9jGACSdxpw0Efd75QJKnSqPL+YPgzsrYJQR5jhm/rP532J0daSY1Xew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JSXntkjY;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF1606A330
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 21:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4AF1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JSXntkjY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795296619; x=1826832619;
  h=date:from:to:cc:subject:message-id;
  bh=EU8k7CG/1lhxZUtLMwcFMf5in31BQocIKBkO9opY/T8=;
  b=JSXntkjY78qpwyaM7KoM5F2+MPaieaUdeorN+YS8GZw0Exj9YEp924NH
   z8dIy9Adh5HoHyk/1UJUMbWTS4JzMt4xQdyYekeAto43oPew+fmB9eidp
   mV1S7sEkWmCuz7s5z/b5V2SK1pqa5IZFM0HYiSUgyF89g2GPEQ7cXSYxF
   dwyyUR8Nh8/dCmseL5NKjS+cT4vrqr0UiK3J0yaNGtgEmceZs4RTSD+H8
   AqmLl2vUt24Rvo4/K/OtVBumjcxyyj8XgViDUtbjICq3nyJ0ykcFAIIj4
   BKto+ujYfyppfScb5mVZHhtt/5MlEC93CX1VXaJpClyTvROZVPugRwOWV
   A==;
X-CSE-ConnectionGUID: Pp+mZS8kTl2FMZGKKWmwFQ==
X-CSE-MsgGUID: F47jN+quTomHWu4ZcrZJkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4230245"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4230245"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 13:30:18 -0800
X-CSE-ConnectionGUID: TiUt2ewHRYG55/IjinVUUQ==
X-CSE-MsgGUID: sMeWMQMyTpy7kMub3GVHMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10975070"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2026 13:30:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUsf0-000000004Nl-3zDl;
	Sat, 21 Nov 2026 21:30:14 +0000
Date: Sat, 21 Nov 2026 22:29:26 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next-v7.5 15/16]
 drivers/video/fbdev/core/bitblit.c:94:35: error: 'struct fbcon_par' has no
 member named 'rotated'; did you mean 'rotate'?
Message-ID: <20261121222750.WiFPmvyY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next-v7.5
head:   b2595e9adf4d5ea8ab31f3da7bd5ff5b0a479a64
commit: c8d71132c412bc50728c5ec2b8a8c7ab405e132d [15/16] fbcon: Handle characters with no glyph defined in a consistent way
config: s390-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121222750.WiFPmvyY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121222750.WiFPmvyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121222750.WiFPmvyY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/bitblit.c: In function 'bit_putcs_aligned':
>> drivers/video/fbdev/core/bitblit.c:94:35: error: 'struct fbcon_par' has no member named 'rotated'; did you mean 'rotate'?
       src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
                                      ^~~~~~~
                                      rotate
   drivers/video/fbdev/core/bitblit.c: In function 'bit_putcs_unaligned':
   drivers/video/fbdev/core/bitblit.c:137:35: error: 'struct fbcon_par' has no member named 'rotated'; did you mean 'rotate'?
       src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
                                      ^~~~~~~
                                      rotate


vim +94 drivers/video/fbdev/core/bitblit.c

    76	
    77	static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
    78					     const u16 *s, u32 attr, u32 cnt,
    79					     u32 d_pitch, u32 s_width, u32 s_vpitch,
    80					     struct fb_image *image,
    81					     unsigned char *buf, u8 *dst)
    82	{
    83		u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
    84		u32 idx = vc->vc_font.width >> 3;
    85		struct fbcon_par *par = info->fbcon_par;
    86		u32 s_pitch = font_glyph_pitch(s_width);
    87		const unsigned char *src;
    88	
    89		while (cnt--) {
    90			u16 ch = scr_readw(s++) & charmask;
    91	
    92			src = font_data_glyph_buf(par->p->fontdata, s_width, s_vpitch, ch);
    93			if (!src) {
  > 94				src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
    95				if (!src)
    96					goto next_char;
    97			}
    98	
    99			if (attr) {
   100				update_attr(buf, src, attr, vc);
   101				src = buf;
   102			}
   103	
   104			if (likely(idx == 1))
   105				__fb_pad_aligned_buffer(dst, d_pitch, src, idx,
   106							image->height);
   107			else
   108				fb_pad_aligned_buffer(dst, d_pitch, src, idx,
   109						      image->height);
   110	next_char:
   111			dst += s_pitch;
   112		}
   113	
   114		info->fbops->fb_imageblit(info, image);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
