Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230E21A314E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041732; cv=none; b=jPeujfTtA+u5d36gAHbF8OLpOhhYFTjmW6Jo6/mYMiwbpwI7IhKQQP1+PQsS8x8ZEGYnsxiDl47e3P6clWjtg8Y2w/vUbiFkBed33Dp3ovXqL2M7P33wBcrb0WWigg5dJ/t/RyIBj7ILdgS75Asap+QpVBA2FEaVNO6H97qoy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041732; c=relaxed/simple;
	bh=8tXVHJ+5TRVNl7KZZFTiZyV8EBw3NQsNUyJGZRoCm8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQnq2065bb3IWg777CH8hoIXRypGi1dXn0qKNeX6pZu8dkBmrAZCLEnQKuzCVobzl6X5IKcS1afkRId/lhJH0K8+FBhUR86WuTWFUG2Gzui8DcHpbKvHrjbS7Rv6tb2oHoIQmdtIDo4kl7/nmY2I8bsCumz9DUqPL1QL+TenO3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g41fZ6QL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g41fZ6QL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739041731; x=1770577731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tXVHJ+5TRVNl7KZZFTiZyV8EBw3NQsNUyJGZRoCm8g=;
  b=g41fZ6QLZ2GsUDSycXoB3+6sBHtCXZkfrW+0caXL54p6RdhZAWSNeyeI
   rw0kWgLpITaaY63W04zJUYH8Yc72Yokrcdy1NMdUni0RN+qyB0d56IYbA
   VOc3BhU2bha3TsVPDKxu85SlF+BVkVGzRMgoRtd3DYvK8RO1VbkMwVIyY
   A6oTvS8e3B2R5n2bN3CEkhH1tarkd23OlPCgPMysQQRST1uTTa9gBnTuX
   p62IPGX+hKOG7ASgygBxlxYglmww8MHUL4THIexBiZViQtuBr38giZaOy
   87CdoE0QVqYvPMFJP1CNbKg2epYnL5IEZSUo6jOGl1TlCQk5eu4CWph1y
   w==;
X-CSE-ConnectionGUID: KRlG3pMBT/W1OctqM+U0Rg==
X-CSE-MsgGUID: SruSBu1TTc6rB7inVLESKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39926879"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39926879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 11:08:49 -0800
X-CSE-ConnectionGUID: 5Fu7cxT7Thec1Q8/iq40NA==
X-CSE-MsgGUID: Gkw87QRVQ6uGde+C8aXgwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111767378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2025 11:08:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgqC4-0010X1-2J;
	Sat, 08 Feb 2025 19:08:44 +0000
Date: Sun, 9 Feb 2025 03:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Zsolt Kajtar <soci@c64.rulez.org>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 15/15] drivers/video/fbdev/core/fb_draw.h:138
 fb_shifted_pixels_mask_long() warn: inconsistent indenting
Message-ID: <202502090217.jHShm68N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   720fcad9d12e92368192689a90e2b932a1e44406
commit: 720fcad9d12e92368192689a90e2b932a1e44406 [15/15] fbdev: core: Split CFB and SYS pixel reversing configuration
config: arm64-randconfig-r072-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090217.jHShm68N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090217.jHShm68N-lkp@intel.com/

New smatch warnings:
drivers/video/fbdev/core/fb_draw.h:138 fb_shifted_pixels_mask_long() warn: inconsistent indenting
drivers/video/fbdev/core/fb_draw.h:116 fb_shifted_pixels_mask_u32() warn: inconsistent indenting

Old smatch warnings:
drivers/video/fbdev/core/fb_imageblit.h:297 fast_imageblit() error: uninitialized symbol 'j'.

vim +138 drivers/video/fbdev/core/fb_draw.h

779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  100  
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  101  static inline u32 fb_shifted_pixels_mask_u32(struct fb_info *p, u32 index,
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  102  					     u32 bswapmask)
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  103  {
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  104  	u32 mask;
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  105  
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  106  	if (!bswapmask) {
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  107  		mask = FB_SHIFT_HIGH(p, ~(u32)0, index);
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  108  	} else {
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  109  		mask = 0xff << FB_LEFT_POS(p, 8);
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  110  		mask = FB_SHIFT_LOW(p, mask, index & (bswapmask)) & mask;
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  111  		mask = FB_SHIFT_HIGH(p, mask, index & ~(bswapmask));
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  112  #if defined(__i386__) || defined(__x86_64__)
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  113  		/* Shift argument is limited to 0 - 31 on x86 based CPU's */
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  114  		if(index + bswapmask < 32)
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  115  #endif
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28 @116  			mask |= FB_SHIFT_HIGH(p, ~(u32)0,
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  117  					(index + bswapmask) & ~(bswapmask));
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  118  	}
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  119  	return mask;
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  120  }
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  121  
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  122  static inline unsigned long fb_shifted_pixels_mask_long(struct fb_info *p,
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  123  							u32 index,
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  124  							u32 bswapmask)
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  125  {
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  126  	unsigned long mask;
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  127  
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  128  	if (!bswapmask) {
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  129  		mask = FB_SHIFT_HIGH(p, ~0UL, index);
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  130  	} else {
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  131  		mask = 0xff << FB_LEFT_POS(p, 8);
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  132  		mask = FB_SHIFT_LOW(p, mask, index & (bswapmask)) & mask;
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28  133  		mask = FB_SHIFT_HIGH(p, mask, index & ~(bswapmask));
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  134  #if defined(__i386__) || defined(__x86_64__)
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  135  		/* Shift argument is limited to 0 - 31 on x86 based CPU's */
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  136  		if(index + bswapmask < BITS_PER_LONG)
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  137  #endif
e4c690e061b909 drivers/video/fb_draw.h Anton Vorontsov 2008-04-28 @138  			mask |= FB_SHIFT_HIGH(p, ~0UL,
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  139  					(index + bswapmask) & ~(bswapmask));
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  140  	}
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  141  	return mask;
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  142  }
779121e9f17525 drivers/video/fb_draw.h Pavel Pisa      2007-10-16  143  

:::::: The code at line 138 was first introduced by commit
:::::: e4c690e061b909127ab0f12e929f82f3f39ec953 fb: add support for foreign endianness

:::::: TO: Anton Vorontsov <avorontsov@ru.mvista.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
