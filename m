Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDC1A262A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 23:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783120170; cv=none; b=ZLOljOkbLUuTgZ3bB33ny9GbuOy41X4GSX6MPnKDZhLcMMjTFeHA6CNfLBdiin9wIGkQ2K8G68ZuWceeH4DoDDvnsXTllkq/ibmSW/8j1Y9UcWlsf3Y1Bg5tXxfCQ5cyG7jTniE36YkwsdTolF/JjPsQH3awW54aJSOPIpgcR8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783120170; c=relaxed/simple;
	bh=+LutGywH/3Ha7SzbNocGRupG42kXQO5N3H7IfOStMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nCng7nFU10rFV6DpqrXyQ1zkYv6RGGDOITReQci2JC4BnlqbGjaXzAUGNC3m3XQLKAg6kFyxjSHoBg5YcB6k9wqrutG12lOr3gcxaGkCMHsYVz5Myl4b3aov9SU4MpfD25MDp236k73phv3yV3uXw5OGHJTE9f4hC2EJY+eyiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZG47PJBj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZG47PJBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783120169; x=1814656169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LutGywH/3Ha7SzbNocGRupG42kXQO5N3H7IfOStMcY=;
  b=ZG47PJBjpjX3RZf6VDSu1dXCLOCiTMwBJfTlHj8zz4eVfcfJWJ94gniw
   GHPYjivBAyq7r6+v4q7zPiZY4CD8+VylljDWYSkkmeXIvCplGyWsZQMFA
   hLWqVKlbENSsdLsK/438cDRJd51aDtab4rbWpuxJK1TrltoejnZU/Gde6
   2NsuBLLBB2ognMhVGNPb1Tv5HXbIjMhwx+bt0IYaEvazvsNQpKAlBrix8
   GI/vZbnX1xo7vl0XnnoY0l6Ii3SvCg8x1bro1Elq18DjiNP8i0i1/U8Pq
   DqONcs2gDHkCB+fzAa56ambfh4Ww91+/Agndf+E80iYf1N6Bxobvgxs3v
   A==;
X-CSE-ConnectionGUID: w2IOuZuMQ4G8SaNwkPhSyw==
X-CSE-MsgGUID: tzh3Qo2iQ5WB3cKobwOc0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="109409021"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="109409021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 16:09:28 -0700
X-CSE-ConnectionGUID: Qhb0S3+xRYehuS6lU8AIpw==
X-CSE-MsgGUID: axF0MBKJQPqdHS8l+d8VWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250550723"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2026 16:09:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfn0d-00000000CdQ-11n1;
	Fri, 03 Jul 2026 23:09:23 +0000
Date: Sat, 04 Jul 2026 07:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-overflow 4/4]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_334' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(long) == 8
Message-ID: <202607040711.3p1yJfE7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_ec-hwmon-overflow
head:   f509e4c5cf112ac16f4d049c2ef6eb6dfdb6e6ad
commit: f509e4c5cf112ac16f4d049c2ef6eb6dfdb6e6ad [4/4] x
config: x86_64-buildonly-randconfig-005-20260704 (https://download.01.org/0day-ci/archive/20260704/202607040711.3p1yJfE7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040711.3p1yJfE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040711.3p1yJfE7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'cros_ec_hwmon_kelvin_to_millicelsius_overflow',
       inlined from 'cros_ec_hwmon_temp_to_millicelsius' at drivers/hwmon/cros_ec_hwmon.c:177:6,
       inlined from 'cros_ec_hwmon_read' at drivers/hwmon/cros_ec_hwmon.c:247:13:
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_334' declared with attribute error: BUILD_BUG_ON failed: sizeof(long) == 8
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/hwmon/cros_ec_hwmon.c:163:17: note: in expansion of macro 'BUILD_BUG_ON'
     163 |                 BUILD_BUG_ON(sizeof(long) == 8);
         |                 ^~~~~~~~~~~~


vim +/__compiletime_assert_334 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
