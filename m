Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03BE2E36F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752517735; cv=none; b=Cb1BqvsQFcLnDBm5LESDsnnK9m8cDUOk64ECobEnMa1+oImvZzKskreQm6XnlSsEYlz3Yr41z6o5LFsZRWlTt5g3cBHfL0tDYr0GrUVaqyHPML93wgR5qyJKUZArgpMrKj7ZzO3dOa+f5dNGsaJoRW/8pi87o7kRK/TLQncqF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752517735; c=relaxed/simple;
	bh=ePRmQUVlgRHTRa4RNsfBJ21EXabSiTUcOcgrzA2jDdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMN9vOn6raToON17nd9KAbwRvqZ33cTgmd/nzB7O1gHu2qAbDBxhCT/T25EIVfeZRGtiBoaKgL5f2T87mYf3rqx6rB63hxgLH9vVKf3Ii2gA7/MntNQDP0aeNIgMxZoXqLqhfwQUh/YCXxRvfHu6t1JHsCOSBZtFjRjHDnfea6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVfC53Iy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVfC53Iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752517734; x=1784053734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ePRmQUVlgRHTRa4RNsfBJ21EXabSiTUcOcgrzA2jDdQ=;
  b=QVfC53Iyja5hpqamsMx0DHY1C/f/gNT25QddeEglHm5WKcpgt13JylxV
   BJ6IIBfUQSJkkddm1zWVqh4Gj0SxyioaTQqa5vn/Km2C/JSzmpYLBipkA
   NQgBd7YRnR5gGF1FbcZadHeZyxVXa25z1e34oNLwSlCWPoOl71ocpjEnC
   jfhU63xpszEXwC2jf4SmSgvT/eXqEtHNxVX8M89Z5hho4Q3LlkZZHGD61
   aDYVW+116GZLhZmZVihN35/z0QajEU/RYECss8IndV8pJRccLrFdsyHvi
   xhaTO8R6vFAEZpZLLx/PdPGi+LHl3CR64EVpUQjShqhaDETXDCi8BA/9l
   A==;
X-CSE-ConnectionGUID: TcgpFi47QemA5FM/9OVBKQ==
X-CSE-MsgGUID: H+2BspslQMuGCs6xEFvhmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77259260"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="77259260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 11:28:53 -0700
X-CSE-ConnectionGUID: 5RcH3eeIQR+XWqC47unNiw==
X-CSE-MsgGUID: UbGLwxS7T+GxC/WJ+Lo4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="187993620"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jul 2025 11:28:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubNuz-0009DT-2l;
	Mon, 14 Jul 2025 18:28:49 +0000
Date: Tue, 15 Jul 2025 02:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/8] nvme: Add CDQ command definitions for contiguous
 PRPs
Message-ID: <202507150251.QaDdT4xy-lkp@intel.com>
References: <20250714-jag-cdq-v1-1-01e027d256d5@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-jag-cdq-v1-1-01e027d256d5@kernel.org>

Hi Joel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Granados/nvme-Add-CDQ-command-definitions-for-contiguous-PRPs/20250714-171834
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250714-jag-cdq-v1-1-01e027d256d5%40kernel.org
patch subject: [PATCH RFC 1/8] nvme: Add CDQ command definitions for contiguous PRPs
config: i386-buildonly-randconfig-003-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150251.QaDdT4xy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150251.QaDdT4xy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150251.QaDdT4xy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function '_nvme_check_size',
       inlined from 'nvme_core_init' at drivers/nvme/host/core.c:5146:2:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_746' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct nvme_cdq) != 64
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:5136:9: note: in expansion of macro 'BUILD_BUG_ON'
    5136 |         BUILD_BUG_ON(sizeof(struct nvme_cdq) != 64);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function '_nvme_check_size',
       inlined from 'nvme_core_init' at core.c:5146:2:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_746' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct nvme_cdq) != 64
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   core.c:5136:9: note: in expansion of macro 'BUILD_BUG_ON'
    5136 |         BUILD_BUG_ON(sizeof(struct nvme_cdq) != 64);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_746 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
