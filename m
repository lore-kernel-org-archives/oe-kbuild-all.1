Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A15013DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 23:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378990; cv=none; b=r6KDaz1bZc/cb4ReiDTCbUp0vMhiODTZVwJlHbwrb7Ex3xYO8uJjG/GcnjF+/YtayX10bNkWzsRrQ4BqNvjktl4hfidR1q2kZ4PzS73pYBGXC5+N4oW/1pWteDbTnKOySbxkMrAE12BeY2aRW6U7O5IYGmO05Om2sM9YgtTCzec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378990; c=relaxed/simple;
	bh=gYUxnSz15t8ObtPJ7A9esKBuLHg7ZjQupzHh2hIp+14=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BUyKf+hG5PYU8Bb6V2siSXxYw3IOicCf/cgxEaUhQy2YQ1YG9qkeIXVyJO/486u2tkQ8tXjBurgFc0ESNYoRBOXYwPbpxr/lvE3DHdflKbjdFJmGWrudHWHmpIhRFDFg26NK2N0oLr+ZokWPvKCg4tNqt8eL00WZviLGcV6krBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmjfUf0l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmjfUf0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790378988; x=1821914988;
  h=date:from:to:cc:subject:message-id;
  bh=gYUxnSz15t8ObtPJ7A9esKBuLHg7ZjQupzHh2hIp+14=;
  b=hmjfUf0lmF52OmnlvvhBIFBgyH3TlVAv1BkcrL4ORmsY4zXTRUtLEYqB
   NGJBM37DG3vG15qEq+7VRgMOmUSBCP659cwxAkB0Iqvnq3Dw2oH5An9N0
   I/GsfKPJoIKtvT9371zsY0T2kD6I2riaZK3tDZO3KlflaLvXRsQqIt8c8
   KKDF5b/JhyeaPCaDYrCQVleo7fsj+qUgduqNn486PM3bkPHPgvMjF/E81
   SG3+rupGlBfBBQPCJYuU0L+OvNZxMZUEIhBhtQN0U3eP5qnn/t7CU/UdI
   fIrqQJrX8aIzSgwDBZWg/fRwr5pTA2iSmieJ0F6WFHY45wzV8eVtoo4ZP
   A==;
X-CSE-ConnectionGUID: 1dVLitqxS6qmCbLP4c9IRA==
X-CSE-MsgGUID: rbkJ4k6nRt6E1N1e31i3vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101698519"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101698519"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:29:48 -0700
X-CSE-ConnectionGUID: UTD5J6imQ5uWZ3x1kba/xQ==
X-CSE-MsgGUID: /XNH/Z4FTUaMU2XJW66OkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="302388989"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 16:29:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFMM-00000000LKv-3VR1;
	Fri, 25 Sep 2026 23:29:42 +0000
Date: Sat, 26 Sep 2026 07:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 0/10]
 drivers/gpu/drm/xe/xe_mmio.c:315: warning: expecting prototype for
 xe_mmio_read64_2x32(). Prototype was for __xe_mmio_read64_2x32() instead
Message-ID: <202609260717.dn5srdA8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   4a1a020d156e5b64d2fca8d2b7d413cae55f51ec
commit: 26a40327c25c005c1653d66e7b1d8de0fbee15a4 [0/10] drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
config: x86_64-randconfig-1012-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260717.dn5srdA8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260717.dn5srdA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260717.dn5srdA8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_mmio.c:315: warning: expecting prototype for xe_mmio_read64_2x32(). Prototype was for __xe_mmio_read64_2x32() instead
>> drivers/gpu/drm/xe/xe_mmio.c:416: warning: expecting prototype for xe_mmio_wait32(). Prototype was for __xe_mmio_wait32() instead
>> drivers/gpu/drm/xe/xe_mmio.c:435: warning: expecting prototype for xe_mmio_wait32_not(). Prototype was for __xe_mmio_wait32_not() instead


vim +315 drivers/gpu/drm/xe/xe_mmio.c

