Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770153A4F5C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770286866; cv=none; b=FgQD3GfyTNkklbdfzMeg+ckIjV6w0eyhLKv2a3NJSHcQ7zWrqFUjQfE3AWzVXfmT3uP8FmkjcSF+1nWP8F+AKIRm9l4v6EuVIE9kIftnWRS5RSPqpPdfWvzN0Dyfr1rPRwofVBs0EaURg/mMO/WBMgi3gypm69Rir+peLLqw+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770286866; c=relaxed/simple;
	bh=OUmMLpXOrJfcNuvtwWhSY/N8UXGykLQBjuqITvt+fOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hZ25RXecTHwY1kr5dpkv68Fy3vB9wRrFXA6C/Ok5mjZziP99U0zNXRduJBm0m/o9gGbWsDphT25+CmanS4h3FY+8IATvXBUf+uGKZ6cd4jpq6oVVg7X2AL3S5X6A+pRjVcAjcN4jBptOaWN99j9Lf8mZ3NsHjMlnDQe0aCbxyCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtzHiCeK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtzHiCeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770286866; x=1801822866;
  h=date:from:to:cc:subject:message-id;
  bh=OUmMLpXOrJfcNuvtwWhSY/N8UXGykLQBjuqITvt+fOU=;
  b=KtzHiCeKJz2BRloiUNnuZcxvEHzWbfT+jr5GUReGWvgchhzG6jo2EaBY
   /VmQx5MGgI41Bw3GbolZFTRzem3/SFdKQmXDjRggUsLUqRMuYB56LT/gZ
   VgWV8uXMlHHKP0d92tbt40AEOr7WalP7AHr3osGTak+BxHcb2FleLkVt+
   sG5mPhut6SNdimNmjaqL2QGCilonol8wpEZAE7xbrjLE1UOoCscGk7LgA
   IBBMY9KNlgbaAZ40XqkSDB157kDmp9jdaSPrH1CeaZvw1yGaHfmu2wkbc
   D1yKZqT68I2CE/817a/gkWhOFsEZASWg6JVBTusygye9/mPsFtzSM99La
   w==;
X-CSE-ConnectionGUID: X01KFM0SR0e7i1a8e0xJJA==
X-CSE-MsgGUID: gUeA1z3tSsiBc93mBV84iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88906004"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="88906004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 02:21:05 -0800
X-CSE-ConnectionGUID: PVx1tvbTR56fOy6TgnPQMQ==
X-CSE-MsgGUID: V6n28+EZRWqdaLj89N5JQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="209564904"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2026 02:21:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnwTs-00000000jiS-3pPV;
	Thu, 05 Feb 2026 10:21:00 +0000
Date: Thu, 05 Feb 2026 18:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:master 96/176] include/asm-generic/io.h:304:18:
 error: redefinition of 'readw_be'
Message-ID: <202602051808.ujLEiIDB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: bf04a97202b1b3cf81cfbfcb93ddf253572499ff [96/176] asm-generic/io.h: Add big-endian MMIO accessors
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260205/202602051808.ujLEiIDB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602051808.ujLEiIDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051808.ujLEiIDB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/io.h:1043,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:21:
>> include/asm-generic/io.h:304:18: error: redefinition of 'readw_be'
     304 | #define readw_be readw_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:305:19: note: in expansion of macro 'readw_be'
     305 | static inline u16 readw_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io-defs.h:8:16: note: previous definition of 'readw_be' with type 'u16(const volatile void *)' {aka 'short unsigned int(const volatile void *)'}
       8 | DEF_PCI_AC_RET(readw_be, u16, (const PCI_IO_ADDR addr), (addr), mem, addr)
         |                ^~~~~~~~
   arch/powerpc/include/asm/io.h:656:19: note: in definition of macro 'DEF_PCI_AC_RET'
     656 | static inline ret name at                                       \
         |                   ^~~~
>> include/asm-generic/io.h:319:18: error: redefinition of 'readl_be'
     319 | #define readl_be readl_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:320:19: note: in expansion of macro 'readl_be'
     320 | static inline u32 readl_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io-defs.h:9:16: note: previous definition of 'readl_be' with type 'u32(const volatile void *)' {aka 'unsigned int(const volatile void *)'}
       9 | DEF_PCI_AC_RET(readl_be, u32, (const PCI_IO_ADDR addr), (addr), mem, addr)
         |                ^~~~~~~~
   arch/powerpc/include/asm/io.h:656:19: note: in definition of macro 'DEF_PCI_AC_RET'
     656 | static inline ret name at                                       \
         |                   ^~~~
