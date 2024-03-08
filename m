Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFAE134A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883228; cv=none; b=dU5u4I754cOqz/vGasX3bv91cIJ9J6oUPELk+IIYA4lYpZkf6dN9hT+exdnbjv9njSMHQg43PTIFlIGNy+Ot5Ye6Q7kkT1cXRzAgwrdsDo4g1eJP0Wf20uGo4FO+S+5sHCmkqtkaG0PatQDztQRbi5A0YLqU5oRqlQqYI3Mfxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883228; c=relaxed/simple;
	bh=fJMnasIK0yBCuMCjPnhaLY91FzAYdLr/PhID4i5QP44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFap89bwfOlF3ualeQws94yGeX0YgcEVM/ZqY1uw/GjuqvlGLDJYFtg4LK3nLAuInBMXd1VPDuJOvBqoSVDdHenEP9jEGn0SazUn7EO7UV4UrUgEEcYw9xsXbx5jx3kak4zfBUgQvQB7C/6WarrGm/WcCoIxjGLJ5ub8Uno136E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ni/QqQXB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ni/QqQXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709883227; x=1741419227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJMnasIK0yBCuMCjPnhaLY91FzAYdLr/PhID4i5QP44=;
  b=Ni/QqQXB4sc7UIX6VB7bYCTJ2XmtlKRc4kwVnKgQIMryfquu2GmT3IKK
   JxxMgPPeDCajAxAi1MKCndp33/CpFmLnSVp0ptsyOixpNoEdPJsDNyJv6
   +SXmeW1TaQxStWYRV2gO+c3Dtb/ZleSerH6XBXGFiZduTIkIlSjCdHis9
   025ppQnAI2eiKJ67ASmZ3Vsfj0vbWoUAAVATcPMFe29EtpNb0l29R5zuy
   C+7pi29upPbJNU2tFoy2PXzx5Lr5zMtels5obxh2a457kSFlMZNzjrZip
   9Dh41FnONDGMPDgbOA2beoCic+eOQtGbcOoWwCVuZ0P8CKhHgMcGQjLwg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4451784"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4451784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 23:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41293618"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2024 23:33:43 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riUjc-00069z-1t;
	Fri, 08 Mar 2024 07:33:40 +0000
Date: Fri, 8 Mar 2024 15:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/core 3/9] drivers/gpu/drm/i915/i915_memcpy.c:144:2:
 error: call to undeclared function 'BUG_ON'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202403081516.g3VFoFQu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/core
head:   0cde2a60890f35f01033f84c1c6dfba3ffca3449
commit: 837b6d58d4521eb15a50dab76b089f9d7b6e0e22 [3/9] x86/msr: Add missing __percpu annotations
config: i386-randconfig-054-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081516.g3VFoFQu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081516.g3VFoFQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081516.g3VFoFQu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_memcpy.c:144:2: error: call to undeclared function 'BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |         CI_BUG_ON(!i915_has_memcpy_from_wc());
         |         ^
   drivers/gpu/drm/i915/i915_memcpy.c:33:25: note: expanded from macro 'CI_BUG_ON'
      33 | #define CI_BUG_ON(expr) BUG_ON(expr)
         |                         ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/BUG_ON +144 drivers/gpu/drm/i915/i915_memcpy.c

0b1de5d58e1972 Chris Wilson      2016-08-12  128  
6aacb5a3b0bccf Chris Wilson      2019-12-11  129  /**
6aacb5a3b0bccf Chris Wilson      2019-12-11  130   * i915_unaligned_memcpy_from_wc: perform a mostly accelerated read from WC
6aacb5a3b0bccf Chris Wilson      2019-12-11  131   * @dst: destination pointer
6aacb5a3b0bccf Chris Wilson      2019-12-11  132   * @src: source pointer
6aacb5a3b0bccf Chris Wilson      2019-12-11  133   * @len: how many bytes to copy
6aacb5a3b0bccf Chris Wilson      2019-12-11  134   *
6aacb5a3b0bccf Chris Wilson      2019-12-11  135   * Like i915_memcpy_from_wc(), the unaligned variant copies @len bytes from
6aacb5a3b0bccf Chris Wilson      2019-12-11  136   * @src to @dst using * non-temporal instructions where available, but
6aacb5a3b0bccf Chris Wilson      2019-12-11  137   * accepts that its arguments may not be aligned, but are valid for the
6aacb5a3b0bccf Chris Wilson      2019-12-11  138   * potential 16-byte read past the end.
6aacb5a3b0bccf Chris Wilson      2019-12-11  139   */
0edbb9ba1bfe70 Maarten Lankhorst 2021-03-23  140  void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
6aacb5a3b0bccf Chris Wilson      2019-12-11  141  {
6aacb5a3b0bccf Chris Wilson      2019-12-11  142  	unsigned long addr;
6aacb5a3b0bccf Chris Wilson      2019-12-11  143  
6aacb5a3b0bccf Chris Wilson      2019-12-11 @144  	CI_BUG_ON(!i915_has_memcpy_from_wc());
6aacb5a3b0bccf Chris Wilson      2019-12-11  145  
6aacb5a3b0bccf Chris Wilson      2019-12-11  146  	addr = (unsigned long)src;
6aacb5a3b0bccf Chris Wilson      2019-12-11  147  	if (!IS_ALIGNED(addr, 16)) {
6aacb5a3b0bccf Chris Wilson      2019-12-11  148  		unsigned long x = min(ALIGN(addr, 16) - addr, len);
6aacb5a3b0bccf Chris Wilson      2019-12-11  149  
6aacb5a3b0bccf Chris Wilson      2019-12-11  150  		memcpy(dst, src, x);
6aacb5a3b0bccf Chris Wilson      2019-12-11  151  
6aacb5a3b0bccf Chris Wilson      2019-12-11  152  		len -= x;
6aacb5a3b0bccf Chris Wilson      2019-12-11  153  		dst += x;
6aacb5a3b0bccf Chris Wilson      2019-12-11  154  		src += x;
6aacb5a3b0bccf Chris Wilson      2019-12-11  155  	}
6aacb5a3b0bccf Chris Wilson      2019-12-11  156  
6aacb5a3b0bccf Chris Wilson      2019-12-11  157  	if (likely(len))
6aacb5a3b0bccf Chris Wilson      2019-12-11  158  		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
6aacb5a3b0bccf Chris Wilson      2019-12-11  159  }
6aacb5a3b0bccf Chris Wilson      2019-12-11  160  

:::::: The code at line 144 was first introduced by commit
:::::: 6aacb5a3b0bccfa207ef2710f106020c1d749f1d drm/i915: Align start for memcpy_from_wc

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
