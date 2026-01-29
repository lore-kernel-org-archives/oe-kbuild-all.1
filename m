Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2B02989A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677498; cv=none; b=d/a/DE3t4jfeub7T3Oi+tmEYK0V+V3SoAisrWzpKdi9Q1tfPxDiqGiJXnUndLi9CFt6c9foxh/m5xwE0PXevgmGVNOBDp70mw8C44ghJMpOcor0yCXVPRxLyRy4MrAqJCJT1TSys+jUTBOhXB2RrBTpK0SR3LVhrZyIdoYTTzXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677498; c=relaxed/simple;
	bh=x8PCGPJ0PJbiLlIMmcbIRPaIHbb2yb5T+zgRXvU9Fuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZzBKT2Z4/5GgG0bmwYkw3In4OOvE3PGCzDfvgNwWiO5V+YSS2AyTb35gvmLFrd/X1AI840ajBmdlrc/Boegch1UPdlyJ42xTrAa22/2K5ObV0ospVTMd3K91TGCbjLganJFucCmQs2nm3x2zoVtI2r9Jd4GpukrlllzIG13NbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiMrjIXz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiMrjIXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769677497; x=1801213497;
  h=date:from:to:cc:subject:message-id;
  bh=x8PCGPJ0PJbiLlIMmcbIRPaIHbb2yb5T+zgRXvU9Fuc=;
  b=jiMrjIXzAKOudaZywQP1m9Di+OgrM2Z9gqGKZs0MlMNeoCfKmqZZ9NL4
   OlqAwXHsRiUBmyvKhhy0yYnlfAHiDOAcVEZHTV/4pOQ7pKGE6U3NREPF7
   N+tWqcqJh7zIHKygoasNccuggcxa1ffDuwEsDE+tN7sHwkqMlW/URB/C0
   c8PfiOxOMTSEk+g6FipVR/vUwhyMpX87+N7VyI8cuQZr2Gf1SPtC7BLTo
   DV6AaDOUHCNXID53IKM1avcFgoXJcd4O+Qz8WPHRVmmYExpJRa2QxWs7m
   z0ls2mRR+uYvGTN/8UsXF2fgFgdySZP2/rGbSjutJV7rBSjJMit9CItWr
   A==;
X-CSE-ConnectionGUID: GPlRZ16JT1STmaRjcbPs8A==
X-CSE-MsgGUID: h4YC+uKdTZ2VN8s+ut4S+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88323148"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="88323148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:04:56 -0800
X-CSE-ConnectionGUID: qslGiAZpQ3Gf3flnRC4faA==
X-CSE-MsgGUID: uQyRzJEXSWOVpWU0uzk31A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2026 01:04:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlNxM-000000002ET-0tf0;
	Thu, 29 Jan 2026 09:04:52 +0000
Date: Thu, 29 Jan 2026 10:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:scanf-break-more 3/3]
 lib/tests/scanf_kunit.c:755:24: error: too few arguments to function
 'number_delimiters_gen_params'
Message-ID: <202601291051.G0OEnDOL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux scanf-break-more
head:   c856662203a0a434151a0c56f5c05ebbf20c9770
commit: c856662203a0a434151a0c56f5c05ebbf20c9770 [3/3] scanf: further break kunit into test cases
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260129/202601291051.G0OEnDOL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291051.G0OEnDOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291051.G0OEnDOL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/tests/scanf_kunit.c: In function 'optional_number_delimiters_gen_params':
>> lib/tests/scanf_kunit.c:755:24: error: too few arguments to function 'number_delimiters_gen_params'
     755 |                 return number_delimiters_gen_params(NULL, desc);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/tests/scanf_kunit.c:6:
   lib/tests/scanf_kunit.c:744:19: note: declared here
     744 | KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
         |                   ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1729:28: note: in definition of macro 'KUNIT_ARRAY_PARAM'
    1729 |         static const void *name##_gen_params(struct kunit *test,                                \
         |                            ^~~~
>> lib/tests/scanf_kunit.c:756:45: warning: passing argument 1 of 'number_delimiters_gen_params' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     756 |         return number_delimiters_gen_params(prev, desc);
         |                                             ^~~~
   include/kunit/test.h:1729:60: note: expected 'struct kunit *' but argument is of type 'const void *'
    1729 |         static const void *name##_gen_params(struct kunit *test,                                \
         |                                              ~~~~~~~~~~~~~~^~~~
   lib/tests/scanf_kunit.c:744:1: note: in expansion of macro 'KUNIT_ARRAY_PARAM'
     744 | KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
         | ^~~~~~~~~~~~~~~~~
   lib/tests/scanf_kunit.c:756:16: error: too few arguments to function 'number_delimiters_gen_params'
     756 |         return number_delimiters_gen_params(prev, desc);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/scanf_kunit.c:744:19: note: declared here
     744 | KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
         |                   ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1729:28: note: in definition of macro 'KUNIT_ARRAY_PARAM'
    1729 |         static const void *name##_gen_params(struct kunit *test,                                \
         |                            ^~~~
   lib/tests/scanf_kunit.c: At top level:
>> lib/tests/scanf_kunit.c:783:59: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
     783 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_ll, optional_number_delimiters_gen_params),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:783:59: note: (near initialization for 'scanf_test_cases[11].generate_params')
     783 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_ll, optional_number_delimiters_gen_params),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:784:58: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
     784 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_l, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:784:58: note: (near initialization for 'scanf_test_cases[12].generate_params')
     784 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_l, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:785:58: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
     785 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_d, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:785:58: note: (near initialization for 'scanf_test_cases[13].generate_params')
     785 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_d, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:786:58: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
     786 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_h, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:786:58: note: (near initialization for 'scanf_test_cases[14].generate_params')
     786 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_h, optional_number_delimiters_gen_params),
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:787:59: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
     787 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_hh, optional_number_delimiters_gen_params),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c:787:59: note: (near initialization for 'scanf_test_cases[15].generate_params')
     787 |         KUNIT_CASE_PARAM(numbers_list_field_width_val_hh, optional_number_delimiters_gen_params),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
     210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
         |                                      ^~~~~~~~~~
   lib/tests/scanf_kunit.c: In function 'optional_number_delimiters_gen_params':
>> lib/tests/scanf_kunit.c:757:1: warning: control reaches end of non-void function [-Wreturn-type]
     757 | }
         | ^


vim +/number_delimiters_gen_params +755 lib/tests/scanf_kunit.c

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
 > 756		return number_delimiters_gen_params(prev, desc);
 > 757	}
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
