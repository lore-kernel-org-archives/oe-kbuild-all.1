Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3F194A66
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865342; cv=none; b=TtIXGRMRiFQkDq0RDL8ehgzzTqssHk4hX/AieWfrniGs+fjbLx06i4kSPWSC7jaVHyTLDa03lfsImghLqarDQLuXFK3utRIFEn45agXrvR06npnIe6bPMnbaVl4Kj6vO3Tjy1ztPtvX6TRhsLHyKl+m2mJ99CL9O73QMDpggfHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865342; c=relaxed/simple;
	bh=WWl/A3pPqZ8mOf82QeWsY3g1zEjASgqD1g3PDMSCTT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTdjSLm6XQx+7Kx+vALu2Wl7DyNQcThT+JcO1vFEJAxj4Trxq5tKdsXH5Qqien4prDn/kLcIiyBFRN/pG4JO2qqqpsX8sDBcOy8jum5w35XMRG1GDElmibGJrATx0l7YxnlFS1GFW1YhqrOIIJn3UXNb1L0UTvz+te9FqJld/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8yxxAaG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8yxxAaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865340; x=1770401340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWl/A3pPqZ8mOf82QeWsY3g1zEjASgqD1g3PDMSCTT4=;
  b=g8yxxAaGJPEwYOkOWyy+M9uCJICD/ftxi9LxlERCJkDk7r3zytZxMHtQ
   Wz3GgEx6aZDJP4BKLJwNHTAg8SMgrdzzN/qleoXt0zQzI2z3ycbydmqbJ
   eRcK2ugvcTTkR+1vnc53vL9xWM39tobDoXL3+lr83OuDouSRhQ5zr3/u6
   DRIUz02dyBKcdG3ULumZZh2xHnGytp2VDABtD2XoLWOcUl2AoVcp/vwbZ
   3D19Cbtdyr7wjUoysdzP3WexLtH/2/BdxdfEWS4c4ZwDtB3iTN0KUnY2E
   NHnqyYArt6Ri+mqJo89GZYVUc9w+clJiZ4X7i4L6ft6oXZeWZ/VWYs4pu
   w==;
X-CSE-ConnectionGUID: yIO5jgHMR/6NJq2vcc0vdg==
X-CSE-MsgGUID: g1KDG59uRQCoUIOARFMGNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39379681"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39379681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:08:58 -0800
X-CSE-ConnectionGUID: 6AP8vasyR2Oy4oKyaaXQ7Q==
X-CSE-MsgGUID: TIOV94ViSXG+zKHZ/10J6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148501158"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2025 10:08:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg6J4-000xBH-0S;
	Thu, 06 Feb 2025 18:08:54 +0000
Date: Fri, 7 Feb 2025 02:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 9/9] arch/x86/kernel/early_printk.c:111:32:
 error: 'io_serial_out' undeclared here (not in a function); did you mean
 'io_serial_in'?
Message-ID: <202502070258.5YJCjerE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: 57750f0464beab3927ad570e0c1b5e78c91dd1b6 [9/9] x86/early_printk: Harden early_serial
config: i386-buildonly-randconfig-004-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070258.5YJCjerE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070258.5YJCjerE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070258.5YJCjerE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/alternative.h:7,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/console.h:17,
                    from arch/x86/kernel/early_printk.c:2:
   include/linux/objtool.h:150:82: error: expected string literal before ')' token
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:102:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     102 | ANNOTATE_NOENDBR_SYM(io_serial_in);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/objtool.h:150:82: error: expected string literal before ')' token
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:108:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     108 | ANNOTATE_NOENDBR_SYM(io_serial_out);
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rcuwait.h:5,
                    from include/linux/irq_work.h:6,
                    from include/linux/console.h:19:
>> arch/x86/kernel/early_printk.c:111:32: error: 'io_serial_out' undeclared here (not in a function); did you mean 'io_serial_in'?
     111 | DEFINE_STATIC_CALL(serial_out, io_serial_out);
         |                                ^~~~~~~~~~~~~
   include/linux/static_call_types.h:39:23: note: in definition of macro 'DECLARE_STATIC_CALL'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                       ^~~~
   arch/x86/kernel/early_printk.c:111:1: note: in expansion of macro 'DEFINE_STATIC_CALL'
     111 | DEFINE_STATIC_CALL(serial_out, io_serial_out);
         | ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c: In function 'early_serial_putc':
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:119:9: note: in expansion of macro 'static_call'
     119 |         static_call(serial_out)(early_serial_base, TXR, ch);
         |         ^~~~~~~~~~~
   arch/x86/kernel/early_printk.c: In function 'early_serial_hw_init':
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:137:9: note: in expansion of macro 'static_call'
     137 |         static_call(serial_out)(early_serial_base, LCR, 0x3);   /* 8n1 */
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:138:9: note: in expansion of macro 'static_call'
     138 |         static_call(serial_out)(early_serial_base, IER, 0);     /* no interrupt */
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:139:9: note: in expansion of macro 'static_call'
     139 |         static_call(serial_out)(early_serial_base, FCR, 0);     /* no fifo */
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:140:9: note: in expansion of macro 'static_call'
     140 |         static_call(serial_out)(early_serial_base, MCR, 0x3);   /* DTR + RTS */
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:143:9: note: in expansion of macro 'static_call'
     143 |         static_call(serial_out)(early_serial_base, LCR, c | DLAB);
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:144:9: note: in expansion of macro 'static_call'
     144 |         static_call(serial_out)(early_serial_base, DLL, divisor & 0xff);
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:145:9: note: in expansion of macro 'static_call'
     145 |         static_call(serial_out)(early_serial_base, DLH, (divisor >> 8) & 0xff);
         |         ^~~~~~~~~~~
