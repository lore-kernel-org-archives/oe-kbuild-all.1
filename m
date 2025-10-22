Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062A72C21ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 03:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761104953; cv=none; b=JLA0pdwsjLmSrUmo7mjtXg9gW2ivhA/LA+PnfEAmu3PFahKct+wVN/pw/FMDYspYspBQxRN9rRn9iw717ceofDv2TYZ9ZdoZBbHLCA4EuA5MdXTH+oRB9ZTMKIwP9Rmr8U3F951N+fjFw2Mk6lBNEHFkUmiwjt4dO+RGzxhOc1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761104953; c=relaxed/simple;
	bh=4s21/2kBqn0OeHRBMEZVjyXESo7hiXhV2AnOkCzrlYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZH1Wr5SZ9/P0Nn0UtvZY5IlXlrhavdrL6j/8SwyOP7pBT2CPc4Hri7bj+fFtrX672o8fO/KxoxQw0kzQjMx8uayXFJX1Y3A9O9DvuWL4zcQ20OkXjV5mY1zcu1srlnTO69ccgJfLrVJu+qPZpAIpfMdE6ooTNhagRRdteO/B3zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qdi8qAVD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qdi8qAVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761104953; x=1792640953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4s21/2kBqn0OeHRBMEZVjyXESo7hiXhV2AnOkCzrlYw=;
  b=Qdi8qAVDlZ/z+AuO+qjDxshy1b/Nt3w7LhRqBJnVi3Gq9B7ehg1oxBkK
   siy+02itBEfg3bv4WnKI1O9RyeatfqBpoBTJyohdMKVyDZSDTgGTkIHL+
   bzt4+Bc/z73BmV12Qhljx/I2azCI+FMlyiNm0ZqtLtGeh+aeWlX5ENEu2
   f+UfcfRkD/U07QBOCvzEdI9i6AW9Gg9hrzM+SE6sMoTMv30pt1EvLHdrp
   N5m2e4sEc1uTdM32DM+vvrgjoLSAiRjL48rcWNORgaKgDv3z9J6Ws/PpI
   HogxHtQJ/sFdSglHu0bRc9MS5YJIgy0F/yTMXjX4R7hYfBz+KK5in8iTB
   w==;
X-CSE-ConnectionGUID: qTZKn+4PRB+b7nMNSrjuhw==
X-CSE-MsgGUID: L+KntvXkSoiim6qs9KO+Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73532822"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73532822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:49:12 -0700
X-CSE-ConnectionGUID: AhkvTca/RpC0llLOxopZBw==
X-CSE-MsgGUID: 1qg6gcWNSQK+kG4BvwtiIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182966033"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2025 20:49:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBPq7-000Byh-38;
	Wed, 22 Oct 2025 03:48:51 +0000
Date: Wed, 22 Oct 2025 11:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: drivers/gpu/drm/sitronix/st7571-i2c.c:318:2-3: Unneeded semicolon
Message-ID: <202510221125.Cg0sM4xJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcus,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   552c50713f273b494ac6c77052032a49bc9255e2
commit: 9b8f32002cddf792fc6657c6f084585c7af1a858 drm/sitronix: move tiny Sitronix drivers to their own subdir
date:   5 months ago
config: alpha-randconfig-r061-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221125.Cg0sM4xJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221125.Cg0sM4xJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7571-i2c.c:318:2-3: Unneeded semicolon

vim +318 drivers/gpu/drm/sitronix/st7571-i2c.c

4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  290  
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  291  static void st7571_prepare_buffer_grayscale(struct st7571_device *st7571,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  292  					    const struct iosys_map *vmap,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  293  					    struct drm_framebuffer *fb,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  294  					    struct drm_rect *rect,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  295  					    struct drm_format_conv_state *fmtcnv_state)
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  296  {
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  297  	u32 size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  298  	unsigned int dst_pitch;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  299  	struct iosys_map dst;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  300  
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  301  	switch (fb->format->format) {
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  302  	case DRM_FORMAT_XRGB8888: /* Only support XRGB8888 in monochrome mode */
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  303  		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  304  		iosys_map_set_vaddr(&dst, st7571->hwbuf);
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  305  
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  306  		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  307  		break;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  308  
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  309  	case DRM_FORMAT_R1:
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  310  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  311  		memcpy(st7571->hwbuf, vmap->vaddr, size);
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  312  		break;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  313  
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  314  	case DRM_FORMAT_R2:
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  315  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 4;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  316  		memcpy(st7571->hwbuf, vmap->vaddr, size);
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  317  		break;
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23 @318  	};
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  319  }
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  320  

:::::: The code at line 318 was first introduced by commit
:::::: 4b35f0f41ee295059c46a6f4ae97e4b5b8f10d9e drm/st7571-i2c: add support for Sitronix ST7571 LCD controller

:::::: TO: Marcus Folkesson <marcus.folkesson@gmail.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
