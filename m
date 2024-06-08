Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D64176ADB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717832010; cv=none; b=ft2aH5NqFKYIq6PRrriZB/T3Y/NF1mGKjs1szTuIU8Jsx0AqLg2GmDykU+UC2xCjyq4D/9g54XBTywjKtwFfwoigtjtCVU38r+YqMB1zlGBjdhI87cWHbf4dBawzCw2Jp1mvtjbxurM38b+y3/Wn1gV0prC0yGRZiBq3K3O3dTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717832010; c=relaxed/simple;
	bh=NvYwuDerLG4/A5Aav+BPlkpqYCAezZQLP0v6uGh2/ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzpMxlv1WR6LW78Hp/O6zTb64jZopv9DqAkeg6H3hY9UxA6n83Nnh++30SXhXFhyfuum436OTIvQvwP99CyTB91Dt9LTLf9gTQ6fqrj5kCzow6132IB/3MdZRgRtDNt7tOD6HEtoxdsJ3vViL25XvtrN4MvaCwIr5a51QGd2F/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTvl11xo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTvl11xo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717832008; x=1749368008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvYwuDerLG4/A5Aav+BPlkpqYCAezZQLP0v6uGh2/ns=;
  b=fTvl11xo+UEmtsC64qb4eVQgcUbzDa3tXcMQyXt/7NAr1EEZE3BusJHc
   AvpDzqya96mdkXtVUbnJK+0PFJ6hlOenOwJdCJqsYKNP7GYEdCkGd0C3D
   1txAwDQBUTII1VQSdYv39M3kkrz4geyHwE9pyumhH7Srv3vbaMLu3Qsum
   nXaZJHAVjSwMn3GndbDdmq/NAEPwu5YUumnpaB1h4tiyraVkfwOZtG6hS
   8Cz3gLt8bvJAwfnTb4cHV+MLiexT+sCjRaXe5Ofu0FQAPOcVx2+X0VjYN
   jmPDOp9XrJLqv5RbfC4R6Fv1w9I9Zc8UdOViJrxPZqW1xDbwWrjst1qQw
   Q==;
X-CSE-ConnectionGUID: GhJxMIJzQreFCcKDc1g4/Q==
X-CSE-MsgGUID: HzdzTEfPQXma+CfpWXfK9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39962133"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="39962133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:33:23 -0700
X-CSE-ConnectionGUID: OhnYqtuBQwW99gequbwjvQ==
X-CSE-MsgGUID: YxceDMeqTfiORaIHzPgGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="43107613"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 00:33:22 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqZk-0001Ee-1J;
	Sat, 08 Jun 2024 07:33:20 +0000
Date: Sat, 8 Jun 2024 15:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 7/42] include/linux/cpumask_atomic.h:16:9:
 error: call to undeclared function 'find_and_set_bit'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202406081507.MGWlSP8T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   01a427072a49f0674209d92684f2bc928b2509a1
commit: dc5d867fa2ddb0dd3f1fbbc6ec0d426fc4b61c86 [7/42] sched: add cpumask_find_and_set() and use it in __mm_cid_get()
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240608/202406081507.MGWlSP8T-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081507.MGWlSP8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081507.MGWlSP8T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from kernel/sched/core.c:87:
   In file included from kernel/sched/sched.h:33:
>> include/linux/cpumask_atomic.h:16:9: error: call to undeclared function 'find_and_set_bit'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return find_and_set_bit(cpumask_bits(srcp), small_cpumask_bits);
                  ^
   include/linux/cpumask_atomic.h:16:9: note: did you mean 'test_and_set_bit'?
   include/asm-generic/bitops/instrumented-atomic.h:68:29: note: 'test_and_set_bit' declared here
   static __always_inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
                               ^
   12 warnings and 1 error generated.


vim +/find_and_set_bit +16 include/linux/cpumask_atomic.h

     6	
     7	/*
     8	 * cpumask_find_and_set - find the first unset cpu in a cpumask and
     9	 *			  set it atomically
    10	 * @srcp: the cpumask pointer
    11	 *
    12	 * Return: >= nr_cpu_ids if nothing is found.
    13	 */
    14	static inline unsigned int cpumask_find_and_set(volatile struct cpumask *srcp)
    15	{
  > 16		return find_and_set_bit(cpumask_bits(srcp), small_cpumask_bits);
    17	}
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
