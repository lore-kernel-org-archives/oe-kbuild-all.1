Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950870;
	b=SWUjIIvrUzwdsjr+3mBOgSxrIS2NXSWWmMeTqUjMy0KXxpBCYxhfpMkCVDmWD7gsiagU
	 +l7W+wdsKrIhzwCxgkUAGhDb/ZCGgenePb1lYLAfjCr4IdJ2pCjIfTw6/Y5SB0gKgBx5k
	 MKzTDnfqHcwmFq2s4zNNKuB7+nwx+CspFhmjyceoLvYXe5JSQU6IjZpX1VRqFip46sANh
	 TvXgTzWDoZdyLQeeKX51PxLTns1vixHBu0v2/R5l+Ha1lkq+CivajNpiDifG8jrWAqrtr
	 tIJp6VPdMciLmcwk+q4GroMV8xiPNDW+3ORFU2hhioJPKWlAix9FVpdL/poiV5c77sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950870;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FGPpsl1xdFig7klgL59RRYwr4+vvLnylm9EtpeX0g+o=;
	b=qqoT/qohJyWcjLUd12kCQbz8ryrD9J3++DjaeSASdayRfQi0vI66VFZy7BtVAQ+cQkaK
	 Gtz8gxpjNBZalUsVo7i6k4cu7bAgKc2yVBVE0OsEx7jmH4lVMj5Ry6KGOa3FYLws3bRb5
	 DaOY2zTyNaMuijMkcchxo1bwNcbFBRjIr1u4xWvH7sfId2G4+QmyfdbmPZicDeseIEbEv
	 m8/3M7tgKy+gr/Zy4WlAoaPnHxG8TiMCWBBqSXCEzJYR8EMSjhyqV5KBakI/pLyExSp7B
	 RfhWa/kjSQEQbjiCLHJFuYA5Z0QP6+RI7lDKlfdDl1jLEWV3h7lHCgOtlsTEHLjA4nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kAFNrWmb;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88139606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 07:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88139606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kAFNrWmb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793950869; x=1825486869;
  h=date:from:to:cc:subject:message-id;
  bh=CFcVrs6bs1eLMBgvSSHi+fqAiGUDfxi78pedb6ylEIQ=;
  b=kAFNrWmbRhb2Hkvbx6AZZDcWxvgDLOdcQyhoI/JjxMa0832sDdJd5hBR
   IiacITP5+1NVEsLd99imLnu2sTNViHJqTGMmkjIz6dm1vx3pXmojTjd/E
   JtrlKuCwXjTm5nnMzfHAn5kfPYMbT4SG8qGCNf7v03TIThBEG043v8p0y
   NrT5E9EbJ7qpeo80oZ5tP9nT30HI37VnNLCJLt1jw1hSL+ZOdgLR9wOlG
   VEbUhgssUQcwemVWYSGfG90H+3C47z2iNL7Zei2Ca6kOX4vLZHLN0N+R7
   ID2YBxJpAS7p1jDjRl4YUoccPdTagHwhl2ZZotQuZ2rwPf+nvbhnKJeEM
   A==;
X-CSE-ConnectionGUID: t6yvVXY8TBel4KZQMSuBkA==
X-CSE-MsgGUID: X5QW64J6Rw+Uk6/Lpc/grQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2848370"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2848370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:41:07 -0800
X-CSE-ConnectionGUID: wXN/ebMZT8WRxP+4mWM8Vg==
X-CSE-MsgGUID: aaHK3UbOS36xFpeQixRaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7091720"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2026 23:41:06 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPEZL-00000000A8V-1v6M;
	Fri, 06 Nov 2026 07:41:03 +0000
Date: Fri, 06 Nov 2026 08:40:58 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 2/56] error[E0599]: the
 associated function or constant `new_zeroed_slice` exists for struct
 `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<[u8],
 Kmalloc>`, but its trait bounds were not satisfied
Message-ID: <202611060812.fRcN8aWV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 9985fb1d439627f74610170aeabe7b590f6b5145 [2/56] rust: alloc: add Box::new_zeroed_slice()
config: x86_64-randconfig-2302-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060812.fRcN8aWV-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060812.fRcN8aWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060812.fRcN8aWV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: the associated function or constant `new_zeroed_slice` exists for struct `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<[u8], Kmalloc>`, but its trait bounds were not satisfied
   --> rust/doctests_kernel_generated.rs:469:23
   |
   469 | let b = KBox::<[u8]>::new_zeroed_slice(10, GFP_KERNEL)?;
   |                       ^^^^^^^^^^^^^^^^ associated function or constant cannot be called due to unsatisfied trait bounds
   |
   note: if you're trying to build a new `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<[u8], Kmalloc>`, consider using `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box::<T, A>::from_raw` which returns `rust_doctest_kernel_alloc_allocator_rs_0::kernel::alloc::Box<_, _>`
   --> rust/kernel/alloc/kbox.rs:177:5
   |
   177 |     pub const unsafe fn from_raw(raw: *mut T) -> Self {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = note: the following trait bounds were not satisfied:
   `[u8]: Sized`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
