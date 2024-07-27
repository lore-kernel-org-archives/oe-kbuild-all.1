Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8938DF9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722076048; cv=none; b=iOHYlhq/Y1Y5veF/joLgvliidcxF/6EbyxTyUmr8rcRLRi9usYgTRaHFF/YWp6ZbOnOPfBoA94/nFd9fMP+PqcBxaEIyXJcFQq0tq8suM7YGNDn10rqEXxj7MFRjY02gZTl5CHSVou2pFjnQN7EJ5XUPD78P1WvW1Dd9yNfXIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722076048; c=relaxed/simple;
	bh=NSVr7fNjnp9HwZWS1sLYp4oyZ0TB4jM9aNvBAnsV3ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzBNydEZgIL7+5QM3Po7czzyO2n93ZBtr2ot0YJQkyyXeh8Nv+U+W3WzC6FKuqC4+U1n2YQiHk6ymly+Cq7A0XEqxh82h9h3M7G7642zw5+eOwzfDubtGBetNsdiDuKkQ/2h7dz1eCYx32uCnGFDzNOdm1cOaRKDWvXi37anSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlqqcnYT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlqqcnYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722076046; x=1753612046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSVr7fNjnp9HwZWS1sLYp4oyZ0TB4jM9aNvBAnsV3ks=;
  b=NlqqcnYTV1H+NF/PQQgT0TsaGeJAQyeCMcR0PjrjJnsS6e99s8zpkyTq
   HgCAvLNipiWOGsKyGtpX8lNFvZd3mS3TJcEBjRvQsmqBa9texHJXx8bNv
   pZyxsPUoSdwZIVhhYhcoCY5IMt5vMqjb0omtQLTfYiwwRXLZQsJZQNhu5
   V2H/byEGzgDekCHJ0567m4c+DCE5uVyTtJf59VFtzGyT9sbiovdnw0Wn5
   okf8M80uAbCVshv4UbBu6WXzbhP+O87Z3kSV6XuVnZQl1+SJUWNzlgjqB
   BwExNu0fzAtcdZbrc4nRdHTCzNWWOUW1GpqUZ/FNKpN/20aVk+ag+aJec
   A==;
X-CSE-ConnectionGUID: 2Wju8DaHROq9GCVqlWpqvg==
X-CSE-MsgGUID: c7w4tdtwS1K0PX2Vgub9AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19829062"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="19829062"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 03:27:25 -0700
X-CSE-ConnectionGUID: O0Rx0jD2TLWOaob+uzD2/A==
X-CSE-MsgGUID: VFpSUCI9RZeLp81eurBbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="53404256"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2024 03:27:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXee1-000pro-2p;
	Sat, 27 Jul 2024 10:27:21 +0000
Date: Sat, 27 Jul 2024 18:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 7/7] arch/x86/include/asm/asm.h:202:9: error:
 expected ':' or ')' before 'FAKE_SYMBOL'
Message-ID: <202407271842.HUm6kHLo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   caecd138f3c820b6e24d9fa9eb0ee20d755cd5c0
commit: caecd138f3c820b6e24d9fa9eb0ee20d755cd5c0 [7/7] todo
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240727/202407271842.HUm6kHLo-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271842.HUm6kHLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271842.HUm6kHLo-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                   ^~~~
   include/linux/jump_label.h:319:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     319 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:319:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     319 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h:322:17: note: in expansion of macro 'WARN_ON_ONCE'
     322 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
         |                 ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h:322:17: note: in expansion of macro 'WARN_ON_ONCE'
     322 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_disable':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:330:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     330 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/jump_label.h:81:35: note: in expansion of macro 'WARN'
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:330:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     330 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h:333:17: note: in expansion of macro 'WARN_ON_ONCE'
     333 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
         |                 ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/jump_label.h:333:17: note: in expansion of macro 'WARN_ON_ONCE'
     333 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
         |                 ^~~~~~~~~~~~
   In file included from arch/x86/include/asm/alternative.h:7,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5:
   arch/x86/include/asm/special_insns.h: In function 'native_read_cr4':
