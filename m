Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C315B102
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743930958; cv=none; b=f9QyZgDobS7ZuT322c2K+Sfw3w4wz6fsqVplxQLSAEmTYGZhf0GEH24240aFOx+xFvmFjowzsmIV2lkc4/W0ndYuRkXc1Aqx79gtxIUn19sXsp4KgtHsvUoB7ZyjLqDWEYUy6MIsu/BAeu2/Vyz1eB+X+mNP/3VgFXS45nubniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743930958; c=relaxed/simple;
	bh=W2olru74Bum+OFYqq4eSnb2wEsIfbTTBt3hpUoaNO5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJfDcg2kw/BVK+NQ6gQu8SNKeWTc8+u3aoAaTC9KrTHqCmMANBIB02zM3UuX+nRzSOsUCMvG45Pz8Ra7WLBLnZUlaM9ikXBkVKV7yNBkbSsUiWzd7M7vb+2sajDNHNRqKo75Xc0wnFtGca70/3sE4dJeFj2YuQR/w82eHmIJIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4JH8qFv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4JH8qFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743930956; x=1775466956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2olru74Bum+OFYqq4eSnb2wEsIfbTTBt3hpUoaNO5Q=;
  b=U4JH8qFvhPPjBK/aWCJgAJMX1PYjIfjckhgH50n0wbmxRVG/Qo5BTDrN
   TNKcqqJ/4M+CDswp7z+O5Gl6WoDMQiT6V0ua9QbWqk2B1ihWPZ1706APt
   md8/k2TL1ZKU0PadGIgNbewaLY7f+UBAYhml75rWijYtwmqzUUfYsx0JC
   FI5qWqYt+Ik9He7jRl5U8k0Iu4k+9BTO7EtytQOjKjtRB+wrZzBwxNmvy
   DsMwJdPJUTAs41MEnE7JzwhdqwgVX5392Sth7VtmDXmQ1PrsX8pRq60ZW
   PtyPNwWOZ8l5745kQ6kGw/W7UBxc0PD1zv8vezu+85O0n/eZlrSIHVvcY
   A==;
X-CSE-ConnectionGUID: v4CV8EEkT1+bC8RGpxaasQ==
X-CSE-MsgGUID: 5UZ23a9KQ/WRLxtwvO+BEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="62724328"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62724328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 02:15:55 -0700
X-CSE-ConnectionGUID: 6mOTaYr8TXiXBXvaizbxog==
X-CSE-MsgGUID: 9yRZlMzLR3WOUOjWpcN05w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128200077"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 02:15:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1M6Z-0002WF-1R;
	Sun, 06 Apr 2025 09:15:51 +0000
Date: Sun, 6 Apr 2025 17:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 8/8] include/linux/compiler.h:30:46: error:
 macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
