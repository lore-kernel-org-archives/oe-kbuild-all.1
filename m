Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD167176AA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739458684; cv=none; b=bxBsfBIzGDf2c+lxtqRKXmaLGB1rX3fg0KlOrorVs4zSVj4FFDM0quHz6QbPHKKiX+6MfcvMMUjqV21w6MMBtfRtgi0iR3PAES5O4ydIaVHSJV+NeNBTKuXNgOI/XYOQwh7yZ/SVMX2+dLb0TTv6de7bgjvcj3bJGtGZqyw70k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739458684; c=relaxed/simple;
	bh=TkE/n/y9WZ10HUnWdZdQD8RLx5nWlhHExPV6JZITyAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNlKbZfDcEY8Lw5XZooBFqgJ20lrwPzWKvILPJGpnQ6IaTLSaPOASuj15Rn1aI8pKsINLFlfn9kpzLygYA9o8Dll2BF9plgNLCQ/0EmsqdkQIhPeYZSAYIaKpN9qHyeqCIzJ2+lkol7X+Pn+O4fxKihT9QAFlcvrEEixAT3fOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8FQpumW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8FQpumW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739458683; x=1770994683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkE/n/y9WZ10HUnWdZdQD8RLx5nWlhHExPV6JZITyAY=;
  b=I8FQpumWij4rTp2vUx4kNR3iIJ260Rdg+oiUa/AIDgBvgfamykX1hS7S
   vm56/REF/TQ5JL+qw1NDQJYm920xGAuPxW+6nknAEYEs0nUvt6IiYROVI
   jtZXrnkSG7vUSWCE+QJn98jJoV/MKxNNiXul2ppc+VZSn/fK0S+Ey3Hq5
   MGqzCg+iFeJ1zGaxtFAtV5ygOcVXxKbZKDkUUsyHKrgtABK5EFiBOmvtN
   671/88RsQ8Fg7G/eMfVHxQxBlHTRSm1geEpS9OUr+5Ea3niQYo2vwkHTb
   gubtLkD5z83S7jg1V4oi0Tmzh5XKclITn5fWMgjyIu2CHobjh5g5Vxpri
   Q==;
X-CSE-ConnectionGUID: sZx5HG9/SQSARWrc0AuMXA==
X-CSE-MsgGUID: WgNyvBEfSpuGwRSKYM1zXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40425240"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40425240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:58:02 -0800
X-CSE-ConnectionGUID: v6PmtIFZSouJY7N4lbTeEg==
X-CSE-MsgGUID: Q9WnRtTMTXWUHxpMPVgOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144111829"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2025 06:58:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiaf8-0017WR-2b;
	Thu, 13 Feb 2025 14:57:58 +0000
Date: Thu, 13 Feb 2025 22:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [peterz-queue:sched/core 1/5] include/linux/compiler.h:55:45: error:
 invalid use of void expression
Message-ID: <202502132216.LCb0y45e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f5e5644f37620a7177ec30bf771fe90926ed9e7a
commit: a776cf5efa44410204ec367cd593ad56b9d3df5e [1/5] sched: Cancel the slice protection of the idle entity
config: csky-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132216.LCb0y45e-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502132216.LCb0y45e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132216.LCb0y45e-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'protect_slice':
   kernel/sched/fair.c:897:18: warning: statement with no effect [-Wunused-value]
     897 |         se->vlag == se->deadline;
         |         ~~~~~~~~~^~~~~~~~~~~~~~~
   In file included from include/linux/cleanup.h:5,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'cancel_protect_slice':
>> include/linux/compiler.h:55:45: error: invalid use of void expression
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/sched/fair.c:902:9: note: in expansion of macro 'if'
     902 |         if (protect_slice(se))
         |         ^~
>> include/linux/compiler.h:55:45: error: invalid use of void expression
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   kernel/sched/fair.c:902:9: note: in expansion of macro 'if'
     902 |         if (protect_slice(se))
         |         ^~
>> include/linux/compiler.h:55:45: error: invalid use of void expression
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/sched/fair.c:902:9: note: in expansion of macro 'if'
     902 |         if (protect_slice(se))
         |         ^~
   kernel/sched/fair.c: In function 'pick_eevdf':
   kernel/sched/fair.c:942:50: error: void value not ignored as it ought to be
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/sched/fair.c:942:9: note: in expansion of macro 'if'
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |         ^~
   kernel/sched/fair.c:942:50: error: void value not ignored as it ought to be
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   kernel/sched/fair.c:942:9: note: in expansion of macro 'if'
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |         ^~
   kernel/sched/fair.c:942:50: error: void value not ignored as it ought to be
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |                                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/sched/fair.c:942:9: note: in expansion of macro 'if'
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |         ^~


vim +55 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  49  
2bcd521a684cc9 Steven Rostedt 2008-11-21  50  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  52   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @55  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  56  

:::::: The code at line 55 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
