Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B93793B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787026415; cv=none; b=aJHEiyMC6O9iMarn+SVhYDbiCDL+qrcZ1QDTd2YhC3350QeT75IuXYPNwvrSWIBu76PDM40ftWxlmH57orlAa2Z1iEKGKLtjByXSMTjRrZ02Cnra4VpaPlJI91dmD1cbC81hXpLx4tA/iMK31HzAz/3sEVBPkxIlTX16GI9t9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787026415; c=relaxed/simple;
	bh=oj19/PjUD2HbgwMUZVEajCzfBR+Mg4+YSgkAeKbfssM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IE3DCp+m8u5A/1uNU3eImIWAm3Uqv6gxhRovVn+PHgfQ4mAovceee74PSSC5EVgYRz3idrDBoz5x1BtL5e/erkJyb1EDM/+Amf1e6stGugF++L1AjZj9Yzm8Ndv0GdYSzSDVTP4SzFCcT5O8aqQiYKDZpu7VhSywxfS7JLOlfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrJgBRoj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrJgBRoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787026414; x=1818562414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oj19/PjUD2HbgwMUZVEajCzfBR+Mg4+YSgkAeKbfssM=;
  b=RrJgBRojmHC1SL5CnlYY8d1xRAQWkHcvnrX7HUgVNBCIMoCZd8OTcPOF
   X2crvk7XGf8XMSFHbEv9efOugnNIJlrhvTwmHLCSo0+v4zbV7OOIYM/8c
   JTZ2VEgGbSis1h4l23gCpWl7W6o1AB2moRe79Ebcy//kz7P5LsnUFPE0X
   Y8VB9a2ah1nfL4AD37NylGs/litdiSyRwtWtl+5gKgr+5/R48p/GVwcq8
   dDidPCJm/8pYr6+jTT2ziswugIBQ+36O7QSycVjta7kOAleNWsv6TNlcY
   IjJSQbkzUMTbdijLGeXWyUySGtbTO2/Fj1VqakErylm8aD/Tz+0GuDO6u
   Q==;
X-CSE-ConnectionGUID: /S9hF5HqQwu3IlYWrG+Z9w==
X-CSE-MsgGUID: bQ9eopJETD66LIOIe5+b7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110293209"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110293209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:13:31 -0700
X-CSE-ConnectionGUID: Jb6s/J2pQlaeinGMA7KLFg==
X-CSE-MsgGUID: rHysTpPHQ3W7a+yUEFkmLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263366834"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 21:13:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBCY-00000000e5m-23Uh;
	Tue, 18 Aug 2026 04:13:26 +0000
Date: Tue, 18 Aug 2026 12:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 16/21]
 kernel/locking/lockdep_internals.h:248:23: error: 'lock_classes' undeclared;
 did you mean 'lock_class'?
Message-ID: <202608181124.s7vzTnUs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 9e99b37a40c36adbf813b758582f9b57aa5e41e3 [16/21] locking/lockdep: Migrate lock_classes array to 2-level dynamic folio chunks
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181124.s7vzTnUs-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181124.s7vzTnUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181124.s7vzTnUs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/locking/lockdep.c:84:
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_inc':
>> kernel/locking/lockdep_internals.h:248:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     248 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep_internals.h:248:23: note: each undeclared identifier is reported only once for each function it appears in
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_read':
   kernel/locking/lockdep_internals.h:257:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     257 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep.c: At top level:
>> kernel/locking/lockdep.c:1188:13: warning: 'in_any_zapped_class_list' defined but not used [-Wunused-function]
    1188 | static bool in_any_zapped_class_list(struct lock_class *class)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/locking/lockdep_proc.c:25:
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_inc':
>> kernel/locking/lockdep_internals.h:248:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     248 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class
   kernel/locking/lockdep_internals.h:248:23: note: each undeclared identifier is reported only once for each function it appears in
   kernel/locking/lockdep_internals.h: In function 'debug_class_ops_read':
   kernel/locking/lockdep_internals.h:257:23: error: 'lock_classes' undeclared (first use in this function); did you mean 'lock_class'?
     257 |         idx = class - lock_classes;
         |                       ^~~~~~~~~~~~
         |                       lock_class


vim +248 kernel/locking/lockdep_internals.h

8ca2b56cd7da98 Waiman Long 2018-10-03  243  
8ca2b56cd7da98 Waiman Long 2018-10-03  244  static inline void debug_class_ops_inc(struct lock_class *class)
8ca2b56cd7da98 Waiman Long 2018-10-03  245  {
8ca2b56cd7da98 Waiman Long 2018-10-03  246  	int idx;
8ca2b56cd7da98 Waiman Long 2018-10-03  247  
8ca2b56cd7da98 Waiman Long 2018-10-03 @248  	idx = class - lock_classes;
8ca2b56cd7da98 Waiman Long 2018-10-03  249  	__debug_atomic_inc(lock_class_ops[idx]);
8ca2b56cd7da98 Waiman Long 2018-10-03  250  }
8ca2b56cd7da98 Waiman Long 2018-10-03  251  

:::::: The code at line 248 was first introduced by commit
:::::: 8ca2b56cd7da98fc8f8d787bb706b9d6c8674a3b locking/lockdep: Make class->ops a percpu counter and move it under CONFIG_DEBUG_LOCKDEP=y

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
