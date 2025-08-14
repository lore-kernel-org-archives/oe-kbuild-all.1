Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806182AEE1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 05:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755149575; cv=none; b=OQnjEK/G92MZGtzqwmBnJnRPY4styxaj8lVd0wKHHILBiT11ULwXw/rYnG6PlFNtSAI1buYcfGBrl/VP1/bSCmWFpvMgNHmwR86p0y4IgjBgCBGv4iWPBm4TDLHnU9FODmSibw6Xnze5QwMOzLZcs19kc8vNoP/rVDGVEczaCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755149575; c=relaxed/simple;
	bh=kjvszrQEnm5/0gubZI6lxdRrBP2ALG1YWYHUoXnaGRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5MEOIboVI6XuJ2seLQKthWg90E5zt3fTDzR8YJ6Wf/SksiAdEbTXZZXdFy52hwJkYTcSvlaIrR9PyUxysQm3El4O/Ojv+oU28/pvR/3ktdS9qBZVXThPA5qd09GNRmPUHaXHrkZI/W3/dEVLrmeArpOOrUl1+dvHK9mQf/xZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDMMQXRN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDMMQXRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755149573; x=1786685573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kjvszrQEnm5/0gubZI6lxdRrBP2ALG1YWYHUoXnaGRs=;
  b=SDMMQXRNnN9Lgzf94GH0CnFNRyT2wMet48m+YMa48M7/wNpwGlGAQX3H
   c/YsEUCxAl4e5LsixzE/DOC7BtjNNxhP5Np2H9o9Fent33D/+rzVmz0RJ
   yj8bnZylgFa05vbn4ZTIZ2YWYgn2zaMl078dVQUGMinnS1fSyWI11dJMe
   bREcCMArpOqMVVFyL43ih/AMP83rPmBTbkbHDoNhtyyMiMyE9SGtJQ6GW
   tS7ss17Kv2f8yk+EeImvHUSTAF+6HB7scwpzhGD7Jn0pLq5UM4a2Jbfvi
   r4kIDRcEzkEGGWP3jle3ijGl5jfGEQdbqa7KA84CdbZ9hUi/v2w/iwP0w
   A==;
X-CSE-ConnectionGUID: GVQsJuOCRxi8pRU4zGzVTg==
X-CSE-MsgGUID: cjL6lNV7QHOZmyc/1qOsMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68061887"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68061887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 22:32:52 -0700
X-CSE-ConnectionGUID: KvI+FdQYS0yNqz7MmZEzZA==
X-CSE-MsgGUID: cncuzZZVTUyahhNwZR+Viw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170873560"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2025 22:32:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umQa1-000Abu-2C;
	Thu, 14 Aug 2025 05:32:49 +0000
Date: Thu, 14 Aug 2025 13:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC 6/6] crypto: implement KFuzzTest targets for PKCS7
 and RSA parsing
Message-ID: <202508141303.fVgUvadx-lkp@intel.com>
References: <20250813133812.926145-7-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813133812.926145-7-ethan.w.s.graham@gmail.com>

