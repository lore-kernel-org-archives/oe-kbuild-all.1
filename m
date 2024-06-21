Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB06382
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718930417; cv=none; b=RzeKj6kgqGIdhodtW1WQh7dTHepEAJh3D+WTK2nS94nHbjy0kUnCe4qM75yXMIOeVmmxQXcewiYEiqMKoOaJeMzHwjyHxIVm2GYV78Llc0vakaa0FGV8fpSZmXhXYKrbuxIGGOxPhEchtNpoyo4G75XzhaJdHn1O6c7H+lkyhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718930417; c=relaxed/simple;
	bh=sMWthwXIFJZp0S9H1q6Y/N/vWrMO/9rmuZRM0tzS7KY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o74f35FVYKERlXycJ8r+nfJglrlnkSNTwHMM4ymDEOoV+abQXV77xb2xwwTERTjAizANIKL2E6T8o1Epoou4xL9moaaCSjoOB4JPn7teioLdU/LoW6gULnOQQrPx35wXlACiIOjbpbtQV6CtDSOMdcV8zkQr2yUQg4e8gLRO3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARrBVA1D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARrBVA1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718930415; x=1750466415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMWthwXIFJZp0S9H1q6Y/N/vWrMO/9rmuZRM0tzS7KY=;
  b=ARrBVA1DkOTErFCBFspX1qr3a7p3JeeTeKbvteEdu2wkxn8n484Q4bQe
   l4pyD3Z0u/EC8gKyVt7rQ63XdY9QWHPOiUSigVZ0G+3g7Y6RIzkATjT7w
   cpy0qbrwDP9LnsADNRochafzqWgtxOmBucrkYpgFxK8pmg2/TG5R8kdp3
   bdOvQQOe7aUglkOVsMLVSVigjqk1hPjONvvKSJi68uXYp3+d4uVgGzcoo
   xDaFPLGIYRwM2REkclnpSkeOZhqa2z1UtS8Z3C+jw89OjeA2uEgMmB8K9
   GwMA+NkdJZQYghJLW9pf/oxxpDJ0aadVK+/pjU/Yf7OG63DOIXqpQ4eMc
   w==;
X-CSE-ConnectionGUID: ra6bRnDPTDWrxqEeBm4G/g==
X-CSE-MsgGUID: dQplailsQOyCXspz0ri4Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19722402"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="19722402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 17:40:15 -0700
X-CSE-ConnectionGUID: yIC9teKbQm+h72a09igVww==
X-CSE-MsgGUID: r5g23D/BRwaD2IQtpixvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="47375956"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jun 2024 17:40:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKSJx-00084M-28;
	Fri, 21 Jun 2024 00:40:05 +0000
Date: Fri, 21 Jun 2024 08:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 1969/7397]
 drivers/cache/starfive_starlink_cache.c:40:8: error: call to undeclared
 function 'readq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202406210833.YnAXTakc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: cabff60ca77da6cb460988e2af40bde95776d92b [1969/7397] cache: Add StarFive StarLink cache management
config: riscv-randconfig-r061-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210833.YnAXTakc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210833.YnAXTakc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210833.YnAXTakc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:744:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     744 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     752 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:760:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     760 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:769:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     769 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:778:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:787:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/cache/starfive_starlink_cache.c:12:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/cache/starfive_starlink_cache.c:40:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         ret = readq_poll_timeout_atomic(ctl, v, !(v & STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK),
         |               ^
   include/linux/iopoll.h:179:28: note: expanded from macro 'readq_poll_timeout_atomic'
     179 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_us, timeout_us)
         |                                   ^
