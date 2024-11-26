Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A918858E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 19:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732648786; cv=none; b=dQ8/hSpQrbsr2a+5C0gsN1y3EhLZvtBrPv/V3ZDnKhFkEMgNhwUp27SSAAsyoj55g1WznxoxVNBS+1IC0lDhPUOx9geVCjFtIJFmmAx9JE2VQpmsxvU/J4sXWgZzH+vOt2Hd+mC57uEcDVByouQ691MFoFDia92xZ/H0k9+6gSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732648786; c=relaxed/simple;
	bh=ngfOX02nfOYng5XnQ6WkXHY4J/870TMpRGix4/4yeGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPz/vuOMt2ItxBcASkVE8QTWB7N/c3JjIbrQJnfAmvbQ7yfeRUn+3RK+DFFSNZXgeb4T6gRCnrpUV3sxAPAmqBwnCPBfV+wPVplLjEatgAmzVZ4DS+ljLcsseDdSwiNArxSYrEX0E2TkZ9sw2Sxru/30mLZ2ZFsLdr2CgrfOWXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgpUAj90; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgpUAj90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732648784; x=1764184784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ngfOX02nfOYng5XnQ6WkXHY4J/870TMpRGix4/4yeGU=;
  b=hgpUAj90DCT4PlnJ6j1zb3unIywReJ4MroszyHb0ZlI/xX0IsKlBYQRw
   S8H09NcBxN4M3WBHjoUhVZb9r6jYn5x/gWyg6WkkA5lsPhn/g9ODZ7DTm
   FEL5UDmP7s506s+bmC0am817ylW+P/VZdNLb/lX88JoXJ0im6EUA54TYN
   Z4wYuvF9LYzWUQAt8/HZlZfVzC/u7zvaPAe08GOTClqvyGQbgjU2KoeqN
   qjrUVgASqTtNM1nFPTykxQnC5YIN95aywBBUcygNy3yOsE4oQ7PkV//v7
   S8KGy1Tg0jfaVU7/xhafJZ+ekIGFoYq4uIl7FcaG+gXvW/HEjNdKuteR2
   A==;
X-CSE-ConnectionGUID: h1Okq1RVRGmoA2DZQm8slw==
X-CSE-MsgGUID: E/vf71TmRqGNsuk+94jaQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32686323"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32686323"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 11:19:43 -0800
X-CSE-ConnectionGUID: RDrI8NMfSyGxq09mDsjS9Q==
X-CSE-MsgGUID: R86oIhdkThKCzFgmdc3zlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="122554079"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 11:19:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG163-0007VA-2W;
	Tue, 26 Nov 2024 19:19:39 +0000
Date: Wed, 27 Nov 2024 03:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 15/16] include/linux/objtool.h:177:41:
 error: expected ':' or ')' before '__ASM_ANNOTATE'
Message-ID: <202411270307.0BkZcVGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   cd9921a0bc2a79a77a7e1f03f84491760d88b6a8
commit: 0b040f5f0c969993bee6cbebb5a7617aaed0d742 [15/16] objtool: 'Fix' ANNOTATE_REACHABLE to be a normal annotation
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20241127/202411270307.0BkZcVGv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270307.0BkZcVGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270307.0BkZcVGv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/loongarch/kernel/asm-offsets.c:8:
   include/linux/cpumask.h: In function 'set_nr_cpu_ids':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/cpumask.h:36:9: note: in expansion of macro 'WARN_ON'
      36 |         WARN_ON(nr != nr_cpu_ids);
         |         ^~~~~~~
   include/linux/thread_info.h: In function 'check_copy_size':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:262:13: note: in expansion of macro 'WARN_ON_ONCE'
     262 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
