Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090D35952
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735380419; cv=none; b=cbJ7n6/KLaZACfWcHs4yT5iavDoyPcseZnsYuoHtVbJ5mDRiFhfGj3XjXHfdSf2A6+19IUA6XQDA7p0KrruResytua7aNPCKGnnSgwEKaEEIdWB1/EJ2sohKfQx/fV88sxHjaxABJZCEYS3BVQZ9VZi7YDUAwp1u0svphn13g/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735380419; c=relaxed/simple;
	bh=OynbHH0pb3oYUpZ+Eqv2iYVQGiaaPwKqHdRm0FBikP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0QLmmefyVqqyQny9zSyKLaG0fuX0qkYhbaxIbUt8aVof0xRbB737AwCpsdUf5oMdCnND5V74JH0usyyrrQ9Gt0Up58ry0LFGsyDa613n2XkptXN/MyYqFeIzuP/IhLwceZfqhJ2qnyVcfAFwZFKSC2/xeg8WfnLuGHSmMWfIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNEJXpdY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNEJXpdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735380417; x=1766916417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OynbHH0pb3oYUpZ+Eqv2iYVQGiaaPwKqHdRm0FBikP8=;
  b=fNEJXpdYf8Rbt4by7Gd0Z84jqR8Z4Y4a36SqxT4ak/J/hPLSmNmN5PRN
   ASQxjtVtBirPJ/5N3MUf9zB+hxfzAbyF5Ex87T+T9BHg56Q7k8056wJj8
   beTeb4xFKQht3yvCOEO6ISr1GX3reylFq8bGH0PDtkC91Noh0KqeGHYIE
   XxKTwBcVygTY1+hp+LOaJG0fVyTU5yDsHiIzhFgpCLszgaXm6j+J3qLmS
   /AmF79Gk5c4WOPrSwqVzNXUtNT1WuTcpK48MjoBctxvX1JJvwm0VoUUqj
   r4+NKBkYQqREeIe9cWSBLWVXnLF22xfrPtxzRnqcLKmmXY+FXDz+BJipB
   Q==;
X-CSE-ConnectionGUID: MnCFJYG1SICpwXfFBaeHvA==
X-CSE-MsgGUID: IkhcXam4Remx/l1z3Xzf2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61127627"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="61127627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 02:06:55 -0800
X-CSE-ConnectionGUID: AwJ2SNt+SSWC5Z4k+Q+MBg==
X-CSE-MsgGUID: Gnx1jLuWRqqymu5SBWNCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="100097812"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2024 02:06:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRTid-0003zi-0k;
	Sat, 28 Dec 2024 10:06:51 +0000
Date: Sat, 28 Dec 2024 18:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13]
 arch/x86/include/asm/msr.h:240:17: error: 'cold' attribute only applies to
 functions
Message-ID: <202412281808.iFVsmRyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   d306be716e5af1adafb2353116f5a5aec9f5fa15
commit: d306be716e5af1adafb2353116f5a5aec9f5fa15 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281808.iFVsmRyj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281808.iFVsmRyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281808.iFVsmRyj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   11 warnings generated.
--
   In file included from lib/kobject.c:15:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   8 warnings generated.
--
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   In file included from lib/vsprintf.c:30:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/vsprintf.c:50:
   In file included from lib/../mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   13 warnings generated.
--
   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:240:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: error: 'cold' attribute only applies to functions [-Werror,-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   8 errors generated.
--
   In file included from lib/crc32test.c:28:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   lib/crc32test.c:674:13: warning: variable 'crc' set but not used [-Wunused-but-set-variable]
     674 |         static u32 crc;
         |                    ^
   lib/crc32test.c:754:13: warning: variable 'crc' set but not used [-Wunused-but-set-variable]
     754 |         static u32 crc;
         |                    ^
   10 warnings generated.
--
   In file included from lib/locking-selftest.c:18:
   In file included from include/linux/sched/mm.h:8:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   In file included from lib/locking-selftest.c:22:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   lib/locking-selftest.c:2510:1: warning: unused function 'class_HARDIRQ_lock_ptr' [-Wunused-function]
    2510 | DEFINE_LOCK_GUARD_0(HARDIRQ, HARDIRQ_ENTER(), HARDIRQ_EXIT())
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:407:49: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
     407 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     408 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:378:21: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     378 | static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)     \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:89:1: note: expanded from here
      89 | class_HARDIRQ_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~
   lib/locking-selftest.c:2511:1: warning: unused function 'class_NOTTHREADED_HARDIRQ_lock_ptr' [-Wunused-function]
    2511 | DEFINE_LOCK_GUARD_0(NOTTHREADED_HARDIRQ,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2512 |         do {
         |         ~~~~
    2513 |                 local_irq_disable();
         |                 ~~~~~~~~~~~~~~~~~~~~
    2514 |                 __irq_enter();
         |                 ~~~~~~~~~~~~~~
    2515 |                 WARN_ON(!in_irq());
         |                 ~~~~~~~~~~~~~~~~~~~
    2516 |         } while(0), HARDIRQ_EXIT())
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:407:49: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
     407 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     408 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:378:21: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     378 | static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)     \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:197:1: note: expanded from here
     197 | class_NOTTHREADED_HARDIRQ_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/locking-selftest.c:2517:1: warning: unused function 'class_SOFTIRQ_lock_ptr' [-Wunused-function]
    2517 | DEFINE_LOCK_GUARD_0(SOFTIRQ, SOFTIRQ_ENTER(), SOFTIRQ_EXIT())
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:407:49: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
     407 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     408 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:378:21: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     378 | static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)     \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:225:1: note: expanded from here
     225 | class_SOFTIRQ_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~
   lib/locking-selftest.c:2520:1: warning: unused function 'class_RCU_lock_ptr' [-Wunused-function]
    2520 | DEFINE_LOCK_GUARD_0(RCU, rcu_read_lock(), rcu_read_unlock())
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:407:49: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
..


vim +/cold +240 arch/x86/include/asm/msr.h

   218	
   219	/*
   220	 * XXX: is ASM_CALL_CONSTRAINT compatible with asm goto?  Perhaps "memory"
   221	 * takes care of the problem without it?
   222	 */
   223	
   224	static __always_inline int __native_rdmsr_variable_safe(const u32 msr, u64 *val)
   225	{
   226	#ifdef CONFIG_X86_64
   227		BUILD_BUG_ON(__builtin_constant_p(msr));
   228	
   229		asm_inline volatile goto(
   230			"1:\n"
   231			RDMSR_AND_SAVE_RESULT
   232			EX_RDMSR_SAFE(1b, %l[badmsr])	/* For RDMSR */
   233			: [val] "=a" (*val)
   234			: "c" (msr)
   235			: "memory", "rdx"
   236			: badmsr);
   237		return 0;
   238	
   239	badmsr:
 > 240		__attribute__((cold, unused));
   241		return -EIO;
   242	#else
   243		int err = 0;
   244	
   245		asm_inline volatile(
   246			"1: rdmsr\n\t"
   247			"xor %[err], %[err]\n\t"
   248			"2:\n\t"
   249			_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
   250			: [err] "=r" (err), "=A" (val)
   251			: "c" (msr));
   252	
   253		return err;
   254	#endif
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
