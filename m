Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19163382281
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869564; cv=none; b=REHDl1Q23x9wYevwwjxJdsXmhLo1uriWxGXD1bEgxXmOpfYDoDVlg5db16vXGIdWcklHYZ20AhtelE/DeirESSt0g5ccMn05f9XjmiInRgwGYJ0TnSxPbUyxzm5pEUI1Ie5JPGd5ti8NudaKD2eGX4N25aknhM4j3R9T4HkKFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869564; c=relaxed/simple;
	bh=JpqXDB32zBZ/900J447bn6NYNFdyErX5zoJIF4C4jNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sZkyFUdc6ZfNZPMBe8bQ7vEAU2WUxL3hXHIXk3/9OiYM/SlCem8G5+r4VI6Z/hZ/7rF8FxIS0oWON0UYaNhHkoTj20eE/piuUUxOfWTnI6gqPv0VwHj3QnZXeQ1XsYz3izsGCixM+Q8gGwWDDZ4y+yChHC+6ARercv9Hz1U1kmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKdePxS8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKdePxS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773869563; x=1805405563;
  h=date:from:to:cc:subject:message-id;
  bh=JpqXDB32zBZ/900J447bn6NYNFdyErX5zoJIF4C4jNA=;
  b=cKdePxS8fJlqdTSgV8aknRj+M7P0PM01pIzCogn8tOLPoUHD38W0Hkch
   KZHXWTYrFsnGItP+8RkYoU8igLkGulRZDBfa9yJCFZe66RlzPJRW5ju0k
   vAv6vukJFgtp1GCvYciY6vQcIOjHv49jSGMtOjygNxLGgEhtQOo0ELHd+
   gTV5syZKiA9spGvO2Fi6+Kqn+PqW3FioTHS8aJtIFHJlRrCZTwb54IZTz
   ax4bcj3jvhulZp7m7FooH2wqhWBAgympkNocvTB7HIbvKwK+/a6b8typz
   baomN0rOcf5pfc7EOCLXcMTXIlTIjXFCX4t0anyy/ZoPBg4REc0PltrBd
   g==;
X-CSE-ConnectionGUID: u9NUOxeOT5imE9xjVpKpPw==
X-CSE-MsgGUID: 7EZxsClMTme2vr8Sl5yrFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74970860"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74970860"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 14:32:42 -0700
X-CSE-ConnectionGUID: zNPD+wY9SKCc4thRVim0zw==
X-CSE-MsgGUID: 4+Nk+nf9Q3q0nu2Ei/XpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="226895794"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2026 14:32:41 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2yVK-000000003ON-33Qd;
	Wed, 18 Mar 2026 21:32:38 +0000
Date: Thu, 19 Mar 2026 05:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3]
 kernel/trace/ring_buffer.c:2515: warning: Function parameter or struct member
 'kaslr_addr' not described in 'ring_buffer_last_boot_delta'
Message-ID: <202603190526.iZmRYpTD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   ffe2e1362e9b65847d18ed9aee64cfc4a4aa38b3
commit: e3d382756d451affb07301ca0dd386f9989b856d [3/3] UPSTREAM: ring-buffer: Use kaslr address instead of text delta
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260319/202603190526.iZmRYpTD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190526.iZmRYpTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190526.iZmRYpTD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c:2477: warning: Function parameter or struct member 'writer' not described in '__ring_buffer_alloc'
>> kernel/trace/ring_buffer.c:2515: warning: Function parameter or struct member 'kaslr_addr' not described in 'ring_buffer_last_boot_delta'
>> kernel/trace/ring_buffer.c:2515: warning: Excess function parameter 'text' description in 'ring_buffer_last_boot_delta'
>> kernel/trace/ring_buffer.c:2515: warning: Excess function parameter 'data' description in 'ring_buffer_last_boot_delta'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +2515 kernel/trace/ring_buffer.c

