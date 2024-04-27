Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BB41A92
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714213655; cv=none; b=pRXv7XhsaAOM/z3G9HjhL55T3PUIKSBjgcIzOnfK6Qh+siwObnG0VuDdUPFGhSfaYYtkr8x+nm3zegrz2L2lUazvWGCE6v6nFaHW/FoyMlP3BDvcsdToK6TB7YOg3G4w76oHKAaIR/xT/igD91e4CP60LnfTzib1Sk7C530y1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714213655; c=relaxed/simple;
	bh=Gwu/xFtwUUDk7SY++0vHCYrdYnm5poss/pjBD1ZWCFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXxrglLmN5azxaXtXc2/7lARSGUPD6KkLY0iU8P0Db4mJiwH9CFqWNQpFw9yBPsvzg2uAoc3qDTzIhAcDBX0mHwlzu5lIKSLfIg9jUCln36MbBFfKowiqv1tajyGnTKRKsD919ldidHNlzQG50RF2unPNZsJW1y6aocS0b9WTqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdYJm5Zl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdYJm5Zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714213653; x=1745749653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gwu/xFtwUUDk7SY++0vHCYrdYnm5poss/pjBD1ZWCFQ=;
  b=RdYJm5ZlQkPjvVgfObbUflMN4kI2ybE4K13DID9DFd56l2KTifH334AM
   1X2CGYzYiAT/AJ5Imzb1uvVmcxW+8y1A5SX96nNbCyxLX2L6ST2YXliq+
   vSVsG7axJ8pMEZ5UbQ6WogjPn3CgdQHAjmEDWGW8sMCswatWJ/sCD2krX
   AGlhAi07JuZGnN/mb5g0NOclUoNNpvztnagxUr42lnhnljaziosv4IUsJ
   4N71EK4C3FEiVHndwGOXZh+9SwTkQC5OuYgls4a94+MNT+yjTiypFVFGD
   elkmqk6bZm2Y65Qr16AkyTTImFXpoUDmIdFz1ijP8miDAzjlbxl+p1JAf
   Q==;
X-CSE-ConnectionGUID: VpxghFJVQlatsP44B67Mew==
X-CSE-MsgGUID: 1cjRyG/CQJib5Q990UZVIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13774220"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="13774220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 03:27:32 -0700
X-CSE-ConnectionGUID: tkyq+Qh9ReKsXE9XDIegVA==
X-CSE-MsgGUID: W2NN8STpS3qDiV25Y3vLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="30466008"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2024 03:27:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0fHD-0004sQ-1l;
	Sat, 27 Apr 2024 10:27:27 +0000
Date: Sat, 27 Apr 2024 18:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: KP Singh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>,
	Kees Cook <keescook@chromium.org>
Subject: [kpsingh:static_calls 3/4] include/linux/lsm_count.h:103:59: error:
 expected expression before '...' token
