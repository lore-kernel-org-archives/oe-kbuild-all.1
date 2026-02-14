Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2AE1E520A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771029842; cv=none; b=Fb3d8RLKMZHLeQZnU5NlbG9iewZu/uijO6ymRlPrrSJgiR0iSmZDqfH+0O/C2b5Y39bH08nqKi1+/hHb6+EkQA8Rugmm20Mg4zVFRN4jS/NCIKU6YhPxOQ1UFS6ehD4kX18uD/p65ZaOQs9RF/Wsmu0ZDsr9u7Dwy8Q97TkgF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771029842; c=relaxed/simple;
	bh=5YMjzkv4GNhDTN7sJQeaxCE8fMhST1tmON1GAqtvDr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtffQA4UsXvoKLnhQge+oGUdLR8LVS23K5D0HPRpYP/lV2sTAlnDJQIRtVS/ZXLGqqhS7SAOSnquy0LuVew5syzQFA0/IbFaCSs/nrLz+Vfe2Lsqw5Ptm0gRPbzPdVLPNypM/pplElXExftUkvIe7GKcDo6TRDqv1BypPQB5rqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VN/3PAXO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VN/3PAXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771029842; x=1802565842;
  h=date:from:to:cc:subject:message-id;
  bh=5YMjzkv4GNhDTN7sJQeaxCE8fMhST1tmON1GAqtvDr4=;
  b=VN/3PAXO9ZXtstNmsnEqw9g4JaFxy1dQqDw3LLxmRL1P9Q7w3t58eJ4m
   ro3gqxjZrHGwjxMZDo8tUSas0T7bH/ea9xU9iNaTSzUe6YAvpQzRDLV/H
   q2k3uwnr+NM1k7ZAAouJB/DTV41tZM8WehaY355+lwnN7MRFGnRC+w799
   RlRxzp48UcM7h4izcgB0LUE8JIZU5BdBi/RMlNX09YlGZNGJhI14YYcBb
   dAM8ZqnEBbXk7xn/eUisT2JhPu0AwAg0lD50eEYHJDvS/YMVgGmG+tBJp
   pt0h5ctNp1HZ2xs1Ocvv0+8tML6JJpn/qBJchA6nhnUt9vKD5A0EnFQMU
   g==;
X-CSE-ConnectionGUID: hSsFOYbcQa64V5S7zdlIAQ==
X-CSE-MsgGUID: LbjDyvTARayLPzXVPIWoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76067710"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="76067710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 16:43:59 -0800
X-CSE-ConnectionGUID: A6Dj+SX2T+a/Zyt14545ow==
X-CSE-MsgGUID: IbUQWw9YRiuLxVAkpI9a7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213165933"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2026 16:43:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr3lK-00000000vzW-1rt3;
	Sat, 14 Feb 2026 00:43:54 +0000
Date: Sat, 14 Feb 2026 08:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:master 96/176] include/asm-generic/io.h:335:18:
 error: redefinition of 'readq_be'
Message-ID: <202602140811.9WdqWEhF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: bf04a97202b1b3cf81cfbfcb93ddf253572499ff [96/176] asm-generic/io.h: Add big-endian MMIO accessors
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602140811.9WdqWEhF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140811.9WdqWEhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140811.9WdqWEhF-lkp@intel.com/

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
   include/asm-generic/io.h:304:18: error: redefinition of 'readw_be'
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
   include/asm-generic/io.h:319:18: error: redefinition of 'readl_be'
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
>> include/asm-generic/io.h:335:18: error: redefinition of 'readq_be'
     335 | #define readq_be readq_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:336:19: note: in expansion of macro 'readq_be'
     336 | static inline u64 readq_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io-defs.h:18:16: note: previous definition of 'readq_be' with type 'u64(const volatile void *)' {aka 'long long unsigned int(const volatile void *)'}
      18 | DEF_PCI_AC_RET(readq_be, u64, (const PCI_IO_ADDR addr), (addr), mem, addr)
         |                ^~~~~~~~
   arch/powerpc/include/asm/io.h:656:19: note: in definition of macro 'DEF_PCI_AC_RET'
     656 | static inline ret name at                                       \
         |                   ^~~~
   include/asm-generic/io.h:351:19: error: redefinition of 'writew_be'
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
   include/asm-generic/io.h:363:19: error: redefinition of 'writel_be'
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
>> include/asm-generic/io.h:376:19: error: redefinition of 'writeq_be'
     376 | #define writeq_be writeq_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:377:20: note: in expansion of macro 'writeq_be'
     377 | static inline void writeq_be(u64 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io-defs.h:20:18: note: previous definition of 'writeq_be' with type 'void(u64,  volatile void *)' {aka 'void(long long unsigned int,  volatile void *)'}
      20 | DEF_PCI_AC_NORET(writeq_be, (u64 val, PCI_IO_ADDR addr), (val, addr), mem, addr)
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


vim +/readq_be +335 include/asm-generic/io.h

   317	
   318	#ifndef readl_be
   319	#define readl_be readl_be
 > 320	static inline u32 readl_be(const volatile void __iomem *addr)
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
 > 335	#define readq_be readq_be
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
   351	#define writew_be writew_be
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
   363	#define writel_be writel_be
 > 364	static inline void writel_be(u32 value, volatile void __iomem *addr)
   365	{
   366		log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   367		__io_bw();
   368		__raw_writel((u32 __force)__cpu_to_be32(value), addr);
   369		__io_aw();
   370		log_post_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   371	}
   372	#endif
   373	
   374	#ifdef CONFIG_64BIT
   375	#ifndef writeq_be
 > 376	#define writeq_be writeq_be
   377	static inline void writeq_be(u64 value, volatile void __iomem *addr)
   378	{
   379		log_write_mmio(value, 64, addr, _THIS_IP_, _RET_IP_);
   380		__io_bw();
   381		__raw_writeq((u64 __force)__cpu_to_be64(value), addr);
   382		__io_aw();
   383		log_post_write_mmio(value, 64, addr, _THIS_IP_, _RET_IP_);
   384	}
   385	#endif
   386	#endif /* CONFIG_64BIT */
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
