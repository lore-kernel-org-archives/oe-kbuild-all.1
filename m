Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9991A0AF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732548066; cv=none; b=Oi9Y+WyzjsSZqx+cVLpFCs4BO/mUhEijzkxVKw1F/wnbHBnyKKvEkPjf86YPJIcVyi1E5b28ovu7X7FUiinVdAN18I6c03bMVHJMThmf7l541HB7Ql0oDIWXb+hqHKRbqgvpFwMwLCl/cfHacahlT1KqJLhCs9rl3VN4O4Zdbvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732548066; c=relaxed/simple;
	bh=mZ7UmNGbQH6LAVjtDpB+Pzdf5fPMUu96wEc0ilJxwmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etEngNNjPBTLAZhepggfnukFttWGvTEM4SD1+oK6SlfQKSLz2aV7Zo8J47e7E8OKncgM/gr/TzglsN8MSNOXya4GgaFZrVXeHm4uc+zdp028UsdLEH67PC6lG4TsC4yjn+jAItkaGnGzIvPldnNpQ328ytjZGfzF4lYPD0tVmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMtKi5wv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMtKi5wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732548064; x=1764084064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZ7UmNGbQH6LAVjtDpB+Pzdf5fPMUu96wEc0ilJxwmU=;
  b=SMtKi5wvGGIFeSvRoC/MKXK0uBmPcFxOggr6aIq37+jsWpQqPZi3/F/f
   IjgoHtinU8wjFx6n3dNBVrDv20lBEe0T2m5Rxs5xWJAdqH2uPopFXn/2E
   6SHz5CqZpqcG7cSX2Zj15Pi4p5I+jxY9UAHFNYsDu8cT/S5SBKvfB+0Ge
   V1s8zUho7et0Hm8Uk8I9WKx0vymmz+mUT/A5HLmG5LjHg2B78QK0MZtKU
   ezXmUnYgma9p9WWa9pdf00qifDciNKx4s86Lgqm+rUdIU4iJl8iQ08sgM
   9wIgVz5AeQWFpLzufgfEpbWhO0s4wRmtUFj9Jy2njgEabeuLvHuQga/Yy
   w==;
X-CSE-ConnectionGUID: NNgpAsiNQ32xu/2rXMFwLg==
X-CSE-MsgGUID: VVnq3OuDR4u8FTgQuBaO6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32519459"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32519459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 07:21:04 -0800
X-CSE-ConnectionGUID: sVADAHU8QgqfFugyvPMIEw==
X-CSE-MsgGUID: lELuTLA4QWWJGKKm8SesxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="96361315"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2024 07:21:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFatZ-0006Xl-17;
	Mon, 25 Nov 2024 15:21:01 +0000
Date: Mon, 25 Nov 2024 23:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Makefile:63: warning: overriding recipe for target 'emit_tests'
Message-ID: <202411252319.jeYGwDJ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 58b33e78a31782ffe25d404d5eba9a45fe636e27 selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
date:   1 year, 2 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252319.jeYGwDJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252319.jeYGwDJ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Makefile:63: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:145: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets specified and no makefile found.  Stop.


vim +/emit_tests +63 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  59  
066b7ed9558087 Michal Marek    2014-07-04  60  # Beautify output
066b7ed9558087 Michal Marek    2014-07-04  61  # ---------------------------------------------------------------------------
066b7ed9558087 Michal Marek    2014-07-04  62  #
8962b6b475bddc Masahiro Yamada 2022-12-23 @63  # Most of build commands in Kbuild start with "cmd_". You can optionally define
8962b6b475bddc Masahiro Yamada 2022-12-23  64  # "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
8962b6b475bddc Masahiro Yamada 2022-12-23  65  # that command is printed by default.
066b7ed9558087 Michal Marek    2014-07-04  66  #
8962b6b475bddc Masahiro Yamada 2022-12-23  67  # e.g.)
8962b6b475bddc Masahiro Yamada 2022-12-23  68  #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
8962b6b475bddc Masahiro Yamada 2022-12-23  69  #          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
066b7ed9558087 Michal Marek    2014-07-04  70  #
066b7ed9558087 Michal Marek    2014-07-04  71  # A simple variant is to prefix commands with $(Q) - that's useful
066b7ed9558087 Michal Marek    2014-07-04  72  # for commands that shall be hidden in non-verbose mode.
066b7ed9558087 Michal Marek    2014-07-04  73  #
8962b6b475bddc Masahiro Yamada 2022-12-23  74  #    $(Q)$(MAKE) $(build)=scripts/basic
066b7ed9558087 Michal Marek    2014-07-04  75  #
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  76  # If KBUILD_VERBOSE contains 1, the whole command is echoed.
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  77  # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
066b7ed9558087 Michal Marek    2014-07-04  78  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  # To put more focus on warnings, be less verbose as default
^1da177e4c3f41 Linus Torvalds  2005-04-16  80  # Use 'make V=1' to see the full commands
^1da177e4c3f41 Linus Torvalds  2005-04-16  81  

:::::: The code at line 63 was first introduced by commit
:::::: 8962b6b475bddc011c414f40ffd02f0ed4e02771 kbuild: print short log in addition to the whole command with V=1

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
