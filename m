Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36C15CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711782210; cv=none; b=Dbt8h2eiZbh84y+Nz49sHv/KO1srO7vuPaIfjqJKOL9MA417FwU1RI4WCLDge3xck2kWgP0FzZOQIdbORZuSZH6wzjZkMeZO1mMXs4E4vtzAWy7gMb1LQZrZEJs4uL6TW1FyigkVtL6Nydp9gE7k6HVyIacgrrJjMQdQXS3Mtdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711782210; c=relaxed/simple;
	bh=KNrdsOU0nmneDV2bkdr+i4+T8SdUK+LH1ndjbgpwlj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDVMpCXgXW+wTbLapOlGP7a7XIphZ8TmRoM5JXeE5NVW2LUIA1A4wdRKOmSisarZTHP9n2IrzDxpC0ACji86Lnqm6e8nSJiheJTvd9gTAZQfVqGjVQnQK6895KJhq2v2VH7ExQWYUviCxiSjylZw3dlEGryQm9jlCFe7iSVHSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0rJD+t0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0rJD+t0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711782208; x=1743318208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNrdsOU0nmneDV2bkdr+i4+T8SdUK+LH1ndjbgpwlj0=;
  b=b0rJD+t04XS1kHNnxar9TGeSo++ByiPnmIKKB9kIeQNgWYWoqDad0SHv
   hixa9oQ5akxZaD37rgxWER9mdiqvX66Yq3Si826X/U6Zf/+KQ9Z5TA9rO
   JJOt+7/84kzv5zfvbwTjnT551OQgXDV/97EJe5l1YNsV56YrbNIsYiZQH
   SWHYY+SS00Mv+74M3ZHXjnXOgTCxaqNmIkNYUupHdGGmWLxz1L+JFQRut
   /g8jeIY1Gyy5DMhOAh4e11QxSN0W++LZrjAnkcqiJqBVgJQjFEOMPKhdu
   rwUfstzPZgTdX0zwBMyTNXDA/9N2vzLnaqFe9kgqZDhuI6Jinw1aLUvzJ
   w==;
X-CSE-ConnectionGUID: uRYAsT8GT/CPUDhDACqF+g==
X-CSE-MsgGUID: k0512ho3RDCynKdGqSlyRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="24427388"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="24427388"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 00:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="48138263"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2024 00:03:23 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqSkK-000426-2t;
	Sat, 30 Mar 2024 07:03:20 +0000
Date: Sat, 30 Mar 2024 15:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanchu Xie <yuanchu@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 6/8] mm: add per-memcg reaccess histogram
Message-ID: <202403301406.KKtUbhYi-lkp@intel.com>
References: <20240327213108.2384666-7-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327213108.2384666-7-yuanchu@google.com>

