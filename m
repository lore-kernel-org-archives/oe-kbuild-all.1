Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1AC1E87A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705590985; cv=none; b=durJN6El381IHUkUmiQtKCigoncHYRK/I7tefBwuQAj454ve2Sk0baI6GZHvT6brPSQKScqbjvrWKJYVooTiY6uyWfELdoT7yV0mcoWA6zvMVimkRITeuQhQn8n0phZ6fm1iuij3sDo7o16Q8vvoA2NRm1VTwuY6rmsCpGEx12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705590985; c=relaxed/simple;
	bh=zQCAWPIBXcvi5W7DHFczbx3geZD7aX4k8W2qN9scRMU=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=vCrKit6XSa3DXpZO/AKFRYVkIVsu2HQHE0A9Uilq8JGKv0YvDLaZQoIoiIughW16vSC5+ONuIOr5N9v+liGibMFr5axx9TO/qCCLd6hCmtODy9QkP59wyWMKn0NwR0osGTmEsc+N8yPOfuXd91zcxM9j//Rg+UIMNfXBPnLRhc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmhuV6HE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmhuV6HE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705590983; x=1737126983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zQCAWPIBXcvi5W7DHFczbx3geZD7aX4k8W2qN9scRMU=;
  b=KmhuV6HEP5LhVaQ1Uaw+v3QP8VE0d8HNBH1eeUIworMSlSgwaDfAK3RN
   GdpSw5eQTiBo8N20PPjP0CAOeaLtdVAVLXLVcErTlYMpLfp4Mc3GvCHBg
   1ZOe4u4n2oOO/kjkG23kgt8G2qn15/czR2N8Oz8bQyw6+uxckkuQ0JU6R
   7e5kLywyFMzofy4XUERkjufQCi5dXXayQGC1+qCPh/VHxeN0tY87YVKKY
   lpVCXWvWxaIH/eZXX7GdbxpiTnf8R2ySmUl4r5nV4Sa3+bmAzuyIhU3E9
   hcHXNeU9gHXJ+jsnBqlyLC3sCbuBicc+ByQ5nWQmbXBwhMBGIXLyr6LkC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13988544"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="13988544"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 07:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="908059170"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="908059170"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2024 07:16:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQU7t-00034u-10;
	Thu, 18 Jan 2024 15:16:17 +0000
Date: Thu, 18 Jan 2024 23:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] mm/maps: read proc/pid/maps under RCU
Message-ID: <202401182318.Ov9XWMqs-lkp@intel.com>
References: <20240115183837.205694-4-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115183837.205694-4-surenb@google.com>