>> arch/loongarch/include/asm/bug.h:43:36: error: expected ')' before ';' token
      43 |                              extra);
         |                                    ^
   arch/loongarch/include/asm/bug.h:48:9: note: in expansion of macro '__BUG_FLAGS'
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags),                    \
         |         ^~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:262:13: note: in expansion of macro 'WARN_ON_ONCE'
     262 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   include/linux/thread_info.h:262:12: note: to match this '('
     262 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |            ^
   include/linux/jump_label.h: In function 'static_key_fast_inc_not_disabled':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:289:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     289 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_slow_dec':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:305:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     305 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_enable':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:322:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     322 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h:325:17: note: in expansion of macro 'WARN_ON_ONCE'
     325 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_disable':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:333:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     333 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h:336:17: note: in expansion of macro 'WARN_ON_ONCE'
     336 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
         |                 ^~~~~~~~~~~~
   include/linux/sched.h: In function 'release_user_cpus_ptr':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/sched.h:1836:9: note: in expansion of macro 'WARN_ON'
    1836 |         WARN_ON(p->user_cpus_ptr);
         |         ^~~~~~~
   include/linux/rcupdate.h: In function 'rcu_head_after_call_rcu':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1153:9: note: in expansion of macro 'WARN_ON_ONCE'
    1153 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
         |         ^~~~~~~~~~~~
   include/linux/maple_tree.h: In function '__mas_set_range':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:729:41: note: in expansion of macro 'WARN_ON'
     729 | #define MAS_WARN_ON(__mas, __x)         WARN_ON(__x)
         |                                         ^~~~~~~
   include/linux/maple_tree.h:747:9: note: in expansion of macro 'MAS_WARN_ON'
     747 |         MAS_WARN_ON(mas, mas_is_active(mas) &&
         |         ^~~~~~~~~~~
   include/linux/maple_tree.h: In function 'mt_clear_in_rcu':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:839:17: note: in expansion of macro 'WARN_ON'
     839 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/maple_tree.h: In function 'mt_set_in_rcu':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:858:17: note: in expansion of macro 'WARN_ON'
     858 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/rwsem.h: In function 'rwsem_assert_held_nolockdep':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/rwsem.h:80:9: note: in expansion of macro 'WARN_ON'
      80 |         WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
         |         ^~~~~~~
   include/linux/rwsem.h: In function 'rwsem_assert_held_write_nolockdep':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/rwsem.h:85:9: note: in expansion of macro 'WARN_ON'
      85 |         WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
         |         ^~~~~~~
   include/linux/ktime.h: In function 'ktime_divns':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/ktime.h:152:9: note: in expansion of macro 'WARN_ON'
     152 |         WARN_ON(div < 0);
         |         ^~~~~~~
   include/linux/srcu.h: In function 'srcu_down_read':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:335:9: note: in expansion of macro 'WARN_ON_ONCE'
     335 |         WARN_ON_ONCE(in_nmi());
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:350:9: note: in expansion of macro 'WARN_ON_ONCE'
     350 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock_lite':
>> include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:366:9: note: in expansion of macro 'WARN_ON_ONCE'
     366 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock_nmisafe':
   include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:382:9: note: in expansion of macro 'WARN_ON_ONCE'
     382 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_up_read':
   include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:407:9: note: in expansion of macro 'WARN_ON_ONCE'
     407 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:408:9: note: in expansion of macro 'WARN_ON_ONCE'
     408 |         WARN_ON_ONCE(in_nmi());
         |         ^~~~~~~~~~~~
   include/linux/percpu-refcount.h: In function 'percpu_ref_tryget_live_rcu':
   include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/percpu-refcount.h:280:9: note: in expansion of macro 'WARN_ON_ONCE'
     280 |         WARN_ON_ONCE(!rcu_read_lock_held());
         |         ^~~~~~~~~~~~
   include/linux/memremap.h: In function 'devm_memremap_pages':
   include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   arch/loongarch/include/asm/bug.h:49:21: note: in expansion of macro '__ANNOTATE_REACHABLE'
      49 |                     __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/memremap.h:210:9: note: in expansion of macro 'WARN_ON_ONCE'
     210 |         WARN_ON_ONCE(1);
         |         ^~~~~~~~~~~~
   include/linux/slab.h: In function '__kmem_cache_default_args':
   include/linux/objtool.h:177:41: error: expected ':' or ')' before '__ASM_ANNOTATE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^~~~~~~~~~~~~~
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~


vim +177 include/linux/objtool.h

   136	
   137	#ifndef __ASSEMBLY__
   138	/*
   139	 * Annotate away the various 'relocation to !ENDBR` complaints; knowing that
   140	 * these relocations will never be used for indirect calls.
   141	 */
   142	#define ANNOTATE_NOENDBR		ASM_ANNOTATE(ANNOTYPE_NOENDBR)
   143	/*
   144	 * This should be used immediately before an indirect jump/call. It tells
   145	 * objtool the subsequent indirect jump/call is vouched safe for retpoline
   146	 * builds.
   147	 */
   148	#define ANNOTATE_RETPOLINE_SAFE		ASM_ANNOTATE(ANNOTYPE_RETPOLINE_SAFE)
   149	/*
   150	 * See linux/instrumentation.h
   151	 */
   152	#define __ANNOTATE_INSTR_BEGIN(s)	__ASM_ANNOTATE(s, ANNOTYPE_INSTR_BEGIN)
   153	#define __ANNOTATE_INSTR_END(s)		__ASM_ANNOTATE(s, ANNOTYPE_INSTR_END)
   154	/*
   155	 * objtool annotation to ignore the alternatives and only consider the original
   156	 * instruction(s).
   157	 */
   158	#define ANNOTATE_IGNORE_ALTERNATIVE	ASM_ANNOTATE(ANNOTYPE_IGNORE_ALTS)
   159	/*
   160	 * This macro indicates that the following intra-function call is valid.
   161	 * Any non-annotated intra-function call will cause objtool to issue a warning.
   162	 */
   163	#define ANNOTATE_INTRA_FUNCTION_CALL	ASM_ANNOTATE(ANNOTYPE_INTRA_FUNCTION_CALL)
   164	/*
   165	 * Use objtool to validate the entry requirement that all code paths do
   166	 * VALIDATE_UNRET_END before RET.
   167	 *
   168	 * NOTE: The macro must be used at the beginning of a global symbol, otherwise
   169	 * it will be ignored.
   170	 */
   171	#define ANNOTATE_UNRET_BEGIN		ASM_ANNOTATE(ANNOTYPE_UNRET_BEGIN)
   172	/*
   173	 * This should be used to refer to an instruction that is considered
   174	 * terminating, like a noreturn CALL or UD2 when we know they are not -- eg
   175	 * WARN using UD2.
   176	 */
 > 177	#define __ANNOTATE_REACHABLE(s)		__ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