>> include/linux/static_call_types.h:43:34: error: called object is not a function or function pointer
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:146:9: note: in expansion of macro 'static_call'
     146 |         static_call(serial_out)(early_serial_base, LCR, c & ~DLAB);
         |         ^~~~~~~~~~~
   arch/x86/kernel/early_printk.c: At top level:
   include/linux/objtool.h:150:82: error: expected string literal before ')' token
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:200:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     200 | ANNOTATE_NOENDBR_SYM(mem32_serial_out);
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/objtool.h:150:82: error: expected string literal before ')' token
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:208:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     208 | ANNOTATE_NOENDBR_SYM(mem32_serial_in);
         | ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c: In function 'setup_early_printk':
>> arch/x86/kernel/early_printk.c:367:25: error: implicit declaration of function 'early_pci_serial_init'; did you mean 'early_serial_init'? [-Werror=implicit-function-declaration]
     367 |                         early_pci_serial_init(buf + 9);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         early_serial_init
   arch/x86/kernel/early_printk.c: At top level:
>> arch/x86/kernel/early_printk.c:194:23: warning: 'mem32_serial_out' defined but not used [-Wunused-function]
     194 | static __noendbr void mem32_serial_out(unsigned long addr, int offset, int value)
         |                       ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +111 arch/x86/kernel/early_printk.c

   109	
   110	DEFINE_STATIC_CALL(serial_in, io_serial_in);
 > 111	DEFINE_STATIC_CALL(serial_out, io_serial_out);
   112	
   113	static int early_serial_putc(unsigned char ch)
   114	{
   115		unsigned timeout = 0xffff;
   116	
   117		while ((static_call(serial_in)(early_serial_base, LSR) & XMTRDY) == 0 && --timeout)
   118			cpu_relax();
   119		static_call(serial_out)(early_serial_base, TXR, ch);
   120		return timeout ? 0 : -1;
   121	}
   122	
   123	static void early_serial_write(struct console *con, const char *s, unsigned n)
   124	{
   125		while (*s && n-- > 0) {
   126			if (*s == '\n')
   127				early_serial_putc('\r');
   128			early_serial_putc(*s);
   129			s++;
   130		}
   131	}
   132	
   133	static __init void early_serial_hw_init(unsigned divisor)
   134	{
   135		unsigned char c;
   136	
   137		static_call(serial_out)(early_serial_base, LCR, 0x3);	/* 8n1 */
   138		static_call(serial_out)(early_serial_base, IER, 0);	/* no interrupt */
   139		static_call(serial_out)(early_serial_base, FCR, 0);	/* no fifo */
   140		static_call(serial_out)(early_serial_base, MCR, 0x3);	/* DTR + RTS */
   141	
   142		c = static_call(serial_in)(early_serial_base, LCR);
   143		static_call(serial_out)(early_serial_base, LCR, c | DLAB);
   144		static_call(serial_out)(early_serial_base, DLL, divisor & 0xff);
   145		static_call(serial_out)(early_serial_base, DLH, (divisor >> 8) & 0xff);
   146		static_call(serial_out)(early_serial_base, LCR, c & ~DLAB);
   147	}
   148	
   149	#define DEFAULT_BAUD 9600
   150	
   151	static __init void early_serial_init(char *s)
   152	{
   153		unsigned divisor;
   154		unsigned long baud = DEFAULT_BAUD;
   155		char *e;
   156	
   157		if (*s == ',')
   158			++s;
   159	
   160		if (*s) {
   161			unsigned port;
   162			if (!strncmp(s, "0x", 2)) {
   163				early_serial_base = simple_strtoul(s, &e, 16);
   164			} else {
   165				static const int __initconst bases[] = { 0x3f8, 0x2f8 };
   166	
   167				if (!strncmp(s, "ttyS", 4))
   168					s += 4;
   169				port = simple_strtoul(s, &e, 10);
   170				if (port > 1 || s == e)
   171					port = 0;
   172				early_serial_base = bases[port];
   173			}
   174			s += strcspn(s, ",");
   175			if (*s == ',')
   176				s++;
   177		}
   178	
   179		if (*s) {
   180			baud = simple_strtoull(s, &e, 0);
   181	
   182			if (baud == 0 || s == e)
   183				baud = DEFAULT_BAUD;
   184		}
   185	
   186		/* Convert from baud to divisor value */
   187		divisor = 115200 / baud;
   188	
   189		/* Set up the HW */
   190		early_serial_hw_init(divisor);
   191	}
   192	
   193	#ifdef CONFIG_PCI
 > 194	static __noendbr void mem32_serial_out(unsigned long addr, int offset, int value)
   195	{
   196		u32 __iomem *vaddr = (u32 __iomem *)addr;
   197		/* shift implied by pointer type */
   198		writel(value, vaddr + offset);
   199	}
   200	ANNOTATE_NOENDBR_SYM(mem32_serial_out);
   201	
   202	static __noendbr unsigned int mem32_serial_in(unsigned long addr, int offset)
   203	{
   204		u32 __iomem *vaddr = (u32 __iomem *)addr;
   205		/* shift implied by pointer type */
   206		return readl(vaddr + offset);
   207	}
 > 208	ANNOTATE_NOENDBR_SYM(mem32_serial_in);
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