>> drivers/cache/starfive_starlink_cache.c:49:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |         ^
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   include/linux/bitfield.h:116:38: note: expanded from macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                           ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
>> drivers/cache/starfive_starlink_cache.c:49:20: warning: shift count is negative [-Wshift-count-negative]
      49 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   include/linux/bitfield.h:116:49: note: expanded from macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   drivers/cache/starfive_starlink_cache.c:51:20: warning: shift count is negative [-Wshift-count-negative]
      51 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:51:20: warning: shift count is negative [-Wshift-count-negative]
      51 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:51:20: warning: shift count is negative [-Wshift-count-negative]
      51 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:51:20: warning: shift count is negative [-Wshift-count-negative]
      51 |         writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
         |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/starfive_starlink_cache.c:22:44: note: expanded from macro 'STARLINK_CACHE_ADDRESS_RANGE_MASK'
      22 | #define STARLINK_CACHE_ADDRESS_RANGE_MASK               GENMASK(39, 0)
         |                                                         ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:487:22: note: expanded from macro 'compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:475:23: note: expanded from macro '_compiletime_assert'
     475 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:467:9: note: expanded from macro '__compiletime_assert'
..


vim +/readq +40 drivers/cache/starfive_starlink_cache.c

    33	
    34	static void starlink_cache_flush_complete(void)
    35	{
    36		volatile void __iomem *ctl = starlink_cache_base + STARLINK_CACHE_FLUSH_CTL;
    37		u64 v;
    38		int ret;
    39	
  > 40		ret = readq_poll_timeout_atomic(ctl, v, !(v & STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK),
    41						STARLINK_CACHE_FLUSH_POLL_DELAY_US,
    42						STARLINK_CACHE_FLUSH_TIMEOUT_US);
    43		if (ret)
    44			WARN(1, "StarFive Starlink cache flush operation timeout\n");
    45	}
    46	
    47	static void starlink_cache_dma_cache_wback(phys_addr_t paddr, unsigned long size)
    48	{
  > 49		writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
    50		       starlink_cache_base + STARLINK_CACHE_FLUSH_START_ADDR);
    51		writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
    52		       starlink_cache_base + STARLINK_CACHE_FLUSH_END_ADDR);
    53	
    54		mb();
    55		writeq(FIELD_PREP(STARLINK_CACHE_FLUSH_CTL_MODE_MASK,
    56				  STARLINK_CACHE_FLUSH_CTL_CLEAN_SHARED),
    57		       starlink_cache_base + STARLINK_CACHE_FLUSH_CTL);
    58	
    59		starlink_cache_flush_complete();
    60	}
    61	
    62	static void starlink_cache_dma_cache_invalidate(phys_addr_t paddr, unsigned long size)
    63	{
    64		writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
    65		       starlink_cache_base + STARLINK_CACHE_FLUSH_START_ADDR);
    66		writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
    67		       starlink_cache_base + STARLINK_CACHE_FLUSH_END_ADDR);
    68	
    69		mb();
    70		writeq(FIELD_PREP(STARLINK_CACHE_FLUSH_CTL_MODE_MASK,
    71				  STARLINK_CACHE_FLUSH_CTL_MAKE_INVALIDATE),
    72		       starlink_cache_base + STARLINK_CACHE_FLUSH_CTL);
    73	
    74		starlink_cache_flush_complete();
    75	}
    76	
    77	static void starlink_cache_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
    78	{
    79		writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr),
    80		       starlink_cache_base + STARLINK_CACHE_FLUSH_START_ADDR);
    81		writeq(FIELD_PREP(STARLINK_CACHE_ADDRESS_RANGE_MASK, paddr + size),
    82		       starlink_cache_base + STARLINK_CACHE_FLUSH_END_ADDR);
    83	
    84		mb();
    85		writeq(FIELD_PREP(STARLINK_CACHE_FLUSH_CTL_MODE_MASK,
    86				  STARLINK_CACHE_FLUSH_CTL_CLEAN_INVALIDATE),
    87		       starlink_cache_base + STARLINK_CACHE_FLUSH_CTL);
    88	
    89		starlink_cache_flush_complete();
    90	}
    91	
    92	static const struct riscv_nonstd_cache_ops starlink_cache_ops = {
  > 93		.wback = &starlink_cache_dma_cache_wback,
    94		.inv = &starlink_cache_dma_cache_invalidate,
    95		.wback_inv = &starlink_cache_dma_cache_wback_inv,
    96	};
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
