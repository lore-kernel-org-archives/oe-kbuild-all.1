Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F01387343
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685896; cv=none; b=rGZse3+K68d9MzIWX6Gpo1sq8RfDq0GWtDcy0jgkVzX2lDPyEaFe1hXFanvdvRfH5mFnNvDpZ4/ORAw74TXz4w/dHI4h/xrUBxl6h7UaOKnpseIo3c7sxZ4qgIzVhrvPcl3vPB3azjn3bdY2axNpO5U0cVFPkGSn9oWUUPn0TrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685896; c=relaxed/simple;
	bh=d+X1eEOxXS/sScnBydp3ZdYRJg8ZARKCclF2+mTfE80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBeGroikwciQLDkHKBakDxRZk2U/9Bu/Gbyjsr/3FbqgmaUoovUzLFNfG5WdLFwvcGF13VxPPDlUERkXS141T8zOQfsRFB2lMGbF9+sRe1OfHYZqY/X+TFPOHOpt1WijxG2vWHESsSxt2pQXnJeCTdtQTjuXw/g9oKKqFvH5R/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0Y82H6e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0Y82H6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769685894; x=1801221894;
  h=date:from:to:cc:subject:message-id;
  bh=d+X1eEOxXS/sScnBydp3ZdYRJg8ZARKCclF2+mTfE80=;
  b=D0Y82H6eNb+IBAu+maGm0TB1G9uStQSWuuh8xev2ApOedQyVoPTQtzs1
   njMpsjZE/exNrhg83AiRDwFVlEKd/9krJT2HcCGeSu6dXfXM4svHuXtc1
   ovV7buICzUW8ThmbrxVFXp1MmDHGURFrGz/8Vdx3U08iVih8VcLEGqdKo
   5nyTuehrYC7+H2lXAn7W/7aLE271fVUzz7pBjdyH/vl5MfuPLwBuoWX07
   icPa51O4C/93pU6jG049+J1RarL0gYof6/cZ7M0NfyiGXszCf3+AuPLJJ
   POFfJNittBRpb+xwIJOkmGVCba010TI6QKipuJy2L4/3ff6moiYaQcC6u
   A==;
X-CSE-ConnectionGUID: vuX3K5fXRteAkgid5PhrcQ==
X-CSE-MsgGUID: BgfCo77YQbajXRElyQsLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70816284"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70816284"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:24:52 -0800
X-CSE-ConnectionGUID: MXCjkO8cS+CvfFUEowMIxw==
X-CSE-MsgGUID: Gdvjg8B6TPiwVS3/g17vYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208456957"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2026 03:24:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlQ8l-00000000bPa-3Zje;
	Thu, 29 Jan 2026 11:24:47 +0000
Date: Thu, 29 Jan 2026 19:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:scanf-break-more 3/3]
 lib/tests/scanf_kunit.c:755:10: error: too few arguments to function
 'number_delimiters_gen_params'
Message-ID: <202601291909.zFDZCrIa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux scanf-break-more
head:   c856662203a0a434151a0c56f5c05ebbf20c9770
commit: c856662203a0a434151a0c56f5c05ebbf20c9770 [3/3] scanf: further break kunit into test cases
config: powerpc-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291909.zFDZCrIa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291909.zFDZCrIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291909.zFDZCrIa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/tests/scanf_kunit.c: In function 'optional_number_delimiters_gen_params':
>> lib/tests/scanf_kunit.c:755:10: error: too few arguments to function 'number_delimiters_gen_params'
      return number_delimiters_gen_params(NULL, desc);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/tests/scanf_kunit.c:6:
   lib/tests/scanf_kunit.c:744:19: note: declared here
    KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
                      ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1729:21: note: in definition of macro 'KUNIT_ARRAY_PARAM'
     static const void *name##_gen_params(struct kunit *test,    \
                        ^~~~
>> lib/tests/scanf_kunit.c:756:38: warning: passing argument 1 of 'number_delimiters_gen_params' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return number_delimiters_gen_params(prev, desc);
                                         ^~~~
   In file included from lib/tests/scanf_kunit.c:6:
   include/kunit/test.h:1729:53: note: expected 'struct kunit *' but argument is of type 'const void *'
     static const void *name##_gen_params(struct kunit *test,    \
                                          ~~~~~~~~~~~~~~^~~~
   lib/tests/scanf_kunit.c:744:1: note: in expansion of macro 'KUNIT_ARRAY_PARAM'
    KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
    ^~~~~~~~~~~~~~~~~
   lib/tests/scanf_kunit.c:756:9: error: too few arguments to function 'number_delimiters_gen_params'
     return number_delimiters_gen_params(prev, desc);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/tests/scanf_kunit.c:6:
   lib/tests/scanf_kunit.c:744:19: note: declared here
    KUNIT_ARRAY_PARAM(number_delimiters, number_delimiters, number_delimiter_param_desc);
                      ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:1729:21: note: in definition of macro 'KUNIT_ARRAY_PARAM'
     static const void *name##_gen_params(struct kunit *test,    \
                        ^~~~
   lib/tests/scanf_kunit.c: At top level:
>> lib/tests/scanf_kunit.c:783:52: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Werror=incompatible-pointer-types]
     KUNIT_CASE_PARAM(numbers_list_field_width_val_ll, optional_number_delimiters_gen_params),
                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:783:52: note: (near initialization for 'scanf_test_cases[11].generate_params')
     KUNIT_CASE_PARAM(numbers_list_field_width_val_ll, optional_number_delimiters_gen_params),
                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:784:51: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Werror=incompatible-pointer-types]
     KUNIT_CASE_PARAM(numbers_list_field_width_val_l, optional_number_delimiters_gen_params),
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:784:51: note: (near initialization for 'scanf_test_cases[12].generate_params')
     KUNIT_CASE_PARAM(numbers_list_field_width_val_l, optional_number_delimiters_gen_params),
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:785:51: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Werror=incompatible-pointer-types]
     KUNIT_CASE_PARAM(numbers_list_field_width_val_d, optional_number_delimiters_gen_params),
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:785:51: note: (near initialization for 'scanf_test_cases[13].generate_params')
     KUNIT_CASE_PARAM(numbers_list_field_width_val_d, optional_number_delimiters_gen_params),
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:786:51: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Werror=incompatible-pointer-types]
     KUNIT_CASE_PARAM(numbers_list_field_width_val_h, optional_number_delimiters_gen_params),
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:786:51: note: (near initialization for 'scanf_test_cases[14].generate_params')
     KUNIT_CASE_PARAM(numbers_list_field_width_val_h, optional_number_delimiters_gen_params),
                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:787:52: error: initialization of 'const void * (*)(struct kunit *, const void *, char *)' from incompatible pointer type 'const void * (*)(const void *, char *)' [-Werror=incompatible-pointer-types]
     KUNIT_CASE_PARAM(numbers_list_field_width_val_hh, optional_number_delimiters_gen_params),
                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c:787:52: note: (near initialization for 'scanf_test_cases[15].generate_params')
     KUNIT_CASE_PARAM(numbers_list_field_width_val_hh, optional_number_delimiters_gen_params),
                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:210:24: note: in definition of macro 'KUNIT_CASE_PARAM'
        .generate_params = gen_params, .module_name = KBUILD_MODNAME}
                           ^~~~~~~~~~
   lib/tests/scanf_kunit.c: In function 'optional_number_delimiters_gen_params':
>> lib/tests/scanf_kunit.c:757:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors


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
