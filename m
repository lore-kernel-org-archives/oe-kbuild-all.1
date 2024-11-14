Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0817BEC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Nov 2024 06:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652683; cv=none; b=kN4/hkrWdvnyu7n7JlKGCuVOS6X2EDyCB/aS7jug9JcuDWKEnZ17XIGo942CADh4mtf1Kj+CUCZwrftFBhkXrLskrGoBJziI7m5aIZdd+W3FUpf0mUeDoE7Mr5C9pl2mzTM0BBRbdPM9dMc+uyWaaQ0v3LzLwzl+50OPG02iOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652683; c=relaxed/simple;
	bh=iU9WhdedNihegdz60zaF6FpbHF3EoBEODbGXp8C+xtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/JmKrtVt6YbgMde0f5B+/gPkF/nln+4vDsIe72oerhweVGJ43azJiV0YATeKeb3f56okRgYdio0zmw2miW8RbJNw3JV5k0M/K2YuHu74y52OyLNJvP7CbZU/+KA+OmZKlCIBH282M0G8XLkfhv3sMFTNqPUsTgTbCKT1Q8ANnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVqdVTto; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVqdVTto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731652682; x=1763188682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iU9WhdedNihegdz60zaF6FpbHF3EoBEODbGXp8C+xtM=;
  b=MVqdVTtoukUJ9V5p5gfqTQdWq82Gika9u5+64gyLx/naU0jS1RRbT2cl
   ofMCaLhdh+pHh8tM5YsSZA2cslFCFOp8ORaPnEyQxnDuziGfNywHfx24I
   JKw8+MAyjBu22jrBsYyNbvnY2dAmh58RFf70TOnKRA4xFsrEpOHTt6Vqr
   jqDCte64BjdriM39kv1Eiv6twYQTdo4AdqiNls6mhBBN1RrK0O/Wvdv35
   kgO0xljEF9j5VexDCGfxhStVGFocxRuuooC/QtFHDtIYXBU8AG3PInmZ+
   Q4oXcKiR5fE4OqhLmYQP4/ofQ+XRGlmBbINLoUfPOfrc+06orFLtCKm+w
   A==;
X-CSE-ConnectionGUID: SRLhfQX8SSejTo+FVqndZw==
X-CSE-MsgGUID: rL7zlvCsT1mWfwpsDRX1Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31703095"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="31703095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 13:40:11 -0800
X-CSE-ConnectionGUID: O21JBzm5QlabVEQ+E6jtDw==
X-CSE-MsgGUID: DNFTlc3PRMK9ZBhpWVxOgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="88326891"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2024 13:40:10 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBhZG-00003F-0K;
	Thu, 14 Nov 2024 21:39:59 +0000
Date: Fri, 15 Nov 2024 05:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:io-uring-bpf/v1 2/3] io_uring/bpf.h:38:1: warning:
 non-void function does not return a value
Message-ID: <202411150542.DvLqFWHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux io-uring-bpf/v1
head:   e4c5bc9551109bef91c53be43a4296f3d317f19a
commit: cffec449e9f6a37b0701f2a8fdd37688db25be55 [2/3] io_uring/bpf: allow to register and run BPF programs
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241115/202411150542.DvLqFWHG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150542.DvLqFWHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150542.DvLqFWHG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from io_uring/io_uring.c:107:
>> io_uring/bpf.h:38:1: warning: non-void function does not return a value [-Wreturn-type]
      38 | }
         | ^
   13 warnings generated.


vim +38 io_uring/bpf.h

    25	
    26	#else
    27	static inline int io_register_bpf(struct io_ring_ctx *ctx, void __user *arg,
    28					  unsigned int nr_args)
    29	{
    30		return -EOPNOTSUPP;
    31	}
    32	static inline int io_unregister_bpf(struct io_ring_ctx *ctx)
    33	{
    34		return -EOPNOTSUPP;
    35	}
    36	static inline int io_run_bpf(struct io_ring_ctx *ctx)
    37	{
  > 38	}
    39	#endif
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