Hi Ethan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.17-rc1 next-20250813]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/mm-kasan-implement-kasan_poison_range/20250813-214228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250813133812.926145-7-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v1 RFC 6/6] crypto: implement KFuzzTest targets for PKCS7 and RSA parsing
config: x86_64-buildonly-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141303.fVgUvadx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141303.fVgUvadx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141303.fVgUvadx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pkcs7_parser.c:16:
>> include/linux/kfuzztest.h:418:37: error: expected identifier or '(' before ':' token
     418 | enum kfuzztest_annotation_attribute : uint8_t {
         |                                     ^
>> include/linux/kfuzztest.h:452:45: error: field 'attrib' has incomplete type
     452 |         enum kfuzztest_annotation_attribute attrib;
         |                                             ^~~~~~
   crypto/asymmetric_keys/pkcs7_parser.c: In function 'kfuzztest_logic_test_pkcs7_parse_message':
>> include/linux/kfuzztest.h:497:61: error: 'ATTRIBUTE_LEN' undeclared (first use in this function)
     497 |         __KFUZZTEST_ANNOTATE(arg_type, field, linked_field, ATTRIBUTE_LEN)
         |                                                             ^~~~~~~~~~~~~
   include/linux/kfuzztest.h:461:35: note: in definition of macro '__KFUZZTEST_ANNOTATE'
     461 |                         .attrib = attribute,                                                                    \
         |                                   ^~~~~~~~~
   crypto/asymmetric_keys/pkcs7_parser.c:181:9: note: in expansion of macro 'KFUZZTEST_ANNOTATE_LEN'
     181 |         KFUZZTEST_ANNOTATE_LEN(pkcs7_parse_message_arg, datalen, data);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfuzztest.h:497:61: note: each undeclared identifier is reported only once for each function it appears in
     497 |         __KFUZZTEST_ANNOTATE(arg_type, field, linked_field, ATTRIBUTE_LEN)
         |                                                             ^~~~~~~~~~~~~
   include/linux/kfuzztest.h:461:35: note: in definition of macro '__KFUZZTEST_ANNOTATE'
     461 |                         .attrib = attribute,                                                                    \
         |                                   ^~~~~~~~~
   crypto/asymmetric_keys/pkcs7_parser.c:181:9: note: in expansion of macro 'KFUZZTEST_ANNOTATE_LEN'
     181 |         KFUZZTEST_ANNOTATE_LEN(pkcs7_parse_message_arg, datalen, data);
         |         ^~~~~~~~~~~~~~~~~~~~~~


vim +418 include/linux/kfuzztest.h

cc1dba9238a428 Ethan Graham 2025-08-13  390  
cc1dba9238a428 Ethan Graham 2025-08-13  391  /**
cc1dba9238a428 Ethan Graham 2025-08-13  392   * KFUZZTEST_EXPECT_IN_RANGE - constrain a field to be within a range
cc1dba9238a428 Ethan Graham 2025-08-13  393   *
cc1dba9238a428 Ethan Graham 2025-08-13  394   * @arg_type: name of the input structure, without the leading "struct ".
cc1dba9238a428 Ethan Graham 2025-08-13  395   * @field: some field that is comparable.
cc1dba9238a428 Ethan Graham 2025-08-13  396   * @lower_bound: a lower bound of the same type as @arg_type.@field.
cc1dba9238a428 Ethan Graham 2025-08-13  397   * @upper_bound: an upper bound of the same type as @arg_type.@field.
cc1dba9238a428 Ethan Graham 2025-08-13  398   */
cc1dba9238a428 Ethan Graham 2025-08-13  399  #define KFUZZTEST_EXPECT_IN_RANGE(arg_type, field, lower_bound, upper_bound)                              \
cc1dba9238a428 Ethan Graham 2025-08-13  400  	do {                                                                                              \
cc1dba9238a428 Ethan Graham 2025-08-13  401  		if (arg->field < lower_bound || arg->field > upper_bound)                                 \
cc1dba9238a428 Ethan Graham 2025-08-13  402  			return;                                                                           \
cc1dba9238a428 Ethan Graham 2025-08-13  403  		__KFUZZTEST_DEFINE_CONSTRAINT(arg_type, field, lower_bound, upper_bound, EXPECT_IN_RANGE) \
cc1dba9238a428 Ethan Graham 2025-08-13  404  	} while (0)
cc1dba9238a428 Ethan Graham 2025-08-13  405  
cc1dba9238a428 Ethan Graham 2025-08-13  406  /**
cc1dba9238a428 Ethan Graham 2025-08-13  407   * Annotations express attributes about structure fields that can't be easily
cc1dba9238a428 Ethan Graham 2025-08-13  408   * or safely verified at runtime. They are intended as hints to the fuzzing
cc1dba9238a428 Ethan Graham 2025-08-13  409   * engine to help it generate more semantically correct and effective inputs.
cc1dba9238a428 Ethan Graham 2025-08-13  410   * Unlike constraints, annotations do not add any runtime checks and do not
cc1dba9238a428 Ethan Graham 2025-08-13  411   * cause a test to exit early.
cc1dba9238a428 Ethan Graham 2025-08-13  412   *
cc1dba9238a428 Ethan Graham 2025-08-13  413   * For example, a `char *` field could be a raw byte buffer or a C-style
cc1dba9238a428 Ethan Graham 2025-08-13  414   * null-terminated string. A fuzzer that is aware of this distinction can avoid
cc1dba9238a428 Ethan Graham 2025-08-13  415   * creating inputs that would cause trivial, uninteresting crashes from reading
cc1dba9238a428 Ethan Graham 2025-08-13  416   * past the end of a non-null-terminated buffer.
cc1dba9238a428 Ethan Graham 2025-08-13  417   */
cc1dba9238a428 Ethan Graham 2025-08-13 @418  enum kfuzztest_annotation_attribute : uint8_t {
cc1dba9238a428 Ethan Graham 2025-08-13  419  	ATTRIBUTE_LEN,
cc1dba9238a428 Ethan Graham 2025-08-13  420  	ATTRIBUTE_STRING,
cc1dba9238a428 Ethan Graham 2025-08-13  421  	ATTRIBUTE_ARRAY,
cc1dba9238a428 Ethan Graham 2025-08-13  422  };
cc1dba9238a428 Ethan Graham 2025-08-13  423  
cc1dba9238a428 Ethan Graham 2025-08-13  424  /**
cc1dba9238a428 Ethan Graham 2025-08-13  425   * struct kfuzztest_annotation - a metadata record for a fuzzer hint
cc1dba9238a428 Ethan Graham 2025-08-13  426   *
cc1dba9238a428 Ethan Graham 2025-08-13  427   * This struct captures a single hint about a field in the input structure.
cc1dba9238a428 Ethan Graham 2025-08-13  428   * Instances are generated by the KFUZZTEST_ANNOTATE_* macros and are placed
cc1dba9238a428 Ethan Graham 2025-08-13  429   * into the read-only ".kfuzztest_annotation" ELF section of the vmlinux binary.
cc1dba9238a428 Ethan Graham 2025-08-13  430   *
cc1dba9238a428 Ethan Graham 2025-08-13  431   * A userspace fuzzer can parse this section to understand the semantic
cc1dba9238a428 Ethan Graham 2025-08-13  432   * relationships between fields (e.g., which field is a length for which
cc1dba9238a428 Ethan Graham 2025-08-13  433   * buffer) and the expected format of the data (e.g., a null-terminated
cc1dba9238a428 Ethan Graham 2025-08-13  434   * string). This allows the fuzzer to be much more intelligent during input
cc1dba9238a428 Ethan Graham 2025-08-13  435   * generation and mutation.
cc1dba9238a428 Ethan Graham 2025-08-13  436   *
cc1dba9238a428 Ethan Graham 2025-08-13  437   * For an example of how annotations are used within a fuzz test, see the
cc1dba9238a428 Ethan Graham 2025-08-13  438   * documentation for the FUZZ_TEST() macro.
cc1dba9238a428 Ethan Graham 2025-08-13  439   *
cc1dba9238a428 Ethan Graham 2025-08-13  440   * @input_type: The name of the input struct type.
cc1dba9238a428 Ethan Graham 2025-08-13  441   * @field_name: The name of the field being annotated (e.g., the data
cc1dba9238a428 Ethan Graham 2025-08-13  442   *	buffer field).
cc1dba9238a428 Ethan Graham 2025-08-13  443   * @linked_field_name: For annotations that link two fields (like
cc1dba9238a428 Ethan Graham 2025-08-13  444   *	ATTRIBUTE_LEN), this is the name of the related field (e.g., the
cc1dba9238a428 Ethan Graham 2025-08-13  445   *	length field). For others, this may be unused.
cc1dba9238a428 Ethan Graham 2025-08-13  446   * @attrib: The type of the annotation hint.
cc1dba9238a428 Ethan Graham 2025-08-13  447   */
cc1dba9238a428 Ethan Graham 2025-08-13  448  struct kfuzztest_annotation {
cc1dba9238a428 Ethan Graham 2025-08-13  449  	const char *input_type;
cc1dba9238a428 Ethan Graham 2025-08-13  450  	const char *field_name;
cc1dba9238a428 Ethan Graham 2025-08-13  451  	const char *linked_field_name;
cc1dba9238a428 Ethan Graham 2025-08-13 @452  	enum kfuzztest_annotation_attribute attrib;
cc1dba9238a428 Ethan Graham 2025-08-13  453  } __aligned(32);
cc1dba9238a428 Ethan Graham 2025-08-13  454  
cc1dba9238a428 Ethan Graham 2025-08-13  455  #define __KFUZZTEST_ANNOTATE(arg_type, field, linked_field, attribute)                                          \
cc1dba9238a428 Ethan Graham 2025-08-13  456  	static struct kfuzztest_annotation __annotation_##arg_type##_##field __section(".kfuzztest_annotation") \
cc1dba9238a428 Ethan Graham 2025-08-13  457  		__used = {                                                                                      \
cc1dba9238a428 Ethan Graham 2025-08-13  458  			.input_type = "struct " #arg_type,                                                      \
cc1dba9238a428 Ethan Graham 2025-08-13  459  			.field_name = #field,                                                                   \
cc1dba9238a428 Ethan Graham 2025-08-13  460  			.linked_field_name = #linked_field,                                                     \
cc1dba9238a428 Ethan Graham 2025-08-13  461  			.attrib = attribute,                                                                    \
cc1dba9238a428 Ethan Graham 2025-08-13  462  		}
cc1dba9238a428 Ethan Graham 2025-08-13  463  
cc1dba9238a428 Ethan Graham 2025-08-13  464  /**
cc1dba9238a428 Ethan Graham 2025-08-13  465   * KFUZZTEST_ANNOTATE_STRING - annotate a char* field as a C string
cc1dba9238a428 Ethan Graham 2025-08-13  466   *
cc1dba9238a428 Ethan Graham 2025-08-13  467   * We define a C string as a sequence of non-zero characters followed by exactly
cc1dba9238a428 Ethan Graham 2025-08-13  468   * one null terminator.
cc1dba9238a428 Ethan Graham 2025-08-13  469   *
cc1dba9238a428 Ethan Graham 2025-08-13  470   * @arg_type: name of the input structure, without the leading "struct ".
cc1dba9238a428 Ethan Graham 2025-08-13  471   * @field: the name of the field to annotate.
cc1dba9238a428 Ethan Graham 2025-08-13  472   */
cc1dba9238a428 Ethan Graham 2025-08-13  473  #define KFUZZTEST_ANNOTATE_STRING(arg_type, field) __KFUZZTEST_ANNOTATE(arg_type, field, NULL, ATTRIBUTE_STRING)
cc1dba9238a428 Ethan Graham 2025-08-13  474  
cc1dba9238a428 Ethan Graham 2025-08-13  475  /**
cc1dba9238a428 Ethan Graham 2025-08-13  476   * KFUZZTEST_ANNOTATE_ARRAY - annotate a pointer as an array
cc1dba9238a428 Ethan Graham 2025-08-13  477   *
cc1dba9238a428 Ethan Graham 2025-08-13  478   * We define an array as a contiguous memory region containing zero or more
cc1dba9238a428 Ethan Graham 2025-08-13  479   * elements of the same type.
cc1dba9238a428 Ethan Graham 2025-08-13  480   *
cc1dba9238a428 Ethan Graham 2025-08-13  481   * @arg_type: name of the input structure, without the leading "struct ".
cc1dba9238a428 Ethan Graham 2025-08-13  482   * @field: the name of the field to annotate.
cc1dba9238a428 Ethan Graham 2025-08-13  483   */
cc1dba9238a428 Ethan Graham 2025-08-13  484  #define KFUZZTEST_ANNOTATE_ARRAY(arg_type, field) __KFUZZTEST_ANNOTATE(arg_type, field, NULL, ATTRIBUTE_ARRAY)
cc1dba9238a428 Ethan Graham 2025-08-13  485  
cc1dba9238a428 Ethan Graham 2025-08-13  486  /**
cc1dba9238a428 Ethan Graham 2025-08-13  487   * KFUZZTEST_ANNOTATE_LEN - annotate a field as the length of another
cc1dba9238a428 Ethan Graham 2025-08-13  488   *
cc1dba9238a428 Ethan Graham 2025-08-13  489   * This expresses the relationship `arg_type.field == len(linked_field)`, where
cc1dba9238a428 Ethan Graham 2025-08-13  490   * `linked_field` is an array.
cc1dba9238a428 Ethan Graham 2025-08-13  491   *
cc1dba9238a428 Ethan Graham 2025-08-13  492   * @arg_type: name of the input structure, without the leading "struct ".
cc1dba9238a428 Ethan Graham 2025-08-13  493   * @field: the name of the field to annotate.
cc1dba9238a428 Ethan Graham 2025-08-13  494   * @linked_field: the name of an array field with length @field.
cc1dba9238a428 Ethan Graham 2025-08-13  495   */
cc1dba9238a428 Ethan Graham 2025-08-13  496  #define KFUZZTEST_ANNOTATE_LEN(arg_type, field, linked_field) \
cc1dba9238a428 Ethan Graham 2025-08-13 @497  	__KFUZZTEST_ANNOTATE(arg_type, field, linked_field, ATTRIBUTE_LEN)
cc1dba9238a428 Ethan Graham 2025-08-13  498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