>> arch/x86/include/asm/asm.h:202:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/asm.h:232:9: note: in expansion of macro '_ASM_EXTABLE_TYPE'
     232 |         _ASM_EXTABLE_TYPE(from, to, EX_TYPE_DEFAULT)
         |         ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/special_insns.h:68:22: note: in expansion of macro '_ASM_EXTABLE'
      68 |                      _ASM_EXTABLE(1b, 2b)
         |                      ^~~~~~~~~~~~
   include/linux/thread_info.h: In function 'check_copy_size':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'set_nr_cpu_ids':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/cpumask.h:48:9: note: in expansion of macro 'WARN_ON'
      48 |         WARN_ON(nr != nr_cpu_ids);
         |         ^~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/cpumask.h:48:9: note: in expansion of macro 'WARN_ON'
      48 |         WARN_ON(nr != nr_cpu_ids);
         |         ^~~~~~~
   include/linux/rcupdate.h: In function 'rcu_head_after_call_rcu':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1085:9: note: in expansion of macro 'WARN_ON_ONCE'
    1085 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1085:9: note: in expansion of macro 'WARN_ON_ONCE'
    1085 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
         |         ^~~~~~~~~~~~
   include/linux/maple_tree.h: In function '__mas_set_range':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:701:41: note: in expansion of macro 'WARN_ON'
     701 | #define MAS_WARN_ON(__mas, __x)         WARN_ON(__x)
         |                                         ^~~~~~~
   include/linux/maple_tree.h:719:9: note: in expansion of macro 'MAS_WARN_ON'
     719 |         MAS_WARN_ON(mas, mas_is_active(mas) &&
         |         ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
--
   include/linux/maple_tree.h:811:17: note: in expansion of macro 'WARN_ON'
     811 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:811:17: note: in expansion of macro 'WARN_ON'
     811 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/maple_tree.h: In function 'mt_set_in_rcu':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:830:17: note: in expansion of macro 'WARN_ON'
     830 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/maple_tree.h:830:17: note: in expansion of macro 'WARN_ON'
     830 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^~~~~~~
   include/linux/rwsem.h: In function 'rwsem_assert_held_nolockdep':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/rwsem.h:80:9: note: in expansion of macro 'WARN_ON'
      80 |         WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
         |         ^~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
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
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/rwsem.h:85:9: note: in expansion of macro 'WARN_ON'
      85 |         WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
         |         ^~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:125:17: note: in expansion of macro '__WARN'
     125 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/rwsem.h:85:9: note: in expansion of macro 'WARN_ON'
      85 |         WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
         |         ^~~~~~~
   arch/x86/include/asm/msr.h: In function '__rdmsr':
>> arch/x86/include/asm/asm.h:202:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/msr.h:88:22: note: in expansion of macro '_ASM_EXTABLE_TYPE'
      88 |                      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
         |                      ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h: In function '__wrmsr':
>> arch/x86/include/asm/asm.h:202:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/msr.h:98:22: note: in expansion of macro '_ASM_EXTABLE_TYPE'
      98 |                      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
         |                      ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h: In function '__wrmsrns':
>> arch/x86/include/asm/asm.h:202:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/msr.h:111:22: note: in expansion of macro '_ASM_EXTABLE_TYPE'
     111 |                      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
         |                      ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h: In function 'native_read_msr_safe':
   arch/x86/include/asm/asm.h:211:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     211 |         FAKE_SYMBOL(__ex_table_, 12)                                            \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/msr.h:148:22: note: in expansion of macro '_ASM_EXTABLE_TYPE_REG'
     148 |                      _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
         |                      ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h: In function 'native_write_msr_safe':
   arch/x86/include/asm/asm.h:211:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     211 |         FAKE_SYMBOL(__ex_table_, 12)                                            \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/msr.h:174:22: note: in expansion of macro '_ASM_EXTABLE_TYPE_REG'
     174 |                      _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %[err])
         |                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/ktime.h: In function 'ktime_divns':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:71:9: note: in expansion of macro '_BUG_FLAGS'
      71 |         _BUG_FLAGS(ASM_UD2, 0, "");                             \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:71:57: note: in expansion of macro 'BUG'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^~~
   include/linux/ktime.h:134:9: note: in expansion of macro 'BUG_ON'
     134 |         BUG_ON(div < 0);
         |         ^~~~~~
   include/linux/srcu.h: In function 'srcu_down_read':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:270:9: note: in expansion of macro 'WARN_ON_ONCE'
     270 |         WARN_ON_ONCE(in_nmi());
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:270:9: note: in expansion of macro 'WARN_ON_ONCE'
     270 |         WARN_ON_ONCE(in_nmi());
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:285:9: note: in expansion of macro 'WARN_ON_ONCE'
     285 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:285:9: note: in expansion of macro 'WARN_ON_ONCE'
     285 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_read_unlock_nmisafe':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^~~~~~~~~~~
   arch/x86/include/asm/bug.h:85:9: note: in expansion of macro '_BUG_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^~~~~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:301:9: note: in expansion of macro 'WARN_ON_ONCE'
     301 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/bug.h:83:21: warning: unused variable '__flags' [-Wunused-variable]
      83 |         __auto_type __flags = BUGFLAG_WARNING|(flags);          \
         |                     ^~~~~~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/srcu.h:301:9: note: in expansion of macro 'WARN_ON_ONCE'
     301 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^~~~~~~~~~~~
   include/linux/srcu.h: In function 'srcu_up_read':
   arch/x86/include/asm/bug.h:30:22: error: expected ':' or ')' before 'FAKE_SYMBOL'


