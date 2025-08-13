Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F28188715
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120536; cv=none; b=EPCWuPT268z9Cb/9bUi2VxH+FgzUyVIa3tj1Xyv8tM1367SCiFvCcCbZ2fxyQBCwd1lqPpN6HKPypRjzHAtAgRL4uV26uPgFt24XaPNbWd8uAFFU+ZEUc2Nd2xVnYoPWkbAgFHGb04LiyZDkQscecM87zi8Moxul3O45b1dZYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120536; c=relaxed/simple;
	bh=QxBCNbIQ+cMjYeBxM4haSjF7rWGgh6fpgLQ42MdLAr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJhh8GCwMVhbLtIhlY29UI0CdzBcfuQqkIktW8SN9JmrxnJdrY5r/9tbuOoQhDg6LvI65fbckqroJlTSBXIyn303nCa90fMW/fefdRiKs/deJKuGYhPrsJyrKaKEAX5qiSwHGZQIIuyqL4PVqRBPHqTkGz78nVBQo8H89Y/1iJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK3WDnm9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK3WDnm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755120534; x=1786656534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxBCNbIQ+cMjYeBxM4haSjF7rWGgh6fpgLQ42MdLAr8=;
  b=YK3WDnm9KHKBHX5D0Bs3m2SaVRs3BTYpEU1iuVlI0NT8LXt+RNJKmUYH
   2xZQvoulLs0WhoI87E3c+wJbRdjKcpETki4P+vdCDbAdgb2Fo0jasCc0h
   lbV1h6SJnAXof2CNfvPUZ+2UqKxc6rj29LUsmIyQ1s8F3Cg20WI+UfnRc
   nMw/xNj5kpPe/tuUhW2XeRM2BZxVNwESmdSaDO9NmNO5ngQ5IbFP69jfq
   nnLrzV5uUhg1dM36KhrvTY0pBW7hKTXUIR8yC+jFktc2NdIluCWZzOEsp
   RNI8csLTPgCrouLRrb6bs1Fob/OabaioL9QmBVnLoSE29A/3Hso78f6iI
   Q==;
X-CSE-ConnectionGUID: TMeG9LENSWa1rlypjOv0bA==
X-CSE-MsgGUID: HXlaZWNfTimau6hGaGR95w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56642683"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56642683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 14:28:53 -0700
X-CSE-ConnectionGUID: dVCaICXJTbScOqBB4UwFQA==
X-CSE-MsgGUID: jU1LJovTRfagzTsRdIBogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166957055"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 14:28:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umJ1d-000AKk-0q;
	Wed, 13 Aug 2025 21:28:49 +0000
Date: Thu, 14 Aug 2025 05:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [hyperv:hyperv-next-staging 2/9]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
 failed: HV_HVCALL_ARG_PAGES == 1
Message-ID: <202508140537.LHGYEm9W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next-staging
head:   ee8b3b85ffbc4dc06a598a12185537dae67714ab
commit: ffe1588178d5bb71c58361cb84cc3f4342f82100 [2/9] x86/hyperv: Use hv_setup_*() to set up hypercall arguments -- part 1
config: i386-randconfig-014-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140537.LHGYEm9W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140537.LHGYEm9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140537.LHGYEm9W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/asm-generic/mshyperv.h: In function 'hv_setup_inout_array.constprop':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON failed: HV_HVCALL_ARG_PAGES == 1
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/mshyperv.h:239:25: note: in expansion of macro 'BUILD_BUG_ON'
     239 |                         BUILD_BUG_ON(HV_HVCALL_ARG_PAGES == 1);
         |                         ^~~~~~~~~~~~


vim +/__compiletime_assert_494 +572 include/linux/compiler_types.h

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
