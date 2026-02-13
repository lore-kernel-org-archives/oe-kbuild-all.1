Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC0224B05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981268; cv=none; b=AWOxjtyq7xGNlxaQsGnXUaYzMthiHYcyKrMswI29GdJYdNmU8e9Q4l2tOeXPtHNgWGArKsEKlRhTEfevitHU/WXaUC1DKd/3aZ0ENq+VDQ+kNRTiBqYWYvGdNnEVXgA+FbycWXaJCvTOr40xsS5K5r15lx73EmU1SdHQ/5ekFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981268; c=relaxed/simple;
	bh=fxyWLUpalEdX+xbSGxLLq7jX4jMWKZDgGZAcBjbr2Rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BE2oE+gbCzK7m1CYKIuC7P/gEeZTYeTvgD9NM1Ci3BFoseVHWerEdPaVVfOTec625m6Rde/k4xarjuG5cCVegjiVF9ucJ8VUU2uvIQFLXcVEeCqz6IS/qnI+WqiTpjBXypBVexr66obel+LZidpssWX8XIUof1jgp+twoWWUvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mx5Q/hEd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mx5Q/hEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981267; x=1802517267;
  h=date:from:to:cc:subject:message-id;
  bh=fxyWLUpalEdX+xbSGxLLq7jX4jMWKZDgGZAcBjbr2Rk=;
  b=Mx5Q/hEdnz9pAbwVKzFbWfOOrr5Mr4jUeEOc8p5JsafaAcRBGcjOxmof
   vcV9K6RMq2TljWqjRnOt5pxV9KwsXZneIhkqzVyK3Nie0pyOd8vdnlw3c
   YUMG88tSwJSKekOLKrVN9v3MxkOu5fV4jULIjfKJzEJ29QVSXT8BZWiXq
   Shsal0xeh6vO1U/yTKXNGAom5y4YY4Kr9awg6+5ALuIkEkMiyGkJDaR1X
   eewoXuozdhivpe9zNdekAZW9+Is6PBoXJfhTIp1J+rAJJfDSm93UoK3Vm
   qqftiPN3kDEtBgo3VvYW6INriiGgYkC4HCCaDAWg+9OPwxpDCbGZ9uBJp
   A==;
X-CSE-ConnectionGUID: frRo0PMjSD2ThKq8Ax2CNQ==
X-CSE-MsgGUID: 09btV7c+QPerozERa4zBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="76005214"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="76005214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:14:27 -0800
X-CSE-ConnectionGUID: AEB1mULpRNyNqA7NdCldNQ==
X-CSE-MsgGUID: 79QuN9z8Qi2Hpuuy6/1bMA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 03:14:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqr7v-00000000vKC-1BlD;
	Fri, 13 Feb 2026 11:14:23 +0000
Date: Fri, 13 Feb 2026 19:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 3/16] arch/parisc/include/asm/pgtable.h:185:9:
 warning: 'PTE_SHIFT' redefined
Message-ID: <202602131907.cWmQskb9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: 49c571ae7bb8b188254533ec2375cebc783f840c [3/16] mm: Introduce PTE_SIZE, PTE_SHIFT and PTE_MASK
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602131907.cWmQskb9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131907.cWmQskb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131907.cWmQskb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/uaccess.h:16,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/parisc/kernel/asm-offsets.c:20:
>> arch/parisc/include/asm/pgtable.h:185:9: warning: 'PTE_SHIFT' redefined
     185 | #define PTE_SHIFT               xlate_pabit(_PAGE_USER_BIT)
         |         ^~~~~~~~~
   In file included from arch/parisc/include/asm/page.h:7,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from arch/parisc/kernel/asm-offsets.c:18:
   include/vdso/page.h:13:9: note: this is the location of the previous definition
      13 | #define PTE_SHIFT      CONFIG_PTE_SHIFT
         |         ^~~~~~~~~
--
   In file included from arch/parisc/include/asm/uaccess.h:16,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/parisc/kernel/asm-offsets.c:20:
>> arch/parisc/include/asm/pgtable.h:185:9: warning: 'PTE_SHIFT' redefined
     185 | #define PTE_SHIFT               xlate_pabit(_PAGE_USER_BIT)
         |         ^~~~~~~~~
   In file included from arch/parisc/include/asm/page.h:7,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from arch/parisc/kernel/asm-offsets.c:18:
   include/vdso/page.h:13:9: note: this is the location of the previous definition
      13 | #define PTE_SHIFT      CONFIG_PTE_SHIFT
         |         ^~~~~~~~~


vim +/PTE_SHIFT +185 arch/parisc/include/asm/pgtable.h

^1da177e4c3f41 include/asm-parisc/pgtable.h Linus Torvalds 2005-04-16  181  
^1da177e4c3f41 include/asm-parisc/pgtable.h Linus Torvalds 2005-04-16  182  /* this defines the shift to the usable bits in the PTE it is set so
^1da177e4c3f41 include/asm-parisc/pgtable.h Linus Torvalds 2005-04-16  183   * that the valid bits _PAGE_PRESENT_BIT and _PAGE_USER_BIT are set
^1da177e4c3f41 include/asm-parisc/pgtable.h Linus Torvalds 2005-04-16  184   * to zero */
^1da177e4c3f41 include/asm-parisc/pgtable.h Linus Torvalds 2005-04-16 @185  #define PTE_SHIFT	   	xlate_pabit(_PAGE_USER_BIT)
^1da177e4c3f41 include/asm-parisc/pgtable.h Linus Torvalds 2005-04-16  186  

:::::: The code at line 185 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
