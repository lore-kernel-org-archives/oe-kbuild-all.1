Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E8A2C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743870461; cv=none; b=kk3E88ZG3Pflu+w/yn72q7hnLQDGr0WRTQSsvyUuIWGPhqC+8DgwfpP9EbqVVBw3EQVym1lfawLN2LSzUPR61tGi/e9SDyF0BYU2IE++KkX7KTraCUYfuEfDhZgGeCe1tk/CchdvNatVZAIzxk/237ONPn3Rlz9OT8z4npLh/oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743870461; c=relaxed/simple;
	bh=WRCzgEvoEsSH20Plry27WiVsXDDR6uJyLRl60lhQnls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6xUYCZfmwwY9NaoAjA4BcknqjLTr8mH85lMnEC7HsWG0+Z4H0j4idWGpfat8CnfFPm04Z5DPpCiypzZWkysFyOvBHskQC/lay4b65thc+9+6oS7ogXLW7za17O1MJP4EilUJkzsfC+xLwtO79/w+3uzbAF7dQpP8fEIHOthxws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTCMw5WB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTCMw5WB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743870459; x=1775406459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRCzgEvoEsSH20Plry27WiVsXDDR6uJyLRl60lhQnls=;
  b=HTCMw5WBLYjQvNWpVE5HSdZUDzKma+Nsr71hzdFEg0OOsQ29v7uQNptL
   8q0ZH8lI+px6lGFPqtwMzTxq8VcYsEMVD3lGYsggNVn3qEGqaHIw2mO+e
   54feIPX/SlnqH2VvEjk3F7cRynqg4wiLZCKV7OWWj+HFSGA1nu0mCvhlb
   /01bkjWhrTNlnkdUIm+zQeLF1VTGfwv21oE134I5ltyRAAOtnqJ5h5pu2
   eouxI/3dbhw3DvX6V6fpoe6mNIsKt/TNpPaL7QHqRKe05d3zByWodk4vO
   45akn9OfbTO1G3fUGnCNwGLSySPwayqnGozZ8aWQhDn/KmWq2ezDuNO9y
   A==;
X-CSE-ConnectionGUID: HwvTn+zQSA6nx2x8RA/lMw==
X-CSE-MsgGUID: zI4xb2gRQIyQJOtYc1TaqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="48949236"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="48949236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 09:27:38 -0700
X-CSE-ConnectionGUID: M/q24+pxRguCdR5XOMkCYg==
X-CSE-MsgGUID: tU/cMsbQSxqY2cwXxEDdfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="127547345"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2025 09:27:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u16Mo-00029D-2A;
	Sat, 05 Apr 2025 16:27:34 +0000
Date: Sun, 6 Apr 2025 00:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 5/7] include/linux/objtool.h:142:77: error:
 expected string literal before ')' token
Message-ID: <202504060036.Eh4mjqBl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   a0a43a727652b13a5df974c124fef58aa1fbb552
commit: b0b640fa028879fb570ed70c6f08ba979e958ade [5/7] objtool: Improve code generation readability
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250406/202504060036.Eh4mjqBl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060036.Eh4mjqBl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060036.Eh4mjqBl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/alternative.h:7,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/smp.h:12,
                    from arch/x86/kernel/smpboot.c:43:
>> include/linux/objtool.h:142:77: error: expected string literal before ')' token
     142 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
         |                                                                             ^
   arch/x86/kernel/smpboot.c:317:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     317 | ANNOTATE_NOENDBR_SYM(start_secondary);
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13:
   arch/x86/kernel/smpboot.c: In function 'topology_sane':
>> arch/x86/kernel/smpboot.c:332:28: error: implicit declaration of function 'topology_same_node'; did you mean 'topology_sane'? [-Werror=implicit-function-declaration]
     332 |         return !WARN_ONCE(!topology_same_node(c, o),
         |                            ^~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   arch/x86/kernel/smpboot.c:332:17: note: in expansion of macro 'WARN_ONCE'
     332 |         return !WARN_ONCE(!topology_same_node(c, o),
         |                 ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/alternative.h:7,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/console.h:17,
                    from arch/x86/kernel/early_printk.c:2:
>> include/linux/objtool.h:142:77: error: expected string literal before ')' token
     142 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
         |                                                                             ^
   arch/x86/kernel/early_printk.c:102:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     102 | ANNOTATE_NOENDBR_SYM(io_serial_in);
         | ^~~~~~~~~~~~~~~~~~~~
>> include/linux/objtool.h:142:77: error: expected string literal before ')' token
     142 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
         |                                                                             ^
   arch/x86/kernel/early_printk.c:108:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     108 | ANNOTATE_NOENDBR_SYM(io_serial_out);
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/preempt.h:8,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rcuwait.h:5,
                    from include/linux/irq_work.h:6,
                    from include/linux/console.h:19:
   arch/x86/kernel/early_printk.c:111:32: error: 'io_serial_out' undeclared here (not in a function); did you mean 'io_serial_in'?
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
>> include/linux/objtool.h:142:77: error: expected string literal before ')' token
     142 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
         |                                                                             ^
   arch/x86/kernel/early_printk.c:199:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     199 | ANNOTATE_NOENDBR_SYM(mem32_serial_out);
         | ^~~~~~~~~~~~~~~~~~~~
>> include/linux/objtool.h:142:77: error: expected string literal before ')' token
     142 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
         |                                                                             ^
   arch/x86/kernel/early_printk.c:207:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     207 | ANNOTATE_NOENDBR_SYM(mem32_serial_in);
         | ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/early_printk.c:22:
   arch/x86/kernel/early_printk.c: In function 'early_pci_serial_init':
>> arch/x86/kernel/early_printk.c:325:47: error: 'mem32_serial_in' undeclared (first use in this function); did you mean 'mem32_serial_out'?
     325 |                 static_call_update(serial_in, mem32_serial_in);
         |                                               ^~~~~~~~~~~~~~~
   include/linux/static_call.h:154:49: note: in definition of macro 'static_call_update'
     154 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
   arch/x86/kernel/early_printk.c:325:47: note: each undeclared identifier is reported only once for each function it appears in
     325 |                 static_call_update(serial_in, mem32_serial_in);
         |                                               ^~~~~~~~~~~~~~~
   include/linux/static_call.h:154:49: note: in definition of macro 'static_call_update'
     154 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
>> include/linux/static_call.h:154:48: error: initialization of 'int *' from incompatible pointer type 'void (*)(long unsigned int,  int,  int)' [-Werror=incompatible-pointer-types]
     154 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   arch/x86/kernel/early_printk.c:326:17: note: in expansion of macro 'static_call_update'
     326 |                 static_call_update(serial_out, mem32_serial_out);
         |                 ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c: In function 'setup_early_printk':
>> arch/x86/kernel/early_printk.c:393:25: error: implicit declaration of function 'early_mmio_serial_init'; did you mean 'early_pci_serial_init'? [-Werror=implicit-function-declaration]
     393 |                         early_mmio_serial_init(buf + 4);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         early_pci_serial_init
   cc1: some warnings being treated as errors


vim +142 include/linux/objtool.h

   135	
   136	#ifndef __ASSEMBLY__
   137	/*
   138	 * Annotate away the various 'relocation to !ENDBR` complaints; knowing that
   139	 * these relocations will never be used for indirect calls.
   140	 */
   141	#define ANNOTATE_NOENDBR		ASM_ANNOTATE(NOENDBR)
 > 142	#define ANNOTATE_NOENDBR_SYM(sym)	asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
