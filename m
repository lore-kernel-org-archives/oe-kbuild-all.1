Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED02D8DDB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874916; cv=none; b=VQL41oZPVr1LJehJeseOYkJ78n5Ql+Tf2qPLTm1yDNL6VKwe1UqX63ZpJXWhIfMhYACN8e5wwncq5jtGdR81ig3j7/PAZ7vjw6857cuUdnT5PIKwsY49VfjuASD8xVQq2JzNHk0zfOL502ijIn1pyAq1uWHVD2vDXERJ7HZmJrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874916; c=relaxed/simple;
	bh=En8shR1f4kj0mf7dYdf4m9Ju1AY49uV8EnTr3UhO7Qs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ag4Mg2eMbUOgUuTLWukSJ6Q1BMdDQRmKsVLCxlXOu9+YXFEpzZI97RH8JTUqlkWUu7r47pzduUsALR6d7HZf06aEuFNpiPFT6NudEcpr9Rvzu+urP/KlEhUPGzyMX6pbIwfTu3oyZyjEti/hYJ185K63HG/e8a15SKTt57RaOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/lnK87F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/lnK87F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786874914; x=1818410914;
  h=date:from:to:cc:subject:message-id;
  bh=En8shR1f4kj0mf7dYdf4m9Ju1AY49uV8EnTr3UhO7Qs=;
  b=f/lnK87F9cLWP5aGVVj/dLx292M10tVpcx7GG8LW8Det9MIzg8gNaiQZ
   8HDW6awEHruoQNlb2FnNt/wPYCXvok+WIY/j/4BuJjY2UESNtDZBYuwCP
   wttV9cz74X7kGZSg2C6zCr8ywNOcHaww+uzrHyfG390q9i5jYvEgtBmKj
   /EfADO8hmL+buJk0GZ8kHcITBwKlTWOlFaqaadWm2mEh3YIPFs/KK2dsF
   u/9RLg3Op8fP3NHQrN/1LPU4gJI8SkSdqevt8Ev+ttp1CxyzNdn14SkbC
   edXf8liQ3MLd7rlVfwaMonsxPjN7DGQ2RAk8/zBsnEdpjZid9bPgibzqJ
   g==;
X-CSE-ConnectionGUID: DZ9MiFhmTWyez01wTocktw==
X-CSE-MsgGUID: BtntSJD5SheIUa+qOab7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87398519"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87398519"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 03:08:34 -0700
X-CSE-ConnectionGUID: Zxhe0TrTSpymFgmIYf4ulQ==
X-CSE-MsgGUID: XLpZFOyHQ3O0sFaliEMcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="266641248"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2026 03:08:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvXn3-00000000cr8-2w0n;
	Sun, 16 Aug 2026 10:08:29 +0000
Date: Sun, 16 Aug 2026 18:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 lib/../mm/internal.h:1249:18: error: static declaration of
 'vmap_pages_range_noflush' follows non-static declaration
Message-ID: <202608161711.5tYCL43s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: c079fb2a08aa30fea641845ea6f5669d72d913c9 [2/2] ANDROID: mm/vmalloc: export vmap_pages_range_noflush and __get_vm_area_caller
config: arm-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161711.5tYCL43s-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161711.5tYCL43s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161711.5tYCL43s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/vsprintf.c:50:
>> lib/../mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/rtc.h:17,
                    from lib/vsprintf.c:36:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from mm/filemap.c:52:
>> mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/filemap.c:20:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/vmscan.c:68:
>> mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/vmscan.c:19:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1071:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
    1071 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c:2681:15: warning: no previous prototype for 'shrink_inactive_list' [-Wmissing-prototypes]
    2681 | unsigned long shrink_inactive_list(unsigned long nr_to_scan,
         |               ^~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/gup.c:26:
>> mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from arch/arm/include/asm/cachetype.h:85,
                    from arch/arm/include/asm/cacheflush.h:14,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/pagemap.h:11,
                    from mm/gup.c:9:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:408:6: warning: no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     408 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/early_ioremap.c:20:
>> mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from mm/early_ioremap.c:13:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/early_ioremap.c:18:
   arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/page_alloc.c:62:
>> mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from arch/arm/include/asm/cachetype.h:85,
                    from arch/arm/include/asm/cacheflush.h:14,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from mm/page_alloc.c:20:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1729:6: warning: no previous prototype for 'prep_new_page' [-Wmissing-prototypes]
    1729 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^~~~~~~~~~~~~
--
   In file included from mm/oom_kill.c:51:
>> mm/internal.h:1249:18: error: static declaration of 'vmap_pages_range_noflush' follows non-static declaration
    1249 | int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/io.h:1028,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from mm/oom_kill.c:30:
   include/linux/vmalloc.h:129:5: note: previous declaration of 'vmap_pages_range_noflush' with type 'int(long unsigned int,  long unsigned int,  pgprot_t,  struct page **, unsigned int)' {aka 'int(long unsigned int,  long unsigned int,  long unsigned int,  struct page **, unsigned int)'}
     129 | int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:432:6: warning: no previous prototype for 'dump_tasks' [-Wmissing-prototypes]
     432 | void dump_tasks(struct oom_control *oc)
         |      ^~~~~~~~~~


vim +/vmap_pages_range_noflush +1249 lib/../mm/internal.h

b671491199acd3 Mike Rapoport (IBM  2023-03-21  1247) 
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1248  static inline
d905ae2b0f7eaf Alexander Potapenko 2023-04-13 @1249  int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1250                  pgprot_t prot, struct page **pages, unsigned int page_shift)
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1251  {
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1252  	return -EINVAL;
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1253  }
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1254  #endif
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  1255  

:::::: The code at line 1249 was first introduced by commit
:::::: d905ae2b0f7eaf8fb37febfe4833ccf3f8c1c27a mm: apply __must_check to vmap_pages_range_noflush()

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
