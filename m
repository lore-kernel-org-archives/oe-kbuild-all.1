Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4890F3B18D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712424407; cv=none; b=XgRD5bmiCwd6VtRvrGPs2jnfSaSx3B/d2L+JGkISG/WUP3fQW5iJj1Vjo0DDS/9pKycGBavbfz+9D1MrsrAyp+lJ3x13fOC3NuPWSdqcoWXFCkd6AGclxTLFmtEwf3L71RtA+lNyk3WS7J0LrDGy0clLYNMR/fwPK70L0AzDU4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712424407; c=relaxed/simple;
	bh=g28/b9GyPjXE2Zt2iD3idRN/jLzY8FrnDheCjSpaZjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anhVvM+hbWA8wt/teVBjVufSNotiBXA/IjRo/521wGDmRWfbekhmBEGs2Y4BT1fpjeBSOGbmdUN4f6LBW9bsASRorjAYM2hno/nNquI/Z0hrLcvBFMFwn+udfRzLCDZuLoVCzm7mrC/P9nKjRAHy2YMgqLBjTsn0br7T5IGYtFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKiCdCs6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKiCdCs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712424405; x=1743960405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g28/b9GyPjXE2Zt2iD3idRN/jLzY8FrnDheCjSpaZjo=;
  b=aKiCdCs6w/6v3dJlkUnY1M9RhfjyQwCbwoyFC+sLMzeSMnumeS5P8tOi
   9tVkhb6IzCuaObaTQiI4H2RiDCP7rJM1YaD6ccdZAV6TBe62Th4tZ+iBH
   mpQooyNHC6HI9zpV4Sm/7Xc/FUNKBEOlAwTjrYfm2eeYNudIJ3/P5por2
   K0xsv88nUSJreVaSTsgnIy7xwStC5VjfEf87tPstjIhfISTZtzTmybweg
   eMUj0SvdL2DZJwnbyLTYx9l/1JbDkB0vGppeYAidMAA8+uG+YIuVLi4fD
   8UI6vzql7MbYYQW6a+jR7mKtNkDF91dJ09rccY7kapN2WULzN3Rp6rGe/
   g==;
X-CSE-ConnectionGUID: Oo6Cjg+KT/KRMdoFAic/kA==
X-CSE-MsgGUID: WSUe2HwmTUeWmHQMqLHmQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="18877519"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="18877519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 10:26:45 -0700
X-CSE-ConnectionGUID: S4p7WQMPQcO4K3ne7BC4/g==
X-CSE-MsgGUID: lX28+YCpQV6mKj4+bRCbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="20002777"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2024 10:26:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt9oO-0003ig-2x;
	Sat, 06 Apr 2024 17:26:40 +0000
Date: Sun, 7 Apr 2024 01:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [broonie-sound:for-next 12/16] include/linux/build_bug.h:78:41:
 error: static assertion failed: "sizeof(struct avs_icl_memwnd2) == 65536"
Message-ID: <202404070100.i3t3Jf7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   1f58d8580e5da64669d923ced99cb3e29832273b
commit: c2b10acb62c195db2c976d614d9d8092ad6339ae [12/16] ASoC: Intel: avs: Add assert_static to guarantee ABI sizes
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240407/202404070100.i3t3Jf7d-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070100.i3t3Jf7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070100.i3t3Jf7d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from sound/soc/intel/avs/icl.c:9:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct avs_icl_memwnd2) == 65536"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   sound/soc/intel/avs/icl.c:73:1: note: in expansion of macro 'static_assert'
      73 | static_assert(sizeof(struct avs_icl_memwnd2) == 65536);
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
