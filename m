Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8C33CFC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742027816; cv=none; b=GMO64SGmoTwkS/307iUsA5IhJz9j1efYPhm1GaLwQ5uu0kZip04cfr9grqitXGCMNaPPlbfmNEftdtvWb1mmwcSQuOdJffvj31Czlq8VqD6JumIyYkypVYGnJi/GDjbriGwcjGepZqAI61S+N1cCiuymnZzicu8bdzOYqkcL+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742027816; c=relaxed/simple;
	bh=FOGMG6W5QBvUjY8kDCB3LwxwtVfd9Z4DuozA61oDfHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LnLfuNRCmhWE8cpM6Ji1id91yaH6R82wMO8VWpq+hwTczlujH4UpgHgek7gZxC19h9iVORbUZQT/WS9wEHGLK8Z2xcSgEaJGMiny61gx+lxFJCMgYtudPsf19t/cErIq49y3MheJYwKw8FBJ66GYBI/ux8W+/4aoGwDUecKxRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dO3Mx2+f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dO3Mx2+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742027814; x=1773563814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FOGMG6W5QBvUjY8kDCB3LwxwtVfd9Z4DuozA61oDfHA=;
  b=dO3Mx2+fw67t/PjXt+1BVkgqWKgZC7Z66ndDWlfFPxQ5WU3YGaSd4xap
   aZ+l8PoR/duedJRLFXSKLDIl7atgmR37xLaXFrAvfWbU+2QqHUqPmpQMx
   V8R2B61WO4TPrM6Y5jRWBPvlVkcW7QeGYvfTPQW2irLwURUQKcXAb7S9A
   FxOHOfaDhrGA3xxzyM525kjYF9lNd0Uo3txx22Ud7Z2bOPP0lXB9Erc8O
   Xuh0Gw8jTUu0R6EGFp8fcZs0WmX/7aYjeiPNpJ6mq7xDUy0cj9tcG44fM
   UiH0oQBOGo9hRw8sYzTaaRJZKl8J6EJO7mWwoSYbiQ6gAr2lITmXNvW3z
   g==;
X-CSE-ConnectionGUID: hIPcK2eQTu60KNb1IYt6Fw==
X-CSE-MsgGUID: DcNLh4ArQnWvMYFwdATQ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42429471"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="42429471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:36:53 -0700
X-CSE-ConnectionGUID: 1Was157xSBS68I4NiCTukg==
X-CSE-MsgGUID: hnWdqNh7St+Y4EonBr2xeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="144678046"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 01:36:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttN0j-000BAR-2H;
	Sat, 15 Mar 2025 08:36:49 +0000
Date: Sat, 15 Mar 2025 16:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 8/15] include/asm-generic/io.h:977:16:
 warning: passing argument 1 of 'readsb' discards 'const' qualifier from
 pointer target type
Message-ID: <202503151622.JuZiRiRG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   02710864b974d663d56bc99493fb1976caab42a2
commit: 58774c1d8c8834d8be1dbea1e8ca339792d73935 [8/15] mips: drop GENERIC_IOMAP wrapper
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20250315/202503151622.JuZiRiRG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151622.JuZiRiRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151622.JuZiRiRG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/mips/kernel/asm-offsets.c:12:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: warning: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: warning: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
--
   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from kernel/kthread.c:11:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: warning: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: warning: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
   kernel/kthread.c: In function 'kthread_affine_preferred':
   kernel/kthread.c:862:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     862 |         int ret;
         |             ^~~
--
   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/percpu.h:12,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from include/linux/clk-provider.h:9,
                    from lib/vsprintf.c:23:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: warning: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: warning: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1704:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1704 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from arch/mips/math-emu/ieee754.h:19,
                    from arch/mips/math-emu/ieee754int.h:13,
                    from arch/mips/math-emu/ieee754sp.h:13,
                    from arch/mips/math-emu/sp_fdp.c:10:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: warning: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: warning: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
   arch/mips/math-emu/sp_fdp.c: In function 'ieee754sp_fdp':
   arch/mips/math-emu/ieee754int.h:49:38: warning: variable 'ys' set but not used [-Wunused-but-set-variable]
      49 |         unsigned int ym; int ye; int ys; int yc
         |                                      ^~
   arch/mips/math-emu/sp_fdp.c:25:9: note: in expansion of macro 'COMPYSP'
      25 |         COMPYSP;
         |         ^~~~~~~
--
   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/context_tracking.h:5,
                    from arch/mips/kernel/traps.c:18:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: warning: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: warning: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
   arch/mips/kernel/traps.c: In function 'do_mcheck':
   arch/mips/kernel/traps.c:1592:24: warning: variable 'prev_state' set but not used [-Wunused-but-set-variable]
    1592 |         enum ctx_state prev_state;
         |                        ^~~~~~~~~~
--
   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/clk/clkdev.c:9:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: warning: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: warning: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:185:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     185 |                 res = vsnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~
..


vim +977 include/asm-generic/io.h

9e44fb1816dba8f Horia Geantă   2016-05-19  971  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  972  #ifndef ioread8_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  973  #define ioread8_rep ioread8_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  974  static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  975  			       unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  976  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @977  	readsb(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  978  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  979  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  980  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  981  #ifndef ioread16_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  982  #define ioread16_rep ioread16_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  983  static inline void ioread16_rep(const volatile void __iomem *addr,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  984  				void *buffer, unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  985  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @986  	readsw(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  987  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  988  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  989  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  990  #ifndef ioread32_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  991  #define ioread32_rep ioread32_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  992  static inline void ioread32_rep(const volatile void __iomem *addr,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  993  				void *buffer, unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  994  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @995  	readsl(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  996  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  997  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  998  

:::::: The code at line 977 was first introduced by commit
:::::: 9ab3a7a0d2b417773e8e8a880fc3a69f7fc1f57a asm-generic/io.h: Implement generic {read,write}s*()

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
