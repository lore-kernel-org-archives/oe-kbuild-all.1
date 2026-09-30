Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93864F55B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783803; cv=none; b=b3+RdthNzubefXGzCs0GkoxaONIcvTjdASqA4cawQpcdcMPV5W+4AAQIfdcESXYCJgG8j7sSY7PoIXjNO0EQDjGhKeo1mQqIMl7LQLS9TxT4eIvVpVQ4Kqt+WF4LeQx3TuiBT9d+7osc39EM4ATZRl7XwTUQtD9jU1zDrtgIb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783803; c=relaxed/simple;
	bh=ryvCl4VNzlDFn450cnP0rv23xHe2xOImdpfjmNjQnXQ=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcZGqlPGBcsHChOnZB+t0YmNsX8RQVQ424pLfL51k12eGvxdNUZ1bZ6dNyMu5GwEIHD1diptNzDhzyGLVgQP3yJ4gsnl7ynQAZT7QRDhJcDH1Y16tydYKH10seiOpNicH7tHXXUvKxEXaF9L53+wmN6Bc/ieu+0Yk72WZ0Tty8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPs/03NB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPs/03NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790783796; x=1822319796;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=ryvCl4VNzlDFn450cnP0rv23xHe2xOImdpfjmNjQnXQ=;
  b=XPs/03NBVcp0W+lM/gL3T0hfafJX5cXUUkcaA/z3yuilmGx8GzJoLZTe
   1+z2Y05/nEQD1bsJVxi+NB64R1zDryjKFz3QG5/R7/RXFf6fMp+3aV4Me
   hONG6OF4cQmXkw1jaf/CmLtx6GIzf0wypJEpvUzjoR6nG1Hu5FUh9rhKU
   HOydka/i33QSP1Sz+LvsKPYrhElumdd8PuNiIkHELHozr8agDIreSE04Q
   vFMfaMPrAQ/O0DYq3PtL6E6i/eBu8QeCTWc/pNRd+tZi1BRiI/+krnISh
   i3Cta27YKIwO1ERG8+1/XjSdD0QqQuBipUYz71hBQhr8ZjlrySldI/Ddb
   w==;
X-CSE-ConnectionGUID: V1MuRiueSi+iYtJmonpucQ==
X-CSE-MsgGUID: 4C7IeBMBSSSsgk43ymSOmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102200409"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102200409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 08:56:33 -0700
X-CSE-ConnectionGUID: T3fqDXoBTcO2AEkELfeoyQ==
X-CSE-MsgGUID: jsWKbotXTaqBuNj2zbc33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275280101"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 08:56:33 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBwfU-000000001ux-3tsQ
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 15:56:28 +0000
Date: Wed, 30 Sep 2026 17:56:00 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: fortify: add KUnit tests for __counted_by and __counted_by_ptr
Message-ID: <202609301715.SnFPA5YE-lkp@intel.com>
References: <202609301715.SnFPA5YE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609301715.SnFPA5YE-lkp@intel.com>

Hi Bill,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/fortify-add-KUnit-tests-for-__counted_by-and-__counted_by_ptr/20260929-010031
base:   
patch link:    https://lore.kernel.org/r/202609301715.SnFPA5YE-lkp%40intel.com
config: x86_64-randconfig-2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301715.SnFPA5YE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301715.SnFPA5YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301715.SnFPA5YE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/tests/fortify_kunit.c:1049:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1049:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
>> lib/tests/fortify_kunit.c:1049:9: sparse: sparse: incompatible types for operation (==):
   lib/tests/fortify_kunit.c:1049:9: sparse:    unsigned long const __left
   lib/tests/fortify_kunit.c:1049:9: sparse:    bad type const __right
   lib/tests/fortify_kunit.c:1051:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1051:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1051:9: sparse: sparse: incompatible types for operation (==):
   lib/tests/fortify_kunit.c:1051:9: sparse:    unsigned long const __left
   lib/tests/fortify_kunit.c:1051:9: sparse:    bad type const __right
   lib/tests/fortify_kunit.c:1106:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1106:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1106:9: sparse: sparse: incompatible types for operation (==):
   lib/tests/fortify_kunit.c:1106:9: sparse:    unsigned long const __left
   lib/tests/fortify_kunit.c:1106:9: sparse:    bad type const __right
   lib/tests/fortify_kunit.c:1107:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1107:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   lib/tests/fortify_kunit.c:1107:9: sparse: sparse: incompatible types for operation (==):
   lib/tests/fortify_kunit.c:1107:9: sparse:    unsigned long const __left
   lib/tests/fortify_kunit.c:1107:9: sparse:    bad type const __right

vim +1049 lib/tests/fortify_kunit.c

  1036	
  1037	static void fortify_test_counted_by_flex(struct kunit *test)
  1038	{
  1039		size_t size = 128;
  1040		struct counted_by_flex_struct *s;
  1041		size_t elem_bytes = size * sizeof(s->array[0]);
  1042	
  1043		s = alloc_counted_by_flex_struct(test, size);
  1044	
  1045		OPTIMIZER_HIDE_VAR(s);
  1046		OPTIMIZER_HIDE_VAR(elem_bytes);
  1047	
  1048		/* __builtin_dynamic_object_size() should return the logical length. */
> 1049		KUNIT_EXPECT_EQ(test, elem_bytes,
  1050				__builtin_dynamic_object_size(s->array, 0));
  1051		KUNIT_EXPECT_EQ(test, elem_bytes,
  1052				__builtin_dynamic_object_size(s->array, 1));
  1053	
  1054		/* Within-bounds write and read succeed. */
  1055		memset(s->array, 0x42, elem_bytes);
  1056		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
  1057		KUNIT_EXPECT_NOT_NULL(test, memchr(s->array, 0x42, elem_bytes));
  1058		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
  1059	
  1060		/* Out-of-bounds write and read past logical size are caught. */
  1061		memset(s->array, 0x42, elem_bytes + 1);
  1062		KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
  1063		KUNIT_EXPECT_NULL(test, memchr(s->array, 0x42, elem_bytes + 1));
  1064		KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
  1065	
  1066		kfree(s);
  1067	}
  1068	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
