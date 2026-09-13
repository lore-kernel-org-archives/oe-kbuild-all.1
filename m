Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4C3CAA3F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285057; cv=none; b=iW+PqFEtGufMcyK/CugEuLQgSxmiH33ZLn1PPZ7DUi9g0o1grk00IMxxRk3NCjMUzdA5oy+h8cRzWh0vmbzZxQqTbkiQTgvp1dE4H51mlzHhWvH2UkxXjURGXWYnaDwLjGtOrR00mpWIYkEF8q9LYolOntD5Y8D/bd/J8HvFDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285057; c=relaxed/simple;
	bh=P5axd2vBj7lh7LaHNMeUP661naW995TDg336PocPkec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZnBHOPkern39+bhVnxXyAhD6dLejpPLq9dFWmwQkS8xcVCL5U9JQv10f5W1vqstRArXYMOW8QztmVAqVM+o53K91IjF6JWUfQJLw8mKGoF/3R0U4xgVoqF5nNFmwOBhG+wKXlsf3N59JTC4w66Fwn6QNWqFPr2t8eh2aVpbw9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A939b1WN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A939b1WN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789285055; x=1820821055;
  h=date:from:to:cc:subject:message-id;
  bh=P5axd2vBj7lh7LaHNMeUP661naW995TDg336PocPkec=;
  b=A939b1WNBvDnT5a1BsspwSH9Ke9rVtdTwUswJAkeKAnG5UYpTudnkXqw
   g+X0asSyPPlviKVBHa/xkXVFZSyz3G9zIlPyJb9gyJX4N5jKGw1NerWCd
   xWq8mECe/qtzJ/X+IDhRb5TNUYHi+gR92DRpfv5Wl7iNsUQ8wVC2RGbFS
   J2qwBqNcmve4awlxyRPcYgky8Yg7wYzzXwMkBIlEQFm5BfQ0mBlnpSpSF
   WPPFPpR5qTJaZPMHsbyyBHnpKsgi//P9FWQwl9Z/MhE7q2DRVekwld42p
   pyGgsPu/6lE+0tioGGT8OgQtkGEcXl1WwR7ELrMYAxzIx2/0KdaKTIdpr
   A==;
X-CSE-ConnectionGUID: W6fJcCeXQQmWfBJQPROcAA==
X-CSE-MsgGUID: JZY1xlCbT/+TAOuhLbR2Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="112452428"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="112452428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 00:37:34 -0700
X-CSE-ConnectionGUID: KJ0o7fjwTgOzesrEqP42Dg==
X-CSE-MsgGUID: mTZzdlclQS2Z5np5/W0Mhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="271853370"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2026 00:37:33 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5el5-000000003hp-0LxZ;
	Sun, 13 Sep 2026 07:36:33 +0000
Date: Sun, 13 Sep 2026 15:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/uaccess_bad_mm 2/9]
 arch/powerpc/kvm/powerpc.c:774:30: error: 'memslot' undeclared; did you mean
 'memset'?
Message-ID: <202609131550.9LgiOEdZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/uaccess_bad_mm
head:   5e20baf271c570712cb8efe0d9400725d6c04386
commit: 12159515b6f2a33c1cdf0cd58802d5e03036ff02 [2/9] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20260913/202609131550.9LgiOEdZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131550.9LgiOEdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131550.9LgiOEdZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:33,
                    from arch/powerpc/kvm/powerpc.c:12:
   arch/powerpc/kvm/powerpc.c: In function 'kvm_arch_flush_shadow_all':
