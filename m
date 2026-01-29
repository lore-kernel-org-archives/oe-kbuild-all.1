Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9518387353
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685894; cv=none; b=YqJY2XRtpFGKXtobY3lEgMNMFU2zZQfNke9DcMj0LB7stIA09EmxDgaCSqhNVsKGlgCb/m0lUv5kcLVUm+jKU8/JqwyyqSQ42KGjgEDu0PHP2JbkTVEHC0nZ/vylShMzmclERCp3CRpyCIlUMtnx+t3I6+O3+FLUvAyqxq677ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685894; c=relaxed/simple;
	bh=QP5WsfsTaChR8XnXpGK0J7p6FIytr5QeHyi3TBnSXQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rdr7RpHeMl0U32ZV51uaoynZlhoV3zKZqRIm7YFtB2zrpEOckf5KYCNGdYjl7uMD5CW1bDWZI2saysxw6G24hLVAfr1K3mC0a3MVnbreOU06vELCANSd90bN21FM/+b9By6Rq0JXPp/DaJBWFWe2Sga6CEsXcET/m3uYPXyqpUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3lKVUPQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3lKVUPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769685893; x=1801221893;
  h=date:from:to:cc:subject:message-id;
  bh=QP5WsfsTaChR8XnXpGK0J7p6FIytr5QeHyi3TBnSXQg=;
  b=K3lKVUPQjhWZjNjzHJ3vxr0c5q03Lt3/ROLDXk8fEC0lB0MC37z2c25x
   Qak75TePgb5fpGeWV0GT4StJYLoTY1LMaVtfB65p8j7zqKilPadXhc1HK
   85Ji5dK+9y1LY7nT9rWC162FR71vb2OVYgkQWiTPMvv2rIJyflxy9E9O9
   4Lm4W3yxh84RaasJGfPr9hQn3LDh6FP3UbDdSpEoPdFi7QYidlxbdXauB
   7DTbeBJ9g7QGxEmcsOF+w1DG1LLoJ4ufPKYkiwJc3sz+oinbMHLXimRZc
   tBe+jIzM5kpS9lLrxuz1IC77QQWYIaTaW4ZMqOWLEtQH6zhK+wxEgImGN
   Q==;
X-CSE-ConnectionGUID: 8CmDRXgzTWGKelLDLt48xA==
X-CSE-MsgGUID: mzm66wsPR8ifhFlmoOsh+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70816280"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70816280"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:24:52 -0800
X-CSE-ConnectionGUID: fxAq01PsSVyhFEZww6MG6w==
X-CSE-MsgGUID: klzeCcRqQEO9rrO1NTXllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208456953"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2026 03:24:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlQ8l-00000000bPc-3g1i;
	Thu, 29 Jan 2026 11:24:47 +0000
Date: Thu, 29 Jan 2026 19:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:scanf-break-more 3/3]
 lib/tests/scanf_kunit.c:755:49: error: too few arguments to function call,
 expected 3, have 2
Message-ID: <202601291921.FlI2BG4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux scanf-break-more
head:   c856662203a0a434151a0c56f5c05ebbf20c9770
commit: c856662203a0a434151a0c56f5c05ebbf20c9770 [3/3] scanf: further break kunit into test cases
config: x86_64-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291921.FlI2BG4c-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291921.FlI2BG4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291921.FlI2BG4c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/scanf_kunit.c:755:49: error: too few arguments to function call, expected 3, have 2
     755 |                 return number_delimiters_gen_params(NULL, desc);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~           ^
   lib/tests/scanf_kunit.c:744:1: note: 'number_delimiters_gen_params' declared here
     744 | KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1729:21: note: expanded from macro 'KUNIT_ARRAY_PARAM'
    1729 |         static const void *name##_gen_params(struct kunit *test,                                \
         |                            ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1730 |                                              const void *prev, char *desc)                      \
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:136:1: note: expanded from here
     136 | number_delimiters_gen_params
         | ^
   lib/tests/scanf_kunit.c:756:48: error: too few arguments to function call, expected 3, have 2
     756 |         return number_delimiters_gen_params(prev, desc);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~           ^
   lib/tests/scanf_kunit.c:744:1: note: 'number_delimiters_gen_params' declared here
     744 | KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1729:21: note: expanded from macro 'KUNIT_ARRAY_PARAM'
    1729 |         static const void *name##_gen_params(struct kunit *test,                                \
         |                            ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1730 |                                              const void *prev, char *desc)                      \
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:136:1: note: expanded from here
     136 | number_delimiters_gen_params
         | ^
