Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBEA33993
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124312; cv=none; b=lSY53zX593C/0UH6FCkASxnWDtAzEpbfM7adQIMfFuXO4IBww+jVjxQV1dqFW8s0+BVZOnxdon/616fIjJ5CwAidUNSRT2Bhjg3P91m9YlWjO/KAsaaZI8lqgNzPnsfmcZxikKvMi7HUm+B02ghd+eogErY0IGPiiNFM6RkpGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124312; c=relaxed/simple;
	bh=+Gd2TZrB8ncygcKn8cHYoPKrcpyXdOFaqMrK6nQ4mBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA7l7chWYJYTK2YT4qGNwaaUEY4X6iar88GCc5kQVJUW7ETSGxvuy8uwTq2j6vP0H93r6sZ1royJU9FTCl01p2cGjNqJ6tCNv0HPgEUA6nNaEQl72QyA52+PDUcNRcHkgPOZpAYHGEzoaWHxL50LX5phT8L4pyRqBYwFzeSy53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkjQ6yPa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkjQ6yPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124309; x=1781660309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Gd2TZrB8ncygcKn8cHYoPKrcpyXdOFaqMrK6nQ4mBg=;
  b=EkjQ6yPa638zRfLdwrNW/pKeeX7ljP6SDE79ou2wTNHT4mNHGU9K8YeK
   OSr/TosOvci9RTg4TuQvuBj9dWbGYg7S1SKaHUKYkZ9oP5EU/k/ehNDD3
   XRw4ljwPy61xHpfi9A4sreijzXkg7u3BIOIFRBtqVHQD0G9ZVD7Dn30lR
   oUhQYD5L5ocUxqooS4LxY2/p9EzNQ2Zkz8JcKjF7qsc98aEMhuhuo6Au8
   oWFDhf2WUNepNLWPWwj/f27zxBx09QWzIG3FFSfcvW/S1llHOhd1gwOOh
   6WFwLtTWz//BfsEq3xqNtsbrLBSBnTXSL2HgYOF+a/BXNDCkPFvSFh20h
   Q==;
X-CSE-ConnectionGUID: LUrtEqNaRIuL0ljFWJdRYg==
X-CSE-MsgGUID: SEX7euKpQPWqJ5L0tLydIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556344"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556344"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:38:28 -0700
X-CSE-ConnectionGUID: Kk45KLVmRMaHaWVtoTOalg==
X-CSE-MsgGUID: KTuxp+EZS5S2LEUfGFoh+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989099"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2025 18:38:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRLHM-000FUC-1Q;
	Tue, 17 Jun 2025 01:38:24 +0000
Date: Tue, 17 Jun 2025 09:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/4] mm: kmigrated - Async kernel migration thread
Message-ID: <202506170912.SiVSef87-lkp@intel.com>
References: <20250616133931.206626-4-bharata@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616133931.206626-4-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.16-rc2 next-20250616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250616-214331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250616133931.206626-4-bharata%40amd.com
patch subject: [RFC PATCH v1 3/4] mm: kmigrated - Async kernel migration thread
config: x86_64-buildonly-randconfig-005-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170912.SiVSef87-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170912.SiVSef87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170912.SiVSef87-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   mm/kmigrated.c: In function 'page_ext_xchg_nid':
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/linux/compiler_types.h:518:27: note: in definition of macro '__unqual_scalar_typeof'
     518 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/kmigrated.c:13:
>> mm/kmigrated.c:26:39: error: invalid use of undefined type 'struct page_ext'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                                       ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/kmigrated.c:26:21: note: in expansion of macro 'READ_ONCE'
      26 |         old_flags = READ_ONCE(page_ext->flags);
         |                     ^~~~~~~~~
