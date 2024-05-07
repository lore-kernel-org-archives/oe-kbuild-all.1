Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258B13F443
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123339; cv=none; b=UrNlwKlOibealJ0ZqETrQw82VBTjRtk3FMZ57qY6V5VAH123h3ertchDLc7bh7RTVjiFk/XAg5xUk6yZxaz/wrW5Twxq4ibw+sfuIuav+n8GrTDH1xot7HlvCF5dIVtNImRa9ZE2OqwM3JCJh4o0LCAaPb0OoveyrB9cSy+e4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123339; c=relaxed/simple;
	bh=mz9MNFRIJL0xskFk5l3FjmzqYpd9LjbdwPPYkqXMhO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOO/jxdXrfncjicomPjNYfHrR+YbU9+WwOAUsL5sb12H7mKPoMM1VhdcXXCH3AGgYJv9BMWMcSsUaQxUrADFV9C4ELLv0vjm2SNy5MV5hUF1H6Ubo3Gw1RkNilCcpfCFYjSFhpIDiGEqm/KVnz3/NNBbZeCis6SN+JwVRTGlgXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QthuHrn/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QthuHrn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715123336; x=1746659336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mz9MNFRIJL0xskFk5l3FjmzqYpd9LjbdwPPYkqXMhO8=;
  b=QthuHrn/sJP+eh29A2uQQTTEHp8Xz9Upfrr4fvBZNI5l7oOLC9tReNX/
   nyxX2XCLinGU+Ttp9xfM/WH5cKSE7CTQ5XLT0dIuHgZNKyl+3M5434bZ0
   BV25TNKyez/anUGKvlF4HvD+H0M8snzf8cRFEsjXfwqklqGLqqDEyj+qG
   89yHTjrg3/EW4yo8EV0zHUsXYvgoc+NXPm0apvFWuQwfopJ4Iisdtgsq9
   NZY4pGRP2nlccg5DUjqcaYYnJTJ7jezszf9JVf1gyQfwQpN4BuGkiuvsS
   d01mf7R4MZVDLj11jkvfO98zz7yOpK2yo7NDCAI9R2JmfoQqlSpfpq4x1
   w==;
X-CSE-ConnectionGUID: TfgbBdOHRC64iPDo5sWUfg==
X-CSE-MsgGUID: ZGVpTvMERP2u/oE8cDEuxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14773195"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="14773195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 16:08:55 -0700
X-CSE-ConnectionGUID: /OYggS2YTjOE6e2MXifh1g==
X-CSE-MsgGUID: fCrjSiy3RJiDjkrh8ubfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="59535511"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2024 16:08:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4TvY-0002iu-0M;
	Tue, 07 May 2024 23:08:52 +0000
Date: Wed, 8 May 2024 07:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: kpsingh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kpsingh:static_calls_type_1 6/6] security/security.c:1233:26:
 error: macro "lsm_for_each_hook" passed 5 arguments, but takes just 3
Message-ID: <202405080624.vnXNTdCc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kpsingh/linux.git static_calls_type_1
head:   dafa5a9ade0b77e70e942cb20ac68c41da19916b
commit: dafa5a9ade0b77e70e942cb20ac68c41da19916b [6/6] failed delta
config: i386-buildonly-randconfig-004-20240508 (https://download.01.org/0day-ci/archive/20240508/202405080624.vnXNTdCc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080624.vnXNTdCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080624.vnXNTdCc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   security/security.c: In function 'security_vm_enough_memory_mm':
>> security/security.c:1233:26: error: macro "lsm_for_each_hook" passed 5 arguments, but takes just 3
    1233 |                 mm, pages);
         |                          ^
   security/security.c:963: note: macro "lsm_for_each_hook" defined here
     963 | #define lsm_for_each_hook(HOOK, RC, BODY)       \
         | 
