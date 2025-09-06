Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465A1A2398
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757152464; cv=none; b=lcHOjuDQnBj7KejwB8nkaDaeFTBrIhFwrDOVnEswNlTaLFIAkJ03yG414yiJPt9ErLMGG/s8xHLxxMi9K0/hM9DancSGVsz4CFPG9EKKBH2lYDQuuIy/GMUGiOs3HwFh3XkFmRNnPvvVKXOvmU9jSLTpmhtwsJ08nKmuH10rq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757152464; c=relaxed/simple;
	bh=q1tYQzTpYy/D3h08OcJA5AnS8r3wOTe62SGi5VT077Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbltHy/8p8qhZY8M744ZcHPRf2LbhSbg/MC19w0I4nO9wv/luuwd+UhsgSJasbShiPJASEJwqdmVpcidjYaKq4iweaN6kjgztsv6MNMNFY++YZsPvyuCfGMwjO2g9qF/x+66911dg4fWGfJbFykcOOQArm1phIZnHY6fIcczOBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ij9gVkMc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij9gVkMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757152462; x=1788688462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1tYQzTpYy/D3h08OcJA5AnS8r3wOTe62SGi5VT077Q=;
  b=ij9gVkMcwyBALUH5dUgDjJ0Q9i4t/n/juiNpmx/SPlF/SKpmku1RiNA+
   sEnxmAkkEVjLMArG5UvK5pdCETtnKA9OIZl7fQsjBmW4HL1+SmGD+IoB6
   jC5BtZN5IKQnUkCwFN0n3sX4fltjOunbjXutCKQiy9YdiFcrblShg3FC7
   XaPV+DDHzvcoKBTljXaKPH5UBSp99os9xWdxns/Vmcuh8uG0vewZyO+uz
   DU8UYMC+HnAooHsnO39JHuZIOm7NTkxaRmFwrh6oHzpKXUVfxs7g/aLsl
   qPpL+o/BAN+TCmohujuqtW92D/MtJy4EusFf6UhLabKN/U2d0F0fNmNxd
   Q==;
X-CSE-ConnectionGUID: Ew6EJrReQIydof/3GuvfYg==
X-CSE-MsgGUID: YfS7MVIsTtyn59RuWBdCVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58697939"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="58697939"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 02:54:21 -0700
X-CSE-ConnectionGUID: b+1AkHgRRI2VebBoHJMh4Q==
X-CSE-MsgGUID: Y8Lgm6gFR7OoNkPNXGpQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="171917122"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2025 02:54:20 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uupcf-00049r-2I;
	Sat, 06 Sep 2025 09:54:17 +0000
Date: Sat, 6 Sep 2025 11:54:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/11] htmldocs:
 ./drivers/gpu/drm/i915/i915_irq.c:1: warning:
 'intel_runtime_pm_disable_interrupts' not found
Message-ID: <202509061148.tsjqhBa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b35af1e3cfa947b4447968903845ace580362cb3
commit: a17fa6ad62b12310b529b63863085a2811ff8f0a [0/11] UPSTREAM: drm/i915/irq: Rename suspend/resume functions
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509061148.tsjqhBa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061148.tsjqhBa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fbdev_probe' not described in 'drm_driver'
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
>> ./drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_interrupts' not found
>> ./drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interrupts' not found
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +/intel_runtime_pm_disable_interrupts +1 ./drivers/gpu/drm/i915/i915_irq.c

0d6aa60b4ac968 drivers/char/drm/i915_irq.c Dave Airlie    2006-01-02  @1  /* i915_irq.c -- IRQ support for the I915 -*- linux-c -*-
^1da177e4c3f41 drivers/char/drm/i915_irq.c Linus Torvalds 2005-04-16   2   */
0d6aa60b4ac968 drivers/char/drm/i915_irq.c Dave Airlie    2006-01-02   3  /*
^1da177e4c3f41 drivers/char/drm/i915_irq.c Linus Torvalds 2005-04-16   4   * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
^1da177e4c3f41 drivers/char/drm/i915_irq.c Linus Torvalds 2005-04-16   5   * All Rights Reserved.
^1da177e4c3f41 drivers/char/drm/i915_irq.c Linus Torvalds 2005-04-16   6   *
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23   7   * Permission is hereby granted, free of charge, to any person obtaining a
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23   8   * copy of this software and associated documentation files (the
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23   9   * "Software"), to deal in the Software without restriction, including
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  10   * without limitation the rights to use, copy, modify, merge, publish,
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  11   * distribute, sub license, and/or sell copies of the Software, and to
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  12   * permit persons to whom the Software is furnished to do so, subject to
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  13   * the following conditions:
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  14   *
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  15   * The above copyright notice and this permission notice (including the
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  16   * next paragraph) shall be included in all copies or substantial portions
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  17   * of the Software.
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  18   *
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  19   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  20   * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  21   * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  22   * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  23   * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  24   * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  25   * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
bc54fd1ad3c597 drivers/char/drm/i915_irq.c Dave Airlie    2005-06-23  26   *
0d6aa60b4ac968 drivers/char/drm/i915_irq.c Dave Airlie    2006-01-02  27   */
^1da177e4c3f41 drivers/char/drm/i915_irq.c Linus Torvalds 2005-04-16  28  

:::::: The code at line 1 was first introduced by commit
:::::: 0d6aa60b4ac9689b750e35cd66f5d7c053aff0f4 drm: update to i915 1.3.0

:::::: TO: Dave Airlie <airlied@starflyer.(none)>
:::::: CC: Dave Airlie <airlied@linux.ie>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
