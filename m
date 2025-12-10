Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D22F0696
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390187; cv=none; b=NI8v5M9t+dnSv+BFxud1fMEk6E0PajsSHYg8Y64LKvSw/xCsfpqvtLsPJI+rWRFVpET7utB9+KNlxlrKZHhkjvDBBSCh8Z4iNIPK6FWCOCIZLi82LD2H+Hx4yVb49Wwi6ib4H9YzZFWvHamI+BVZzLiAR8OpoxKD38ioJ30iGPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390187; c=relaxed/simple;
	bh=+zV0wgcIABVyAXaTPbuKxHpIXRxAlh5JRopjMH0POQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CWvrRKhvJRgHs42uQCp0wsv7EGZp8xB0EDyWbZDuxroLSW1DOy8ABSMInhS/D32PVdeT2KCY3EKTw2pF5Xt3IkfOPMR5peMMxG7d+Juh13rRPSP6rLAT0EfoSXo3TQZVxgdcZbQp6Md4zMmJFFfyDUQe09WZ1ZW+1IYNA0bvZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8cE8aHa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8cE8aHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765390186; x=1796926186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+zV0wgcIABVyAXaTPbuKxHpIXRxAlh5JRopjMH0POQ0=;
  b=X8cE8aHaOr6rW+tuRkHOo3QoFrfFw1U8Gc+FMiZUV1+gpKe1rEa3/aV0
   qW89IJM1J8sTRn+6VyNe109WHUF117SKYLt8hrcq+IDH0NMZAQl9Jw0gd
   zYStTr2Ilh4wQZPlNPGQyYNHNkLSTauO+zU+y59TbjHY6BjPuodEXta3p
   9iqhLogkvg3jA2u3L16MAdUKmN6v2we+h3RLrALQCkhFYIiaf6RSrfvaj
   QWUJKTwpayplq+AeJpCgu+O8R8tLg1xE+BubbkuFwm9d52YG0sHmofyix
   nXa4C80wtqj9QyW72hEv0Q6nyj8z0z4PJMO9BJxLqAigkIyNMoQy50FCT
   w==;
X-CSE-ConnectionGUID: hIRGVVWsTLCtnAitgh025w==
X-CSE-MsgGUID: 4VRIvDtRRQutJCpG4336GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54912532"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="54912532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:09:45 -0800
X-CSE-ConnectionGUID: WS4bWy+RQQ6Ldo4ATa4++g==
X-CSE-MsgGUID: 6eDcG4bZQh2dZFU2bv3scg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196643298"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 10:09:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTOdA-000000003c9-2uo1;
	Wed, 10 Dec 2025 18:09:40 +0000
Date: Thu, 11 Dec 2025 02:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: include/linux/compiler_types.h:568:38: error: call to
 '__compiletime_assert_372' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(priv_tbl->probs) % 16
Message-ID: <202512110229.R6YCf1Le-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: d968e50b5c26642754492dea23cbd3592bde62d8 media: rkvdec: Unstage the driver
date:   5 months ago
config: arm-randconfig-002-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110229.R6YCf1Le-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110229.R6YCf1Le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_372' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:1010:2: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |  BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_372 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
