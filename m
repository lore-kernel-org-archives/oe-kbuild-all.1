Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9AA3DE424
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868237; cv=none; b=MgkAtTLbl1fTwBi2dPKX0QDrEzDkDjpyBaMChyvnD0vcxN8xQDMk69BijGYriniVtJ59bxN72ctObXZBjJga6FDHeVcXi1k3JAc++HMFx7OTZLlggOZSLqbVc5rd5km3uqAt8mzpuw1aslWMOalhfWrILegID0pELZQ5I+d0tU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868237; c=relaxed/simple;
	bh=AakJNspYIHehDLzG7eEaRxqw/l2tvNLjGil8D559dvI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MY2tSh5FFnnwfVpWOc4VnaDT7iWm7H4TPlCHBDEIoU5wWgJQ0IJrDD4S+T3uYbXs2X4PlvMZdW+feWileT33gNRGkDzQvuj3Nt6S0bHQVh4qgBO5x4iKphWgVVYcg8hOR4v0Yt0pm0K++tqF9J0oc2thbO9C/IsLrezess6be6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bb5qGcBu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bb5qGcBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778868235; x=1810404235;
  h=date:from:to:cc:subject:message-id;
  bh=AakJNspYIHehDLzG7eEaRxqw/l2tvNLjGil8D559dvI=;
  b=bb5qGcBuD+11RpQEReBR4jDpwEatH82lUqhFyOyE3TfGM8lxk4LmeNgS
   7VgDor/n2gr6FL6XgGsq507QgdiJikT6gLgeZgrJZHxAXGJ4EWLYlHoaJ
   GPAlPvbK/BbVKmt70N3+5LUrKNkBlUJ1ZPo/3NJlm34QdTtgBi3SgNoAd
   BtbpAZ8NkcqLl99cY34uUHB9GlgG9R+HZOU24IS/+reYBSimHsQh8ex5+
   jHkRjVLFMa5Jp3Ep0gh+MhSTXABkHG9nSPXNLoEdslHLqb+LY6gaVsi3s
   HC7bA0NBJfxQO5WA91CGk1ouEu3EZbj8hkzgyTXMff+k14wwlUCY9z/Sj
   A==;
X-CSE-ConnectionGUID: +rIAQ/bWREicyyXDq8Yktw==
X-CSE-MsgGUID: GIVyeR3NT3iIPZguFAlatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="82394053"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="82394053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:03:54 -0700
X-CSE-ConnectionGUID: 78fk/RYnR1yUI5LCJifk/g==
X-CSE-MsgGUID: LrbYZPAlSJKlRWYaLG+gAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="276859993"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2026 11:03:52 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNwsp-000000002U3-3Zqz;
	Fri, 15 May 2026 18:03:49 +0000
Date: Sat, 16 May 2026 02:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nathan:clang-fixes-for-next 1/1]
 include/linux/syscalls.h:250:30: error: expected declaration specifiers or
 '...' before numeric constant
Message-ID: <202605160146.mKMTmQyg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-fixes-for-next
head:   c2ce0c7ca3f05632d11ee5b30a9eb9c883c4684e
commit: c2ce0c7ca3f05632d11ee5b30a9eb9c883c4684e [1/1] Disable -Wattribute-alias for clang-23 and newer
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260516/202605160146.mKMTmQyg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160146.mKMTmQyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160146.mKMTmQyg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:1785:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1785 | SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:1785:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1785 | SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:1785:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1785 | SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:2846:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    2846 | SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:2846:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    2846 | SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:2846:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    2846 | SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:3004:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    3004 | SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:3004:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    3004 | SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:3004:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    3004 | SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:3315:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    3315 | SYSCALL_DEFINE1(unshare, unsigned long, unshare_flags)
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:3315:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    3315 | SYSCALL_DEFINE1(unshare, unsigned long, unshare_flags)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/fork.c:3315:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    3315 | SYSCALL_DEFINE1(unshare, unsigned long, unshare_flags)
         | ^~~~~~~~~~~~~~~