be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2462) 
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2463) /**
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2464)  * __ring_buffer_alloc - allocate a new ring_buffer
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2465)  * @size: the size in bytes per cpu that is needed.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2466)  * @flags: attributes to set for the ring buffer.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2467)  * @key: ring buffer reader_lock_key.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2468)  *
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2469)  * Currently the only flag that is available is the RB_FL_OVERWRITE
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2470)  * flag. This flag means that the buffer will overwrite old data
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2471)  * when the buffer wraps. If this flag is not set, the buffer will
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2472)  * drop data when the tail hits the head.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2473)  */
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2474) struct trace_buffer *__ring_buffer_alloc(unsigned long size, unsigned flags,
162c11d25bcd8e Vincent Donnefort       2024-09-11  2475  					 struct lock_class_key *key,
162c11d25bcd8e Vincent Donnefort       2024-09-11  2476  					 struct ring_buffer_writer *writer)
be68d63a139bd4 Steven Rostedt (Google  2024-06-12 @2477) {
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2478) 	/* Default buffer page size - one system page */
9c0e67d97d2d2f Kalesh Singh            2025-12-29  2479  	return alloc_buffer(size, flags, get_order(__PAGE_SIZE), 0, 0, key, writer);
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2480) 
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2481) }
1f8a6a10fb9437 Peter Zijlstra          2009-06-08  2482  EXPORT_SYMBOL_GPL(__ring_buffer_alloc);
7a8e76a3829f10 Steven Rostedt          2008-09-29  2483  
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2484) /**
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2485)  * __ring_buffer_alloc_range - allocate a new ring_buffer from existing memory
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2486)  * @size: the size in bytes per cpu that is needed.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2487)  * @flags: attributes to set for the ring buffer.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2488)  * @start: start of allocated range
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2489)  * @range_size: size of allocated range
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2490)  * @order: sub-buffer order
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2491)  * @key: ring buffer reader_lock_key.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2492)  *
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2493)  * Currently the only flag that is available is the RB_FL_OVERWRITE
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2494)  * flag. This flag means that the buffer will overwrite old data
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2495)  * when the buffer wraps. If this flag is not set, the buffer will
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2496)  * drop data when the tail hits the head.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2497)  */
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2498) struct trace_buffer *__ring_buffer_alloc_range(unsigned long size, unsigned flags,
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2499) 					       int order, unsigned long start,
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2500) 					       unsigned long range_size,
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2501) 					       struct lock_class_key *key)
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2502) {
162c11d25bcd8e Vincent Donnefort       2024-09-11  2503  	return alloc_buffer(size, flags, order, start, start + range_size, key, NULL);
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2504) }
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2505) 
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2506) /**
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2507)  * ring_buffer_last_boot_delta - return the delta offset from last boot
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2508)  * @buffer: The buffer to return the delta from
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2509)  * @text: Return text delta
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2510)  * @data: Return data delta
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2511)  *
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2512)  * Returns: The true if the delta is non zero
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2513)  */
e3d382756d451a Steven Rostedt          2025-03-05  2514  bool ring_buffer_last_boot_delta(struct trace_buffer *buffer, unsigned long *kaslr_addr)
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12 @2515) {
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2516) 	if (!buffer)
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2517) 		return false;
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2518) 
e3d382756d451a Steven Rostedt          2025-03-05  2519  	if (!buffer->kaslr_addr)
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2520) 		return false;
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2521) 
e3d382756d451a Steven Rostedt          2025-03-05  2522  	*kaslr_addr = buffer->kaslr_addr;
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2523) 
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2524) 	return true;
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2525) }
7a1d1e4b9639ff Steven Rostedt (Google  2024-06-12  2526) 

:::::: The code at line 2515 was first introduced by commit
:::::: 7a1d1e4b9639ff08b2f42605c2950ae1ba4a43bf tracing/ring-buffer: Add last_boot_info file to boot instance

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
