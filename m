Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040E22DF83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577565; cv=none; b=Ux+JqGR13M8W8d8qSzqyUmRvlSH8v4lzjDrUrR2BfAvt29gTL0WdLIq/FeosD8l8n98llgBBU34sJQN5CJDU0HXdMh4/LEaItSPccCDV+K7jXf4kSTUQI9er6ODVmBbeJisAE5Xp3bzYJ1AFjTp4fI/mil5TD283N75dxuqoDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577565; c=relaxed/simple;
	bh=zXhHLtsC4zG/YUavuyZmsJupi0VNGo0Lfu9Nt+OtFaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBZNuRb6fPpT2RNFE9xb6T++PYb5Plxs8W9AlLDC1LMA8ZCNznMSm8p91gqZhwOOvInWwVRPrZHVX3TUJPCyWpuZgs/NkSGpgmSBztx51dEtKe/7DEovCPY8O+jgPXlsYbq7+XcifEmeeD0iB52vcBXPnb8EXu/eRdJIPXL2K9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euFikx0J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euFikx0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742577563; x=1774113563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXhHLtsC4zG/YUavuyZmsJupi0VNGo0Lfu9Nt+OtFaM=;
  b=euFikx0JXakdWzMkIZpjXaG6azdcrlVQ5ECi7Ck2sTyjX7RoEssQsD/8
   I2cVeM3DzorBFFWexSDTnQfQGE22FTpM6n+dd8dXeWu48z66lvsxb7O/f
   ALPN1P2uDhQlXj/atISejIEJ2V8dbpE+Bs8dzqz4MSB+yVKVZ+5U1GHAE
   qAA891slYm5cnVsL60uscfQyN+uNjqDwa+bCHGqgy7Itb5BkPoWJ9oIc3
   CAAnkd9UmjqBHPwN+67JJ2fwo7U7J2eHyCdogdoL/j7qCS/WbPxfZAAsy
   atJkAM7lXh/k5S1wtAM7ZrgmceYS3QN1Nh4xcFZ9pJWbj5gmRsG5o22PX
   g==;
X-CSE-ConnectionGUID: JBuqNby6TtKVmyXu/orY0w==
X-CSE-MsgGUID: w+7YnBheSHSxoRVhQJcSsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54065515"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="54065515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 10:19:22 -0700
X-CSE-ConnectionGUID: zkqWA7NeQn2/o13aJoN1sA==
X-CSE-MsgGUID: 43NZvZyPQuKbPjW7GPugOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123261981"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2025 10:19:20 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvg1e-0001XT-2K;
	Fri, 21 Mar 2025 17:19:18 +0000
Date: Sat, 22 Mar 2025 01:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:gregkh-rust 1/1] Diff in drivers/greybus/gregkh_hack.rs
 at line 5:
Message-ID: <202503220134.8TKc76Zf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git gregkh-rust
head:   de02bd98ce95437ae810960cbfb9d500b2b5bb46
commit: de02bd98ce95437ae810960cbfb9d500b2b5bb46 [1/1] gregkh_hack.rs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250322/202503220134.8TKc76Zf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220134.8TKc76Zf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220134.8TKc76Zf-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/greybus/gregkh_hack.rs at line 5:
    //!
    //!
    
   -use kernel::prelude::*;
    use kernel::pr_info;
   +use kernel::prelude::*;
    
    module! {
        type:       GregKHHackModule,
   make[2]: *** [Makefile:1816: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