Hi Yuanchu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.8]
[cannot apply to akpm-mm/mm-everything driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanchu-Xie/mm-multi-gen-LRU-ignore-non-leaf-pmd_young-for-force_scan-true/20240328-053344
base:   v6.8
patch link:    https://lore.kernel.org/r/20240327213108.2384666-7-yuanchu%40google.com
patch subject: [RFC PATCH v3 6/8] mm: add per-memcg reaccess histogram
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240330/202403301406.KKtUbhYi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301406.KKtUbhYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301406.KKtUbhYi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rcupdate.h:258,
                    from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/rcutiny.h:131:9: error: expected identifier or '(' before 'do'
     131 |         do { \
         |         ^~
   include/linux/rcutree.h:21:6: note: in expansion of macro 'rcu_note_context_switch'
      21 | void rcu_note_context_switch(bool preempt);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:134:11: error: expected identifier or '(' before 'while'
     134 |         } while (0)
         |           ^~~~~
   include/linux/rcutree.h:21:6: note: in expansion of macro 'rcu_note_context_switch'
      21 | void rcu_note_context_switch(bool preempt);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/workingset_report.h:7,
                    from include/linux/mmzone.h:27:
   include/linux/rcutree.h:31:20: error: redefinition of 'rcu_virt_note_context_switch'
      31 | static inline void rcu_virt_note_context_switch(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:147:20: note: previous definition of 'rcu_virt_note_context_switch' with type 'void(void)'
     147 | static inline void rcu_virt_note_context_switch(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/rcutree.h: In function 'rcu_virt_note_context_switch':
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/linux/compiler_types.h:398:27: note: in definition of macro '__unqual_scalar_typeof'
     398 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./arch/sh/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
>> include/linux/rcupdate.h:164:48: error: invalid use of undefined type 'struct task_struct'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                                ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:164:35: note: in expansion of macro 'READ_ONCE'
     164 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:165:39: error: invalid use of undefined type 'struct task_struct'
     165 |                         WRITE_ONCE((t)->rcu_tasks_holdout, false);      \
         |                                       ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:165:25: note: in expansion of macro 'WRITE_ONCE'
     165 |                         WRITE_ONCE((t)->rcu_tasks_holdout, false);      \
         |                         ^~~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:165:39: error: invalid use of undefined type 'struct task_struct'
     165 |                         WRITE_ONCE((t)->rcu_tasks_holdout, false);      \
         |                                       ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:165:25: note: in expansion of macro 'WRITE_ONCE'
     165 |                         WRITE_ONCE((t)->rcu_tasks_holdout, false);      \
         |                         ^~~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcutiny.h:133:17: note: in expansion of macro 'rcu_tasks_qs'
     133 |                 rcu_tasks_qs(current, (preempt)); \
         |                 ^~~~~~~~~~~~
   include/linux/rcutree.h:33:9: note: in expansion of macro 'rcu_note_context_switch'
      33 |         rcu_note_context_switch(false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:165:39: error: invalid use of undefined type 'struct task_struct'
     165 |                         WRITE_ONCE((t)->rcu_tasks_holdout, false);      \
         |                                       ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:165:25: note: in expansion of macro 'WRITE_ONCE'
     165 |                         WRITE_ONCE((t)->rcu_tasks_holdout, false);      \
         |                         ^~~~~~~~~~
   include/linux/rcupdate.h:201:9: note: in expansion of macro 'rcu_tasks_classic_qs'
     201 |         rcu_tasks_classic_qs((t), (preempt));                           \


vim +164 include/linux/rcupdate.h

43766c3eadcf60 Paul E. McKenney 2020-03-16  160  
43766c3eadcf60 Paul E. McKenney 2020-03-16  161  # ifdef CONFIG_TASKS_RCU
43766c3eadcf60 Paul E. McKenney 2020-03-16  162  # define rcu_tasks_classic_qs(t, preempt)				\
8315f42295d266 Paul E. McKenney 2014-06-27  163  	do {								\
43766c3eadcf60 Paul E. McKenney 2020-03-16 @164  		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
7d0ae8086b8283 Paul E. McKenney 2015-03-03  165  			WRITE_ONCE((t)->rcu_tasks_holdout, false);	\
8315f42295d266 Paul E. McKenney 2014-06-27  166  	} while (0)
7e42776d5ed1fe Paul E. McKenney 2017-05-25  167  void call_rcu_tasks(struct rcu_head *head, rcu_callback_t func);
7e42776d5ed1fe Paul E. McKenney 2017-05-25  168  void synchronize_rcu_tasks(void);
43766c3eadcf60 Paul E. McKenney 2020-03-16  169  # else
43766c3eadcf60 Paul E. McKenney 2020-03-16  170  # define rcu_tasks_classic_qs(t, preempt) do { } while (0)
43766c3eadcf60 Paul E. McKenney 2020-03-16  171  # define call_rcu_tasks call_rcu
43766c3eadcf60 Paul E. McKenney 2020-03-16  172  # define synchronize_rcu_tasks synchronize_rcu
43766c3eadcf60 Paul E. McKenney 2020-03-16  173  # endif
43766c3eadcf60 Paul E. McKenney 2020-03-16  174  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