>> security/security.c:1226:9: error: 'lsm_for_each_hook' undeclared (first use in this function)
    1226 |         lsm_for_each_hook(vm_enough_memory, rc,
         |         ^~~~~~~~~~~~~~~~~
   security/security.c:1226:9: note: each undeclared identifier is reported only once for each function it appears in
   security/security.c:1235:1: warning: label 'out' defined but not used [-Wunused-label]
    1235 | out:
         | ^~~
   security/security.c:1216:13: warning: unused variable 'rc' [-Wunused-variable]
    1216 |         int rc;
         |             ^~
   security/security.c: In function 'security_fs_context_parse_param':
   security/security.c:1385:21: error: macro "lsm_for_each_hook" passed 5 arguments, but takes just 3
    1385 |         }, fc, param);
         |                     ^
   security/security.c:963: note: macro "lsm_for_each_hook" defined here
     963 | #define lsm_for_each_hook(HOOK, RC, BODY)       \
         | 
   security/security.c:1380:9: error: 'lsm_for_each_hook' undeclared (first use in this function)
    1380 |         lsm_for_each_hook(fs_context_parse_param, trc, {
         |         ^~~~~~~~~~~~~~~~~
   security/security.c:1377:13: warning: unused variable 'trc' [-Wunused-variable]
    1377 |         int trc = LSM_RET_DEFAULT(fs_context_parse_param);
         |             ^~~
   security/security.c: In function 'security_sb_set_mnt_opts':
   security/security.c:1616:52: error: macro "lsm_for_each_hook" passed 7 arguments, but takes just 3
    1616 |         }, sb, mnt_opts, kern_flags, set_kern_flags);
         |                                                    ^
   security/security.c:963: note: macro "lsm_for_each_hook" defined here
     963 | #define lsm_for_each_hook(HOOK, RC, BODY)       \
         | 
   security/security.c:1613:9: error: 'lsm_for_each_hook' undeclared (first use in this function)
    1613 |         lsm_for_each_hook(sb_set_mnt_opts, rc, {
         |         ^~~~~~~~~~~~~~~~~
   security/security.c:1618:1: warning: label 'out' defined but not used [-Wunused-label]
    1618 | out:
         | ^~~
   security/security.c: In function 'security_inode_init_security':
   security/security.c:1836:59: error: macro "lsm_for_each_hook" passed 8 arguments, but takes just 3
    1836 |                 inode, dir, qstr, new_xattrs, &xattr_count);
         |                                                           ^
   security/security.c:963: note: macro "lsm_for_each_hook" defined here
     963 | #define lsm_for_each_hook(HOOK, RC, BODY)       \
         | 
   security/security.c:1826:9: error: 'lsm_for_each_hook' undeclared (first use in this function)
    1826 |         lsm_for_each_hook(inode_init_security, ret, {
         |         ^~~~~~~~~~~~~~~~~
   security/security.c: In function 'security_task_prctl':
   security/security.c:3638:42: error: macro "lsm_for_each_hook" passed 8 arguments, but takes just 3
    3638 |         }, option, arg2, arg3, arg4, arg5);
         |                                          ^
   security/security.c:963: note: macro "lsm_for_each_hook" defined here
     963 | #define lsm_for_each_hook(HOOK, RC, BODY)       \
         | 
   security/security.c:3632:9: error: 'lsm_for_each_hook' undeclared (first use in this function)
    3632 |         lsm_for_each_hook(task_prctl, thisrc, {
         |         ^~~~~~~~~~~~~~~~~
   security/security.c:3640:1: warning: label 'out' defined but not used [-Wunused-label]
    3640 | out:
         | ^~~
   security/security.c:3629:13: warning: unused variable 'thisrc' [-Wunused-variable]
    3629 |         int thisrc;
         |             ^~~~~~
   security/security.c: In function 'security_getselfattr':
>> security/security.c:4101:8: error: macro "__CALL_HOOK" passed 9 arguments, but takes just 3
    4101 |         }, attr, uctx, &entrysize, flags);
         | ^       ~~~~~~~~~
   security/security.c:956: note: macro "__CALL_HOOK" defined here
     956 | #define __CALL_HOOK(NUM, HOOK, BODY)                                         \
         | 
>> security/security.c:4101:8: error: macro "__CALL_HOOK" passed 9 arguments, but takes just 3
    4101 |         }, attr, uctx, &entrysize, flags);
         | ^       ~~~~~~~~~
   security/security.c:956: note: macro "__CALL_HOOK" defined here
     956 | #define __CALL_HOOK(NUM, HOOK, BODY)                                         \
         | 
   In file included from include/linux/lsm_hooks.h:34,
                    from security/security.c:21:
