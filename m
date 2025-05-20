Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F22459F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722780; cv=none; b=rvExB5y04w0A1sz/2v7Fy+4qJN8KYSrSLIZgTqjlFe5Q9zmy/34f9QyELO9thduwnfZkoCmCGtZ3cm1K6rhtLF+PTT4qo+pFlsL/bsBMEBbKPhM2FE69OJ6DOOI1EvdwIk5DdqKDIaI1nDLQ+lgZw5mvCmo4fp0uDjTtotQ62f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722780; c=relaxed/simple;
	bh=ZL/s6Hs0IIxK6h4m9BjvffeCVpiz8FKn349+mwYkDy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BChwWc0r6B5iXWJmUjsorCSdwjVD1FEKGGFeN2xzcd9pGq18TQ3bFU7poNx+DBYoVmGk3KosKqz4i7072Gs4AWWzqRLsy8i32B8lhvhmqEd7CED08KLSydp/ktRLZhChRRvnGexAE6CEukYqhrJiuSAdRPnCOZLj68ipk1SIPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi527cWE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi527cWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747722779; x=1779258779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZL/s6Hs0IIxK6h4m9BjvffeCVpiz8FKn349+mwYkDy0=;
  b=Hi527cWEaEpUkeMxuNQu0ZT0IYA9JILg8al0mlybqaZssiF0PnMOEylQ
   ixYsuoYCF7DwMBksFTv/nricjehFna5zVrc27uMTiyJ+a1IeGcbZDu/ku
   U6hwoo3gSvwBAQArfwFDhSng9twpq1qVdfIleUVuMJ5F9PWsam7EyjzDO
   Drywls7Nuhd+6V6oJGF5tY4xBusglR6VoBKM6MBkz908nnTwo43j5sAPq
   uokKdtzVWxHuqAuxaNDOToN08U+78sBGipoQPy1ZN9PQfg+RDe4DdPnyg
   19zWhmuZ5iZhA2D3v9LJkQeCrcVmKQWfJu0dPTSoGFrbB7pV8LEoclRBY
   g==;
X-CSE-ConnectionGUID: wmEdH875TzOa3CvnIGYSUg==
X-CSE-MsgGUID: 4DmWPWtBTy6btWMrvboT2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49516551"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49516551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 23:32:59 -0700
X-CSE-ConnectionGUID: 0Q9awBwXRWCl0tKgEq9AiQ==
X-CSE-MsgGUID: AR9lssMDTkC96mQljr2V+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139479264"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2025 23:32:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHGX1-000ME2-0z;
	Tue, 20 May 2025 06:32:55 +0000
Date: Tue, 20 May 2025 14:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/dynamic_mmu_page_hash 78/79]
 include/linux/compiler_types.h:557:45: error: call to
 '__compiletime_assert_578' declared with attribute error: BUILD_BUG_ON
 failed: get_order(sizeof(struct kvm_svm)) < 2 &&
 !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN)
Message-ID: <202505201404.NiYFEahw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/dynamic_mmu_page_hash
head:   2d5754b01bfb557478371493e9ff3c5a49516338
commit: b783b064073844d4db8ca790ce101798658b60bc [78/79] KVM: x86: Use kvzalloc() to allocate VM struct
config: i386-buildonly-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201404.NiYFEahw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201404.NiYFEahw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201404.NiYFEahw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/x86/kvm/svm/svm.c: In function 'svm_init':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_578' declared with attribute error: BUILD_BUG_ON failed: get_order(sizeof(struct kvm_svm)) < 2 && !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN)
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
   arch/x86/kvm/x86.h:76:9: note: in expansion of macro 'BUILD_BUG_ON'
      76 |         BUILD_BUG_ON(get_order(sizeof(struct x)) < 2 &&                                 \
         |         ^~~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:5678:9: note: in expansion of macro 'KVM_SANITY_CHECK_VM_STRUCT_SIZE'
    5678 |         KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_svm);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_init':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_733' declared with attribute error: BUILD_BUG_ON failed: get_order(sizeof(struct kvm_vmx)) < 2 && !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN)
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
   arch/x86/kvm/vmx/../x86.h:76:9: note: in expansion of macro 'BUILD_BUG_ON'
      76 |         BUILD_BUG_ON(get_order(sizeof(struct x)) < 2 &&                                 \
         |         ^~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:8646:9: note: in expansion of macro 'KVM_SANITY_CHECK_VM_STRUCT_SIZE'
    8646 |         KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_vmx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_578 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
