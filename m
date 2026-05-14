Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDD642982F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771464; cv=none; b=uXHT/1OJ3YpCAoUwU1AOiSwzHmFhFhffsYz+GHsZaHNqZS2gTm7oDb9Wzj9MV6rDCtDc8bz5op7uk/PCW8aMdnZBUdOFEYbqw7qx8T9hshq3o6WbggMZeUdeyY6Rtwt/cHyciMt8RHYly/q21mTSwhDedIgQ/8USfjPFPTQbmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771464; c=relaxed/simple;
	bh=1sWd7voH0SNW02M0873/6PeKf9hW1v7BC0AW4pwxR3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BQ0g1P8fVgDuD+bjq/89gp2+Giu+9gPMTKHNrJYBPXB76wx7VBmoFrNMDiuWopUywB33tYo90Qnf3ch0rcgemF3/b8uCBdVUfCoilnliigSVApTgCelCYLGvfKy7wY1dIyuARGhqe/q3s3sSEOwLw9JXVhdzN7nTDhsihIBdJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+MjdaTh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+MjdaTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778771460; x=1810307460;
  h=date:from:to:cc:subject:message-id;
  bh=1sWd7voH0SNW02M0873/6PeKf9hW1v7BC0AW4pwxR3w=;
  b=i+MjdaTh8DGOGlf4dDSCsZF69gfg6kvZhV4ZZg/nW8z249csIIXAgK0b
   AiFMytSDrGsp/j2EkjdoIjYkhAqiWzN3ksmf+aTdDAaxjeEP9/h2/jz49
   Mm4WEvotFjWKwlvfepA4X/QNoYYyK+4PiGqrg01vvrwqtXVs8mmUYDQ7d
   +p+J2/BmoxnUE6hxpCRVbT3bZpTHDqmytyQM/sz62qxWeHW7dwcMPAApL
   aHu8hjb9/o8WDxR00bmc2K1zS9csqBITzFQMqH9Tnw1UzJZ6xuFpM9E3e
   CPi3fwXEFBckV+ISHBTL3CRtVQPd+ff8hSejCLxeBh9IrH35RuWFiFaUA
   A==;
X-CSE-ConnectionGUID: BlOwoGcFRa+6zxDogIYRqQ==
X-CSE-MsgGUID: HPYLe6U5TR+oH04s19OxSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82283817"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="82283817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 08:10:57 -0700
X-CSE-ConnectionGUID: IUXJwaO9SUCPogLS+aUUnw==
X-CSE-MsgGUID: BdJ37c6hRVCkY/nkFKJPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235358698"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 08:10:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNXi9-000000006fn-0ioI;
	Thu, 14 May 2026 15:10:53 +0000
Date: Thu, 14 May 2026 23:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 492/870]
 include/asm-generic/io.h:322:18: error: redefinition of 'readw_be'
Message-ID: <202605142201.OI2h1QS7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: 66262fff1de8401d7f4dd6c23d0adab1701e28dc [492/870] asm-generic/io.h: Add big-endian MMIO accessors
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260514/202605142201.OI2h1QS7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142201.OI2h1QS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142201.OI2h1QS7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/io.h:962,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:27,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:22:
>> include/asm-generic/io.h:322:18: error: redefinition of 'readw_be'
     322 | #define readw_be readw_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:323:19: note: in expansion of macro 'readw_be'
     323 | static inline u16 readw_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io.h:517:19: note: previous definition of 'readw_be' with type 'u16(const volatile void *)' {aka 'short unsigned int(const volatile void *)'}
     517 | static inline u16 readw_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
>> include/asm-generic/io.h:337:18: error: redefinition of 'readl_be'
     337 | #define readl_be readl_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:338:19: note: in expansion of macro 'readl_be'
     338 | static inline u32 readl_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io.h:522:19: note: previous definition of 'readl_be' with type 'u32(const volatile void *)' {aka 'unsigned int(const volatile void *)'}
     522 | static inline u32 readl_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
>> include/asm-generic/io.h:369:19: error: redefinition of 'writew_be'
     369 | #define writew_be writew_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:370:20: note: in expansion of macro 'writew_be'
     370 | static inline void writew_be(u16 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io.h:545:20: note: previous definition of 'writew_be' with type 'void(u16,  volatile void *)' {aka 'void(short unsigned int,  volatile void *)'}
     545 | static inline void writew_be(u16 val, volatile void __iomem *addr)
         |                    ^~~~~~~~~
>> include/asm-generic/io.h:381:19: error: redefinition of 'writel_be'
     381 | #define writel_be writel_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:382:20: note: in expansion of macro 'writel_be'
     382 | static inline void writel_be(u32 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io.h:550:20: note: previous definition of 'writel_be' with type 'void(u32,  volatile void *)' {aka 'void(unsigned int,  volatile void *)'}
     550 | static inline void writel_be(u32 val, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/readw_be +322 include/asm-generic/io.h

   315	
   316	/*
   317	 * {read,write}{w,l,q}_be() access big endian memory and return result
   318	 * in native endianness.
   319	 */
   320	
   321	#ifndef readw_be
 > 322	#define readw_be readw_be
   323	static inline u16 readw_be(const volatile void __iomem *addr)
   324	{
   325		u16 val;
   326	
   327		log_read_mmio(16, addr, _THIS_IP_, _RET_IP_);
   328		__io_br();
   329		val = __be16_to_cpu((__be16 __force)__raw_readw(addr));
   330		__io_ar(val);
   331		log_post_read_mmio(val, 16, addr, _THIS_IP_, _RET_IP_);
   332		return val;
   333	}
   334	#endif
   335	
   336	#ifndef readl_be
 > 337	#define readl_be readl_be
   338	static inline u32 readl_be(const volatile void __iomem *addr)
   339	{
   340		u32 val;
   341	
   342		log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
   343		__io_br();
   344		val = __be32_to_cpu((__be32 __force)__raw_readl(addr));
   345		__io_ar(val);
   346		log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
   347		return val;
   348	}
   349	#endif
   350	
   351	#ifdef CONFIG_64BIT
   352	#ifndef readq_be
   353	#define readq_be readq_be
   354	static inline u64 readq_be(const volatile void __iomem *addr)
   355	{
   356		u64 val;
   357	
   358		log_read_mmio(64, addr, _THIS_IP_, _RET_IP_);
   359		__io_br();
   360		val = __be64_to_cpu((__be64 __force)__raw_readq(addr));
   361		__io_ar(val);
   362		log_post_read_mmio(val, 64, addr, _THIS_IP_, _RET_IP_);
   363		return val;
   364	}
   365	#endif
   366	#endif /* CONFIG_64BIT */
   367	
   368	#ifndef writew_be
 > 369	#define writew_be writew_be
   370	static inline void writew_be(u16 value, volatile void __iomem *addr)
   371	{
   372		log_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
   373		__io_bw();
   374		__raw_writew((u16 __force)__cpu_to_be16(value), addr);
   375		__io_aw();
   376		log_post_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
   377	}
   378	#endif
   379	
   380	#ifndef writel_be
 > 381	#define writel_be writel_be
   382	static inline void writel_be(u32 value, volatile void __iomem *addr)
   383	{
   384		log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   385		__io_bw();
   386		__raw_writel((u32 __force)__cpu_to_be32(value), addr);
   387		__io_aw();
   388		log_post_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   389	}
   390	#endif
   391	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