>> security/security.c:4077:25: error: unknown type name '__CALL_HOOK'
    4077 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, rc, {
         |                         ^~~~~~~~~~~
   include/linux/unroll.h:15:62: note: in definition of macro '__UNROLL_1'
      15 | #define __UNROLL_1(MACRO, args...)  __UNROLL_0(MACRO, args)  MACRO(0, args)
         |                                                              ^~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:4077:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
    4077 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, rc, {
         |         ^~~~~~~~~~~~~~~
>> security/security.c:4101:8: error: macro "__CALL_HOOK" passed 9 arguments, but takes just 3
    4101 |         }, attr, uctx, &entrysize, flags);
         | ^       ~~~~~~~~~
   security/security.c:956: note: macro "__CALL_HOOK" defined here
     956 | #define __CALL_HOOK(NUM, HOOK, BODY)                                         \
         | 
>> security/security.c:4077:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__CALL_HOOK'
    4077 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, rc, {
         |                         ^~~~~~~~~~~
   include/linux/unroll.h:17:62: note: in definition of macro '__UNROLL_3'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                                              ^~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:4077:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
    4077 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, rc, {
         |         ^~~~~~~~~~~~~~~
>> security/security.c:4132:1: error: expected 'while' before 'int'
    4132 | int security_setselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
         | ^~~
   security/security.c: In function 'security_getprocattr':
>> security/security.c:952:44: error: 'struct lsm_static_calls_table' has no member named 'HOOK'
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                            ^
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:16:37: note: in expansion of macro '__UNROLL_1'
      16 | #define __UNROLL_2(MACRO, args...)  __UNROLL_1(MACRO, args)  MACRO(1, args)
         |                                     ^~~~~~~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:952:50: error: 'NUM' undeclared (first use in this function)
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                                  ^~~
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:16:37: note: in expansion of macro '__UNROLL_1'
      16 | #define __UNROLL_2(MACRO, args...)  __UNROLL_1(MACRO, args)  MACRO(1, args)
         |                                     ^~~~~~~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__lsm_static_call_HOOK_NUM' undeclared (first use in this function); did you mean '__SCT__lsm_static_call_syslog_2'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:16:37: note: in expansion of macro '__UNROLL_1'
      16 | #define __UNROLL_2(MACRO, args...)  __UNROLL_1(MACRO, args)  MACRO(1, args)
         |                                     ^~~~~~~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   security/security.c:954:28: note: in expansion of macro 'static_call'
     954 | #define current_hook(...) (static_call(LSM_STATIC_CALL(HOOK, NUM))(__VA_ARGS__))
         |                            ^~~~~~~~~~~
   security/security.c:953:29: note: in expansion of macro 'current_hook'
     953 | #define __current_hook(...) current_hook(__VA_ARGS__)
         |                             ^~~~~~~~~~~~
   security/security.c:974:22: note: in expansion of macro '__current_hook'
     974 |                 RC = __current_hook(__VA_ARGS__);                               \
         |                      ^~~~~~~~~~~~~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:952:44: error: 'struct lsm_static_calls_table' has no member named 'HOOK'
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                            ^
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:952:44: error: 'struct lsm_static_calls_table' has no member named 'HOOK'
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                            ^
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:976:11: error: expected ';' before 'l'
     976 |         })l                                                             \
         |           ^
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:969:13: warning: variable 'RC' set but not used [-Wunused-but-set-variable]
     969 |         int RC = LSM_RET_DEFAULT(HOOK);                                 \
         |             ^~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8,
                    from security/security.c:14:
>> include/linux/jump_label.h:421:34: error: label 'out' used but not defined
     421 |         static_key_count((struct static_key *)x) > 0;                           \
         |                                  ^~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/jump_label.h:509:41: note: in expansion of macro 'unlikely_notrace'
     509 | #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:509:58: note: in expansion of macro 'static_key_enabled'
     509 | #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
         |                                                          ^~~~~~~~~~~~~~~~~~
   security/security.c:958:13: note: in expansion of macro 'static_branch_unlikely'
     958 |         if (static_branch_unlikely(&SECURITY_HOOK_ACTIVE_KEY(HOOK, NUM))) {  \
         |             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:17:62: note: in expansion of macro '__CALL_HOOK'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                                              ^~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:967:2: error: void value not ignored as it ought to be
     967 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     968 |         __label__ out;                                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     969 |         int RC = LSM_RET_DEFAULT(HOOK);                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     970 |                                                                         \
         |                                                                         ~
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     972 |                 if (current_lsmid() != LSMID)                           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     973 |                         continue;                                       \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     974 |                 RC = __current_hook(__VA_ARGS__);                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     975 |                 goto out;                                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     976 |         })l                                                             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     977 | out:                                                                    \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     978 |         RC;                                                             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     979 | })
         | ~~
   security/security.c:4178:16: note: in expansion of macro 'call_hook_with_lsmid'
    4178 |         return call_hook_with_lsmid(getprocattr, lsmid, p, name, value);
         |                ^~~~~~~~~~~~~~~~~~~~
   security/security.c: In function 'security_setprocattr':
>> security/security.c:952:44: error: 'struct lsm_static_calls_table' has no member named 'HOOK'
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                            ^
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:16:37: note: in expansion of macro '__UNROLL_1'
      16 | #define __UNROLL_2(MACRO, args...)  __UNROLL_1(MACRO, args)  MACRO(1, args)
         |                                     ^~~~~~~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4195:16: note: in expansion of macro 'call_hook_with_lsmid'
    4195 |         return call_hook_with_lsmid(setprocattr, lsmid, name, value, size);
         |                ^~~~~~~~~~~~~~~~~~~~