--
   In file included from <command-line>:
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exec_domain.c:38:1: note: in expansion of macro 'SYSCALL_DEFINE1'
      38 | SYSCALL_DEFINE1(personality, unsigned int, personality)
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exec_domain.c:38:1: note: in expansion of macro 'SYSCALL_DEFINE1'
      38 | SYSCALL_DEFINE1(personality, unsigned int, personality)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exec_domain.c:38:1: note: in expansion of macro 'SYSCALL_DEFINE1'
      38 | SYSCALL_DEFINE1(personality, unsigned int, personality)
         | ^~~~~~~~~~~~~~~
--
   In file included from <command-line>:
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1082:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1082 | SYSCALL_DEFINE1(exit, int, error_code)
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1082:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1082 | SYSCALL_DEFINE1(exit, int, error_code)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1082:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1082 | SYSCALL_DEFINE1(exit, int, error_code)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1126:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1126 | SYSCALL_DEFINE1(exit_group, int, error_code)
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1126:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1126 | SYSCALL_DEFINE1(exit_group, int, error_code)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1126:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1126 | SYSCALL_DEFINE1(exit_group, int, error_code)
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1812:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    1812 | SYSCALL_DEFINE5(waitid, int, which, pid_t, upid, struct siginfo __user *,
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1812:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    1812 | SYSCALL_DEFINE5(waitid, int, which, pid_t, upid, struct siginfo __user *,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1812:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    1812 | SYSCALL_DEFINE5(waitid, int, which, pid_t, upid, struct siginfo __user *,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:30: error: expected declaration specifiers or '...' before numeric constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                              ^~
   include/linux/compiler_types.h:718:29: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                             ^~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1904:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1904 | SYSCALL_DEFINE4(wait4, pid_t, upid, int __user *, stat_addr,
         | ^~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:718:38: error: unknown type name 'ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                      ^~~~~~
   include/linux/syscalls.h:250:9: note: in expansion of macro '__diag_ignore'
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |         ^~~~~~~~~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1904:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1904 | SYSCALL_DEFINE4(wait4, pid_t, upid, int __user *, stat_addr,
         | ^~~~~~~~~~~~~~~
>> include/linux/syscalls.h:250:34: error: expected declaration specifiers or '...' before string constant
     250 |         __diag_ignore(clang, 23, "-Wattribute-alias",                   \
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:718:46: note: in definition of macro '__diag_ignore'
     718 |         __diag_ ## compiler(version, ignore, option)
         |                                              ^~~~~~
   include/linux/syscalls.h:236:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/exit.c:1904:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1904 | SYSCALL_DEFINE4(wait4, pid_t, upid, int __user *, stat_addr,
         | ^~~~~~~~~~~~~~~
..


vim +250 include/linux/syscalls.h

   239	
   240	/*
   241	 * The asmlinkage stub is aliased to a function named __se_sys_*() which
   242	 * sign-extends 32-bit ints to longs whenever needed. The actual work is
   243	 * done within __do_sys_*().
   244	 */
   245	#ifndef __SYSCALL_DEFINEx
   246	#define __SYSCALL_DEFINEx(x, name, ...)					\
   247		__diag_push();							\
   248		__diag_ignore(GCC, 8, "-Wattribute-alias",			\
   249			      "Type aliasing is used to sanitize syscall arguments");\
 > 250		__diag_ignore(clang, 23, "-Wattribute-alias",			\
   251			      "Type aliasing is used to sanitize syscall arguments");\
   252		asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
   253			__attribute__((alias(__stringify(__se_sys##name))));	\
   254		ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
   255		static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
   256		asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
   257		asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
   258		{								\
   259			long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
   260			__MAP(x,__SC_TEST,__VA_ARGS__);				\
   261			__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
   262			return ret;						\
   263		}								\
   264		__diag_pop();							\
   265		static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
   266	#endif /* __SYSCALL_DEFINEx */
   267	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
