Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AA231C8D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610199; cv=none; b=nKRWvl3h0TcFl6Mb+XJ1lidk5pRNVRSm9l2YvjELkRDjrbNv/+lUG1S5/g76/Ej3k9z9kG0kaThKdoY7hWvASdNN+nR97qm/D9RkDYYtMV5gE5CL1M8FlqJnOz/qaQeiFcSo+sRpmBjGi/IF7s2MXCu+OKgcZaka84aqbFfZK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610199; c=relaxed/simple;
	bh=b33G875FvM8x22v+VzHY4R4AWqI3MfRJq3p5qEeaHDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SXKJNFR5vMwrQHlpG5by0KP4yMGmqCJghDVNwcL56BVDfqbbGVryOGb6iip9NpYGzlW7iMqVGV1Lp1Zw/503JV1f+QcE6kLm0c0BFkdBr8r1j3UdBOZQOfDMv/3RuxT1LG8oWltojz6aPacGkitZBvxLOiS2kvvgd5tytf1MVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFfAs8Fs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFfAs8Fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746610197; x=1778146197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b33G875FvM8x22v+VzHY4R4AWqI3MfRJq3p5qEeaHDI=;
  b=JFfAs8FsMvc89oS60M/kbrsJNi48hzN8wXcT0VlrX2SB8113vN2WDqEY
   O8qv7I7fu8K239KFZ3w1uuUE5VJpMLAGRusQtkSSfnD9gr5Rtdo47uSr+
   dA3EmpY2BhPq5MK8iRn5e4OMnYtYX2B3jZCxdtbNYyrO4PZygbXvSdWkf
   VNsa61NgM92CbTzP/CF6hPoSXz/18Hqe92Jqttd4GvnxRwkfydubYgFG4
   bx7Q0h2dKRfSkCUMIdtLBFhv5DfAo32IkuSyxhGivjJYTNeiJb6Ppv6/W
   ar4ubLucH9sCyVh1OHcXuh0ujxJwOoNRLHldJBg6X4fqOlP60gP6Z2d+E
   g==;
X-CSE-ConnectionGUID: At92Ve6TQ/G4U2VOpOlVqQ==
X-CSE-MsgGUID: rsikDzQ8TU2mqxAs68TzkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70834524"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70834524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:29:55 -0700
X-CSE-ConnectionGUID: DP5oqnVyR6mPSy7WJci+hg==
X-CSE-MsgGUID: SKknMysmS/CDYdQDeBH0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140640299"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 02:29:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCb67-0007VT-07;
	Wed, 07 May 2025 09:29:51 +0000
Date: Wed, 7 May 2025 17:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: [linux-next:master 4752/5832] error[E0433]: failed to resolve: could
 not find `mm` in the crate root
Message-ID: <202505071753.kldNHYVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 64f43d565d3869b4fcba438ef3ed6cfb7ed8fee7 [4752/5832] rust: miscdevice: add mmap support
config: riscv-randconfig-r071-20250427 (https://download.01.org/0day-ci/archive/20250507/202505071753.kldNHYVQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071753.kldNHYVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071753.kldNHYVQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   820 |         insl(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
   |                                          ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   829 |         outsb(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   838 |         outsw(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   847 |         outsl(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   clang diag: arch/riscv/include/asm/io.h:104:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:105:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:106:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:118:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:119:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:120:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:104:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:105:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:106:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:118:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:119:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:120:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   7 warnings generated.
   clang diag: arch/riscv/include/asm/io.h:104:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:105:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:106:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:118:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:119:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:120:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> error[E0433]: failed to resolve: could not find `mm` in the crate root
   --> rust/kernel/miscdevice.rs:17:5
   |
   17 |     mm::virt::VmaNew,
   |     ^^ could not find `mm` in the crate root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:64:9
   |
   64 | pub mod mm;
   |         ^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