Message-ID: <202404271857.DbtTvMCO-lkp@intel.com>
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
commit: 2882213a96f2dfd572afdc46a9238e7b1cf88eb7 [3/4] security: Replace indirect LSM hook calls with static calls
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240427/202404271857.DbtTvMCO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271857.DbtTvMCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271857.DbtTvMCO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:5,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from include/linux/sched.h:16,
                    from include/linux/audit.h:12,
                    from security/commoncap.c:6:
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:29:1: note: in expansion of macro 'LSM_HOOK'
      29 | LSM_HOOK(int, 0, binder_set_context_mgr, const struct cred *mgr)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:30:1: note: in expansion of macro 'LSM_HOOK'
      30 | LSM_HOOK(int, 0, binder_transaction, const struct cred *from,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:32:1: note: in expansion of macro 'LSM_HOOK'
      32 | LSM_HOOK(int, 0, binder_transfer_binder, const struct cred *from,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:34:1: note: in expansion of macro 'LSM_HOOK'
      34 | LSM_HOOK(int, 0, binder_transfer_file, const struct cred *from,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:36:1: note: in expansion of macro 'LSM_HOOK'
      36 | LSM_HOOK(int, 0, ptrace_access_check, struct task_struct *child,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:38:1: note: in expansion of macro 'LSM_HOOK'
      38 | LSM_HOOK(int, 0, ptrace_traceme, struct task_struct *parent)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:39:1: note: in expansion of macro 'LSM_HOOK'
      39 | LSM_HOOK(int, 0, capget, const struct task_struct *target, kernel_cap_t *effective,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:41:1: note: in expansion of macro 'LSM_HOOK'
      41 | LSM_HOOK(int, 0, capset, struct cred *new, const struct cred *old,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:44:1: note: in expansion of macro 'LSM_HOOK'
      44 | LSM_HOOK(int, 0, capable, const struct cred *cred, struct user_namespace *ns,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:46:1: note: in expansion of macro 'LSM_HOOK'
      46 | LSM_HOOK(int, 0, quotactl, int cmds, int type, int id, const struct super_block *sb)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:47:1: note: in expansion of macro 'LSM_HOOK'
      47 | LSM_HOOK(int, 0, quota_on, struct dentry *dentry)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:48:1: note: in expansion of macro 'LSM_HOOK'
      48 | LSM_HOOK(int, 0, syslog, int type)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:49:1: note: in expansion of macro 'LSM_HOOK'
      49 | LSM_HOOK(int, 0, settime, const struct timespec64 *ts,
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:51:1: note: in expansion of macro 'LSM_HOOK'
      51 | LSM_HOOK(int, 1, vm_enough_memory, struct mm_struct *mm, long pages)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:52:1: note: in expansion of macro 'LSM_HOOK'
      52 | LSM_HOOK(int, 0, bprm_creds_for_exec, struct linux_binprm *bprm)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:53:1: note: in expansion of macro 'LSM_HOOK'
      53 | LSM_HOOK(int, 0, bprm_creds_from_file, struct linux_binprm *bprm, const struct file *file)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:54:1: note: in expansion of macro 'LSM_HOOK'
      54 | LSM_HOOK(int, 0, bprm_check_security, struct linux_binprm *bprm)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:55:1: note: in expansion of macro 'LSM_HOOK'
      55 | LSM_HOOK(void, LSM_RET_VOID, bprm_committing_creds, const struct linux_binprm *bprm)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:56:1: note: in expansion of macro 'LSM_HOOK'
      56 | LSM_HOOK(void, LSM_RET_VOID, bprm_committed_creds, const struct linux_binprm *bprm)
         | ^~~~~~~~
>> include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:57:1: note: in expansion of macro 'LSM_HOOK'
      57 | LSM_HOOK(int, 0, fs_context_submount, struct fs_context *fc, struct super_block *reference)
         | ^~~~~~~~
   include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:58:1: note: in expansion of macro 'LSM_HOOK'
      58 | LSM_HOOK(int, 0, fs_context_dup, struct fs_context *fc,
         | ^~~~~~~~
   include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:60:1: note: in expansion of macro 'LSM_HOOK'
      60 | LSM_HOOK(int, -ENOPARAM, fs_context_parse_param, struct fs_context *fc,
         | ^~~~~~~~
   include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
         |                                             ^~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:62:1: note: in expansion of macro 'LSM_HOOK'
      62 | LSM_HOOK(int, 0, sb_alloc_security, struct super_block *sb)
         | ^~~~~~~~
   include/linux/lsm_count.h:103:59: error: expected expression before '...' token
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                                           ^~~
   include/linux/args.h:21:87: note: in definition of macro '__COUNT_ARGS'
      21 | #define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
         |                                                                                       ^~
   include/linux/lsm_count.h:103:44: note: in expansion of macro 'COUNT_ARGS'
     103 | #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
         |                                            ^~~~~~~~~~
   include/linux/lsm_count.h:104:29: note: in expansion of macro '__COUNT_LSMS'
     104 | #define COUNT_LSMS(args...) __COUNT_LSMS(args)
         |                             ^~~~~~~~~~~~
   include/linux/lsm_count.h:107:9: note: in expansion of macro 'COUNT_LSMS'
     107 |         COUNT_LSMS(                     \
         |         ^~~~~~~~~~
   include/linux/lsm_hooks.h:88:45: note: in expansion of macro 'MAX_LSM_COUNT'
      88 |                 struct lsm_static_call NAME[MAX_LSM_COUNT];
..


vim +103 include/linux/lsm_count.h

5b632c6e0372b36 KP Singh 2023-11-10   98  
5b632c6e0372b36 KP Singh 2023-11-10   99  /*
5b632c6e0372b36 KP Singh 2023-11-10  100   *  There is a trailing comma that we need to be accounted for. This is done by
5b632c6e0372b36 KP Singh 2023-11-10  101   *  using a skipped argument in __COUNT_LSMS
5b632c6e0372b36 KP Singh 2023-11-10  102   */
5b632c6e0372b36 KP Singh 2023-11-10 @103  #define __COUNT_LSMS(skipped_arg, args...) COUNT_ARGS(args...)
5b632c6e0372b36 KP Singh 2023-11-10  104  #define COUNT_LSMS(args...) __COUNT_LSMS(args)
5b632c6e0372b36 KP Singh 2023-11-10  105  

:::::: The code at line 103 was first introduced by commit
:::::: 5b632c6e0372b367164faa875a9537aa1932a4e3 security: Count the LSMs enabled at compile time

:::::: TO: KP Singh <kpsingh@kernel.org>
:::::: CC: kpsingh <kpsingh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
