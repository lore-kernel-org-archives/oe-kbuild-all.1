Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC721C3BFC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167301; cv=none; b=ejEd78gFIZmVTCfgtKg+v5vVJD8T/3BNswiFQXMOUUr5bK7RA+SdKis2kncIKmSMstPr89IJgF+KFTedSEXW5fvtCn//ojDBGBpYzsQpGLvmAtQSwzxF4sKD4GnQz+qCFLs10vptForeskC0gcaDkgl0uM1FmRYL50zLmkRGpns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167301; c=relaxed/simple;
	bh=N+MNR8HCqor1Jk1Ao4fzI24eOxad9smyWlk665fl0yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAd2CgJjwy6G83JBabfwDC4iEMSj4fOoJvKWcb7HMwkwn7BkwTHCo3O7vNVNqQN88F3oM6VhOu145VrCbqFI53Sh05aq666Gf3oOX6RTN7Qwg/jFsfOEuXxKk5MTigLPBOvcGQDF64lG1IrPEtrPwE+VGXPoQ4uxrZzSZppMuuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyGdIR1H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyGdIR1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747167300; x=1778703300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+MNR8HCqor1Jk1Ao4fzI24eOxad9smyWlk665fl0yM=;
  b=OyGdIR1HGqxE4PL702t3ntBopv2MVGorUzRr2d+q6cIZmPE2/ny+IKRO
   VCI9f7zXrNsmmmcqL17jAXQbbLXuiUItB78FYv8ufxyJlLmkPgHRKwUtt
   c5P77eJ9czUXU8SMtlX12pCnhPvffOrNRNINwctF7tjit+M8vVX/WC4FA
   gAT9/ZHYcxz17g2WOvKloQnbU5kXdQQmOS6S4+EQEx6Z8jhXuZuqop7TC
   4hNa1UUtlUG2ybAQT9/o8e1dNFTHAGImvibx+NzROPA41dRip6ofyRzD8
   CYdTyQ1U628rg9M32K889OfPgHPJcQMHj1aNIvAT9UfIVwKn+P1VgkgJS
   w==;
X-CSE-ConnectionGUID: iTW7SNHUQL2ACyPulPKy6g==
X-CSE-MsgGUID: w11Z4PTRRnaeQPf9PxK/yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66585787"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="66585787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 13:14:59 -0700
X-CSE-ConnectionGUID: QKVOctWzSfCWT3omqCnOGQ==
X-CSE-MsgGUID: eUBga1XpSHmMntmwbSjRlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137734768"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 13:14:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEw1f-000GMp-2j;
	Tue, 13 May 2025 20:14:55 +0000
Date: Wed, 14 May 2025 04:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 5/9] pidfs, coredump: add PIDFD_INFO_COREDUMP
Message-ID: <202505140421.xJDaRD9F-lkp@intel.com>
References: <20250509-work-coredump-socket-v5-5-23c5b14df1bc@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-work-coredump-socket-v5-5-23c5b14df1bc@kernel.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4dd6566b5a8ca1e8c9ff2652c2249715d6c64217]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/coredump-massage-format_corname/20250509-183048
base:   4dd6566b5a8ca1e8c9ff2652c2249715d6c64217
patch link:    https://lore.kernel.org/r/20250509-work-coredump-socket-v5-5-23c5b14df1bc%40kernel.org
patch subject: [PATCH v5 5/9] pidfs, coredump: add PIDFD_INFO_COREDUMP
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250514/202505140421.xJDaRD9F-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140421.xJDaRD9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140421.xJDaRD9F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/pidfs.c: In function 'pidfs_coredump_cookie':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_424' declared with attribute error: Need native word sized stores/loads for atomicity.
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:560:9: note: in expansion of macro 'compiletime_assert'
     560 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   arch/parisc/include/asm/barrier.h:38:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      38 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   fs/pidfs.c:608:9: note: in expansion of macro 'smp_store_release'
     608 |         smp_store_release(&exit_info->coredump_cookie, coredump_cookie);
         |         ^~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_424 +557 include/linux/compiler_types.h

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
