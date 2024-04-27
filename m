Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875514AED1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714215515; cv=none; b=e/MpThOWljOKlHlnXFDfaajFzd3+ZdOeY/FK+2npdbZsMSSZEtpYvQT9v3O7U5YHHG15WFaVV1BixklROJ0yz0SFXiLjh3PoZPERvP0n8mrPRaNAdL27Xvs8uICJFGuj3ioHSCI5gwBYbkCX/sojpj8MQX8E97vBUuDnP7Yoy+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714215515; c=relaxed/simple;
	bh=G5gWQGHCCdDKPlVWQTibL/Z1eZyONdT/qLdNrPz7EFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0p6KgA3ZHSY2jmWP6m6WXS0cPIctXgQhB8rZX7oQVTVrV78uQEqh6wg9LplxfBeMpyDMij6jJ9QaaPtN4ja98rmzkpisDdC2RCjj1XZWaGXzWkS3hWvxNyu6+JYLvThv+ffmYUCafnHY0ERKTRggtFJQzbRXToLWZxCM6PdYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbQq/Otc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbQq/Otc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714215513; x=1745751513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5gWQGHCCdDKPlVWQTibL/Z1eZyONdT/qLdNrPz7EFs=;
  b=nbQq/OtcYednyXuQHnMYQSnavf6MU0/K2R8NMtX2wMtvTGrKynMiTBiA
   IT+gf5iZvvE8xOSd9EhEplJymEa7ttbRj8TRRtMCtunwxn7WxUSFTzIwB
   wEoSdcpegaT9D2VnVJtGdnA9/lPKM0nXnEHYCfomQabKpZegUjKAHbPbS
   GWXPeh2PP5lYcmwQf42+333ylCgsN9PwCtUZDN45ijtUeBFv51SOilsMA
   LFrZDnX9TYXeNQON8x5ArwtVbouyMgYGQ6Y5HJuFz/7NSkg/ASyWpfv72
   ajD3lSKGm/Llx4/bCXLy06nHBM7l6RrMZaR3GluBFXJwJv5K6csJub3hC
   g==;
X-CSE-ConnectionGUID: Esq9E2YYRUiRlv4mUBqGaA==
X-CSE-MsgGUID: LqiLNXqzRIG94IjMyXJ+eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10052671"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="10052671"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 03:58:32 -0700
X-CSE-ConnectionGUID: 1JoVGiWwTfO6kjgyVJpaZQ==
X-CSE-MsgGUID: btiP3g/ZRVOmvKnNinA8xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="56571136"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Apr 2024 03:58:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0flE-0004uY-1a;
	Sat, 27 Apr 2024 10:58:28 +0000
Date: Sat, 27 Apr 2024 18:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: kpsingh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kpsingh:static_calls 4/4] security/security.c:4047:13: warning:
 variable 'left' set but not used