>> mm/kmigrated.c:29:37: error: 'PAGE_EXT_MIG_NID_SHIFT' undeclared (first use in this function)
      29 |                 old_nid = (flags >> PAGE_EXT_MIG_NID_SHIFT) & PAGE_EXT_MIG_NID_MASK;
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:29:37: note: each undeclared identifier is reported only once for each function it appears in
>> mm/kmigrated.c:29:63: error: 'PAGE_EXT_MIG_NID_MASK' undeclared (first use in this function)
      29 |                 old_nid = (flags >> PAGE_EXT_MIG_NID_SHIFT) & PAGE_EXT_MIG_NID_MASK;
         |                                                               ^~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:33:49: error: invalid use of undefined type 'struct page_ext'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                                                 ^~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   mm/kmigrated.c:33:49: error: invalid use of undefined type 'struct page_ext'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                                                 ^~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4878:55: error: invalid type argument of unary '*' (have 'int')
    4878 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4878:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4878 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/x86/include/asm/bitops.h:429,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   arch/x86/include/asm/cmpxchg.h:161:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     161 |         __typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);              \
         |                                 ^
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:162:20: error: invalid type argument of unary '*' (have 'int')
     162 |         __typeof__(*(_ptr)) __old = *_old;                              \
         |                    ^~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:162:37: error: invalid type argument of unary '*' (have 'int')
     162 |         __typeof__(*(_ptr)) __old = *_old;                              \
         |                                     ^~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:163:20: error: invalid type argument of unary '*' (have 'int')
     163 |         __typeof__(*(_ptr)) __new = (_new);                             \
         |                    ^~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:52: error: invalid type argument of unary '*' (have 'int')
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |                                                    ^~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
>> arch/x86/include/asm/cmpxchg.h:167:38: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     167 |                 volatile u8 *__ptr = (volatile u8 *)(_ptr);             \
         |                                      ^
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:179:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     179 |                 volatile u16 *__ptr = (volatile u16 *)(_ptr);           \
         |                                       ^
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:191:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     191 |                 volatile u32 *__ptr = (volatile u32 *)(_ptr);           \
         |                                       ^
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:203:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     203 |                 volatile u64 *__ptr = (volatile u64 *)(_ptr);           \
         |                                       ^
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:217:17: error: invalid type argument of unary '*' (have 'int')
     217 |                 *_old = __old;                                          \
         |                 ^~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   mm/kmigrated.c:33:49: error: invalid use of undefined type 'struct page_ext'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                                                 ^~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   mm/kmigrated.c:33:49: error: invalid use of undefined type 'struct page_ext'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                                                 ^~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4878:55: error: invalid type argument of unary '*' (have 'int')
    4878 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4878:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4878 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   arch/x86/include/asm/cmpxchg.h:161:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     161 |         __typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);              \
         |                                 ^
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:162:20: error: invalid type argument of unary '*' (have 'int')
     162 |         __typeof__(*(_ptr)) __old = *_old;                              \
         |                    ^~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:162:37: error: invalid type argument of unary '*' (have 'int')
     162 |         __typeof__(*(_ptr)) __old = *_old;                              \
         |                                     ^~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:163:20: error: invalid type argument of unary '*' (have 'int')
     163 |         __typeof__(*(_ptr)) __new = (_new);                             \
         |                    ^~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:52: error: invalid type argument of unary '*' (have 'int')
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |                                                    ^~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
>> arch/x86/include/asm/cmpxchg.h:167:38: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     167 |                 volatile u8 *__ptr = (volatile u8 *)(_ptr);             \
         |                                      ^
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:179:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     179 |                 volatile u16 *__ptr = (volatile u16 *)(_ptr);           \
         |                                       ^
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:191:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     191 |                 volatile u32 *__ptr = (volatile u32 *)(_ptr);           \
         |                                       ^
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:203:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     203 |                 volatile u64 *__ptr = (volatile u64 *)(_ptr);           \
         |                                       ^
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:217:17: error: invalid type argument of unary '*' (have 'int')
     217 |                 *_old = __old;                                          \
         |                 ^~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/kmigrated.c:33:18: note: in expansion of macro 'unlikely'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                  ^~~~~~~~
   arch/x86/include/asm/cmpxchg.h:222:9: note: in expansion of macro '__raw_try_cmpxchg'
     222 |         __raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:231:9: note: in expansion of macro '__try_cmpxchg'
     231 |         __try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
         |         ^~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:184:25: note: in expansion of macro 'arch_try_cmpxchg'
     184 | #define raw_try_cmpxchg arch_try_cmpxchg
         |                         ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   mm/kmigrated.c:33:28: note: in expansion of macro 'try_cmpxchg'
      33 |         } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
         |                            ^~~~~~~~~~~
   mm/kmigrated.c: In function 'kmigrated_add_pfn':
>> mm/kmigrated.c:61:26: error: 'PAGE_EXT_MIGRATE_READY' undeclared (first use in this function)
      61 |         test_and_set_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags);
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:61:59: error: invalid use of undefined type 'struct page_ext'
      61 |         test_and_set_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags);
         |                                                           ^~
   mm/kmigrated.c: In function 'kmigrated_get_nid':
   mm/kmigrated.c:83:33: error: 'PAGE_EXT_MIGRATE_READY' undeclared (first use in this function)
      83 |         if (!test_and_clear_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   mm/kmigrated.c:83:66: error: invalid use of undefined type 'struct page_ext'
      83 |         if (!test_and_clear_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags))
         |                                                                  ^~


vim +26 mm/kmigrated.c

    20	
    21	static int page_ext_xchg_nid(struct page_ext *page_ext, int nid)
    22	{
    23		unsigned long old_flags, flags;
    24		int old_nid;
    25	
  > 26		old_flags = READ_ONCE(page_ext->flags);
    27		do {
    28			flags = old_flags;
  > 29			old_nid = (flags >> PAGE_EXT_MIG_NID_SHIFT) & PAGE_EXT_MIG_NID_MASK;
    30	
    31			flags &= ~(PAGE_EXT_MIG_NID_MASK << PAGE_EXT_MIG_NID_SHIFT);
    32			flags |= (nid & PAGE_EXT_MIG_NID_MASK) << PAGE_EXT_MIG_NID_SHIFT;
    33		} while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
    34	
    35		return old_nid;
    36	}
    37	
    38	/*
    39	 * Marks the page as ready for migration.
    40	 *
    41	 * @pfn: PFN of the page
    42	 * @nid: Target NID to were the page needs to be migrated
    43	 *
    44	 * The request for migration is noted by setting PAGE_EXT_MIGRATE_READY
    45	 * in the extended page flags which the kmigrated thread would check.
    46	 */
    47	int kmigrated_add_pfn(unsigned long pfn, int nid)
    48	{
    49		struct page *page;
    50		struct page_ext *page_ext;
    51	
    52		page = pfn_to_page(pfn);
    53		if (!page)
    54			return -EINVAL;
    55	
    56		page_ext = page_ext_get(page);
    57		if (unlikely(!page_ext))
    58			return -EINVAL;
    59	
    60		page_ext_xchg_nid(page_ext, nid);
  > 61		test_and_set_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags);
    62		page_ext_put(page_ext);
    63	
    64		set_bit(PGDAT_KMIGRATED_ACTIVATE, &page_pgdat(page)->flags);
    65		return 0;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
