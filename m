Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC892E5D2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755276678; cv=none; b=EwjmST3EjLbzzej6GU9KmGjlKV+upQIkO0IR3BEnCjldQr9B5nhTLl6TF9edv5vpeDbQ+jRu3ajzCYGIuwbJ7hmx3Wp7IeUeY27wPArlmCK5DKW7GPiMfQgcKh/96Mz7YuSnLu9l321X/VeQK/AUiYnrIOPzSPPzVP/+4HpkTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755276678; c=relaxed/simple;
	bh=7NTaViNVxaMYuQr9mTPMGMMhBcYakL9cKYcXpQrkLF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ahDaQf83mYbeUPEV6hUL0n6SGoYYCNPFOr4B7N5lxriMTH3v8IV54D32kSE7cIB9aQs7sNvXjRLv7rXnUV7IDBGCmdF+wXacKwJSeu/keGDSSIldRafwwUpZR1dQndWJnndPxdT/aO2Obv+KIQmtBDTqJsfIRA7sEhivqHY7xcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciRsAe7O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciRsAe7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755276676; x=1786812676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NTaViNVxaMYuQr9mTPMGMMhBcYakL9cKYcXpQrkLF8=;
  b=ciRsAe7OH84FrxpisnQEAXqKojkfOGPQTFhLxYpvSFRZceGsdOV6owIv
   MzoTsm19ZpDONVrTqUcGsrENpM2NU+xiW+IA1T7sLHWrDmL8COwHsa/bR
   UZiJfpZOFY/+d87ckQQh+lledjl1okMfb+qwP37U/Vpt3LgF+psXxGZ6s
   2JXgt8pWx+RHqy5Go88GSKXkixcgeHRxfFv8nhEspVi5lTxsFfI/crv74
   Vw4yIwgeVdLvE+OgAmN8BXZxISFUm6Wc/baZZpvcvSdmz7kzgrWNZxHoT
   87XjsEQORGAz3uyB3QE1+8h2iVKYb/KdfEqo6Of3W2Cp9F9gwyBUy0fln
   Q==;
X-CSE-ConnectionGUID: gZofmPFCRXGLA8JioEN6zA==
X-CSE-MsgGUID: xOFFO68jTVuFxQ/G55sgRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61410969"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61410969"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 09:51:16 -0700
X-CSE-ConnectionGUID: 6CrZOOFpQpacTi1bb2gudg==
X-CSE-MsgGUID: f2Oz+VuMTO6WqnQkxAeCbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166543218"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2025 09:51:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umxdM-000C8S-06;
	Fri, 15 Aug 2025 16:50:53 +0000
Date: Sat, 16 Aug 2025 00:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [akpm-mm:mm-new 136/142] include/linux/compiler_types.h:572:38:
 error: call to '__compiletime_assert_352' declared with attribute error:
 BUILD_BUG failed
Message-ID: <202508160059.Aj29DucC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   916e1f0416709c79737776abd5283cb27a5da908
commit: 119a909df9ee611b1656fa9cbdefa9ea68032048 [136/142] powerpc: mm: add pud_pfn() stub
config: powerpc64-randconfig-002-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160059.Aj29DucC-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160059.Aj29DucC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160059.Aj29DucC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'pud_pfn',
       inlined from 'follow_pfnmap_start' at mm/memory.c:6695:7:
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_352' declared with attribute error: BUILD_BUG failed
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
     553 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable.h:221:2: note: in expansion of macro 'BUILD_BUG'
     221 |  BUILD_BUG();
         |  ^~~~~~~~~


vim +/__compiletime_assert_352 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