54c659660d637d Michal Wajdeczko 2024-03-14  291  
07431945d8ae80 Matt Roper       2023-08-22  292  /**
07431945d8ae80 Matt Roper       2023-08-22  293   * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
26a40327c25c00 Matt Roper       2024-09-10  294   * @mmio: MMIO target
07431945d8ae80 Matt Roper       2023-08-22  295   * @reg: register to read value from
07431945d8ae80 Matt Roper       2023-08-22  296   *
07431945d8ae80 Matt Roper       2023-08-22  297   * Although Intel GPUs have some 64-bit registers, the hardware officially
07431945d8ae80 Matt Roper       2023-08-22  298   * only supports GTTMMADR register reads of 32 bits or smaller.  Even if
07431945d8ae80 Matt Roper       2023-08-22  299   * a readq operation may return a reasonable value, that violation of the
07431945d8ae80 Matt Roper       2023-08-22  300   * spec shouldn't be relied upon and all 64-bit register reads should be
07431945d8ae80 Matt Roper       2023-08-22  301   * performed as two 32-bit reads of the upper and lower dwords.
07431945d8ae80 Matt Roper       2023-08-22  302   *
07431945d8ae80 Matt Roper       2023-08-22  303   * When reading registers that may be changing (such as
07431945d8ae80 Matt Roper       2023-08-22  304   * counters), a rollover of the lower dword between the two 32-bit reads
07431945d8ae80 Matt Roper       2023-08-22  305   * can be problematic.  This function attempts to ensure the upper dword has
07431945d8ae80 Matt Roper       2023-08-22  306   * stabilized before returning the 64-bit value.
07431945d8ae80 Matt Roper       2023-08-22  307   *
07431945d8ae80 Matt Roper       2023-08-22  308   * Note that because this function may re-read the register multiple times
07431945d8ae80 Matt Roper       2023-08-22  309   * while waiting for the value to stabilize it should not be used to read
07431945d8ae80 Matt Roper       2023-08-22  310   * any registers where read operations have side effects.
07431945d8ae80 Matt Roper       2023-08-22  311   *
07431945d8ae80 Matt Roper       2023-08-22  312   * Returns the value of the 64-bit register.
07431945d8ae80 Matt Roper       2023-08-22  313   */
26a40327c25c00 Matt Roper       2024-09-10  314  u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
07431945d8ae80 Matt Roper       2023-08-22 @315  {
07431945d8ae80 Matt Roper       2023-08-22  316  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
07431945d8ae80 Matt Roper       2023-08-22  317  	u32 ldw, udw, oldudw, retries;
07431945d8ae80 Matt Roper       2023-08-22  318  
26a40327c25c00 Matt Roper       2024-09-10  319  	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
26a40327c25c00 Matt Roper       2024-09-10  320  	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
1cb4db30cf6857 Michal Wajdeczko 2024-04-23  321  
1cb4db30cf6857 Michal Wajdeczko 2024-04-23  322  	/* we shouldn't adjust just one register address */
26a40327c25c00 Matt Roper       2024-09-10  323  	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
07431945d8ae80 Matt Roper       2023-08-22  324  
26a40327c25c00 Matt Roper       2024-09-10  325  	oldudw = xe_mmio_read32(mmio, reg_udw);
07431945d8ae80 Matt Roper       2023-08-22  326  	for (retries = 5; retries; --retries) {
26a40327c25c00 Matt Roper       2024-09-10  327  		ldw = xe_mmio_read32(mmio, reg);
26a40327c25c00 Matt Roper       2024-09-10  328  		udw = xe_mmio_read32(mmio, reg_udw);
07431945d8ae80 Matt Roper       2023-08-22  329  
07431945d8ae80 Matt Roper       2023-08-22  330  		if (udw == oldudw)
07431945d8ae80 Matt Roper       2023-08-22  331  			break;
07431945d8ae80 Matt Roper       2023-08-22  332  
07431945d8ae80 Matt Roper       2023-08-22  333  		oldudw = udw;
07431945d8ae80 Matt Roper       2023-08-22  334  	}
07431945d8ae80 Matt Roper       2023-08-22  335  
26a40327c25c00 Matt Roper       2024-09-10  336  	drm_WARN(&mmio->tile->xe->drm, retries == 0,
07431945d8ae80 Matt Roper       2023-08-22  337  		 "64-bit read of %#x did not stabilize\n", reg.addr);
07431945d8ae80 Matt Roper       2023-08-22  338  
07431945d8ae80 Matt Roper       2023-08-22  339  	return (u64)udw << 32 | ldw;
07431945d8ae80 Matt Roper       2023-08-22  340  }
07431945d8ae80 Matt Roper       2023-08-22  341  
26a40327c25c00 Matt Roper       2024-09-10  342  static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
be8f9f4c866f41 Gustavo Sousa    2024-07-23  343  			      u32 *out_val, bool atomic, bool expect_match)
5c09bd6ccd418f Gustavo Sousa    2023-11-16  344  {
5c09bd6ccd418f Gustavo Sousa    2023-11-16  345  	ktime_t cur = ktime_get_raw();
5c09bd6ccd418f Gustavo Sousa    2023-11-16  346  	const ktime_t end = ktime_add_us(cur, timeout_us);
5c09bd6ccd418f Gustavo Sousa    2023-11-16  347  	int ret = -ETIMEDOUT;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  348  	s64 wait = 10;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  349  	u32 read;
be8f9f4c866f41 Gustavo Sousa    2024-07-23  350  	bool check;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  351  
5c09bd6ccd418f Gustavo Sousa    2023-11-16  352  	for (;;) {
26a40327c25c00 Matt Roper       2024-09-10  353  		read = xe_mmio_read32(mmio, reg);
be8f9f4c866f41 Gustavo Sousa    2024-07-23  354  
be8f9f4c866f41 Gustavo Sousa    2024-07-23  355  		check = (read & mask) == val;
be8f9f4c866f41 Gustavo Sousa    2024-07-23  356  		if (!expect_match)
be8f9f4c866f41 Gustavo Sousa    2024-07-23  357  			check = !check;
be8f9f4c866f41 Gustavo Sousa    2024-07-23  358  
be8f9f4c866f41 Gustavo Sousa    2024-07-23  359  		if (check) {
5c09bd6ccd418f Gustavo Sousa    2023-11-16  360  			ret = 0;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  361  			break;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  362  		}
5c09bd6ccd418f Gustavo Sousa    2023-11-16  363  
5c09bd6ccd418f Gustavo Sousa    2023-11-16  364  		cur = ktime_get_raw();
5c09bd6ccd418f Gustavo Sousa    2023-11-16  365  		if (!ktime_before(cur, end))
5c09bd6ccd418f Gustavo Sousa    2023-11-16  366  			break;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  367  
5c09bd6ccd418f Gustavo Sousa    2023-11-16  368  		if (ktime_after(ktime_add_us(cur, wait), end))
5c09bd6ccd418f Gustavo Sousa    2023-11-16  369  			wait = ktime_us_delta(end, cur);
5c09bd6ccd418f Gustavo Sousa    2023-11-16  370  
5c09bd6ccd418f Gustavo Sousa    2023-11-16  371  		if (atomic)
5c09bd6ccd418f Gustavo Sousa    2023-11-16  372  			udelay(wait);
5c09bd6ccd418f Gustavo Sousa    2023-11-16  373  		else
5c09bd6ccd418f Gustavo Sousa    2023-11-16  374  			usleep_range(wait, wait << 1);
5c09bd6ccd418f Gustavo Sousa    2023-11-16  375  		wait <<= 1;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  376  	}
5c09bd6ccd418f Gustavo Sousa    2023-11-16  377  
b3f0654f55859c Gustavo Sousa    2023-11-16  378  	if (ret != 0) {
26a40327c25c00 Matt Roper       2024-09-10  379  		read = xe_mmio_read32(mmio, reg);
be8f9f4c866f41 Gustavo Sousa    2024-07-23  380  
be8f9f4c866f41 Gustavo Sousa    2024-07-23  381  		check = (read & mask) == val;
be8f9f4c866f41 Gustavo Sousa    2024-07-23  382  		if (!expect_match)
be8f9f4c866f41 Gustavo Sousa    2024-07-23  383  			check = !check;
be8f9f4c866f41 Gustavo Sousa    2024-07-23  384  
be8f9f4c866f41 Gustavo Sousa    2024-07-23  385  		if (check)
b3f0654f55859c Gustavo Sousa    2023-11-16  386  			ret = 0;
b3f0654f55859c Gustavo Sousa    2023-11-16  387  	}
b3f0654f55859c Gustavo Sousa    2023-11-16  388  
5c09bd6ccd418f Gustavo Sousa    2023-11-16  389  	if (out_val)
5c09bd6ccd418f Gustavo Sousa    2023-11-16  390  		*out_val = read;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  391  
5c09bd6ccd418f Gustavo Sousa    2023-11-16  392  	return ret;
5c09bd6ccd418f Gustavo Sousa    2023-11-16  393  }
b0ac1b42dbdcc9 John Harrison    2024-05-17  394  
b0ac1b42dbdcc9 John Harrison    2024-05-17  395  /**
be8f9f4c866f41 Gustavo Sousa    2024-07-23  396   * xe_mmio_wait32() - Wait for a register to match the desired masked value
26a40327c25c00 Matt Roper       2024-09-10  397   * @mmio: MMIO target
b0ac1b42dbdcc9 John Harrison    2024-05-17  398   * @reg: register to read value from
b0ac1b42dbdcc9 John Harrison    2024-05-17  399   * @mask: mask to be applied to the value read from the register
be8f9f4c866f41 Gustavo Sousa    2024-07-23  400   * @val: desired value after applying the mask
b0ac1b42dbdcc9 John Harrison    2024-05-17  401   * @timeout_us: time out after this period of time. Wait logic tries to be
b0ac1b42dbdcc9 John Harrison    2024-05-17  402   * smart, applying an exponential backoff until @timeout_us is reached.
b0ac1b42dbdcc9 John Harrison    2024-05-17  403   * @out_val: if not NULL, points where to store the last unmasked value
b0ac1b42dbdcc9 John Harrison    2024-05-17  404   * @atomic: needs to be true if calling from an atomic context
b0ac1b42dbdcc9 John Harrison    2024-05-17  405   *
be8f9f4c866f41 Gustavo Sousa    2024-07-23  406   * This function polls for the desired masked value and returns zero on success
be8f9f4c866f41 Gustavo Sousa    2024-07-23  407   * or -ETIMEDOUT if timed out.
b0ac1b42dbdcc9 John Harrison    2024-05-17  408   *
b0ac1b42dbdcc9 John Harrison    2024-05-17  409   * Note that @timeout_us represents the minimum amount of time to wait before
b0ac1b42dbdcc9 John Harrison    2024-05-17  410   * giving up. The actual time taken by this function can be a little more than
b0ac1b42dbdcc9 John Harrison    2024-05-17  411   * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
b0ac1b42dbdcc9 John Harrison    2024-05-17  412   * it is possible that this function succeeds even after @timeout_us has passed.
b0ac1b42dbdcc9 John Harrison    2024-05-17  413   */
26a40327c25c00 Matt Roper       2024-09-10  414  int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
b0ac1b42dbdcc9 John Harrison    2024-05-17  415  		     u32 *out_val, bool atomic)
b0ac1b42dbdcc9 John Harrison    2024-05-17 @416  {
26a40327c25c00 Matt Roper       2024-09-10  417  	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
b0ac1b42dbdcc9 John Harrison    2024-05-17  418  }
b0ac1b42dbdcc9 John Harrison    2024-05-17  419  
be8f9f4c866f41 Gustavo Sousa    2024-07-23  420  /**
be8f9f4c866f41 Gustavo Sousa    2024-07-23  421   * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
26a40327c25c00 Matt Roper       2024-09-10  422   * @mmio: MMIO target
be8f9f4c866f41 Gustavo Sousa    2024-07-23  423   * @reg: register to read value from
be8f9f4c866f41 Gustavo Sousa    2024-07-23  424   * @mask: mask to be applied to the value read from the register
be8f9f4c866f41 Gustavo Sousa    2024-07-23  425   * @val: value not to be matched after applying the mask
be8f9f4c866f41 Gustavo Sousa    2024-07-23  426   * @timeout_us: time out after this period of time
be8f9f4c866f41 Gustavo Sousa    2024-07-23  427   * @out_val: if not NULL, points where to store the last unmasked value
be8f9f4c866f41 Gustavo Sousa    2024-07-23  428   * @atomic: needs to be true if calling from an atomic context
be8f9f4c866f41 Gustavo Sousa    2024-07-23  429   *
be8f9f4c866f41 Gustavo Sousa    2024-07-23  430   * This function works exactly like xe_mmio_wait32() with the exception that
be8f9f4c866f41 Gustavo Sousa    2024-07-23  431   * @val is expected not to be matched.
be8f9f4c866f41 Gustavo Sousa    2024-07-23  432   */
26a40327c25c00 Matt Roper       2024-09-10  433  int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
be8f9f4c866f41 Gustavo Sousa    2024-07-23  434  			 u32 *out_val, bool atomic)
be8f9f4c866f41 Gustavo Sousa    2024-07-23 @435  {

:::::: The code at line 315 was first introduced by commit
:::::: 07431945d8ae805746bbd01b052eeefb919911db drm/xe: Avoid 64-bit register reads

:::::: TO: Matt Roper <matthew.d.roper@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
