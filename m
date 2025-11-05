Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AC3009F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347809; cv=none; b=U435tH40I5gKcYl8qI4/BPp1+AQATjNZsTe2ZEpd5KBi0X69sx9FxFHdytYzbAUc62fS+JecJxdmGJo/tvubj4TPyuIwF0QZTgB7iB++R5biORze5mBXowlXacn86hpFz9uRZH2t9egFgtGxECtPNRrnRamEAISFm2ocIdv421o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347809; c=relaxed/simple;
	bh=kJBmWLpit6CNFfBzVI/93vH2Fzcq/jHY5H0BQQnJZ3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDnUAiYPH2o+qESdtnkV0sbmDF3bGamEucmqZ+U70AwWqDqtiu6EI5r8jQxkIL82L+Go5kp+4ydMzzlaJfdw2FFjqvz+/rVtmTuKgy9s7sTL6fKgV6spNTa2QkeL/r9cm7TQACB5SwqHLejG0rjXERIkQ7QEZpkBaRiwRQL5QPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZNYVLRy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZNYVLRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762347807; x=1793883807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJBmWLpit6CNFfBzVI/93vH2Fzcq/jHY5H0BQQnJZ3k=;
  b=dZNYVLRyEPZ53yg7463M+jH2tUQUtTNE5fdsEXp+VfrYQUrIwuC/5+/t
   s+aF1msJaUP2vzvkJC4kujAd2LXVL+y8VzMWXyn+pT4YrBJZmuuYunxZl
   lBBKCeR4aSNgeY/wMOyLTxxujTinNv+ehsvME7N6bDCtVbUp8sPDIumE1
   DiekSCXjpbqMZunoIiUDXF9ik8LswbL4Eb7kyqMn2lMsqBN46yMCziWFu
   3vKtRP6qnFQp5OzjYkiuyjMjVKu+AgLdZg4UI0GNhPjQKCsg1UDXhjbV1
   DrF1nFaS23yf/mJFBiN4jOt/x2fOhVn3KJ3fUNz6+PlR/Qs0Ft0qQ+azY
   w==;
X-CSE-ConnectionGUID: ZwCXHC5GQ76FZ+o+NOl0Ag==
X-CSE-MsgGUID: sssW30CQTuKAldKn7DyvLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68320132"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="68320132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 05:03:27 -0800
X-CSE-ConnectionGUID: EaGeUYc+RcKUFBTLSvKmBw==
X-CSE-MsgGUID: FDFlsoVNSCivM2ADxdlb9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="224698239"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2025 05:03:25 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGdAV-000SaD-0x;
	Wed, 05 Nov 2025 13:03:20 +0000
Date: Wed, 5 Nov 2025 21:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/svm_handler_nospec 5/5]
 include/linux/compiler_types.h:597:45: error: call to
 '__compiletime_assert_1122' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(_i) > sizeof(long)
Message-ID: <202511052041.SuRW3wII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/svm_handler_nospec
head:   bac6bf1a9360d8301e58c5ea06be70c71a665b75
commit: bac6bf1a9360d8301e58c5ea06be70c71a665b75 [5/5] KVM: SVM: Harden exit_code against being used in Spectre-like attacks
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251105/202511052041.SuRW3wII-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052041.SuRW3wII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052041.SuRW3wII-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/x86/kvm/svm/svm.c: In function 'svm_invoke_exit_handler':
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_1122' declared with attribute error: BUILD_BUG_ON failed: sizeof(_i) > sizeof(long)
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
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/nospec.h:61:9: note: in expansion of macro 'BUILD_BUG_ON'
      61 |         BUILD_BUG_ON(sizeof(_i) > sizeof(long));                        \
         |         ^~~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:3469:17: note: in expansion of macro 'array_index_nospec'
    3469 |         index = array_index_nospec(exit_code, ARRAY_SIZE(svm_exit_handlers));
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   svm/svm.c: In function 'svm_invoke_exit_handler':
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_1122' declared with attribute error: BUILD_BUG_ON failed: sizeof(_i) > sizeof(long)
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
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/nospec.h:61:9: note: in expansion of macro 'BUILD_BUG_ON'
      61 |         BUILD_BUG_ON(sizeof(_i) > sizeof(long));                        \
         |         ^~~~~~~~~~~~
   svm/svm.c:3469:17: note: in expansion of macro 'array_index_nospec'
    3469 |         index = array_index_nospec(exit_code, ARRAY_SIZE(svm_exit_handlers));
         |                 ^~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_1122 +597 include/linux/compiler_types.h

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

:::::: The code at line 597 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
