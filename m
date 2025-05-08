Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8B223DDC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741896; cv=none; b=jLqfOy4T6kvS2YoPy11DZwFT3XtqsK1Jwbez+Fjr3Gzw7yQwSpaKdUGi3ZupxU4odNpYD/6zrgQMjkd/pWW/9dYndVYjvjjpDvCCKrJeLe3gvmr7WfL2IxUQa4JETVwCQ4Ic3vdYQnmqWpE38nXhxhJ6UuwvsmFggj6G5vaHu6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741896; c=relaxed/simple;
	bh=XjtnjASa69WQ90Hr5y/AckuLd7qGDFC8LU/lRWRfkdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJ4FLZ35amJEWe/ksMFonanTHoaqSDM02rZGlnHAvsqSSuovmObaPwWysjJkwy1rzRbhCbqt5OBUH8WtsTSonhPuwE+C1YEUYyreEv6Gs26DqLeP+nNb7kSmDdp2zznvq1pXApHuXcCC8zXMOsT2hYT1TorVfTjneNn+khVFAQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AohcogE1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AohcogE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746741895; x=1778277895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjtnjASa69WQ90Hr5y/AckuLd7qGDFC8LU/lRWRfkdg=;
  b=AohcogE1dtpRBJrDMejcZFEms+cMZQehT8g9gLBLtnrPjECrUFQMwCT2
   5N1JtgyL4R/RVWIQkA8H4cICJMzYC9E0rFXQcp3pvuTRVRSNkZAdjDYEv
   l5MiZ/VM0Fxc8Q7HP576J3l8EsoW2sqbMJySjP/41HiKa7Zyn4RdC8QOo
   UV3ZA61c115WD7QcHSvA9Zk4NAgxPjlg9gUty40Rhy1DXOX1mypZxTB/q
   4TIJf4fgDp6ZntPY/zoHMCsusTLBenQzVjvyO1n/CORWu0XD+rve5+X/5
   314MPOeRyU0WMf6X+1sdBZoKNXLRWPOqzr3AclZ0Wt/sPf4di+5XA+Ecm
   A==;
X-CSE-ConnectionGUID: QKcu2qY6QRSwnfTM9kXcOA==
X-CSE-MsgGUID: ZrpGB/ywRtm2jbySpStSkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58765321"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="58765321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:04:52 -0700
X-CSE-ConnectionGUID: FpGHDxu7SQKK1bZAx/b+rg==
X-CSE-MsgGUID: bQTut7XUTlOL0Pa6v8j88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="173599793"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 15:04:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9MH-000BPz-00;
	Thu, 08 May 2025 22:04:49 +0000
Date: Fri, 9 May 2025 06:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 4/4]
 arch/x86/include/asm/paravirt.h:873:47: warning: declaration of 'struct
 mm_struct' will not be visible outside of this function
Message-ID: <202505090520.Ylk4FrUI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   3d787fbb81fafa82ef096a45908185c6c4ab2ebc
commit: 7acb4f6bcac9871c147dc6652266b3ec4235d0a8 [4/4] ANDROID: x86/paravirt: Add pv_mmio_ops
config: x86_64-buildonly-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090520.Ylk4FrUI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090520.Ylk4FrUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090520.Ylk4FrUI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/early_ioremap.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:45:
>> arch/x86/include/asm/paravirt.h:873:47: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
     873 | static inline void paravirt_enter_mmap(struct mm_struct *mm)
         |                                               ^
   arch/x86/include/asm/paravirt.h:879:51: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
     879 | static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
         |                                                   ^
   In file included from mm/early_ioremap.c:14:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:33:
   In file included from include/linux/mman.h:8:
   In file included from include/linux/mm.h:2257:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +873 arch/x86/include/asm/paravirt.h

fdc0269e8958a1 Juergen Gross 2018-08-28  870  
a1ea1c032b8f8c Dave Hansen   2014-11-18  871  #ifndef __ASSEMBLY__
fdc0269e8958a1 Juergen Gross 2018-08-28  872  #ifndef CONFIG_PARAVIRT_XXL
c9ae1b10d95610 Juergen Gross 2023-02-07 @873  static inline void paravirt_enter_mmap(struct mm_struct *mm)
a1ea1c032b8f8c Dave Hansen   2014-11-18  874  {
a1ea1c032b8f8c Dave Hansen   2014-11-18  875  }
fdc0269e8958a1 Juergen Gross 2018-08-28  876  #endif
a1ea1c032b8f8c Dave Hansen   2014-11-18  877  

:::::: The code at line 873 was first introduced by commit
:::::: c9ae1b10d9561012a222e05f0d3ab4e93d301f06 x86/paravirt: Merge activate_mm() and dup_mmap() callbacks

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