Message-ID: <202504061724.Xo1OSe0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   e8a76adeb37a54222d935bddfb4105b5cdd3b3c9
commit: e8a76adeb37a54222d935bddfb4105b5cdd3b3c9 [8/8] todo
config: i386-buildonly-randconfig-003-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061724.Xo1OSe0D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061724.Xo1OSe0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061724.Xo1OSe0D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:119,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/smp.h: In function 'play_dead':
   arch/x86/include/asm/smp.h:85:13: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      85 |         BUG();
         |             ^
   In file included from include/linux/bug.h:5,
                    from include/linux/jump_label.h:258,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59:
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function)
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   arch/x86/include/asm/smp.h:85:9: note: in expansion of macro 'BUG'
      85 |         BUG();
         |         ^~~
   arch/x86/include/asm/bug.h:91:9: note: each undeclared identifier is reported only once for each function it appears in
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   arch/x86/include/asm/smp.h:85:9: note: in expansion of macro 'BUG'
      85 |         BUG();
         |         ^~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/swait.h:5:
   include/linux/ktime.h: In function 'ktime_divns':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/ktime.h:134:9: note: in expansion of macro 'BUG_ON'
     134 |         BUG_ON(div < 0);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/ktime.h:134:9: note: in expansion of macro 'BUG_ON'
     134 |         BUG_ON(div < 0);
         |         ^~~~~~
   In file included from include/linux/crypto.h:19:
   include/linux/slab.h: In function '__kmalloc_index':
   include/linux/slab.h:717:21: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     717 |                 BUG();
         |                     ^
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/slab.h:717:17: note: in expansion of macro 'BUG'
     717 |                 BUG();
         |                 ^~~
   include/asm-generic/fixmap.h: In function 'virt_to_fix':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/asm-generic/fixmap.h:38:9: note: in expansion of macro 'BUG_ON'
      38 |         BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/asm-generic/fixmap.h:38:9: note: in expansion of macro 'BUG_ON'
      38 |         BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
         |         ^~~~~~
   arch/x86/include/asm/desc.h: In function 'init_idt_data':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   arch/x86/include/asm/desc.h:408:9: note: in expansion of macro 'BUG_ON'
     408 |         BUG_ON(n > 0xFF);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   arch/x86/include/asm/desc.h:408:9: note: in expansion of macro 'BUG_ON'
     408 |         BUG_ON(n > 0xFF);
         |         ^~~~~~
   include/linux/xarray.h: In function 'xas_set_order':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/xarray.h:1676:9: note: in expansion of macro 'BUG_ON'
    1676 |         BUG_ON(order > 0);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/xarray.h:1676:9: note: in expansion of macro 'BUG_ON'
    1676 |         BUG_ON(order > 0);
         |         ^~~~~~
   include/linux/bit_spinlock.h: In function 'bit_spin_unlock':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/bit_spinlock.h:60:9: note: in expansion of macro 'BUG_ON'
      60 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/bit_spinlock.h:60:9: note: in expansion of macro 'BUG_ON'
      60 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^~~~~~
   include/linux/bit_spinlock.h: In function '__bit_spin_unlock':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/bit_spinlock.h:77:9: note: in expansion of macro 'BUG_ON'
      77 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/bit_spinlock.h:77:9: note: in expansion of macro 'BUG_ON'
      77 |         BUG_ON(!test_bit(bitnum, addr));
         |         ^~~~~~
   include/linux/list_bl.h: In function 'hlist_bl_set_first':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/list_bl.h:66:9: note: in expansion of macro 'LIST_BL_BUG_ON'
      66 |         LIST_BL_BUG_ON((unsigned long)n & LIST_BL_LOCKMASK);
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/list_bl.h:66:9: note: in expansion of macro 'LIST_BL_BUG_ON'
      66 |         LIST_BL_BUG_ON((unsigned long)n & LIST_BL_LOCKMASK);
         |         ^~~~~~~~~~~~~~
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/list_bl.h:67:9: note: in expansion of macro 'LIST_BL_BUG_ON'
      67 |         LIST_BL_BUG_ON(((unsigned long)h->first & LIST_BL_LOCKMASK) !=
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   include/linux/list_bl.h: In function '__hlist_bl_del':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/list_bl.h:120:9: note: in expansion of macro 'LIST_BL_BUG_ON'
     120 |         LIST_BL_BUG_ON((unsigned long)n & LIST_BL_LOCKMASK);
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/list_bl.h:120:9: note: in expansion of macro 'LIST_BL_BUG_ON'
     120 |         LIST_BL_BUG_ON((unsigned long)n & LIST_BL_LOCKMASK);
         |         ^~~~~~~~~~~~~~
   include/linux/rculist_bl.h: In function 'hlist_bl_set_first_rcu':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/rculist_bl.h:14:9: note: in expansion of macro 'LIST_BL_BUG_ON'
      14 |         LIST_BL_BUG_ON((unsigned long)n & LIST_BL_LOCKMASK);
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'AT_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/rculist_bl.h:14:9: note: in expansion of macro 'LIST_BL_BUG_ON'
      14 |         LIST_BL_BUG_ON((unsigned long)n & LIST_BL_LOCKMASK);
         |         ^~~~~~~~~~~~~~
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/list_bl.h:28:27: note: in expansion of macro 'BUG_ON'
      28 | #define LIST_BL_BUG_ON(x) BUG_ON(x)
         |                           ^~~~~~
   include/linux/rculist_bl.h:15:9: note: in expansion of macro 'LIST_BL_BUG_ON'
      15 |         LIST_BL_BUG_ON(((unsigned long)h->first & LIST_BL_LOCKMASK) !=
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   In file included from include/linux/fs.h:304,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/quota.h: In function 'make_kqid':
   include/linux/quota.h:114:21: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     114 |                 BUG();
         |                     ^
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function)
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/quota.h:114:17: note: in expansion of macro 'BUG'
     114 |                 BUG();
         |                 ^~~
   include/linux/quota.h: In function 'make_kqid_invalid':
   include/linux/quota.h:141:21: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     141 |                 BUG();
         |                     ^
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function)
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/quota.h:141:17: note: in expansion of macro 'BUG'
     141 |                 BUG();
         |                 ^~~
   include/linux/fs.h: In function 'i_readcount_dec':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/fs.h:3175:9: note: in expansion of macro 'BUG_ON'
    3175 |         BUG_ON(atomic_dec_return(&inode->i_readcount) < 0);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/fs.h:3175:9: note: in expansion of macro 'BUG_ON'
    3175 |         BUG_ON(atomic_dec_return(&inode->i_readcount) < 0);
         |         ^~~~~~
   include/linux/seq_file.h: In function 'seq_get_buf':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/seq_file.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(m->count > m->size);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/seq_file.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(m->count > m->size);
         |         ^~~~~~
   include/linux/seq_file.h: In function 'seq_commit':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/seq_file.h:88:17: note: in expansion of macro 'BUG_ON'
      88 |                 BUG_ON(m->count + num > m->size);
         |                 ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/seq_file.h:88:17: note: in expansion of macro 'BUG_ON'
      88 |                 BUG_ON(m->count + num > m->size);
         |                 ^~~~~~
   include/linux/highmem.h: In function 'zero_user_segments':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/highmem.h:275:9: note: in expansion of macro 'BUG_ON'
     275 |         BUG_ON(end1 > page_size(page) || end2 > page_size(page));
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/highmem.h:275:9: note: in expansion of macro 'BUG_ON'
     275 |         BUG_ON(end1 > page_size(page) || end2 > page_size(page));
         |         ^~~~~~
   include/linux/pagemap.h: In function '__readahead_folio':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/pagemap.h:1402:9: note: in expansion of macro 'BUG_ON'
    1402 |         BUG_ON(ractl->_batch_count > ractl->_nr_pages);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/pagemap.h:1402:9: note: in expansion of macro 'BUG_ON'
    1402 |         BUG_ON(ractl->_batch_count > ractl->_nr_pages);
         |         ^~~~~~
   include/linux/pagemap.h: In function '__readahead_batch':