Message-ID: <202404271824.XpPSivEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kpsingh/linux.git static_calls
head:   06bb8ee551361059ecddd590b22e22143b4def41
commit: 06bb8ee551361059ecddd590b22e22143b4def41 [4/4] security: Update non standard hooks to use static calls
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240427/202404271824.XpPSivEO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271824.XpPSivEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271824.XpPSivEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   include/linux/args.h:22:26: note: in expansion of macro '__COUNT_ARGS'
      22 | #define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
         |                          ^~~~~~~~~~~~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:52:16: note: in expansion of macro 'MAX_LSM_COUNT'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |                ^~~~~~~~~~~~~
   security/security.c:925:17: note: in expansion of macro 'LSM_LOOP_UNROLL'
     925 |                 LSM_LOOP_UNROLL(__CALL_STATIC_VOID, HOOK, __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~~
   security/security.c:4013:9: note: in expansion of macro 'call_void_hook'
    4013 |         call_void_hook(d_instantiate, dentry, inode);
         |         ^~~~~~~~~~~~~~
   security/security.c: In function 'security_getselfattr':
   include/linux/unroll.h:12:47: error: pasting "__UNROLL_" and "..." does not give a valid preprocessing token
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:4022:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
    4022 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, RC, BODY_BEFORE, BODY_AFTER, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:4081:9: note: in expansion of macro 'call_getselfattr'
    4081 |         call_getselfattr(rc, {
         |         ^~~~~~~~~~~~~~~~
   include/linux/unroll.h:12:47: error: '__UNROLL_' undeclared (first use in this function); did you mean 'UNROLL'?
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:4022:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
    4022 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, RC, BODY_BEFORE, BODY_AFTER, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:4081:9: note: in expansion of macro 'call_getselfattr'
    4081 |         call_getselfattr(rc, {
         |         ^~~~~~~~~~~~~~~~
   include/linux/lsm_count.h:103:59: error: expected ';' before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:25:29: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                             ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   include/linux/args.h:22:26: note: in expansion of macro '__COUNT_ARGS'
      22 | #define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
         |                          ^~~~~~~~~~~~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:52:16: note: in expansion of macro 'MAX_LSM_COUNT'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |                ^~~~~~~~~~~~~
   security/security.c:4022:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
    4022 |         LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, RC, BODY_BEFORE, BODY_AFTER, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:4081:9: note: in expansion of macro 'call_getselfattr'
    4081 |         call_getselfattr(rc, {
         |         ^~~~~~~~~~~~~~~~
   security/security.c:4051:13: warning: unused variable 'rc' [-Wunused-variable]
    4051 |         int rc;
         |             ^~
   security/security.c:4049:14: warning: variable 'single' set but not used [-Wunused-but-set-variable]
    4049 |         bool single = false;
         |              ^~~~~~
>> security/security.c:4047:13: warning: variable 'left' set but not used [-Wunused-but-set-variable]
    4047 |         u32 left;
         |             ^~~~
   security/security.c:4045:13: warning: unused variable 'entrysize' [-Wunused-variable]
    4045 |         u32 entrysize;
         |             ^~~~~~~~~
   security/security.c:4044:20: warning: unused variable 'base' [-Wunused-variable]
    4044 |         u8 __user *base = (u8 __user *)uctx;
         |                    ^~~~
   security/security.c: In function 'security_setselfattr':
   include/linux/unroll.h:12:47: error: pasting "__UNROLL_" and "..." does not give a valid preprocessing token
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:974:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     974 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, {                        \
         |         ^~~~~~~~~~~~~~~
   security/security.c:4159:14: note: in expansion of macro 'call_hook_with_lsmid'
    4159 |         rc = call_hook_with_lsmid(setselfattr, lctx->id, attr, lctx, size, flags);
         |              ^~~~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:12:47: error: '__UNROLL_' undeclared (first use in this function); did you mean 'UNROLL'?
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:974:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     974 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, {                        \
         |         ^~~~~~~~~~~~~~~
   security/security.c:4159:14: note: in expansion of macro 'call_hook_with_lsmid'
    4159 |         rc = call_hook_with_lsmid(setselfattr, lctx->id, attr, lctx, size, flags);
         |              ^~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_count.h:103:59: error: expected ';' before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:25:29: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                             ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   include/linux/args.h:22:26: note: in expansion of macro '__COUNT_ARGS'
      22 | #define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
         |                          ^~~~~~~~~~~~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:52:16: note: in expansion of macro 'MAX_LSM_COUNT'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |                ^~~~~~~~~~~~~
   security/security.c:974:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     974 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, {                        \
         |         ^~~~~~~~~~~~~~~
   security/security.c:4159:14: note: in expansion of macro 'call_hook_with_lsmid'
    4159 |         rc = call_hook_with_lsmid(setselfattr, lctx->id, attr, lctx, size, flags);
         |              ^~~~~~~~~~~~~~~~~~~~
   security/security.c:980:1: warning: label 'out' defined but not used [-Wunused-label]
     980 | out:                                                                    \
         | ^~~
   security/security.c:4159:14: note: in expansion of macro 'call_hook_with_lsmid'
    4159 |         rc = call_hook_with_lsmid(setselfattr, lctx->id, attr, lctx, size, flags);
         |              ^~~~~~~~~~~~~~~~~~~~
   security/security.c: In function 'security_getprocattr':
   include/linux/unroll.h:12:47: error: pasting "__UNROLL_" and "..." does not give a valid preprocessing token
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/unroll.h:12:35: note: in expansion of macro 'CONCATENATE'
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                   ^~~~~~~~~~~
   include/linux/lsm_hooks.h:52:9: note: in expansion of macro 'UNROLL'
      52 |         UNROLL(MAX_LSM_COUNT, M, __VA_ARGS__)   \
         |         ^~~~~~
   security/security.c:974:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     974 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, {                        \
         |         ^~~~~~~~~~~~~~~


vim +/left +4047 security/security.c

20510f2f4e2dab James Morris    2007-10-16  4016  
a04a1198088a13 Casey Schaufler 2023-09-12  4017  /*
a04a1198088a13 Casey Schaufler 2023-09-12  4018   * Please keep this in sync with it's counterpart in security/lsm_syscalls.c
a04a1198088a13 Casey Schaufler 2023-09-12  4019   */
a04a1198088a13 Casey Schaufler 2023-09-12  4020  
06bb8ee5513610 kpsingh         2024-04-26  4021  #define call_getselfattr(RC, BODY_BEFORE, BODY_AFTER, ...) \
06bb8ee5513610 kpsingh         2024-04-26  4022  	LSM_LOOP_UNROLL(__CALL_HOOK, getselfattr, RC, BODY_BEFORE, BODY_AFTER, __VA_ARGS__)
06bb8ee5513610 kpsingh         2024-04-26  4023  
a04a1198088a13 Casey Schaufler 2023-09-12  4024  /**
a04a1198088a13 Casey Schaufler 2023-09-12  4025   * security_getselfattr - Read an LSM attribute of the current process.
a04a1198088a13 Casey Schaufler 2023-09-12  4026   * @attr: which attribute to return
a04a1198088a13 Casey Schaufler 2023-09-12  4027   * @uctx: the user-space destination for the information, or NULL
a04a1198088a13 Casey Schaufler 2023-09-12  4028   * @size: pointer to the size of space available to receive the data
a04a1198088a13 Casey Schaufler 2023-09-12  4029   * @flags: special handling options. LSM_FLAG_SINGLE indicates that only
a04a1198088a13 Casey Schaufler 2023-09-12  4030   * attributes associated with the LSM identified in the passed @ctx be
a04a1198088a13 Casey Schaufler 2023-09-12  4031   * reported.
a04a1198088a13 Casey Schaufler 2023-09-12  4032   *
a04a1198088a13 Casey Schaufler 2023-09-12  4033   * A NULL value for @uctx can be used to get both the number of attributes
a04a1198088a13 Casey Schaufler 2023-09-12  4034   * and the size of the data.
a04a1198088a13 Casey Schaufler 2023-09-12  4035   *
a04a1198088a13 Casey Schaufler 2023-09-12  4036   * Returns the number of attributes found on success, negative value
a04a1198088a13 Casey Schaufler 2023-09-12  4037   * on error. @size is reset to the total size of the data.
a04a1198088a13 Casey Schaufler 2023-09-12  4038   * If @size is insufficient to contain the data -E2BIG is returned.
a04a1198088a13 Casey Schaufler 2023-09-12  4039   */
a04a1198088a13 Casey Schaufler 2023-09-12  4040  int security_getselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
a5a858f622a0af Casey Schaufler 2024-03-14  4041  			 u32 __user *size, u32 flags)
a04a1198088a13 Casey Schaufler 2023-09-12  4042  {
a04a1198088a13 Casey Schaufler 2023-09-12  4043  	struct lsm_ctx lctx = { .id = LSM_ID_UNDEF, };
a04a1198088a13 Casey Schaufler 2023-09-12  4044  	u8 __user *base = (u8 __user *)uctx;
a5a858f622a0af Casey Schaufler 2024-03-14  4045  	u32 entrysize;
a5a858f622a0af Casey Schaufler 2024-03-14  4046  	u32 total = 0;
a5a858f622a0af Casey Schaufler 2024-03-14 @4047  	u32 left;
a04a1198088a13 Casey Schaufler 2023-09-12  4048  	bool toobig = false;
a04a1198088a13 Casey Schaufler 2023-09-12  4049  	bool single = false;
a04a1198088a13 Casey Schaufler 2023-09-12  4050  	int count = 0;
a04a1198088a13 Casey Schaufler 2023-09-12  4051  	int rc;
a04a1198088a13 Casey Schaufler 2023-09-12  4052  
a04a1198088a13 Casey Schaufler 2023-09-12  4053  	if (attr == LSM_ATTR_UNDEF)
a04a1198088a13 Casey Schaufler 2023-09-12  4054  		return -EINVAL;
a04a1198088a13 Casey Schaufler 2023-09-12  4055  	if (size == NULL)
a04a1198088a13 Casey Schaufler 2023-09-12  4056  		return -EINVAL;
a04a1198088a13 Casey Schaufler 2023-09-12  4057  	if (get_user(left, size))
a04a1198088a13 Casey Schaufler 2023-09-12  4058  		return -EFAULT;
a04a1198088a13 Casey Schaufler 2023-09-12  4059  
a04a1198088a13 Casey Schaufler 2023-09-12  4060  	if (flags) {
a04a1198088a13 Casey Schaufler 2023-09-12  4061  		/*
a04a1198088a13 Casey Schaufler 2023-09-12  4062  		 * Only flag supported is LSM_FLAG_SINGLE
a04a1198088a13 Casey Schaufler 2023-09-12  4063  		 */
fdcf699b60712e Paul Moore      2023-10-24  4064  		if (flags != LSM_FLAG_SINGLE || !uctx)
a04a1198088a13 Casey Schaufler 2023-09-12  4065  			return -EINVAL;
fdcf699b60712e Paul Moore      2023-10-24  4066  		if (copy_from_user(&lctx, uctx, sizeof(lctx)))
a04a1198088a13 Casey Schaufler 2023-09-12  4067  			return -EFAULT;
a04a1198088a13 Casey Schaufler 2023-09-12  4068  		/*
a04a1198088a13 Casey Schaufler 2023-09-12  4069  		 * If the LSM ID isn't specified it is an error.
a04a1198088a13 Casey Schaufler 2023-09-12  4070  		 */
a04a1198088a13 Casey Schaufler 2023-09-12  4071  		if (lctx.id == LSM_ID_UNDEF)
a04a1198088a13 Casey Schaufler 2023-09-12  4072  			return -EINVAL;
a04a1198088a13 Casey Schaufler 2023-09-12  4073  		single = true;
a04a1198088a13 Casey Schaufler 2023-09-12  4074  	}
a04a1198088a13 Casey Schaufler 2023-09-12  4075  
a04a1198088a13 Casey Schaufler 2023-09-12  4076  	/*
a04a1198088a13 Casey Schaufler 2023-09-12  4077  	 * In the usual case gather all the data from the LSMs.
a04a1198088a13 Casey Schaufler 2023-09-12  4078  	 * In the single case only get the data from the LSM specified.
a04a1198088a13 Casey Schaufler 2023-09-12  4079  	 */
06bb8ee5513610 kpsingh         2024-04-26  4080  
06bb8ee5513610 kpsingh         2024-04-26  4081  	call_getselfattr(rc, {
06bb8ee5513610 kpsingh         2024-04-26  4082  		if (single && lctx.id != current_lsmid())
a04a1198088a13 Casey Schaufler 2023-09-12  4083  			continue;
a04a1198088a13 Casey Schaufler 2023-09-12  4084  		entrysize = left;
a04a1198088a13 Casey Schaufler 2023-09-12  4085  		if (base)
a04a1198088a13 Casey Schaufler 2023-09-12  4086  			uctx = (struct lsm_ctx __user *)(base + total);
06bb8ee5513610 kpsingh         2024-04-26  4087  	}, {
a04a1198088a13 Casey Schaufler 2023-09-12  4088  		if (rc == -EOPNOTSUPP) {
a04a1198088a13 Casey Schaufler 2023-09-12  4089  			rc = 0;
a04a1198088a13 Casey Schaufler 2023-09-12  4090  			continue;
a04a1198088a13 Casey Schaufler 2023-09-12  4091  		}
a04a1198088a13 Casey Schaufler 2023-09-12  4092  		if (rc == -E2BIG) {
dc46db78b9747f Paul Moore      2023-10-24  4093  			rc = 0;
a04a1198088a13 Casey Schaufler 2023-09-12  4094  			left = 0;
dc46db78b9747f Paul Moore      2023-10-24  4095  			toobig = true;
a04a1198088a13 Casey Schaufler 2023-09-12  4096  		} else if (rc < 0)
a04a1198088a13 Casey Schaufler 2023-09-12  4097  			return rc;
a04a1198088a13 Casey Schaufler 2023-09-12  4098  		else
a04a1198088a13 Casey Schaufler 2023-09-12  4099  			left -= entrysize;
a04a1198088a13 Casey Schaufler 2023-09-12  4100  
a04a1198088a13 Casey Schaufler 2023-09-12  4101  		total += entrysize;
a04a1198088a13 Casey Schaufler 2023-09-12  4102  		count += rc;
a04a1198088a13 Casey Schaufler 2023-09-12  4103  		if (single)
a04a1198088a13 Casey Schaufler 2023-09-12  4104  			break;
06bb8ee5513610 kpsingh         2024-04-26  4105  	}, attr, uctx, &entrysize, flags);
06bb8ee5513610 kpsingh         2024-04-26  4106  
a04a1198088a13 Casey Schaufler 2023-09-12  4107  	if (put_user(total, size))
a04a1198088a13 Casey Schaufler 2023-09-12  4108  		return -EFAULT;
a04a1198088a13 Casey Schaufler 2023-09-12  4109  	if (toobig)
a04a1198088a13 Casey Schaufler 2023-09-12  4110  		return -E2BIG;
a04a1198088a13 Casey Schaufler 2023-09-12  4111  	if (count == 0)
a04a1198088a13 Casey Schaufler 2023-09-12  4112  		return LSM_RET_DEFAULT(getselfattr);
a04a1198088a13 Casey Schaufler 2023-09-12  4113  	return count;
a04a1198088a13 Casey Schaufler 2023-09-12  4114  }
a04a1198088a13 Casey Schaufler 2023-09-12  4115  

:::::: The code at line 4047 was first introduced by commit
:::::: a5a858f622a0aff5cdb5e271442cd01b2a01467f lsm: use 32-bit compatible data types in LSM syscalls

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
