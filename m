Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3632E737B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815890; cv=none; b=TBF1EVUgwMXL6JxeS7IPZyADuu/OQVp8etBrzV8DxDGJlXVmhd4hj0gGKRBVne6D5hssKhM7xHQKIIqowKBEMpfO00zJTmXNkeB8IIhkDTxkQu9RlmKCsDOEIJcT21iHoEKwtK+ermtO8HJdJFUXlr1tux65UcoCt03yZsYdG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815890; c=relaxed/simple;
	bh=faWLxh+y1jl6Qg3y3L52IIYOczbWjGywgMwi3k2i34c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IVrnmQG5GRRsqoCkeJ6i9Ac59ggaWy87h2GhewT3abnA7euTwau0Voyojfnnf+zmQCJeItmNuGgRSEmnQsL8VaNCgkP8Dv7s2GhRp/PO/RDlEjIfIPGNW0nkTI0o9/5u0+0PpQ+KDatWlXCNrZqJGxcQan4o6b/W9B1F5JbiZow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZxoIdAg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZxoIdAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781815888; x=1813351888;
  h=date:from:to:cc:subject:message-id;
  bh=faWLxh+y1jl6Qg3y3L52IIYOczbWjGywgMwi3k2i34c=;
  b=MZxoIdAgD4dpH0MPXwmU1yfijt+btDej/1hAc//qU3Og5DZUFweuHQMs
   +Oewyd6vdP7Bb4VsWlK0CpY7j8KBZNmlyOKduBH8p+kRNAnjO7E4oDFz2
   y/TEQhwsqXhdRcvuioYxypNU+FAhw+i8Ypj2Q14IiXOt+vEX6P/FOL9MT
   XgeXYknUo9UiGHX29AUQ+x4Vzlu5wbSz7ERPcyXnoGAexUbejtf+7EYo1
   6BjKDm2hH8P945OmkI04ZcRCK77PbKtEgz0Awbkvx4/9mIP7jOeQIEDvX
   X8DY9wMEm8lyhMYMrl1IasCw71QZEEKDQPadT0kdUFzQPjwUFguXF5i2b
   A==;
X-CSE-ConnectionGUID: SdqU0yjCQn+6kblhX+PEGQ==
X-CSE-MsgGUID: 5iagGOzIR+ibl3ZQ3aEewg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="105468372"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="105468372"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 13:51:27 -0700
X-CSE-ConnectionGUID: y1VHSPHlQ064u0IbSUbtsw==
X-CSE-MsgGUID: DJKWNvTUSQ+xXCm6Hm7obg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="272528201"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2026 13:51:25 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waJhr-000000005al-0KLt;
	Thu, 18 Jun 2026 20:51:23 +0000
Date: Thu, 18 Jun 2026 22:50:57 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/dynamic_memslot_hashtable 7/7]
 include/linux/build_bug.h:80:41: error: static assertion failed:
 "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 +
 IS_ENABLED(CONFIG_KVM_SMM)))"
Message-ID: <202606182256.PUuH548U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/dynamic_memslot_hashtable
head:   e6c91f158091040c1e79a7dc9b8401235ae066b5
commit: e6c91f158091040c1e79a7dc9b8401235ae066b5 [7/7] KVM: Dynamically allocate memslot's id=>slot hash table
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260618/202606182256.PUuH548U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606182256.PUuH548U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606182256.PUuH548U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/x86.c:20:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   arch/x86/kvm/x86.h:63:1: note: in expansion of macro 'static_assert'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ^~~~~~~~~~~~~
--
   In file included from include/linux/init.h:5,
                    from arch/x86/include/asm/mem_encrypt.h:15,
                    from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/processor.h:5,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/../x86.h:63:1: note: in expansion of macro 'static_assert'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ^~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/nmi.h:8,
                    from arch/x86/include/asm/mshyperv.h:6,
                    from arch/x86/kvm/svm/hyperv.h:9,
                    from arch/x86/kvm/svm/hyperv.c:7:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   arch/x86/kvm/svm/../x86.h:63:1: note: in expansion of macro 'static_assert'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ^~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from x86.c:20:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   x86.h:63:1: note: in expansion of macro 'static_assert'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ^~~~~~~~~~~~~
--
   In file included from include/linux/init.h:5,
                    from arch/x86/include/asm/mem_encrypt.h:15,
                    from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/processor.h:5,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from vmx/vmx.c:17:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   vmx/../x86.h:63:1: note: in expansion of macro 'static_assert'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ^~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/nmi.h:8,
                    from arch/x86/include/asm/mshyperv.h:6,
                    from svm/hyperv.h:9,
                    from svm/hyperv.c:7:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SIZE_OF_MEMSLOTS_HASHTABLE == (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM)))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   svm/../x86.h:63:1: note: in expansion of macro 'static_assert'
      63 | static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
         | ^~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  61  
6bab69c65013be Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  63   * static_assert - check integer constant expression at build time
6ffd853b0b10e1 Randy Dunlap     2026-03-01  64   * @expr: expression to be checked
6bab69c65013be Rasmus Villemoes 2019-03-07  65   *
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  67   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  69   *
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  74   *
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  76   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  78   */
6bab69c65013be Rasmus Villemoes 2019-03-07  79  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @80  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  81  
07a368b3f55a79 Maxim Levitsky   2022-10-25  82  

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
