Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0711A681B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768791; cv=none; b=hlneo1DuRc8KpNz4VUpfuIQqhUlIpSD7KJ55oddmjDywej/aP8KJz3SBTTE2kbmvFL3DcRpEfHxS0NA6KrMihGHbNkbnFcndQpVK64UhRFDqiS+KxpMnXzjXBGx91YCo3zCQ+uZuwFoNagTXOP94shRVIQuCqvakaskkLOcU3Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768791; c=relaxed/simple;
	bh=9DMdj+lxAK0PyvUwtzn0SS6CKoLBEVzOEwQjkKhaOrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZ++rf6l4820M3xVrWkL1a/Bu99DKOiuf7pH4DdS50Ux513IrHYU+jLyd1UMxsuMXfX2JSSuDItmK2ppbdx7B0MAR8ITqPgThtt1XE3e+WzPjtc6IkTH7BCrcijRKpkqtKu3IRKK5DL5jkBtu2YBF49J/Q+mQ0aQ8kbZWVuABNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KU8WStx6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KU8WStx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777768791; x=1809304791;
  h=date:from:to:cc:subject:message-id;
  bh=9DMdj+lxAK0PyvUwtzn0SS6CKoLBEVzOEwQjkKhaOrk=;
  b=KU8WStx6itC7YLndcIFLE/spRPW6OEopFD4f/vE+rYGWOwXshsEdjs98
   OWlhnfIbRsC99p3zS+RN0AnA/7VxyKNHPcMnDVyJpaJ1H3bPI+H1hbeJN
   SIIrkcU6kqpGUtaLGnMfX5P5F6w+mct/d9gZHUsKxd0zshiEvm1bAVBjB
   RGDBQ53u4FCi3IYvS0vRZn+W8EsHYOfK/omM70uSLvVsSXNYjhwwZ3nAm
   Y8aoYeOlv7KqUWHfUEr3r5KBOSk7ULQDXPqNuCuz8fy6jEakvkRSPRgbQ
   xpIUh3t+voMJG1Mu6SYYtqJQGuVQwkaNdi2v5cMNiZoY7ZtFdjATKkh7K
   Q==;
X-CSE-ConnectionGUID: gW5TclVQT/yqaDrKsawojg==
X-CSE-MsgGUID: lSikc4k5QVuRbXbVqnLq1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78579730"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78579730"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:39:50 -0700
X-CSE-ConnectionGUID: l2Cc0s/zQnSj/1q/ZNLfRA==
X-CSE-MsgGUID: l071KC9xS52TIgqR10TMIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="240180158"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2026 17:39:48 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKs5-000000001xR-2ojV;
	Sun, 03 May 2026 00:39:45 +0000
Date: Sun, 03 May 2026 08:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kvfree-rcu-improvements-rfc-v2r1-wip 1/9]
 include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rcu_head) == sizeof(struct rcu_ptr)"
Message-ID: <202605030815.Ko3pJXtp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v2r1-wip
head:   1e4fd024c798fbeff0b5a3c5f55cdcf710367c59
commit: dd7b7336ad2c3f9589f28e095aed50717e65f0d5 [1/9] mm/slab: introduce k[v]free_rcu() with struct rcu_ptr
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605030815.Ko3pJXtp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030815.Ko3pJXtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030815.Ko3pJXtp-lkp@intel.com/

Note: the harry/kvfree-rcu-improvements-rfc-v2r1-wip HEAD 1e4fd024c798fbeff0b5a3c5f55cdcf710367c59 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/time.h:5,
                    from include/vdso/auxclock.h:5,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
>> include/linux/types.h:257:29: warning: declaration does not declare anything
     257 |         struct callback_head;
         |                             ^
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from arch/mips/include/asm/page.h:14,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/mips/include/asm/vdso.h:10,
                    from arch/mips/include/asm/vdso/vdso.h:15,
                    from arch/mips/include/asm/vdso/gettimeofday.h:16,
                    from include/vdso/datapage.h:196,
                    from lib/vdso/gettimeofday.c:6:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rcu_head) == sizeof(struct rcu_ptr)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1127:1: note: in expansion of macro 'static_assert'
    1127 | static_assert(sizeof(struct rcu_head) == sizeof(struct rcu_ptr));
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c4 Ian Abbott       2017-07-10  60  
6bab69c65013bed Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013bed Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013bed Rasmus Villemoes 2019-03-07  63   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013bed Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013bed Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013bed Rasmus Villemoes 2019-03-07  67   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013bed Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013bed Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013bed Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013bed Rasmus Villemoes 2019-03-07  72   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013bed Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013bed Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013bed Rasmus Villemoes 2019-03-07  76   */
6bab69c65013bed Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013bed Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013bed Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79d Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
