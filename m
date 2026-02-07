Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428D2367D1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770474468; cv=none; b=JaWFeoi+ij0Q1tzAYYUf+LtDzH+ukC3kYsl6I7k/F2lU4thJgtYvks1L+l4Swp5iuuZKz0QYPjpTf3O3GID9x/fgLeyCzcSH8rB7O9mc78bLQM46MDMGAONWQhBFF44K0RSvxUtwKjcldUeyJD1D656CRZx1k8Hne+NUaKwFG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770474468; c=relaxed/simple;
	bh=nCwQFGy7ugdX0Ca2RSLV4r7LijKAjYssocRp5QxTP1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V2Kxt1/RFNGIL3zPv0Q4O85bOCQ3k98llMyshGp2VOsnJXBY5dONrzMoWfvDhqzMIOm13mjIzGsprnRX7IPtl5gThUBtU8512BdkPx1gHChG5YniCrUj09FPbn6qK4IHpg8tXYoIASbfIrqfiRVRHpNsQmvWhDEm6hG55HGsfz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtv9hClq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtv9hClq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770474468; x=1802010468;
  h=date:from:to:cc:subject:message-id;
  bh=nCwQFGy7ugdX0Ca2RSLV4r7LijKAjYssocRp5QxTP1E=;
  b=gtv9hClqrqoTqTtXINT2CxBWOD3SWPfh9944OzIL+CSw7AM94z2beDU7
   2GukT/TtF3OuD00NWhhhwAU7rq6RJH7gjWoa2yH1RX9QgPTXigyYfy0Ed
   gWLFkWPVzqUC1NIoyolEx4U5xL2q2YMEVGoEfz47dLMo6gpe6XGk1s+d/
   1bOfAvddNHe4b2Z/X0Zit5Eqr0z0vPnaXJlZOhORx5ASBYI5X3gWeR0s+
   vrcmlkNZJj9qXCMcYcNUVUOubQcrrefSDmvJoi0/FJlTRhukFa9Q9dEdw
   sy4aKJOG949mHUeFyIrtoiyTkm6N6ScZuZrHkhgxP9XFnaFrbvCCyN2jC
   w==;
X-CSE-ConnectionGUID: 1m4+CQchSEWep+CusM5eSA==
X-CSE-MsgGUID: xFe1S+kBSd+ynh7IGvNiWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70852865"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70852865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 06:27:47 -0800
X-CSE-ConnectionGUID: +94dhXh2SjKWdGogEXltPg==
X-CSE-MsgGUID: GPTu+2dZRSOmQ97khkargA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210372650"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Feb 2026 06:27:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vojHj-00000000lge-2Dl7;
	Sat, 07 Feb 2026 14:27:43 +0000
Date: Sat, 07 Feb 2026 22:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>
Subject: [agd5f:baseline0 1810/3826]
 include/asm-generic/mm_hooks.h:20:53: warning: 'struct vm_area_struct'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202602072214.PqXZewoT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: b4b83fff12280856b628855c225d6f897695329b [1810/3826] drm/amdkcl: test kthread_{use,unuse}_mm()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260207/202602072214.PqXZewoT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072214.PqXZewoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072214.PqXZewoT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/mmu_context.h:5,
                    from include/linux/mmu_context.h:5,
                    from include/kcl/kcl_kthread.h:8,
                    from include/kcl/backport/kcl_kthread_backport.h:6,
                    from drivers/gpu/drm/scheduler/backport/backport.h:6,
                    from <command-line>:
>> include/asm-generic/mm_hooks.h:20:53: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
         |                                                     ^~~~~~~~~~~~~~
   include/kcl/kcl_kthread.h:24:6: error: static declaration of 'kthread_use_mm' follows non-static declaration
      24 | void kthread_use_mm(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~~
   In file included from include/kcl/backport/kcl_kthread_backport.h:5:
   include/linux/kthread.h:262:6: note: previous declaration of 'kthread_use_mm' with type 'void(struct mm_struct *)'
     262 | void kthread_use_mm(struct mm_struct *mm);
         |      ^~~~~~~~~~~~~~
   include/kcl/kcl_kthread.h: In function 'kthread_use_mm':
   include/kcl/kcl_kthread.h:26:9: error: implicit declaration of function 'use_mm' [-Wimplicit-function-declaration]
      26 |         use_mm(mm);
         |         ^~~~~~
   include/kcl/kcl_kthread.h: At top level:
   include/kcl/kcl_kthread.h:29:6: error: static declaration of 'kthread_unuse_mm' follows non-static declaration
      29 | void kthread_unuse_mm(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:263:6: note: previous declaration of 'kthread_unuse_mm' with type 'void(struct mm_struct *)'
     263 | void kthread_unuse_mm(struct mm_struct *mm);
         |      ^~~~~~~~~~~~~~~~
   include/kcl/kcl_kthread.h: In function 'kthread_unuse_mm':
   include/kcl/kcl_kthread.h:31:9: error: implicit declaration of function 'unuse_mm' [-Wimplicit-function-declaration]
      31 |         unuse_mm(mm);
         |         ^~~~~~~~
   In file included from include/kcl/backport/kcl_fence_backport.h:4,
                    from drivers/gpu/drm/scheduler/backport/backport.h:7:
   include/kcl/kcl_fence.h: At top level:
   include/kcl/kcl_fence.h:16:10: fatal error: kcl/kcl_rcupdate.h: No such file or directory
      16 | #include <kcl/kcl_rcupdate.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 include/asm-generic/mm_hooks.h

d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  19  
1b2ee1266ea647 Dave Hansen         2016-02-12 @20  static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,

:::::: The code at line 20 was first introduced by commit
:::::: 1b2ee1266ea647713dbaf44825967c180dfc8d76 mm/core: Do not enforce PKEY permissions on remote mm access

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
