Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561E18E02F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336526; cv=none; b=X2/LM31YE+OJpdMLZ1aH2OvX7OwU75p+d+EJ/+sK9O+9KrXwn7wawk7osetgKW/vF7dHPEf6O6zxaCV08cXR8Z+I3+tj7VWZBlghtSdkrvKCYvLYBR0jk8+UqsjeuDSbwR6xusxYn40yoN/UsghEfu0dqs37pZyoBUdRwZ+ZZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336526; c=relaxed/simple;
	bh=P6A5EEXZ5azTjeRpP9lcYdF5HUq4L0vtEhns+GeWDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/hV9iFkxilRzA6rRg325hG7YDPt8RNQYUUzZp8dyOGNCwhW3Qmknz9mjtQPNZ2PF4PU79nBMrVlZn0MRy82pqijd03eiqqul4GFFHeiGS3Ff74+kAYrOppsEbfjH6MyFX4Cy4vaDXRcT347JDOMqZiCZg8LlAPOSKZRaLwXdLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kq/xmVzk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kq/xmVzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727336525; x=1758872525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6A5EEXZ5azTjeRpP9lcYdF5HUq4L0vtEhns+GeWDZk=;
  b=kq/xmVzkYPjSmhYU9kZ2D7/skb2trhpnuXAZPNqfsaWZgYWRkxYdXLOI
   zjyHDH2JTqqeYelTKyy55rG2sAoloJSHre03pGjgWOICBmfAIYLb8Mwh1
   xE8kRh+Rb7JCi/Dv8PEYAw3oZIKDDJHIeg7s1c6Pu4GScjMid7kSNQJfn
   fUK3mE6M7jtvrXPEP/A9pZFMRm/tZEZVSC8qiIB7AguTfnOrer8QcpV56
   crLpg8epKfRkJZqc5XeUwBbxC7gHBXSM06oa5W3sfqFqBiYnBAOLif48P
   YY3Pk8amE4VnK9IcWhPLmhdup+jolahc2Ee4t1HfJ3yHrD/6ORuYL6GGR
   Q==;
X-CSE-ConnectionGUID: hUHj7EVwSCmBvEvqwExnZA==
X-CSE-MsgGUID: UK8kEN9ZR06HkazfIHcjfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="29306400"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="29306400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 00:42:03 -0700
X-CSE-ConnectionGUID: wXYu5TVeR2qrVK76Lj/3Kw==
X-CSE-MsgGUID: o6jcM7GNQXmUjqDHc8IG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="76551432"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 00:42:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stj8R-000KPT-2g;
	Thu, 26 Sep 2024 07:41:59 +0000
Date: Thu, 26 Sep 2024 15:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 46/47] include/linux/build_bug.h:78:41: error:
 static assertion failed: "!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
 IS_ENABLED(CONFIG_IOMMU_DMA))"
Message-ID: <202409261553.4IRfEiAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 52b502637f663a122417fde5416982e137148c64 [46/47] iommu/sun50i: Ensure the IOMMU can be used for DMA
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409261553.4IRfEiAn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261553.4IRfEiAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261553.4IRfEiAn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/clk.h:13,
                    from include/linux/amba/bus.h:14,
                    from drivers/iommu/iommu.c:9:
   drivers/iommu/iommu.c: In function 'iommu_get_default_domain_type':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && IS_ENABLED(CONFIG_IOMMU_DMA))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1739:17: note: in expansion of macro 'static_assert'
    1739 |                 static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
         |                 ^~~~~~~~~~~~~


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
