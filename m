Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992582F260F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412493; cv=none; b=d9uC9CTsk0E6d6xtPvOLh5mkm9ulqPUniWC6FtYFbzfEF7bjj4QLmAPfn2hxa7K+sd/d8NbaIilwIPZL5+niZnqybm82e+qXr+PThqsukJB+Mi3mEe8ytfuQXxj4BNwUXUQhpAGPys1p/AG4nsjsAUr4jDHqa1uSUZkYAiA0PHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412493; c=relaxed/simple;
	bh=rrerw5zLqWSK8LQ34YCWWd9/XsSjiyIrvzmThv3GqWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IHXrtURXWcnJhMTtPNLBCQ7C3EN/4k4Ub3qL1Epa5ectPLV/s6WkPKBuuc9i+ngPsP3OYW5eDGtzsYEHBKM4T76tDmd0SoTGRwprBzcexajtaqVhORt1+YsYIxKhyYbg9uUKgP5ADWgnHu0ISJv17CiOb0drl00P4D0oK7uCTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYvfLplq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYvfLplq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770412493; x=1801948493;
  h=date:from:to:cc:subject:message-id;
  bh=rrerw5zLqWSK8LQ34YCWWd9/XsSjiyIrvzmThv3GqWI=;
  b=LYvfLplqYZ4OfDCeXn5Sr1YeoSk67qLNlVOxs258Rfp+FEJovtVy5atB
   OtlFODgcGgPKQb6EZ4S+0uMm9G9DdUaZcwn0RRqHuZ8GCZRolvAhv/XJU
   q2XumySA1rGhYA+AWmYmMYx/LpO9HsABz4q0M+DLs+MGDOwWeUWdPGgtd
   GgzGJwURVr0RNz7MyOoDj0H1jvzs8KkKNn0uzV8TuVqQXBLbHYM0Kq/Gs
   1BGcdZrzfszQee2keaH7Mb3jMDvFK8WSHE4ga63h1Sq2C3/8pT0EISBOT
   AS6vV7WcXG7A0XbuwT4iOcmebKJKhG6QvqqeHQcvz9XzONClCgoKLMczS
   w==;
X-CSE-ConnectionGUID: tdNh9MP4TGiMAVpUsy7qMg==
X-CSE-MsgGUID: J41UEVM7QJmBDIebMD0pcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82994995"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="82994995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:14:52 -0800
X-CSE-ConnectionGUID: hQrt275dSlCjy3auLalZ0Q==
X-CSE-MsgGUID: 7MPTltsHRMWpwyaQfY4o9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210280910"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2026 13:14:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTA9-000000004in-069F;
	Fri, 06 Feb 2026 21:14:49 +0000
Date: Fri, 06 Feb 2026 22:14:23 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 56/56]
 include/linux/static_call_types.h:58:2: error: too few arguments to function
 '(({...}))'
Message-ID: <202602062251.XYjU7tz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   c86be62d601ede14cbad1d0fb5af9b67d4172342
commit: c86be62d601ede14cbad1d0fb5af9b67d4172342 [56/56] FIXUPS
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260206/202602062251.XYjU7tz4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602062251.XYjU7tz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602062251.XYjU7tz4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:141,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/page_64.h:9,
                    from arch/x86/include/asm/page.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:19:
   arch/x86/kvm/mmu/mmu.c: In function 'mmu_topup_memory_caches':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:609:21: note: in expansion of macro 'kvm_x86_call'
     609 |                 r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
         |                     ^~~~~~~~~~~~
--
   In file included from include/linux/entry-virt.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/mmu.h:5,
                    from arch/x86/kvm/mmu/tdp_mmu.c:4:
   arch/x86/kvm/mmu/tdp_mmu.c: In function 'tdp_mmu_alloc_sp_for_split':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   arch/x86/kvm/mmu/tdp_mmu.c:1468:21: note: in expansion of macro 'kvm_x86_call'
    1468 |                 if (kvm_x86_call(topup_external_cache)(kvm, kvm_get_running_vcpu()))
         |                     ^~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/bug.h:141,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/page_64.h:9,
                    from arch/x86/include/asm/page.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from mmu/mmu.c:19:
   mmu/mmu.c: In function 'mmu_topup_memory_caches':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   mmu/mmu.c:609:21: note: in expansion of macro 'kvm_x86_call'
     609 |                 r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
         |                     ^~~~~~~~~~~~
--
   In file included from include/linux/entry-virt.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/mmu.h:5,
                    from mmu/tdp_mmu.c:4:
   mmu/tdp_mmu.c: In function 'tdp_mmu_alloc_sp_for_split':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   mmu/tdp_mmu.c:1468:21: note: in expansion of macro 'kvm_x86_call'
    1468 |                 if (kvm_x86_call(topup_external_cache)(kvm, kvm_get_running_vcpu()))
         |                     ^~~~~~~~~~~~


vim +58 include/linux/static_call_types.h

73f44fe19d3596 Josh Poimboeuf 2021-01-27  48  
880cfed3a012d7 Peter Zijlstra 2021-01-18  49  /*
880cfed3a012d7 Peter Zijlstra 2021-01-18  50   * __ADDRESSABLE() is used to ensure the key symbol doesn't get stripped from
880cfed3a012d7 Peter Zijlstra 2021-01-18  51   * the symbol table so that objtool can reference it when it generates the
880cfed3a012d7 Peter Zijlstra 2021-01-18  52   * .static_call_sites section.
880cfed3a012d7 Peter Zijlstra 2021-01-18  53   */
73f44fe19d3596 Josh Poimboeuf 2021-01-27  54  #define __STATIC_CALL_ADDRESSABLE(name) \
73f44fe19d3596 Josh Poimboeuf 2021-01-27  55  	__ADDRESSABLE(STATIC_CALL_KEY(name))
73f44fe19d3596 Josh Poimboeuf 2021-01-27  56  
880cfed3a012d7 Peter Zijlstra 2021-01-18  57  #define __static_call(name)						\
880cfed3a012d7 Peter Zijlstra 2021-01-18 @58  ({									\
73f44fe19d3596 Josh Poimboeuf 2021-01-27  59  	__STATIC_CALL_ADDRESSABLE(name);				\
73f44fe19d3596 Josh Poimboeuf 2021-01-27  60  	__raw_static_call(name);					\
880cfed3a012d7 Peter Zijlstra 2021-01-18  61  })
880cfed3a012d7 Peter Zijlstra 2021-01-18  62  

:::::: The code at line 58 was first introduced by commit
:::::: 880cfed3a012d7863f42251791cea7fe78c39390 static_call: Pull some static_call declarations to the type headers

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