>> include/linux/compiler.h:30:46: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
      30 |                                 .data.line = __LINE__,                  \
         |                                              ^~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:36: note: in expansion of macro 'unlikely'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/pagemap.h:1458:9: note: in expansion of macro 'BUG_ON'
    1458 |         BUG_ON(rac->_batch_count > rac->_nr_pages);
         |         ^~~~~~
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:166:57: note: in expansion of macro 'BUG'
     166 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/pagemap.h:1458:9: note: in expansion of macro 'BUG_ON'
    1458 |         BUG_ON(rac->_batch_count > rac->_nr_pages);
         |         ^~~~~~
   In file included from include/linux/efi.h:19,
                    from arch/x86/kernel/asm-offsets_32.c:6,
                    from arch/x86/kernel/asm-offsets.c:29:
   include/linux/proc_fs.h: In function 'pde_data':
   include/linux/proc_fs.h:210:62: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     210 | static inline void *pde_data(const struct inode *inode) {BUG(); return NULL;}
         |                                                              ^
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/proc_fs.h:210:58: note: in expansion of macro 'BUG'
     210 | static inline void *pde_data(const struct inode *inode) {BUG(); return NULL;}
         |                                                          ^~~
   include/linux/proc_fs.h: In function 'proc_get_parent_data':
   include/linux/proc_fs.h:211:75: error: macro "_BUG_FLAGS" passed 4 arguments, but takes just 3
     211 | static inline void *proc_get_parent_data(const struct inode *inode) { BUG(); return NULL; }
         |                                                                           ^
   arch/x86/include/asm/bug.h:83: note: macro "_BUG_FLAGS" defined here
      83 | #define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
         | 
   arch/x86/include/asm/bug.h:91:9: error: '_BUG_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
      91 |         _BUG_FLAGS("BUG", ASM_UD2, 0, "");                              \
         |         ^~~~~~~~~~
   include/linux/proc_fs.h:211:71: note: in expansion of macro 'BUG'
     211 | static inline void *proc_get_parent_data(const struct inode *inode) { BUG(); return NULL; }
         |                                                                       ^~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1434993930
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1272: prepare0] Error 2 shuffle=1434993930
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1434993930
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1434993930
   make: Target 'prepare' not remade because of errors.


vim +/_BUG_FLAGS +30 include/linux/compiler.h

1f0d69a9fc815d Steven Rostedt          2008-11-12  21  
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  22) #define __branch_check__(x, expect, is_constant) ({			\
2026d35741f2c3 Mikulas Patocka         2018-05-30  23  			long ______r;					\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19  24) 			static struct ftrace_likely_data		\
e04462fb82f8dd Miguel Ojeda            2018-09-03  25  				__aligned(4)				\
33def8498fdde1 Joe Perches             2020-10-21  26  				__section("_ftrace_annotated_branch")	\
1f0d69a9fc815d Steven Rostedt          2008-11-12  27  				______f = {				\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19  28) 				.data.func = __func__,			\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19  29) 				.data.file = __FILE__,			\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19 @30) 				.data.line = __LINE__,			\
1f0d69a9fc815d Steven Rostedt          2008-11-12  31  			};						\
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  32) 			______r = __builtin_expect(!!(x), expect);	\
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  33) 			ftrace_likely_update(&______f, ______r,		\
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  34) 					     expect, is_constant);	\
1f0d69a9fc815d Steven Rostedt          2008-11-12  35  			______r;					\
1f0d69a9fc815d Steven Rostedt          2008-11-12  36  		})
1f0d69a9fc815d Steven Rostedt          2008-11-12  37  

:::::: The code at line 30 was first introduced by commit
:::::: 134e6a034cb004ed5acd3048792de70ced1c6cf5 tracing: Show number of constants profiled in likely profiler

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