>> security/security.c:952:50: error: 'NUM' undeclared (first use in this function)
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                                  ^~~
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:16:37: note: in expansion of macro '__UNROLL_1'
      16 | #define __UNROLL_2(MACRO, args...)  __UNROLL_1(MACRO, args)  MACRO(1, args)
         |                                     ^~~~~~~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4195:16: note: in expansion of macro 'call_hook_with_lsmid'
    4195 |         return call_hook_with_lsmid(setprocattr, lsmid, name, value, size);
         |                ^~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: '__SCT__lsm_static_call_HOOK_NUM' undeclared (first use in this function); did you mean '__SCT__lsm_static_call_syslog_2'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:16:37: note: in expansion of macro '__UNROLL_1'
      16 | #define __UNROLL_2(MACRO, args...)  __UNROLL_1(MACRO, args)  MACRO(1, args)
         |                                     ^~~~~~~~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   security/security.c:954:28: note: in expansion of macro 'static_call'
     954 | #define current_hook(...) (static_call(LSM_STATIC_CALL(HOOK, NUM))(__VA_ARGS__))
         |                            ^~~~~~~~~~~
   security/security.c:953:29: note: in expansion of macro 'current_hook'
     953 | #define __current_hook(...) current_hook(__VA_ARGS__)
         |                             ^~~~~~~~~~~~
   security/security.c:974:22: note: in expansion of macro '__current_hook'
     974 |                 RC = __current_hook(__VA_ARGS__);                               \
         |                      ^~~~~~~~~~~~~~
   security/security.c:4195:16: note: in expansion of macro 'call_hook_with_lsmid'
    4195 |         return call_hook_with_lsmid(setprocattr, lsmid, name, value, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   security/security.c:952:44: error: 'struct lsm_static_calls_table' has no member named 'HOOK'
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                            ^
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/unroll.h:17:37: note: in expansion of macro '__UNROLL_2'
      17 | #define __UNROLL_3(MACRO, args...)  __UNROLL_2(MACRO, args)  MACRO(2, args)
         |                                     ^~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4195:16: note: in expansion of macro 'call_hook_with_lsmid'
    4195 |         return call_hook_with_lsmid(setprocattr, lsmid, name, value, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   security/security.c:952:44: error: 'struct lsm_static_calls_table' has no member named 'HOOK'
     952 | #define current_lsmid() (static_calls_table.HOOK[NUM].hl->lsmid->id)
         |                                            ^
   security/security.c:959:17: note: in definition of macro '__CALL_HOOK'
     959 |                 BODY                                                         \
         |                 ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__UNROLL_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:971:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     971 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, {                    \
         |         ^~~~~~~~~~~~~~~
   security/security.c:972:21: note: in expansion of macro 'current_lsmid'
     972 |                 if (current_lsmid() != LSMID)                           \
         |                     ^~~~~~~~~~~~~
   security/security.c:4195:16: note: in expansion of macro 'call_hook_with_lsmid'
    4195 |         return call_hook_with_lsmid(setprocattr, lsmid, name, value, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   security/security.c:976:11: error: expected ';' before 'l'
     976 |         })l                                                             \
         |           ^
   security/security.c:4195:16: note: in expansion of macro 'call_hook_with_lsmid'
    4195 |         return call_hook_with_lsmid(setprocattr, lsmid, name, value, size);


vim +/lsm_for_each_hook +1233 security/security.c

20510f2f4e2dab James Morris    2007-10-16  1199  
e261301c851aee Paul Moore      2023-02-16  1200  /**
e261301c851aee Paul Moore      2023-02-16  1201   * security_vm_enough_memory_mm() - Check if allocating a new mem map is allowed
e261301c851aee Paul Moore      2023-02-16  1202   * @mm: mm struct
e261301c851aee Paul Moore      2023-02-16  1203   * @pages: number of pages
e261301c851aee Paul Moore      2023-02-16  1204   *
e261301c851aee Paul Moore      2023-02-16  1205   * Check permissions for allocating a new virtual mapping.  If all LSMs return
e261301c851aee Paul Moore      2023-02-16  1206   * a positive value, __vm_enough_memory() will be called with cap_sys_admin
e261301c851aee Paul Moore      2023-02-16  1207   * set. If at least one LSM returns 0 or negative, __vm_enough_memory() will be
e261301c851aee Paul Moore      2023-02-16  1208   * called with cap_sys_admin cleared.
e261301c851aee Paul Moore      2023-02-16  1209   *
e261301c851aee Paul Moore      2023-02-16  1210   * Return: Returns 0 if permission is granted by the LSM infrastructure to the
e261301c851aee Paul Moore      2023-02-16  1211   *         caller.
e261301c851aee Paul Moore      2023-02-16  1212   */
20510f2f4e2dab James Morris    2007-10-16  1213  int security_vm_enough_memory_mm(struct mm_struct *mm, long pages)
20510f2f4e2dab James Morris    2007-10-16  1214  {
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1215  	int cap_sys_admin = 1;
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1216  	int rc;
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1217  
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1218  	/*
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1219  	 * The module will respond with a positive value if
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1220  	 * it thinks the __vm_enough_memory() call should be
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1221  	 * made with the cap_sys_admin set. If all of the modules
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1222  	 * agree that it should be set it will. If any module
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1223  	 * thinks it should not be set it won't.
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1224  	 */
126d968c88f643 kpsingh         2024-04-26  1225  
126d968c88f643 kpsingh         2024-04-26 @1226  	lsm_for_each_hook(vm_enough_memory, rc,
126d968c88f643 kpsingh         2024-04-26  1227  		{
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1228  			if (rc <= 0) {
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1229  				cap_sys_admin = 0;
126d968c88f643 kpsingh         2024-04-26  1230  				goto out;
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1231  			}
126d968c88f643 kpsingh         2024-04-26  1232  		},
126d968c88f643 kpsingh         2024-04-26 @1233  		mm, pages);
126d968c88f643 kpsingh         2024-04-26  1234  
126d968c88f643 kpsingh         2024-04-26  1235  out:
b1d9e6b0646d0e Casey Schaufler 2015-05-02  1236  	return __vm_enough_memory(mm, pages, cap_sys_admin);
20510f2f4e2dab James Morris    2007-10-16  1237  }
20510f2f4e2dab James Morris    2007-10-16  1238  

:::::: The code at line 1233 was first introduced by commit
:::::: 126d968c88f6431656168406517107d2b6b09ada security: Update non standard hooks to use static calls

:::::: TO: kpsingh <kpsingh@kernel.org>
:::::: CC: kpsingh <kpsingh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