vim +202 arch/x86/include/asm/asm.h

   171	
   172	# define DEFINE_EXTABLE_TYPE_REG \
   173		".macro extable_type_reg type:req reg:req\n"						\
   174		".set .Lfound, 0\n"									\
   175		".set .Lregnr, 0\n"									\
   176		".irp rs,rax,rcx,rdx,rbx,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14,r15\n"		\
   177		".ifc \\reg, %%\\rs\n"									\
   178		".set .Lfound, .Lfound+1\n"								\
   179		".long \\type + (.Lregnr << 8)\n"							\
   180		".endif\n"										\
   181		".set .Lregnr, .Lregnr+1\n"								\
   182		".endr\n"										\
   183		".set .Lregnr, 0\n"									\
   184		".irp rs,eax,ecx,edx,ebx,esp,ebp,esi,edi,r8d,r9d,r10d,r11d,r12d,r13d,r14d,r15d\n"	\
   185		".ifc \\reg, %%\\rs\n"									\
   186		".set .Lfound, .Lfound+1\n"								\
   187		".long \\type + (.Lregnr << 8)\n"							\
   188		".endif\n"										\
   189		".set .Lregnr, .Lregnr+1\n"								\
   190		".endr\n"										\
   191		".if (.Lfound != 1)\n"									\
   192		".error \"extable_type_reg: bad register argument\"\n"					\
   193		".endif\n"										\
   194		".endm\n"
   195	
   196	# define UNDEFINE_EXTABLE_TYPE_REG \
   197		".purgem extable_type_reg\n"
   198	
   199	# define _ASM_EXTABLE_TYPE(from, to, type)			\
   200		" .pushsection \"__ex_table\",\"a\"\n"			\
   201		" .balign 4\n"						\
 > 202		FAKE_SYMBOL(__ex_table_, 12)				\
   203		" .long (" #from ") - .\n"				\
   204		" .long (" #to ") - .\n"				\
   205		" .long " __stringify(type) " \n"			\
   206		" .popsection\n"
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