Hi Suren,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7 next-20240118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-make-vm_area_struct-anon_name-field-RCU-safe/20240116-024359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240115183837.205694-4-surenb%40google.com
patch subject: [RFC 3/3] mm/maps: read proc/pid/maps under RCU
config: i386-randconfig-011-20240118 (https://download.01.org/0day-ci/archive/20240118/202401182318.Ov9XWMqs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182318.Ov9XWMqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182318.Ov9XWMqs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:11,
                    from include/linux/preempt.h:12,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from fs/proc/task_mmu.c:2:
   fs/proc/task_mmu.c: In function 'm_start':
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   arch/x86/include/asm/barrier.h:72:17: note: in definition of macro '__smp_load_acquire'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                 ^
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:391:27: note: in definition of macro '__unqual_scalar_typeof'
     391 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagewalk.h:5,
                    from fs/proc/task_mmu.c:2:
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:9: note: in expansion of macro 'compiletime_assert'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:28: note: in expansion of macro '__native_word'
     438 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:73:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      73 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:9: note: in expansion of macro 'compiletime_assert'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:28: note: in expansion of macro '__native_word'
     438 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:73:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      73 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:9: note: in expansion of macro 'compiletime_assert'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:28: note: in expansion of macro '__native_word'
     438 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:73:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      73 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
>> fs/proc/task_mmu.c:190:63: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                               ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:9: note: in expansion of macro 'compiletime_assert'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:438:28: note: in expansion of macro '__native_word'
     438 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:73:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      73 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:190:37: note: in expansion of macro 'smp_load_acquire'
     190 |                 priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                     ^~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c: In function 'get_vma_fields':
>> fs/proc/task_mmu.c:387:18: error: 'struct vm_area_struct' has no member named 'anon_name'; did you mean 'anon_vma'?
     387 |         if (vma->anon_name) {
         |                  ^~~~~~~~~
         |                  anon_vma
   In file included from include/linux/list.h:11,
                    from include/linux/preempt.h:12,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from fs/proc/task_mmu.c:2:
   fs/proc/task_mmu.c: In function 'validate_map':
   fs/proc/task_mmu.c:437:57: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                         ^~
   arch/x86/include/asm/barrier.h:72:17: note: in definition of macro '__smp_load_acquire'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                 ^
   fs/proc/task_mmu.c:437:31: note: in expansion of macro 'smp_load_acquire'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                               ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
   fs/proc/task_mmu.c:437:57: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                         ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:437:31: note: in expansion of macro 'smp_load_acquire'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                               ^~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:437:57: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                         ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:437:31: note: in expansion of macro 'smp_load_acquire'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                               ^~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:437:57: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     437 |                 mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
         |                                                         ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   arch/x86/include/asm/barrier.h:72:28: note: in expansion of macro 'READ_ONCE'
      72 |         typeof(*p) ___p1 = READ_ONCE(*p);                               \
         |                            ^~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~


vim +190 fs/proc/task_mmu.c

   > 2	#include <linux/pagewalk.h>
     3	#include <linux/mm_inline.h>
     4	#include <linux/hugetlb.h>
     5	#include <linux/huge_mm.h>
     6	#include <linux/mount.h>
     7	#include <linux/ksm.h>
     8	#include <linux/seq_file.h>
     9	#include <linux/highmem.h>
    10	#include <linux/ptrace.h>
    11	#include <linux/slab.h>
    12	#include <linux/pagemap.h>
    13	#include <linux/mempolicy.h>
    14	#include <linux/rmap.h>
    15	#include <linux/swap.h>
    16	#include <linux/sched/mm.h>
    17	#include <linux/swapops.h>
    18	#include <linux/mmu_notifier.h>
    19	#include <linux/page_idle.h>
    20	#include <linux/shmem_fs.h>
    21	#include <linux/uaccess.h>
    22	#include <linux/pkeys.h>
    23	#include <linux/minmax.h>
    24	#include <linux/overflow.h>
    25	
    26	#include <asm/elf.h>
    27	#include <asm/tlb.h>
    28	#include <asm/tlbflush.h>
    29	#include "internal.h"
    30	
    31	#define SEQ_PUT_DEC(str, val) \
    32			seq_put_decimal_ull_width(m, str, (val) << (PAGE_SHIFT-10), 8)
    33	void task_mem(struct seq_file *m, struct mm_struct *mm)
    34	{
    35		unsigned long text, lib, swap, anon, file, shmem;
    36		unsigned long hiwater_vm, total_vm, hiwater_rss, total_rss;
    37	
    38		anon = get_mm_counter(mm, MM_ANONPAGES);
    39		file = get_mm_counter(mm, MM_FILEPAGES);
    40		shmem = get_mm_counter(mm, MM_SHMEMPAGES);
    41	
    42		/*
    43		 * Note: to minimize their overhead, mm maintains hiwater_vm and
    44		 * hiwater_rss only when about to *lower* total_vm or rss.  Any
    45		 * collector of these hiwater stats must therefore get total_vm
    46		 * and rss too, which will usually be the higher.  Barriers? not
    47		 * worth the effort, such snapshots can always be inconsistent.
    48		 */
    49		hiwater_vm = total_vm = mm->total_vm;
    50		if (hiwater_vm < mm->hiwater_vm)
    51			hiwater_vm = mm->hiwater_vm;
    52		hiwater_rss = total_rss = anon + file + shmem;
    53		if (hiwater_rss < mm->hiwater_rss)
    54			hiwater_rss = mm->hiwater_rss;
    55	
    56		/* split executable areas between text and lib */
    57		text = PAGE_ALIGN(mm->end_code) - (mm->start_code & PAGE_MASK);
    58		text = min(text, mm->exec_vm << PAGE_SHIFT);
    59		lib = (mm->exec_vm << PAGE_SHIFT) - text;
    60	
    61		swap = get_mm_counter(mm, MM_SWAPENTS);
    62		SEQ_PUT_DEC("VmPeak:\t", hiwater_vm);
    63		SEQ_PUT_DEC(" kB\nVmSize:\t", total_vm);
    64		SEQ_PUT_DEC(" kB\nVmLck:\t", mm->locked_vm);
    65		SEQ_PUT_DEC(" kB\nVmPin:\t", atomic64_read(&mm->pinned_vm));
    66		SEQ_PUT_DEC(" kB\nVmHWM:\t", hiwater_rss);
    67		SEQ_PUT_DEC(" kB\nVmRSS:\t", total_rss);
    68		SEQ_PUT_DEC(" kB\nRssAnon:\t", anon);
    69		SEQ_PUT_DEC(" kB\nRssFile:\t", file);
    70		SEQ_PUT_DEC(" kB\nRssShmem:\t", shmem);
    71		SEQ_PUT_DEC(" kB\nVmData:\t", mm->data_vm);
    72		SEQ_PUT_DEC(" kB\nVmStk:\t", mm->stack_vm);
    73		seq_put_decimal_ull_width(m,
    74			    " kB\nVmExe:\t", text >> 10, 8);
    75		seq_put_decimal_ull_width(m,
    76			    " kB\nVmLib:\t", lib >> 10, 8);
    77		seq_put_decimal_ull_width(m,
    78			    " kB\nVmPTE:\t", mm_pgtables_bytes(mm) >> 10, 8);
    79		SEQ_PUT_DEC(" kB\nVmSwap:\t", swap);
    80		seq_puts(m, " kB\n");
    81		hugetlb_report_usage(m, mm);
    82	}
    83	#undef SEQ_PUT_DEC
    84	
    85	unsigned long task_vsize(struct mm_struct *mm)
    86	{
    87		return PAGE_SIZE * mm->total_vm;
    88	}
    89	
    90	unsigned long task_statm(struct mm_struct *mm,
    91				 unsigned long *shared, unsigned long *text,
    92				 unsigned long *data, unsigned long *resident)
    93	{
    94		*shared = get_mm_counter(mm, MM_FILEPAGES) +
    95				get_mm_counter(mm, MM_SHMEMPAGES);
    96		*text = (PAGE_ALIGN(mm->end_code) - (mm->start_code & PAGE_MASK))
    97									>> PAGE_SHIFT;
    98		*data = mm->data_vm + mm->stack_vm;
    99		*resident = *shared + get_mm_counter(mm, MM_ANONPAGES);
   100		return mm->total_vm;
   101	}
   102	
   103	#ifdef CONFIG_NUMA
   104	/*
   105	 * Save get_task_policy() for show_numa_map().
   106	 */
   107	static void hold_task_mempolicy(struct proc_maps_private *priv)
   108	{
   109		struct task_struct *task = priv->task;
   110	
   111		task_lock(task);
   112		priv->task_mempolicy = get_task_policy(task);
   113		mpol_get(priv->task_mempolicy);
   114		task_unlock(task);
   115	}
   116	static void release_task_mempolicy(struct proc_maps_private *priv)
   117	{
   118		mpol_put(priv->task_mempolicy);
   119	}
   120	#else
   121	static void hold_task_mempolicy(struct proc_maps_private *priv)
   122	{
   123	}
   124	static void release_task_mempolicy(struct proc_maps_private *priv)
   125	{
   126	}
   127	#endif
   128	
   129	static struct vm_area_struct *proc_get_vma(struct proc_maps_private *priv,
   130							loff_t *ppos)
   131	{
   132		struct vm_area_struct *vma = vma_next(&priv->iter);
   133	
   134		if (vma) {
   135			*ppos = vma->vm_start;
   136		} else {
   137			*ppos = -2UL;
   138			vma = get_gate_vma(priv->mm);
   139		}
   140	
   141		return vma;
   142	}
   143	
   144	static const struct seq_operations proc_pid_maps_op;
   145	
   146	static inline bool needs_mmap_lock(struct seq_file *m)
   147	{
   148	#ifdef CONFIG_PER_VMA_LOCK
   149		/*
   150		 * smaps and numa_maps perform page table walk, therefore require
   151		 * mmap_lock but maps can be read under RCU.
   152		 */
   153		return m->op != &proc_pid_maps_op;
   154	#else
   155		/* Without per-vma locks VMA access is not RCU-safe */
   156		return true;
   157	#endif
   158	}
   159	
   160	static void *m_start(struct seq_file *m, loff_t *ppos)
   161	{
   162		struct proc_maps_private *priv = m->private;
   163		unsigned long last_addr = *ppos;
   164		struct mm_struct *mm;
   165	
   166		/* See m_next(). Zero at the start or after lseek. */
   167		if (last_addr == -1UL)
   168			return NULL;
   169	
   170		priv->task = get_proc_task(priv->inode);
   171		if (!priv->task)
   172			return ERR_PTR(-ESRCH);
   173	
   174		mm = priv->mm;
   175		if (!mm || !mmget_not_zero(mm)) {
   176			put_task_struct(priv->task);
   177			priv->task = NULL;
   178			return NULL;
   179		}
   180	
   181		if (needs_mmap_lock(m)) {
   182			if (mmap_read_lock_killable(mm)) {
   183				mmput(mm);
   184				put_task_struct(priv->task);
   185				priv->task = NULL;
   186				return ERR_PTR(-EINTR);
   187			}
   188		} else {
   189			/* For memory barrier see the comment for mm_lock_seq in mm_struct */
 > 190			priv->mm_lock_seq = smp_load_acquire(&priv->mm->mm_lock_seq);
   191			rcu_read_lock();
   192		}
   193	
   194		vma_iter_init(&priv->iter, mm, last_addr);
   195		hold_task_mempolicy(priv);
   196		if (last_addr == -2UL)
   197			return get_gate_vma(mm);
   198	
   199		return proc_get_vma(priv, ppos);
   200	}
   201	
   202	static void *m_next(struct seq_file *m, void *v, loff_t *ppos)
   203	{
   204		if (*ppos == -2UL) {
   205			*ppos = -1UL;
   206			return NULL;
   207		}
   208		return proc_get_vma(m->private, ppos);
   209	}
   210	
   211	static void m_stop(struct seq_file *m, void *v)
   212	{
   213		struct proc_maps_private *priv = m->private;
   214		struct mm_struct *mm = priv->mm;
   215	
   216		if (!priv->task)
   217			return;
   218	
   219		release_task_mempolicy(priv);
   220		if (needs_mmap_lock(m))
   221			mmap_read_unlock(mm);
   222		else
   223			rcu_read_unlock();
   224		mmput(mm);
   225		put_task_struct(priv->task);
   226		priv->task = NULL;
   227	}
   228	
   229	static int proc_maps_open(struct inode *inode, struct file *file,
   230				const struct seq_operations *ops, int psize)
   231	{
   232		struct proc_maps_private *priv = __seq_open_private(file, ops, psize);
   233	
   234		if (!priv)
   235			return -ENOMEM;
   236	
   237		priv->inode = inode;
   238		priv->mm = proc_mem_open(inode, PTRACE_MODE_READ);
   239		if (IS_ERR(priv->mm)) {
   240			int err = PTR_ERR(priv->mm);
   241	
   242			seq_release_private(inode, file);
   243			return err;
   244		}
   245	
   246		return 0;
   247	}
   248	
   249	static int proc_map_release(struct inode *inode, struct file *file)
   250	{
   251		struct seq_file *seq = file->private_data;
   252		struct proc_maps_private *priv = seq->private;
   253	
   254		if (priv->mm)
   255			mmdrop(priv->mm);
   256	
   257		return seq_release_private(inode, file);
   258	}
   259	
   260	static int do_maps_open(struct inode *inode, struct file *file,
   261				const struct seq_operations *ops)
   262	{
   263		return proc_maps_open(inode, file, ops,
   264					sizeof(struct proc_maps_private));
   265	}
   266	
   267	static void show_vma_header_prefix(struct seq_file *m,
   268					   unsigned long start, unsigned long end,
   269					   vm_flags_t flags, unsigned long long pgoff,
   270					   dev_t dev, unsigned long ino)
   271	{
   272		seq_setwidth(m, 25 + sizeof(void *) * 6 - 1);
   273		seq_put_hex_ll(m, NULL, start, 8);
   274		seq_put_hex_ll(m, "-", end, 8);
   275		seq_putc(m, ' ');
   276		seq_putc(m, flags & VM_READ ? 'r' : '-');
   277		seq_putc(m, flags & VM_WRITE ? 'w' : '-');
   278		seq_putc(m, flags & VM_EXEC ? 'x' : '-');
   279		seq_putc(m, flags & VM_MAYSHARE ? 's' : 'p');
   280		seq_put_hex_ll(m, " ", pgoff, 8);
   281		seq_put_hex_ll(m, " ", MAJOR(dev), 2);
   282		seq_put_hex_ll(m, ":", MINOR(dev), 2);
   283		seq_put_decimal_ull(m, " ", ino);
   284		seq_putc(m, ' ');
   285	}
   286	
   287	static void
   288	show_map_vma(struct seq_file *m, struct vm_area_struct *vma)
   289	{
   290		struct anon_vma_name *anon_name = NULL;
   291		struct mm_struct *mm = vma->vm_mm;
   292		struct file *file = vma->vm_file;
   293		vm_flags_t flags = vma->vm_flags;
   294		unsigned long ino = 0;
   295		unsigned long long pgoff = 0;
   296		unsigned long start, end;
   297		dev_t dev = 0;
   298		const char *name = NULL;
   299	
   300		if (file) {
   301			const struct inode *inode = file_user_inode(vma->vm_file);
   302	
   303			dev = inode->i_sb->s_dev;
   304			ino = inode->i_ino;
   305			pgoff = ((loff_t)vma->vm_pgoff) << PAGE_SHIFT;
   306		}
   307	
   308		start = vma->vm_start;
   309		end = vma->vm_end;
   310		show_vma_header_prefix(m, start, end, flags, pgoff, dev, ino);
   311		if (mm) {
   312			anon_name = needs_mmap_lock(m) ? anon_vma_name(vma) :
   313					anon_vma_name_get_rcu(vma);
   314		}
   315	
   316		/*
   317		 * Print the dentry name for named mappings, and a
   318		 * special [heap] marker for the heap:
   319		 */
   320		if (file) {
   321			seq_pad(m, ' ');
   322			/*
   323			 * If user named this anon shared memory via
   324			 * prctl(PR_SET_VMA ..., use the provided name.
   325			 */
   326			if (anon_name)
   327				seq_printf(m, "[anon_shmem:%s]", anon_name->name);
   328			else
   329				seq_path(m, file_user_path(file), "\n");
   330			goto done;
   331		}
   332	
   333		if (vma->vm_ops && vma->vm_ops->name) {
   334			name = vma->vm_ops->name(vma);
   335			if (name)
   336				goto done;
   337		}
   338	
   339		name = arch_vma_name(vma);
   340		if (!name) {
   341			if (!mm) {
   342				name = "[vdso]";
   343				goto done;
   344			}
   345	
   346			if (vma_is_initial_heap(vma)) {
   347				name = "[heap]";
   348				goto done;
   349			}
   350	
   351			if (vma_is_initial_stack(vma)) {
   352				name = "[stack]";
   353				goto done;
   354			}
   355	
   356			if (anon_name) {
   357				seq_pad(m, ' ');
   358				seq_printf(m, "[anon:%s]", anon_name->name);
   359			}
   360		}
   361	
   362	done:
   363		if (name) {
   364			seq_pad(m, ' ');
   365			seq_puts(m, name);
   366		}
   367		seq_putc(m, '\n');
   368		if (anon_name && !needs_mmap_lock(m))
   369			anon_vma_name_put(anon_name);
   370	}
   371	
   372	/*
   373	 * Pin vm_area_struct fields used by show_map_vma. We also copy pinned fields
   374	 * into proc_maps_private because by the time put_vma_fields() is called, VMA
   375	 * might have changed and these fields might be pointing to different objects.
   376	 */
   377	static bool get_vma_fields(struct vm_area_struct *vma, struct proc_maps_private *priv)
   378	{
   379		if (vma->vm_file) {
   380			priv->vm_file =  get_file_rcu(&vma->vm_file);
   381			if (!priv->vm_file)
   382				return false;
   383	
   384		} else
   385			priv->vm_file = NULL;
   386	
 > 387		if (vma->anon_name) {
   388			priv->anon_name = anon_vma_name_get_rcu(vma);
   389			if (!priv->anon_name) {
   390				if (priv->vm_file) {
   391					fput(priv->vm_file);
   392					return false;
   393				}
   394			}
   395		} else
   396			priv->anon_name = NULL;
   397	
   398		return true;
   399	}
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
