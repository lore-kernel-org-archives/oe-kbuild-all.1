Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CF44CB23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714218698; cv=none; b=lBi0FtIPpSjujETaUWTBuw4xHmTREyPN7gSaKbCVS8QxyNZiN2dXaWuu0XxPI2sJABGUnCuM19/f1+VFbsUjakZ/sJZ6OVFPpseRku7CXwK/KoF/S3Zlh1A3NbwY32nGF4kf3heK5lPct99A+UX5FOGbwR7CsRclSlcuAfMhB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714218698; c=relaxed/simple;
	bh=th7YMQixPMhHBr+eP7XuATDNFsiBbyX1t2SwKOWdScs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQv8oHUOcFZrAGjZDNe9r/QTLwiKF+rWshbpGQyHgH/cRF564vdwZlpWWAxcRjEISsupQnipRvthDlwkJ5FDnKLGOI2HfnwYCdisjL5SV4WAnWEtLQf3zoJsb8qzmQagwtcrqNSY7FO+E6SB7qcjjCAG1U6guPU35CtqdL8jk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jao1/W6m; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jao1/W6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714218695; x=1745754695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=th7YMQixPMhHBr+eP7XuATDNFsiBbyX1t2SwKOWdScs=;
  b=jao1/W6m+ajxcGCZwDstd3x5m9Q16hpes53vH2BxTiDk5T4//LQqPxSi
   1SeD9I6tEMk9rGoEg3elwrwuMns43T+G8MH1UtzJ2RsYPCyzzaSzHLTbq
   4dMoDMwfJJXAD9uUdOU3OK5qfNUGt1jWGE1H3cNHnGCZjF8j9RVRZaaOm
   4WAinpJzvdm3V8sCtTuImcbd4iaHrFlSK3hCE3tf+wZH9j+Uu0gHXRIrE
   jhukk80W6jsWdJhZCttGl4C+Ll02MwqfRAZ8DE/8vx4hN9RaehXaD35bp
   Hf4CeEyZ4SMK23wyns8J0G+uyCPfuUsYvwigBMajvK/cMFnqKyE/ECdK5
   g==;
X-CSE-ConnectionGUID: A9BrJa/vQnKUVX4H/wktXA==
X-CSE-MsgGUID: F+6rSavgQlaHZf99zRc4uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="12882919"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="12882919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 04:51:34 -0700
X-CSE-ConnectionGUID: mobjf3vfQg6gQjUzeGEygA==
X-CSE-MsgGUID: SWoaZOWbSq2IWa5a8+EDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="26296823"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Apr 2024 04:51:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0gaY-0004x8-0L;
	Sat, 27 Apr 2024 11:51:30 +0000
Date: Sat, 27 Apr 2024 19:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: kpsingh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kpsingh:static_calls 4/4] security/security.c:1219:13: warning:
 unused variable 'rc'