>> include/asm-generic/io.h:351:19: error: redefinition of 'writew_be'
     351 | #define writew_be writew_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:352:20: note: in expansion of macro 'writew_be'
     352 | static inline void writew_be(u16 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io-defs.h:13:18: note: previous definition of 'writew_be' with type 'void(u16,  volatile void *)' {aka 'void(short unsigned int,  volatile void *)'}
      13 | DEF_PCI_AC_NORET(writew_be, (u16 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
         |                  ^~~~~~~~~
   arch/powerpc/include/asm/io.h:664:20: note: in definition of macro 'DEF_PCI_AC_NORET'
     664 | static inline void name at                                      \
         |                    ^~~~
>> include/asm-generic/io.h:363:19: error: redefinition of 'writel_be'
     363 | #define writel_be writel_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:364:20: note: in expansion of macro 'writel_be'
     364 | static inline void writel_be(u32 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io-defs.h:14:18: note: previous definition of 'writel_be' with type 'void(u32,  volatile void *)' {aka 'void(unsigned int,  volatile void *)'}
      14 | DEF_PCI_AC_NORET(writel_be, (u32 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
         |                  ^~~~~~~~~
   arch/powerpc/include/asm/io.h:664:20: note: in definition of macro 'DEF_PCI_AC_NORET'
     664 | static inline void name at                                      \
         |                    ^~~~
   make[3]: *** [scripts/Makefile.build:102: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/readw_be +304 include/asm-generic/io.h

   297	
   298	/*
   299	 * {read,write}{w,l,q}_be() access big endian memory and return result
   300	 * in native endianness.
   301	 */
   302	
   303	#ifndef readw_be
 > 304	#define readw_be readw_be
   305	static inline u16 readw_be(const volatile void __iomem *addr)
   306	{
   307		u16 val;
   308	
   309		log_read_mmio(16, addr, _THIS_IP_, _RET_IP_);
   310		__io_br();
   311		val = __be16_to_cpu((__be16 __force)__raw_readw(addr));
   312		__io_ar(val);
   313		log_post_read_mmio(val, 16, addr, _THIS_IP_, _RET_IP_);
   314		return val;
   315	}
   316	#endif
   317	
   318	#ifndef readl_be
 > 319	#define readl_be readl_be
   320	static inline u32 readl_be(const volatile void __iomem *addr)
   321	{
   322		u32 val;
   323	
   324		log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
   325		__io_br();
   326		val = __be32_to_cpu((__be32 __force)__raw_readl(addr));
   327		__io_ar(val);
   328		log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
   329		return val;
   330	}
   331	#endif
   332	
   333	#ifdef CONFIG_64BIT
   334	#ifndef readq_be
   335	#define readq_be readq_be
   336	static inline u64 readq_be(const volatile void __iomem *addr)
   337	{
   338		u64 val;
   339	
   340		log_read_mmio(64, addr, _THIS_IP_, _RET_IP_);
   341		__io_br();
   342		val = __be64_to_cpu((__be64 __force)__raw_readq(addr));
   343		__io_ar(val);
   344		log_post_read_mmio(val, 64, addr, _THIS_IP_, _RET_IP_);
   345		return val;
   346	}
   347	#endif
   348	#endif /* CONFIG_64BIT */
   349	
   350	#ifndef writew_be
 > 351	#define writew_be writew_be
   352	static inline void writew_be(u16 value, volatile void __iomem *addr)
   353	{
   354		log_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
   355		__io_bw();
   356		__raw_writew((u16 __force)__cpu_to_be16(value), addr);
   357		__io_aw();
   358		log_post_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
   359	}
   360	#endif
   361	
   362	#ifndef writel_be
 > 363	#define writel_be writel_be
   364	static inline void writel_be(u32 value, volatile void __iomem *addr)
   365	{
   366		log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   367		__io_bw();
   368		__raw_writel((u32 __force)__cpu_to_be32(value), addr);
   369		__io_aw();
   370		log_post_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   371	}
   372	#endif
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