>> arch/powerpc/kvm/powerpc.c:774:30: error: 'memslot' undeclared (first use in this function); did you mean 'memset'?
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |                              ^~~~~~~
   include/linux/hashtable.h:127:25: note: in definition of macro 'hash_for_each'
     127 |         for ((bkt) = 0, obj = NULL; obj == NULL && (bkt) < HASH_SIZE(name);\
         |                         ^~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/powerpc.c:774:30: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/hashtable.h:127:25: note: in definition of macro 'hash_for_each'
     127 |         for ((bkt) = 0, obj = NULL; obj == NULL && (bkt) < HASH_SIZE(name);\
         |                         ^~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/mmu.h:142,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5:
   include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1199:40: note: in expansion of macro 'container_of'
    1199 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1210:22: note: in expansion of macro 'hlist_entry'
    1210 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1220:20: note: in expansion of macro 'hlist_entry_safe'
    1220 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^~~~~~~~~~~~~~~~
   include/linux/hashtable.h:129:17: note: in expansion of macro 'hlist_for_each_entry'
     129 |                 hlist_for_each_entry(obj, &name[bkt], member)
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1117:9: note: in expansion of macro 'hash_for_each'
    1117 |         hash_for_each(slots->id_hash, bkt, memslot, id_node[slots->node_idx]) \
         |         ^~~~~~~~~~~~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:35: error: invalid type argument of unary '*' (have 'int')
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                                   ^~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1199:40: note: in expansion of macro 'container_of'
    1199 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1210:22: note: in expansion of macro 'hlist_entry'
    1210 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1222:20: note: in expansion of macro 'hlist_entry_safe'
    1222 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   include/linux/hashtable.h:129:17: note: in expansion of macro 'hlist_for_each_entry'
     129 |                 hlist_for_each_entry(obj, &name[bkt], member)
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1117:9: note: in expansion of macro 'hash_for_each'
    1117 |         hash_for_each(slots->id_hash, bkt, memslot, id_node[slots->node_idx]) \
         |         ^~~~~~~~~~~~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1199:40: note: in expansion of macro 'container_of'
    1199 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1210:22: note: in expansion of macro 'hlist_entry'
    1210 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1222:20: note: in expansion of macro 'hlist_entry_safe'
    1222 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   include/linux/hashtable.h:129:17: note: in expansion of macro 'hlist_for_each_entry'
     129 |                 hlist_for_each_entry(obj, &name[bkt], member)
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1117:9: note: in expansion of macro 'hash_for_each'
    1117 |         hash_for_each(slots->id_hash, bkt, memslot, id_node[slots->node_idx]) \
         |         ^~~~~~~~~~~~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1199:40: note: in expansion of macro 'container_of'
    1199 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1210:22: note: in expansion of macro 'hlist_entry'
    1210 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1222:20: note: in expansion of macro 'hlist_entry_safe'
    1222 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   include/linux/hashtable.h:129:17: note: in expansion of macro 'hlist_for_each_entry'
     129 |                 hlist_for_each_entry(obj, &name[bkt], member)
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1117:9: note: in expansion of macro 'hash_for_each'
    1117 |         hash_for_each(slots->id_hash, bkt, memslot, id_node[slots->node_idx]) \
         |         ^~~~~~~~~~~~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:22,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/mmu.h:144:
>> include/linux/container_of.h:23:18: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      23 |         (type *)((void *)(ptr) - offsetof(type, member)); })
         |                  ^
   include/linux/list.h:1199:40: note: in expansion of macro 'container_of'
    1199 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1210:22: note: in expansion of macro 'hlist_entry'
    1210 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1222:20: note: in expansion of macro 'hlist_entry_safe'
    1222 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   include/linux/hashtable.h:129:17: note: in expansion of macro 'hlist_for_each_entry'
     129 |                 hlist_for_each_entry(obj, &name[bkt], member)
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1117:9: note: in expansion of macro 'hash_for_each'
    1117 |         hash_for_each(slots->id_hash, bkt, memslot, id_node[slots->node_idx]) \
         |         ^~~~~~~~~~~~~
   arch/powerpc/kvm/powerpc.c:774:9: note: in expansion of macro 'kvm_for_each_memslot'
     774 |         kvm_for_each_memslot(memslot, bkt, slots)
         |         ^~~~~~~~~~~~~~~~~~~~


vim +774 arch/powerpc/kvm/powerpc.c

   766	
   767	void kvm_arch_flush_shadow_all(struct kvm *kvm)
   768	{
   769		struct kvm_memory_slot *slot;
   770		struct kvm_memslots *slots;
   771		int bkt;
   772	
   773		slots = kvm_memslots(kvm);
 > 774		kvm_for_each_memslot(memslot, bkt, slots)
   775			kvmppc_core_flush_memslot(kvm, slot);
   776	}
   777	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
