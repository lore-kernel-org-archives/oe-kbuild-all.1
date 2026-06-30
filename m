Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2072D3E639D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801356; cv=none; b=BzdU9JfS905xIytZ50DqF4xDbVgMcE4kHOw18xjTy8g50oJuIDJI7smJt75MCr539Cgtxm2L9k2uNzFVUptPzhlDDwmkfTG1KiXchoteyN0KjqYyDws4DeDKYkSJSD9oKknPL9POQo8cblWToqiwMjYCb1cS9+n7mkIA8B/c/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801356; c=relaxed/simple;
	bh=g5TC97a+32fvBYAzIGnZVb2o5MOI5gzCEfaPsGQvPSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bz5420DC1EkpEXQa/fML5uA3fJdlD0flsuBg/45CgnVfvk5tvRjtoJEKA7LIpMzI0x07a30e9UNt/anVh4WoVJmXtBuP7epVNhQZrzmKyMtJTXBQFq4bKc60HMWM2uVPdhltqFeSoQMPMuh/p7kNIET/l5syaAfZFDkFJobz5cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hk+7yIMk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hk+7yIMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782801351; x=1814337351;
  h=date:from:to:cc:subject:message-id;
  bh=g5TC97a+32fvBYAzIGnZVb2o5MOI5gzCEfaPsGQvPSw=;
  b=Hk+7yIMkWsMWoPdCgC9Wary216efKlB4ajj7+5by6UYpnA1IpvW+VQKt
   mS0YL0msga+1NeXBJLG7cmwABw+5B8siAmZC5qeXN95OK5lQoOmXZ+smp
   AOCZPy4pafFMZFSiAm4dKEYWNjDU1MbnW0DH2KaUy+3vlJLLIojpPNK2y
   3KC380R6mYVtBX+8trR2olMCc0j5HXUFAvpcqolHT31E78wtGgxfqeG/w
   MkSLBkb9EFXZyMO8g548sDWDljnhIjyv7MJgzwnMd+3ptllFiw9CfvUFa
   9jBSqz1s+Uzitm4cxivdTq+Z6/YYFqAfsR/HSIieq1BzoCk8C6ZScM1JY
   A==;
X-CSE-ConnectionGUID: n1MeUr77SM20B/pXJjHd7Q==
X-CSE-MsgGUID: xtkFN48kSsi+6ydu4P1lxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83640616"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83640616"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 23:35:50 -0700
X-CSE-ConnectionGUID: 3cukZHRqTpS4hUL1kJMbSA==
X-CSE-MsgGUID: g/0Iy0AQRhK4OaAmd7h14Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248810656"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2026 23:35:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weS4P-0000000083J-20gI;
	Tue, 30 Jun 2026 06:35:45 +0000
Date: Tue, 30 Jun 2026 14:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: drivers/gpu/drm/solomon/ssd130x.c:1011:5-8: Unneeded
 variable: "ret". Return "0" on line 1024
Message-ID: <202606301409.I0ctsf41-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 2258f03989afb66087538a5d6d56c18ef6532b07 drm/solomon: Move calls to drm_gem_fb_end_cpu*()
date:   9 months ago
config: parisc-randconfig-r063-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301409.I0ctsf41-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2258f03989af ("drm/solomon: Move calls to drm_gem_fb_end_cpu*()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301409.I0ctsf41-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/solomon/ssd130x.c:1011:5-8: Unneeded variable: "ret". Return "0" on line 1024
   drivers/gpu/drm/solomon/ssd130x.c:1036:5-8: Unneeded variable: "ret". Return "0" on line 1050

vim +1011 drivers/gpu/drm/solomon/ssd130x.c

b4299c936d8fd6 Javier Martinez Canillas 2023-12-29  1001  
d51f9fbd98b6d8 Javier Martinez Canillas 2023-09-13  1002  static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
45b58669e532bc Javier Martinez Canillas 2023-07-26  1003  				const struct iosys_map *vmap,
d51f9fbd98b6d8 Javier Martinez Canillas 2023-09-13  1004  				struct drm_rect *rect,
4cd24d4b1a9548 Thomas Zimmermann        2023-10-09  1005  				u8 *buf, u8 *data_array,
4cd24d4b1a9548 Thomas Zimmermann        2023-10-09  1006  				struct drm_format_conv_state *fmtcnv_state)
a61732e808672c Javier Martinez Canillas 2022-02-14  1007  {
a61732e808672c Javier Martinez Canillas 2022-02-14  1008  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
b3aca563d69bcb Thomas Zimmermann        2022-08-08  1009  	struct iosys_map dst;
4442ac1af10442 Geert Uytterhoeven       2022-03-17  1010  	unsigned int dst_pitch;
a61732e808672c Javier Martinez Canillas 2022-02-14 @1011  	int ret = 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  1012  
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  1013  	/* Align y to display page boundaries */
ec5dceb8180f0c Javier Martinez Canillas 2023-10-14  1014  	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
ec5dceb8180f0c Javier Martinez Canillas 2023-10-14  1015  	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd130x->height);
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  1016  
27564c61ab1dbd Geert Uytterhoeven       2023-07-13  1017  	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
a61732e808672c Javier Martinez Canillas 2022-02-14  1018  
b3aca563d69bcb Thomas Zimmermann        2022-08-08  1019  	iosys_map_set_vaddr(&dst, buf);
4cd24d4b1a9548 Thomas Zimmermann        2023-10-09  1020  	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
a61732e808672c Javier Martinez Canillas 2022-02-14  1021  
d51f9fbd98b6d8 Javier Martinez Canillas 2023-09-13  1022  	ssd130x_update_rect(ssd130x, rect, buf, data_array);
a61732e808672c Javier Martinez Canillas 2022-02-14  1023  
a61732e808672c Javier Martinez Canillas 2022-02-14 @1024  	return ret;
a61732e808672c Javier Martinez Canillas 2022-02-14  1025  }
a61732e808672c Javier Martinez Canillas 2022-02-14  1026  

:::::: The code at line 1011 was first introduced by commit
:::::: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomon SSD130x OLED displays

:::::: TO: Javier Martinez Canillas <javierm@redhat.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
