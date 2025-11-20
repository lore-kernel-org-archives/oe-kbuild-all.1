Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B54311C3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630694; cv=none; b=GAu/VFlcYDYDzD84jmLuaJSJl5If9+FEeKqDFj3mD34/0kiUb1RngK1xRcubYB54rY7JG5TYbbfK+lzKz9dNSJ15wNwepQojAa/ewuZ+N53nJ1G6eQMWvBtHa41DGHyY+n/6WAyhFYLD+VzmBffok/uWDHG6IbXIKlEfLuNto3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630694; c=relaxed/simple;
	bh=OPjNc/gUByCFqZ8Vixc1KLela/ta95EHDRNxS4C1lGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/mOrlYI0PS80blwoaocSrKAA6y5THkZPcwqmme5IfCYimNjkt2/DTQYgGo5mddlYoSgBiBFvDC6FQ7jN459baLxMmfqIkDcKZnbhC1j1VoAUjtTcJPUU0iAj6gwcJTqVMOvJpjUTNKOONIf3Da3mcqeGeKJyUEgPZolmVPAbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4cKht6k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4cKht6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763630693; x=1795166693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPjNc/gUByCFqZ8Vixc1KLela/ta95EHDRNxS4C1lGg=;
  b=b4cKht6kYVmXORzwjFn2iMjC+UhYvdRzd+9wHypfYHZNupfRWAuzV8YF
   CH2LDPlr+j9pmqKUbXHjhvF4SMCBjjOlp2GnNDOtyeuOCcRKbtbm8L21x
   sWoI47xDhZnHT9mI3HrXegvDcP8NGASVLcGE7nYsniMXwEPSPb0SUV6ar
   ERM1AgQVmZquCgSpg9iEOZteuKXIgWplBDGAwdHa+cwDfV9pUIHZur8yn
   hAe50z5oZ+IGwVvhZTQgHAAphsnnkbQj6BtV5RbXjYZU8aGW7Ed+ozGkk
   KPCMgpg3sTeXTAH9vVlriR1/CxZJ5tMxAoK3aR9JmlY6QOkUHEvT1xvIL
   w==;
X-CSE-ConnectionGUID: 8P5k27XCTGW90IggAvq7cg==
X-CSE-MsgGUID: TvnJty/hQpmXY2s1hqNHig==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65572010"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65572010"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:24:51 -0800
X-CSE-ConnectionGUID: c33I7xXpT0ibIp+AOLBl8w==
X-CSE-MsgGUID: 2SrIl1SnRwWseOQT7lVhaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="221957870"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 01:24:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0uD-0003oF-2q;
	Thu, 20 Nov 2025 09:24:45 +0000
Date: Thu, 20 Nov 2025 17:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: ssrane_b23@ee.vjti.ac.in, Zsolt Kajtar <soci@c64.rulez.org>,
	Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
Subject: Re: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
Message-ID: <202511201752.4fVbQwPc-lkp@intel.com>
References: <20251119133821.89998-1-ssranevjti@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119133821.89998-1-ssranevjti@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ssrane_b23-ee-vjti-ac-in/fbdev-core-Fix-vmalloc-out-of-bounds-in-fb_imageblit/20251119-215054
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251119133821.89998-1-ssranevjti%40gmail.com
patch subject: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
config: nios2-randconfig-r073-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201752.4fVbQwPc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201752.4fVbQwPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201752.4fVbQwPc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/core/cfbimgblt.c:17:
   drivers/video/fbdev/core/fb_imageblit.h: In function 'fb_imageblit':
>> drivers/video/fbdev/core/fb_imageblit.h:490:16: warning: unused variable 'max_offset_bytes' [-Wunused-variable]
     490 |  unsigned long max_offset_bytes;
         |                ^~~~~~~~~~~~~~~~


vim +/max_offset_bytes +490 drivers/video/fbdev/core/fb_imageblit.h

   480	
   481	static inline void fb_imageblit(struct fb_info *p, const struct fb_image *image)
   482	{
   483		int bpp = p->var.bits_per_pixel;
   484		unsigned int bits_per_line = BYTES_TO_BITS(p->fix.line_length);
   485		struct fb_address dst = fb_address_init(p);
   486		struct fb_reverse reverse = fb_reverse_init(p);
   487		const u32 *palette = fb_palette(p);
   488		struct fb_image clipped_image;
   489		u32 max_x, max_y;
 > 490		unsigned long max_offset_bytes;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