>> lib/tests/scanf_kunit.c:783:52: error: incompatible function pointer types initializing 'const void *(*)(struct kunit *, const void *, char *)' with an expression of type 'const void *(const void *, char *)' [-Wincompatible-function-pointer-types]
     783 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_ll, optional_number_delimiters_gen_params),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: expanded from macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:784:51: error: incompatible function pointer types initializing 'const void *(*)(struct kunit *, const void *, char *)' with an expression of type 'const void *(const void *, char *)' [-Wincompatible-function-pointer-types]
     784 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_l, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: expanded from macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:785:51: error: incompatible function pointer types initializing 'const void *(*)(struct kunit *, const void *, char *)' with an expression of type 'const void *(const void *, char *)' [-Wincompatible-function-pointer-types]
     785 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_d, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: expanded from macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:786:51: error: incompatible function pointer types initializing 'const void *(*)(struct kunit *, const void *, char *)' with an expression of type 'const void *(const void *, char *)' [-Wincompatible-function-pointer-types]
     786 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_h, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: expanded from macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:787:52: error: incompatible function pointer types initializing 'const void *(*)(struct kunit *, const void *, char *)' with an expression of type 'const void *(const void *, char *)' [-Wincompatible-function-pointer-types]
     787 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_hh, optional_number_delimiters_gen_params),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: expanded from macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   7 errors generated.


vim +755 lib/tests/scanf_kunit.c

   745	
   746	static const void *optional_number_delimiters_gen_params(const void *prev, char *desc)
   747	{
   748		static const char * const blank = "";
   749	
   750		if (prev == NULL) {
   751			number_delimiter_param_desc(&blank, desc);
   752			return &blank;
   753		}
   754		if (prev == &blank)
 > 755			return number_delimiters_gen_params(NULL, desc);
   756		return number_delimiters_gen_params(prev, desc);
   757	}
   758	
   759	static struct kunit_case scanf_test_cases[] = {
   760		KUNIT_CASE(numbers_simple),
   761		/* String with multiple numbers separated by delimiter. */
   762		KUNIT_CASE_PARAM(numbers_list_ll, number_delimiters_gen_params),
   763		KUNIT_CASE_PARAM(numbers_list_l, number_delimiters_gen_params),
   764		KUNIT_CASE_PARAM(numbers_list_d, number_delimiters_gen_params),
   765		KUNIT_CASE_PARAM(numbers_list_h, number_delimiters_gen_params),
   766		KUNIT_CASE_PARAM(numbers_list_hh, number_delimiters_gen_params),
   767	
   768		/*
   769		 * Lists of numbers separated by delim. Each field width specifier is the
   770		 * maximum possible digits for the given type and base.
   771		 */
   772		KUNIT_CASE_PARAM(numbers_list_field_width_ll, number_delimiters_gen_params),
   773		KUNIT_CASE_PARAM(numbers_list_field_width_l, number_delimiters_gen_params),
   774		KUNIT_CASE_PARAM(numbers_list_field_width_d, number_delimiters_gen_params),
   775		KUNIT_CASE_PARAM(numbers_list_field_width_h, number_delimiters_gen_params),
   776		KUNIT_CASE_PARAM(numbers_list_field_width_hh, number_delimiters_gen_params),
   777	
   778		/*
   779		 * Lists of numbers separated by delim. Each field width specifier is the
   780		 * exact length of the corresponding value digits in the string being scanned.
   781		 * The empty string is included in the list of delimiters.
   782		 */
 > 783		KUNIT_CASE_PARAM(numbers_list_field_width_val_ll, optional_number_delimiters_gen_params),
   784		KUNIT_CASE_PARAM(numbers_list_field_width_val_l, optional_number_delimiters_gen_params),
   785		KUNIT_CASE_PARAM(numbers_list_field_width_val_d, optional_number_delimiters_gen_params),
   786		KUNIT_CASE_PARAM(numbers_list_field_width_val_h, optional_number_delimiters_gen_params),
   787		KUNIT_CASE_PARAM(numbers_list_field_width_val_hh, optional_number_delimiters_gen_params),
   788	
   789		KUNIT_CASE(numbers_prefix_overflow),
   790	
   791		KUNIT_CASE(test_simple_strtoull),
   792		KUNIT_CASE(test_simple_strtoll),
   793		KUNIT_CASE(test_simple_strtoul),
   794		KUNIT_CASE(test_simple_strtol),
   795		{}
   796	};
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
