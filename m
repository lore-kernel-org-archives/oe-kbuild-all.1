Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C072E6CBC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 21:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767043477; cv=none; b=navXk7IUmQ18fIQ8JLXdlMNpg+25A+A4obyiR3CwAel1r0mGDPNhOfNjqXupSKLooHRLAxcWnBhh9tHj/aKgcJjfA3rekl2FvvzHYrmNg7ZwDZ5gbqKVPRL01403cbQXpQ4oQR+elLNWRD8fmZtkzU+eJCNS1rSN4QMAb/yKZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767043477; c=relaxed/simple;
	bh=Kr/ic25OOvp89bjamjiEM8P8nZ9kSK/vKbJURiUzrR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a/yfKsgjw/pTxDQ+KRjlHRE0KzJAb1qQ20zd/ge+f9Hiazpqm+bLkhvJGlZxNRueJ7UfDhU1WdMjlMHl+Kf+JoRp/+9L6nJd1hmKoa+jNkzSvcatIPkEXM84l7qfBxqHK1ZDrr8gAadsXK1obbmcQyxaViEHFiATRDe1DjUgDYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIXwjMjY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIXwjMjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767043475; x=1798579475;
  h=date:from:to:cc:subject:message-id;
  bh=Kr/ic25OOvp89bjamjiEM8P8nZ9kSK/vKbJURiUzrR4=;
  b=kIXwjMjY8DEIpqZgcaMUm4Mx8dytcD68Bpghjn3rRovrzMFymAO8EXK6
   JJu2FD4TB51FOTIWUY+3xkE0mtagQkVgeb5O7PVhjz8GQPxRBe7++j/MM
   NZET0wZZIqN2dnBC7/dH1lUvI815LEZFUt/On+zWqFNUfXlJGmrXMwS5W
   6R0i9sjEpuzTedIe9oyyIcQxxfvNb6NRopJYrCJZDnwuSGe3OA6I9VmlS
   u96uFWigoZcmCm0yeO0dcqrXjbmvAL2AIE2j4Q0VUIOn8PR1qgN6vuvl8
   a2R9EaHEUDIOYTCXxJMMGzQT98o06dxQKCQDEFYmkoJDE7NOYYpPCXMUn
   A==;
X-CSE-ConnectionGUID: hOomYj4OSXCvOq9BB+KNiQ==
X-CSE-MsgGUID: iczmIh4UTp6+/Ymz9jk/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72499041"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="72499041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 13:24:34 -0800
X-CSE-ConnectionGUID: Sv/+B6MvSIqj9MV+N5wRLA==
X-CSE-MsgGUID: RLwYlx7PSLuwLDeT41fQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201010936"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Dec 2025 13:24:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaKj7-0000000082f-1LaV;
	Mon, 29 Dec 2025 21:24:29 +0000
Date: Tue, 30 Dec 2025 05:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: arch/riscv/include/asm/io.h:108:53: warning: performing
 pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202512300518.85jsnXn2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 473b9f331718267815649cd93801da832200db71 rust: pci: fix build failure when CONFIG_PCI_MSI is disabled
date:   4 weeks ago
config: riscv-randconfig-r063-20251230 (https://download.01.org/0day-ci/archive/20251230/202512300518.85jsnXn2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300518.85jsnXn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300518.85jsnXn2-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   854 |         insl(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
   110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
   |                                          ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:16:
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
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   863 |         outsb(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
   122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:16:
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
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   872 |         outsw(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
   123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:16:
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
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   881 |         outsl(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
   124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:16:
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
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:40:
   rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   36 |         pci_free_irq_vectors(dev);
   |         ^
   rust/helpers/pci.c:36:2: note: did you mean 'pci_alloc_irq_vectors'?
   include/linux/pci.h:2161:1: note: 'pci_alloc_irq_vectors' declared here
   2161 | pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
   | ^
   7 warnings and 1 error generated.
   make[3]: *** [rust/Makefile:495: rust/helpers/helpers.o] Error 1
>> arch/riscv/include/asm/io.h:108:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   arch/riscv/include/asm/io.h:109:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   arch/riscv/include/asm/io.h:110:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   arch/riscv/include/asm/io.h:122:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   arch/riscv/include/asm/io.h:123:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   arch/riscv/include/asm/io.h:124:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> clang diag: arch/riscv/include/asm/io.h:108:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:109:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:110:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:122:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:123:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:124:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   Unable to generate bindings: clang diagnosed error: rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
--
   make[3]: *** [rust/Makefile:384: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
>> clang diag: arch/riscv/include/asm/io.h:108:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:109:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:110:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:122:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:123:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:124:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: arch/riscv/include/asm/io.h:108:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:109:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:110:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:122:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:123:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:124:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1286: prepare] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +108 arch/riscv/include/asm/io.h

fab957c11efe2f Palmer Dabbelt    2017-07-10  104  
ce246c444a08e0 Will Deacon       2019-02-22  105  __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
ce246c444a08e0 Will Deacon       2019-02-22  106  __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
ce246c444a08e0 Will Deacon       2019-02-22  107  __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
9cc205e3c17d57 Maciej W. Rozycki 2022-09-22 @108  #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
9cc205e3c17d57 Maciej W. Rozycki 2022-09-22  109  #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
9cc205e3c17d57 Maciej W. Rozycki 2022-09-22  110  #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
fab957c11efe2f Palmer Dabbelt    2017-07-10  111  

:::::: The code at line 108 was first introduced by commit
:::::: 9cc205e3c17d5716da7ebb7fa0c985555e95d009 RISC-V: Make port I/O string accessors actually work

:::::: TO: Maciej W. Rozycki <macro@orcam.me.uk>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
