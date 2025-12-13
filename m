Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CF220F21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765634616; cv=none; b=UT4Qz0uvLGNhHWYMAlX8dFa4wGey2KcWahJqx9yHD79izg5gNrUKNsWByWyMZ7iSsB+J75hFwYINQwLpKEJ9FMevE5Oag0v3U2dvUxjgvZbi5If+77fmfKRV2eNOIrd2yaPWj/fhp9/bGAi4VGzN0KKQH283IsugLbWN0FbFhyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765634616; c=relaxed/simple;
	bh=vkluvngdqUWROIzDE6mRaB3YbCCnj2yidDBE1y1eQrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSQ7sHIVbZd59XHp9vRtT+/1prFC5QKW11ob3+FMuEenjRId1Z4uMN/ZvXJBh3yoANINXbjWRp6mgrCmMMSdv0KPXE/aPOjH7lsqHNeCSYveeUwtb3bj+zUUMTWgWSFjmnhOUD/l08fioCEaqnVfxUfCj2QgxuL8SK83HlptQB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8HWwe2U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8HWwe2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765634615; x=1797170615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkluvngdqUWROIzDE6mRaB3YbCCnj2yidDBE1y1eQrE=;
  b=g8HWwe2UZZZjalViRar/7v4qfOTYbky9U8mM6JzjGtWnkFK6y8iFdIEf
   FFgZwCrBBOi+oKZQtwOlZ+TedvreJCzYR2shQX3qVg+gNtbhgVt1yldEp
   /NV1IUIxKOxHSE/fAcNUIS6QkEgLzPU6ks1eDrdYW3n5YK4LREMYxANHM
   p0m/QpaKaGOsUH61emrEc4cm9kIZ8IVEciXnvMshNEkGQaozHtK9ABGPk
   i8Rnz4lpuM0ywwrvXPOhr33M9kSHVJctDsaMTJpowXPkExw/qGWwnSIjB
   c9v+dJCOYholZEiXecshxR4/F9Vk/mTxJs0Gl8q+zCOnOkfsAU0uGW9g6
   g==;
X-CSE-ConnectionGUID: jbdu5VKzR9CJsXFb+tBi/w==
X-CSE-MsgGUID: Fsd9CFp+R7CqYt6i3RtFVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67650330"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67650330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:03:34 -0800
X-CSE-ConnectionGUID: jZvvdmVaRWu9XCEc+oc6xw==
X-CSE-MsgGUID: 4Ai7EGEGQY+noNCjb6mJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201736746"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 06:03:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQDZ-0000000025M-0xaR;
	Sat, 13 Dec 2025 14:03:29 +0000
Date: Sat, 13 Dec 2025 15:03:21 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18] htmldocs:
 ./drivers/gpu/drm/i915/i915_irq.c:1: warning:
 'intel_runtime_pm_disable_interrupts' not found
Message-ID: <202512131541.5oJmb6Nf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rodrigo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: a17fa6ad62b12310b529b63863085a2811ff8f0a [0/18] UPSTREAM: drm/i915/irq: Rename suspend/resume functions
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512131541.5oJmb6Nf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131541.5oJmb6Nf-lkp@intel.com/

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
