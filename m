Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E22D7397
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763060097; cv=none; b=bhx48hwcPYeOg1D5/X/ifwr4FcJik90Z0cO7Rg3qNDtKheZRBtPopG/Nw2qfsEjDA0pywoV2ZhBjaykzxRKE2ORrhZR/rcpFmIqlUSkO/5OFDK/GTSAB81+6lCHaYMsv712ramwlb9lVx06Q2HVROi3UugH7OTJ/ks/K3Lmomms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763060097; c=relaxed/simple;
	bh=H1dKyJ3XxIiallIOjA48V0yoMQ3V1SPBaVVwNXDVo1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7nL8ReX/Di6KZfV6rv0R/bUFIKPnWOi1FZsDT7LnDbXDGgOQ/47WIV0w2BAgWxY5c+kSZLRLfNXkSuY/6y2FltG7k/qi5mBrmqTBU9SsonpMn3YgAONx5arzb0TEN5yU8MgYvU9eA9hG0zQBC0UEBqtM+BgCH4S6SGygc1mUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0ctsqI0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0ctsqI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763060095; x=1794596095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H1dKyJ3XxIiallIOjA48V0yoMQ3V1SPBaVVwNXDVo1g=;
  b=E0ctsqI0goyXYd8qhHfCJJ5hmKYJmPDM27xjNA1idhWCjfk7jIew+Pgk
   SrecdMRSvOrmnHhlCi5ptuSaE3JwDFlaawBk3dMr4AQ/gi1jMIowsKbbB
   8zPn6ExKBCpkk4Xr1g3r31QEoD3y5n3cBamgZomZF+l6MJxSfHE0JtpI/
   NGvz7Rp8So2A7hiZYR8bEyCyEA4+zBZHfCr16gD8a7J2IMCnYNxi0qiqZ
   2DtlomuZYq3kcodXgdjoun4NVWoCK5/fZujbBl6RSLBVjuU5CYT21I760
   F8y7XttBHWOu1ThEL6Sjr2NdLQKtZhCoFnNOJFZz73BAe4j05+UXsesFN
   g==;
X-CSE-ConnectionGUID: jWTAhqnoTQyi6lBJdNIYRQ==
X-CSE-MsgGUID: a911/xCMQcydUVXQd9d+BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65182675"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65182675"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 10:54:55 -0800
X-CSE-ConnectionGUID: VkjfDZfvTOGz2vjFZqYWdA==
X-CSE-MsgGUID: rdPSg3tuQNSC7Z2VDMH4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="190348736"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 10:54:54 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJcT5-0005lh-21;
	Thu, 13 Nov 2025 18:54:51 +0000
Date: Fri, 14 Nov 2025 02:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/8] PCI/IDE: Add Address Association Register setup
 for downstream MMIO
Message-ID: <202511140256.InMiHWYq-lkp@intel.com>
References: <20251113021446.436830-5-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113021446.436830-5-dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on a4438f06b1db15ce3d831ce82b8767665638aa2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/drivers-virt-Drop-VIRT_DRIVERS-build-dependency/20251113-102117
base:   a4438f06b1db15ce3d831ce82b8767665638aa2a
patch link:    https://lore.kernel.org/r/20251113021446.436830-5-dan.j.williams%40intel.com
patch subject: [PATCH v2 4/8] PCI/IDE: Add Address Association Register setup for downstream MMIO
config: i386-randconfig-012-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140256.InMiHWYq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140256.InMiHWYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140256.InMiHWYq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/pci/ide.c: In function 'mem_assoc_to_regs.constprop':
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_537' declared with attribute error: FIELD_GET: type of reg too small for mask
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pci/ide.c:425:34: note: in expansion of macro 'FIELD_GET'
     425 |         regs->addr[idx].assoc2 = FIELD_GET(SEL_ADDR_UPPER, region->end);
         |                                  ^~~~~~~~~


vim +/__compiletime_assert_537 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