Message-ID: <202404271942.1xlaUy3v-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240427/202404271942.1xlaUy3v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271942.1xlaUy3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271942.1xlaUy3v-lkp@intel.com/

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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1200:16: note: in expansion of macro 'call_int_hook'
    1200 |         return call_int_hook(settime, ts, tz);
         |                ^~~~~~~~~~~~~
   security/security.c:944:1: warning: label 'out' defined but not used [-Wunused-label]
     944 | out:                                                                    \
         | ^~~
   security/security.c:1200:16: note: in expansion of macro 'call_int_hook'
    1200 |         return call_int_hook(settime, ts, tz);
         |                ^~~~~~~~~~~~~
   security/security.c: In function 'security_vm_enough_memory_mm':
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
   security/security.c:967:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     967 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, ;, BODY, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:1229:9: note: in expansion of macro 'lsm_for_each_hook'
    1229 |         lsm_for_each_hook(vm_enough_memory, rc,
         |         ^~~~~~~~~~~~~~~~~
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
   security/security.c:967:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     967 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, ;, BODY, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:1229:9: note: in expansion of macro 'lsm_for_each_hook'
    1229 |         lsm_for_each_hook(vm_enough_memory, rc,
         |         ^~~~~~~~~~~~~~~~~
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
   security/security.c:967:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     967 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, ;, BODY, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:1229:9: note: in expansion of macro 'lsm_for_each_hook'
    1229 |         lsm_for_each_hook(vm_enough_memory, rc,
         |         ^~~~~~~~~~~~~~~~~
>> security/security.c:1219:13: warning: unused variable 'rc' [-Wunused-variable]
    1219 |         int rc;
         |             ^~
   security/security.c: In function 'security_bprm_creds_for_exec':
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1257:16: note: in expansion of macro 'call_int_hook'
    1257 |         return call_int_hook(bprm_creds_for_exec, bprm);
         |                ^~~~~~~~~~~~~
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1257:16: note: in expansion of macro 'call_int_hook'
    1257 |         return call_int_hook(bprm_creds_for_exec, bprm);
         |                ^~~~~~~~~~~~~
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1257:16: note: in expansion of macro 'call_int_hook'
    1257 |         return call_int_hook(bprm_creds_for_exec, bprm);
         |                ^~~~~~~~~~~~~
   security/security.c:944:1: warning: label 'out' defined but not used [-Wunused-label]
     944 | out:                                                                    \
         | ^~~
   security/security.c:1257:16: note: in expansion of macro 'call_int_hook'
    1257 |         return call_int_hook(bprm_creds_for_exec, bprm);
         |                ^~~~~~~~~~~~~
   security/security.c: In function 'security_bprm_creds_from_file':
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1281:16: note: in expansion of macro 'call_int_hook'
    1281 |         return call_int_hook(bprm_creds_from_file, bprm, file);
         |                ^~~~~~~~~~~~~
   include/linux/unroll.h:12:47: error: '__UNROLL_' undeclared (first use in this function); did you mean 'UNROLL'?
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
--
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1361:16: note: in expansion of macro 'call_int_hook'
    1361 |         return call_int_hook(fs_context_dup, fc, src_fc);
         |                ^~~~~~~~~~~~~
   security/security.c:944:1: warning: label 'out' defined but not used [-Wunused-label]
     944 | out:                                                                    \
         | ^~~
   security/security.c:1361:16: note: in expansion of macro 'call_int_hook'
    1361 |         return call_int_hook(fs_context_dup, fc, src_fc);
         |                ^~~~~~~~~~~~~
   security/security.c: In function 'security_fs_context_parse_param':
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
   security/security.c:967:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     967 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, ;, BODY, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:1382:9: note: in expansion of macro 'lsm_for_each_hook'
    1382 |         lsm_for_each_hook(fs_context_parse_param, trc, {
         |         ^~~~~~~~~~~~~~~~~
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
   security/security.c:967:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     967 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, ;, BODY, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:1382:9: note: in expansion of macro 'lsm_for_each_hook'
    1382 |         lsm_for_each_hook(fs_context_parse_param, trc, {
         |         ^~~~~~~~~~~~~~~~~
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
   security/security.c:967:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     967 |         LSM_LOOP_UNROLL(__CALL_HOOK, HOOK, RC, ;, BODY, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   security/security.c:1382:9: note: in expansion of macro 'lsm_for_each_hook'
    1382 |         lsm_for_each_hook(fs_context_parse_param, trc, {
         |         ^~~~~~~~~~~~~~~~~
>> security/security.c:1379:13: warning: unused variable 'trc' [-Wunused-variable]
    1379 |         int trc = LSM_RET_DEFAULT(fs_context_parse_param);
         |             ^~~
   security/security.c: In function 'security_sb_alloc':
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1408:14: note: in expansion of macro 'call_int_hook'
    1408 |         rc = call_int_hook(sb_alloc_security, sb);
         |              ^~~~~~~~~~~~~
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1408:14: note: in expansion of macro 'call_int_hook'
    1408 |         rc = call_int_hook(sb_alloc_security, sb);
         |              ^~~~~~~~~~~~~
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
   security/security.c:943:9: note: in expansion of macro 'LSM_LOOP_UNROLL'
     943 |         LSM_LOOP_UNROLL(__CALL_STATIC_INT, RC, HOOK, out, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   security/security.c:1408:14: note: in expansion of macro 'call_int_hook'
    1408 |         rc = call_int_hook(sb_alloc_security, sb);
         |              ^~~~~~~~~~~~~
   security/security.c:944:1: warning: label 'out' defined but not used [-Wunused-label]
     944 | out:                                                                    \
         | ^~~
   security/security.c:1408:14: note: in expansion of macro 'call_int_hook'
    1408 |         rc = call_int_hook(sb_alloc_security, sb);
         |              ^~~~~~~~~~~~~
   security/security.c: In function 'security_sb_delete':
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
   security/security.c:925:17: note: in expansion of macro 'LSM_LOOP_UNROLL'
     925 |                 LSM_LOOP_UNROLL(__CALL_STATIC_VOID, HOOK, __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~~
   security/security.c:1423:9: note: in expansion of macro 'call_void_hook'
    1423 |         call_void_hook(sb_delete, sb);
         |         ^~~~~~~~~~~~~~
   include/linux/unroll.h:12:47: error: '__UNROLL_' undeclared (first use in this function); did you mean 'UNROLL'?
      12 | #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
         |                                               ^~~~~~~~~
..


vim +/rc +1219 security/security.c

20510f2f4e2dab James Morris      2007-10-16  1202  
e261301c851aee Paul Moore        2023-02-16  1203  /**
e261301c851aee Paul Moore        2023-02-16  1204   * security_vm_enough_memory_mm() - Check if allocating a new mem map is allowed
e261301c851aee Paul Moore        2023-02-16  1205   * @mm: mm struct
e261301c851aee Paul Moore        2023-02-16  1206   * @pages: number of pages
e261301c851aee Paul Moore        2023-02-16  1207   *
e261301c851aee Paul Moore        2023-02-16  1208   * Check permissions for allocating a new virtual mapping.  If all LSMs return
e261301c851aee Paul Moore        2023-02-16  1209   * a positive value, __vm_enough_memory() will be called with cap_sys_admin
e261301c851aee Paul Moore        2023-02-16  1210   * set. If at least one LSM returns 0 or negative, __vm_enough_memory() will be
e261301c851aee Paul Moore        2023-02-16  1211   * called with cap_sys_admin cleared.
e261301c851aee Paul Moore        2023-02-16  1212   *
e261301c851aee Paul Moore        2023-02-16  1213   * Return: Returns 0 if permission is granted by the LSM infrastructure to the
e261301c851aee Paul Moore        2023-02-16  1214   *         caller.
e261301c851aee Paul Moore        2023-02-16  1215   */
20510f2f4e2dab James Morris      2007-10-16  1216  int security_vm_enough_memory_mm(struct mm_struct *mm, long pages)
20510f2f4e2dab James Morris      2007-10-16  1217  {
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1218  	int cap_sys_admin = 1;
b1d9e6b0646d0e Casey Schaufler   2015-05-02 @1219  	int rc;
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1220  
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1221  	/*
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1222  	 * The module will respond with a positive value if
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1223  	 * it thinks the __vm_enough_memory() call should be
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1224  	 * made with the cap_sys_admin set. If all of the modules
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1225  	 * agree that it should be set it will. If any module
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1226  	 * thinks it should not be set it won't.
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1227  	 */
06bb8ee5513610 kpsingh           2024-04-26  1228  
06bb8ee5513610 kpsingh           2024-04-26  1229  	lsm_for_each_hook(vm_enough_memory, rc,
06bb8ee5513610 kpsingh           2024-04-26  1230  		{
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1231  			if (rc <= 0) {
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1232  				cap_sys_admin = 0;
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1233  				break;
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1234  			}
06bb8ee5513610 kpsingh           2024-04-26  1235  		},
06bb8ee5513610 kpsingh           2024-04-26  1236  		mm, pages);
06bb8ee5513610 kpsingh           2024-04-26  1237  
b1d9e6b0646d0e Casey Schaufler   2015-05-02  1238  	return __vm_enough_memory(mm, pages, cap_sys_admin);
20510f2f4e2dab James Morris      2007-10-16  1239  }
20510f2f4e2dab James Morris      2007-10-16  1240  
1661372c912d19 Paul Moore        2023-02-07  1241  /**
1661372c912d19 Paul Moore        2023-02-07  1242   * security_bprm_creds_for_exec() - Prepare the credentials for exec()
1661372c912d19 Paul Moore        2023-02-07  1243   * @bprm: binary program information
1661372c912d19 Paul Moore        2023-02-07  1244   *
1661372c912d19 Paul Moore        2023-02-07  1245   * If the setup in prepare_exec_creds did not setup @bprm->cred->security
1661372c912d19 Paul Moore        2023-02-07  1246   * properly for executing @bprm->file, update the LSM's portion of
1661372c912d19 Paul Moore        2023-02-07  1247   * @bprm->cred->security to be what commit_creds needs to install for the new
1661372c912d19 Paul Moore        2023-02-07  1248   * program.  This hook may also optionally check permissions (e.g. for
1661372c912d19 Paul Moore        2023-02-07  1249   * transitions between security domains).  The hook must set @bprm->secureexec
1661372c912d19 Paul Moore        2023-02-07  1250   * to 1 if AT_SECURE should be set to request libc enable secure mode.  @bprm
1661372c912d19 Paul Moore        2023-02-07  1251   * contains the linux_binprm structure.
1661372c912d19 Paul Moore        2023-02-07  1252   *
1661372c912d19 Paul Moore        2023-02-07  1253   * Return: Returns 0 if the hook is successful and permission is granted.
1661372c912d19 Paul Moore        2023-02-07  1254   */
b8bff599261c93 Eric W. Biederman 2020-03-22  1255  int security_bprm_creds_for_exec(struct linux_binprm *bprm)
20510f2f4e2dab James Morris      2007-10-16  1256  {
260017f31a8c38 Ondrej Mosnacek   2024-01-30  1257  	return call_int_hook(bprm_creds_for_exec, bprm);
b8bff599261c93 Eric W. Biederman 2020-03-22  1258  }
b8bff599261c93 Eric W. Biederman 2020-03-22  1259  
1661372c912d19 Paul Moore        2023-02-07  1260  /**
1661372c912d19 Paul Moore        2023-02-07  1261   * security_bprm_creds_from_file() - Update linux_binprm creds based on file
1661372c912d19 Paul Moore        2023-02-07  1262   * @bprm: binary program information
1661372c912d19 Paul Moore        2023-02-07  1263   * @file: associated file
1661372c912d19 Paul Moore        2023-02-07  1264   *
1661372c912d19 Paul Moore        2023-02-07  1265   * If @file is setpcap, suid, sgid or otherwise marked to change privilege upon
1661372c912d19 Paul Moore        2023-02-07  1266   * exec, update @bprm->cred to reflect that change. This is called after
1661372c912d19 Paul Moore        2023-02-07  1267   * finding the binary that will be executed without an interpreter.  This
1661372c912d19 Paul Moore        2023-02-07  1268   * ensures that the credentials will not be derived from a script that the
1661372c912d19 Paul Moore        2023-02-07  1269   * binary will need to reopen, which when reopend may end up being a completely
1661372c912d19 Paul Moore        2023-02-07  1270   * different file.  This hook may also optionally check permissions (e.g. for
1661372c912d19 Paul Moore        2023-02-07  1271   * transitions between security domains).  The hook must set @bprm->secureexec
1661372c912d19 Paul Moore        2023-02-07  1272   * to 1 if AT_SECURE should be set to request libc enable secure mode.  The
1661372c912d19 Paul Moore        2023-02-07  1273   * hook must add to @bprm->per_clear any personality flags that should be
1661372c912d19 Paul Moore        2023-02-07  1274   * cleared from current->personality.  @bprm contains the linux_binprm
1661372c912d19 Paul Moore        2023-02-07  1275   * structure.
1661372c912d19 Paul Moore        2023-02-07  1276   *
1661372c912d19 Paul Moore        2023-02-07  1277   * Return: Returns 0 if the hook is successful and permission is granted.
1661372c912d19 Paul Moore        2023-02-07  1278   */
4a00c673068e72 Khadija Kamran    2023-08-23  1279  int security_bprm_creds_from_file(struct linux_binprm *bprm, const struct file *file)
20510f2f4e2dab James Morris      2007-10-16  1280  {
260017f31a8c38 Ondrej Mosnacek   2024-01-30  1281  	return call_int_hook(bprm_creds_from_file, bprm, file);
20510f2f4e2dab James Morris      2007-10-16  1282  }
20510f2f4e2dab James Morris      2007-10-16  1283  
1661372c912d19 Paul Moore        2023-02-07  1284  /**
1661372c912d19 Paul Moore        2023-02-07  1285   * security_bprm_check() - Mediate binary handler search
1661372c912d19 Paul Moore        2023-02-07  1286   * @bprm: binary program information
1661372c912d19 Paul Moore        2023-02-07  1287   *
1661372c912d19 Paul Moore        2023-02-07  1288   * This hook mediates the point when a search for a binary handler will begin.
1661372c912d19 Paul Moore        2023-02-07  1289   * It allows a check against the @bprm->cred->security value which was set in
1661372c912d19 Paul Moore        2023-02-07  1290   * the preceding creds_for_exec call.  The argv list and envp list are reliably
1661372c912d19 Paul Moore        2023-02-07  1291   * available in @bprm.  This hook may be called multiple times during a single
1661372c912d19 Paul Moore        2023-02-07  1292   * execve.  @bprm contains the linux_binprm structure.
1661372c912d19 Paul Moore        2023-02-07  1293   *
1661372c912d19 Paul Moore        2023-02-07  1294   * Return: Returns 0 if the hook is successful and permission is granted.
1661372c912d19 Paul Moore        2023-02-07  1295   */
a6f76f23d297f7 David Howells     2008-11-14  1296  int security_bprm_check(struct linux_binprm *bprm)
20510f2f4e2dab James Morris      2007-10-16  1297  {
260017f31a8c38 Ondrej Mosnacek   2024-01-30  1298  	return call_int_hook(bprm_check_security, bprm);
20510f2f4e2dab James Morris      2007-10-16  1299  }
20510f2f4e2dab James Morris      2007-10-16  1300  
1661372c912d19 Paul Moore        2023-02-07  1301  /**
1661372c912d19 Paul Moore        2023-02-07  1302   * security_bprm_committing_creds() - Install creds for a process during exec()
1661372c912d19 Paul Moore        2023-02-07  1303   * @bprm: binary program information
1661372c912d19 Paul Moore        2023-02-07  1304   *
1661372c912d19 Paul Moore        2023-02-07  1305   * Prepare to install the new security attributes of a process being
1661372c912d19 Paul Moore        2023-02-07  1306   * transformed by an execve operation, based on the old credentials pointed to
1661372c912d19 Paul Moore        2023-02-07  1307   * by @current->cred and the information set in @bprm->cred by the
1661372c912d19 Paul Moore        2023-02-07  1308   * bprm_creds_for_exec hook.  @bprm points to the linux_binprm structure.  This
1661372c912d19 Paul Moore        2023-02-07  1309   * hook is a good place to perform state changes on the process such as closing
1661372c912d19 Paul Moore        2023-02-07  1310   * open file descriptors to which access will no longer be granted when the
1661372c912d19 Paul Moore        2023-02-07  1311   * attributes are changed.  This is called immediately before commit_creds().
1661372c912d19 Paul Moore        2023-02-07  1312   */
64fc9526147c7f Khadija Kamran    2023-08-23  1313  void security_bprm_committing_creds(const struct linux_binprm *bprm)
20510f2f4e2dab James Morris      2007-10-16  1314  {
f25fce3e8f1f15 Casey Schaufler   2015-05-02  1315  	call_void_hook(bprm_committing_creds, bprm);
20510f2f4e2dab James Morris      2007-10-16  1316  }
20510f2f4e2dab James Morris      2007-10-16  1317  
1661372c912d19 Paul Moore        2023-02-07  1318  /**
1661372c912d19 Paul Moore        2023-02-07  1319   * security_bprm_committed_creds() - Tidy up after cred install during exec()
1661372c912d19 Paul Moore        2023-02-07  1320   * @bprm: binary program information
1661372c912d19 Paul Moore        2023-02-07  1321   *
1661372c912d19 Paul Moore        2023-02-07  1322   * Tidy up after the installation of the new security attributes of a process
1661372c912d19 Paul Moore        2023-02-07  1323   * being transformed by an execve operation.  The new credentials have, by this
1661372c912d19 Paul Moore        2023-02-07  1324   * point, been set to @current->cred.  @bprm points to the linux_binprm
1661372c912d19 Paul Moore        2023-02-07  1325   * structure.  This hook is a good place to perform state changes on the
1661372c912d19 Paul Moore        2023-02-07  1326   * process such as clearing out non-inheritable signal state.  This is called
1661372c912d19 Paul Moore        2023-02-07  1327   * immediately after commit_creds().
1661372c912d19 Paul Moore        2023-02-07  1328   */
a721f7b8c3548e Khadija Kamran    2023-08-23  1329  void security_bprm_committed_creds(const struct linux_binprm *bprm)
20510f2f4e2dab James Morris      2007-10-16  1330  {
f25fce3e8f1f15 Casey Schaufler   2015-05-02  1331  	call_void_hook(bprm_committed_creds, bprm);
20510f2f4e2dab James Morris      2007-10-16  1332  }
20510f2f4e2dab James Morris      2007-10-16  1333  
d80a8f1b58c2bc David Howells     2023-08-08  1334  /**
d80a8f1b58c2bc David Howells     2023-08-08  1335   * security_fs_context_submount() - Initialise fc->security
d80a8f1b58c2bc David Howells     2023-08-08  1336   * @fc: new filesystem context
d80a8f1b58c2bc David Howells     2023-08-08  1337   * @reference: dentry reference for submount/remount
d80a8f1b58c2bc David Howells     2023-08-08  1338   *
d80a8f1b58c2bc David Howells     2023-08-08  1339   * Fill out the ->security field for a new fs_context.
d80a8f1b58c2bc David Howells     2023-08-08  1340   *
d80a8f1b58c2bc David Howells     2023-08-08  1341   * Return: Returns 0 on success or negative error code on failure.
d80a8f1b58c2bc David Howells     2023-08-08  1342   */
d80a8f1b58c2bc David Howells     2023-08-08  1343  int security_fs_context_submount(struct fs_context *fc, struct super_block *reference)
d80a8f1b58c2bc David Howells     2023-08-08  1344  {
260017f31a8c38 Ondrej Mosnacek   2024-01-30  1345  	return call_int_hook(fs_context_submount, fc, reference);
d80a8f1b58c2bc David Howells     2023-08-08  1346  }
d80a8f1b58c2bc David Howells     2023-08-08  1347  
36819f185590c1 Paul Moore        2023-02-07  1348  /**
36819f185590c1 Paul Moore        2023-02-07  1349   * security_fs_context_dup() - Duplicate a fs_context LSM blob
36819f185590c1 Paul Moore        2023-02-07  1350   * @fc: destination filesystem context
36819f185590c1 Paul Moore        2023-02-07  1351   * @src_fc: source filesystem context
36819f185590c1 Paul Moore        2023-02-07  1352   *
36819f185590c1 Paul Moore        2023-02-07  1353   * Allocate and attach a security structure to sc->security.  This pointer is
36819f185590c1 Paul Moore        2023-02-07  1354   * initialised to NULL by the caller.  @fc indicates the new filesystem context.
36819f185590c1 Paul Moore        2023-02-07  1355   * @src_fc indicates the original filesystem context.
36819f185590c1 Paul Moore        2023-02-07  1356   *
36819f185590c1 Paul Moore        2023-02-07  1357   * Return: Returns 0 on success or a negative error code on failure.
36819f185590c1 Paul Moore        2023-02-07  1358   */
0b52075ee62301 Al Viro           2018-12-23  1359  int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc)
0b52075ee62301 Al Viro           2018-12-23  1360  {
260017f31a8c38 Ondrej Mosnacek   2024-01-30  1361  	return call_int_hook(fs_context_dup, fc, src_fc);
0b52075ee62301 Al Viro           2018-12-23  1362  }
0b52075ee62301 Al Viro           2018-12-23  1363  
36819f185590c1 Paul Moore        2023-02-07  1364  /**
36819f185590c1 Paul Moore        2023-02-07  1365   * security_fs_context_parse_param() - Configure a filesystem context
36819f185590c1 Paul Moore        2023-02-07  1366   * @fc: filesystem context
36819f185590c1 Paul Moore        2023-02-07  1367   * @param: filesystem parameter
36819f185590c1 Paul Moore        2023-02-07  1368   *
36819f185590c1 Paul Moore        2023-02-07  1369   * Userspace provided a parameter to configure a superblock.  The LSM can
36819f185590c1 Paul Moore        2023-02-07  1370   * consume the parameter or return it to the caller for use elsewhere.
36819f185590c1 Paul Moore        2023-02-07  1371   *
36819f185590c1 Paul Moore        2023-02-07  1372   * Return: If the parameter is used by the LSM it should return 0, if it is
36819f185590c1 Paul Moore        2023-02-07  1373   *         returned to the caller -ENOPARAM is returned, otherwise a negative
36819f185590c1 Paul Moore        2023-02-07  1374   *         error code is returned.
36819f185590c1 Paul Moore        2023-02-07  1375   */
ecff30575b5ad0 Casey Schaufler   2022-01-27  1376  int security_fs_context_parse_param(struct fs_context *fc,
ecff30575b5ad0 Casey Schaufler   2022-01-27  1377  				    struct fs_parameter *param)
da2441fdffbf76 David Howells     2018-11-01  1378  {
06bb8ee5513610 kpsingh           2024-04-26 @1379  	int trc = LSM_RET_DEFAULT(fs_context_parse_param);
ecff30575b5ad0 Casey Schaufler   2022-01-27  1380  	int rc = -ENOPARAM;
ecff30575b5ad0 Casey Schaufler   2022-01-27  1381  
06bb8ee5513610 kpsingh           2024-04-26  1382  	lsm_for_each_hook(fs_context_parse_param, trc, {
ecff30575b5ad0 Casey Schaufler   2022-01-27  1383  		if (trc == 0)
ecff30575b5ad0 Casey Schaufler   2022-01-27  1384  			rc = 0;
ecff30575b5ad0 Casey Schaufler   2022-01-27  1385  		else if (trc != -ENOPARAM)
ecff30575b5ad0 Casey Schaufler   2022-01-27  1386  			return trc;
06bb8ee5513610 kpsingh           2024-04-26  1387  	}, fc, param);
06bb8ee5513610 kpsingh           2024-04-26  1388  
ecff30575b5ad0 Casey Schaufler   2022-01-27  1389  	return rc;
da2441fdffbf76 David Howells     2018-11-01  1390  }
da2441fdffbf76 David Howells     2018-11-01  1391  

:::::: The code at line 1219 was first introduced by commit
:::::: b1d9e6b0646d0e5ee5d9050bd236b6c65d66faef LSM: Switch to lists of hooks

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: James Morris <james.l.morris@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
