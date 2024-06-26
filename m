Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97615C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719361257; cv=none; b=l77paKxVg4TkrEjGNzZQtXY9l7Cetr4jWUvOOz/GTGmiCkfVuk4ducAqmM9yE8E7AxNZnwDF/vvfMMCaU9l4Ct+SpriE+Rr86eo+F7cylKz3LN2N+OsZuCtbO45vsVlrYnDoFQ0Bi4mbHAyFbZTgauU+DqC+RBZ1wCok/Y1WrfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719361257; c=relaxed/simple;
	bh=CJoeJ3lDkHIZ/KHxL11f+1YMStkAQJV5OkhkWjkbJqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha3XO5FRvzp8wjYg9O8+fzTKwcz37OisXZU7hRs6HYeAvW0V8Io328O5s3hS76zklY1VoFzPLbXdzEUyVUN39P/vZVDO7vZfNCtW01x7C80YTtWhsIhWYHa8v5T6ZwKV9ptau7VJ0Eo+fesoCAqPy4gXpEkFJNOnSLgXXbsCIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCbLNG7r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCbLNG7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719361256; x=1750897256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CJoeJ3lDkHIZ/KHxL11f+1YMStkAQJV5OkhkWjkbJqs=;
  b=hCbLNG7rJHGtAldP3Hb2HDZ2tMfiOTYe3FyLDL0q6+8d/nlEQ4BU/xtS
   qYSIOXMIQNnylmiT4s3DOIg16OxJNZQyRgPepgPuSjhaF2ydGjozMI7DS
   3L1/aHBA5dIW4h9Dc2PgmUxhRZgmvNI/HXW0XMwRJYgDr71BDEgoUPD8/
   ejaUxsxzA6/MHGRKURE4TazzFNGzNN6ZFuD7u/v7T885uZZlut8+xsiMW
   nq0DbZWEWr8AulKv9lVBZvaA0gg+o82eKvJSm3vetV39QXhNCWY5Cu0Yk
   aIwoJK9vxs4rqJhMGIGYrn59cO4VUCJbexRIID6I6BkXB1Xl90mNY5Gvg
   w==;
X-CSE-ConnectionGUID: xzL8fHzrRSSCZxa8uRYTkw==
X-CSE-MsgGUID: WZLKSCP1SlGcx0C6g4xt1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16286875"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16286875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:20:55 -0700
X-CSE-ConnectionGUID: heJN9hlgR2G0rFKXw5HwKA==
X-CSE-MsgGUID: 9LOxIo6XQtC8ns/GYnSnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="43793764"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2024 17:20:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMGP6-000Epc-1F;
	Wed, 26 Jun 2024 00:20:52 +0000
Date: Wed, 26 Jun 2024 08:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: daire.mcnamara@microchip.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <202406260846.ybHvD2P1-lkp@intel.com>
References: <20240621112915.3434402-3-daire.mcnamara@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621112915.3434402-3-daire.mcnamara@microchip.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/daire-mcnamara-microchip-com/PCI-microchip-Fix-outbound-address-translation-tables/20240625-161731
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240621112915.3434402-3-daire.mcnamara%40microchip.com
patch subject: [PATCH v4 2/3] PCI: microchip: Fix inbound address translation tables
config: i386-buildonly-randconfig-004-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260846.ybHvD2P1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260846.ybHvD2P1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260846.ybHvD2P1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/kernel.h:15,
                    from include/linux/clk.h:13,
                    from drivers/pci/controller/pcie-microchip-host.c:11:
   drivers/pci/controller/pcie-microchip-host.c: In function 'mc_pcie_setup_inbound_ranges':
   include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:46:41: note: in expansion of macro '_AC'
      46 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   drivers/pci/controller/pcie-microchip-host.c:1000:60: note: in expansion of macro 'SZ_4G'
    1000 |                         mc_pcie_setup_inbound_atr(0, 0, 0, SZ_4G);
         |                                                            ^~~~~
   In file included from <command-line>:
   In function 'mc_pcie_setup_inbound_atr',
       inlined from 'mc_pcie_setup_inbound_ranges' at drivers/pci/controller/pcie-microchip-host.c:1000:4,
       inlined from 'mc_platform_init' at drivers/pci/controller/pcie-microchip-host.c:1212:8:
>> include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_441' declared with attribute error: FIELD_PREP: value too large for the field
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
     441 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-microchip-host.c:949:16: note: in expansion of macro 'FIELD_PREP'
     949 |         val |= FIELD_PREP(ATR_SIZE_MASK, atr_sz);
         |                ^~~~~~~~~~


vim +/__compiletime_assert_441 +460 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  446  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  447  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  448  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  449  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  451   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  452   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  453   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  454   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  455   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  456   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  457   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  458   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  459  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @460  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
