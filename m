Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0A15F3FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737400250; cv=none; b=GyhUusUA4BTJOOMtr7pu/VBVyenJv39EnYOas9SwQcKZ5T5380AlU5zrPF7FOPCNszn/zGINoVf/4ObneXwZ4HVfhpUbldDrp9D4FpS6cQZoDiJvDbkCMwdC7LIaakTWNu8N78s5Bk79Krm/oZRb4iMNK9csIPH8xGX5cx3TsO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737400250; c=relaxed/simple;
	bh=Q7zEV/z+YOHZSQ6Gf3rl6VsO30pKTCsqPqTa1DixeVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1lS53P2wj06uGYKainjpEVZh7xXbFtXzlsHgfNXBAyXA3uEXpu2HDRCOfejyxq4AFY1R7uTsb+Ee1r4z8qOW2h5erPgVI7fxwb7/BK6TK5U6pLtDe20JUR47mFmRwSSXFErPvO3n2Zy4IeKAX7trpvaHlcFkYWtuoevqk85QmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj4qmn6/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj4qmn6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737400249; x=1768936249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7zEV/z+YOHZSQ6Gf3rl6VsO30pKTCsqPqTa1DixeVE=;
  b=Tj4qmn6/2ZnKHNAg2xZ20oAUsyd5MB4AjRH+g3D/MSjHyUBFf1l8xu70
   FzbRE8hQK4R/d9at+gxVNrMCbfBeZam/aeiWHJoJywMSGKwWo83xoq5zz
   Hl7vwTs2T5w+xcW/aTwrVgaQdhfz6KZ/JqJ2KUqgKdarJ3nKq3up/EYdC
   Brxr5T38a9FjrOFNNq3sHYg5i9hNVTHHh6ZfiW2WpygeAoVbx2w6bpRSE
   I2EjCcXdVsp1NoIlRLCM6X6iz/v3hPHTIlncw7xM7LpdDCGEdl8cZKlKx
   rKEaWQfOddXE7xPvZqkysCegxnb/oRoqjFKSq2NmeOgpMf1WWcO76OMqU
   Q==;
X-CSE-ConnectionGUID: NCJSQmQeRHKxGnwUJYCiiA==
X-CSE-MsgGUID: vMHcJGGKSJ27GNewHeSdGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37496904"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37496904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 11:10:48 -0800
X-CSE-ConnectionGUID: xp1uPkosSkGhXZA2/0U9sA==
X-CSE-MsgGUID: 59HBYYsRRlGLGECi8T6Lvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107033687"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jan 2025 11:10:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZxAa-000Wtz-0H;
	Mon, 20 Jan 2025 19:10:44 +0000
Date: Tue, 21 Jan 2025 03:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(union avs_virtual_index) == 1"
Message-ID: <202501210328.uLkWI3Hv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amadeusz,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: c2b10acb62c195db2c976d614d9d8092ad6339ae ASoC: Intel: avs: Add assert_static to guarantee ABI sizes
date:   10 months ago
config: arm-randconfig-004-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210328.uLkWI3Hv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210328.uLkWI3Hv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210328.uLkWI3Hv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:8,
                    from sound/soc/intel/avs/loader.c:9:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(union avs_virtual_index) == 1"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   sound/soc/intel/avs/messages.h:752:1: note: in expansion of macro 'static_assert'
     752 | static_assert(sizeof(union avs_virtual_index) == 1);
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
