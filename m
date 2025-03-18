Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DA1A83FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742290581; cv=none; b=urNEYExnDwpQYJMoalv+vEEWcvvQHLmk4/5ikxR3L/PBmZEfMo+/UlL7Raw/V+veVHHpPRjF+x4o0GIXJTmR4eNC0kxXL+ZZVogKJs6X2wsrGn1eocFgeG9pZmQq/7kZ6eJT5EdPij9ud8yB4SR9f8lFYTESpG3NA1rwzPtvJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742290581; c=relaxed/simple;
	bh=2pfmAUuHN967C9JBTPwp98d6HLBfSSL4aYTJ//rt41w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALxqupxtk1ZRR/Bd6jAKO/nSV5tvw+dbNg4U1nF/UDR0Ft3JiOGHMrwKonI3cjTE/nFIkJaAA1wV9VYESLZ/y/BhW9M2A3nazbWQbmuclWsWhHz04ptOa/A8UMKv9I5Q5dBQgCDOAcOjLreDT33zMPxlU/zZ14xiod4h0iYXRRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKC9/dC9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKC9/dC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742290580; x=1773826580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pfmAUuHN967C9JBTPwp98d6HLBfSSL4aYTJ//rt41w=;
  b=dKC9/dC9uC+ISqW77f/sjkeyhO+RhUSHlCevCSl5IlGUYbtpHP4KT4f1
   AhQ3FFxJn21quHoNCBY1mKUI7VjEl1kntDbHd3hFrgC0+qxKW3E542x+X
   Ql6p2XRCpNrm5LHK7BWsdf9LY2aemEjCKT+DvUtuY4eEkPrxel18FzlhA
   tg6JaNZ/9GS+X5yESEtRr+IobgwQseiIO5G4cxgHstJpgjDHNMwbwD4ua
   9iJKGMfswi111ZSIBprIkqDSN3zIrh7QqpoK9VHg9l1KhPP3iFyivMIEp
   k4dmprrUgIZSKg7ESbbVFDfXqAESWiHNM1Y4ppyo2NeuKa1hKwdggCqMm
   Q==;
X-CSE-ConnectionGUID: Izm9pst3Sk6ARsqBNFpgtg==
X-CSE-MsgGUID: vsJM/pDETheuV9PAA1AlUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43592386"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43592386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 02:28:02 -0700
X-CSE-ConnectionGUID: rOCo8uIRSwODsVGkWsklKA==
X-CSE-MsgGUID: V+7GQYDXSVespfJpRKQucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127299795"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 02:27:59 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuTEr-000Dcp-1o;
	Tue, 18 Mar 2025 09:27:57 +0000
Date: Tue, 18 Mar 2025 17:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1501/1501] lib/ubsan.c:195:6: warning:
 mismatch in argument 1 type of built-in function
 '__ubsan_handle_add_overflow'; expected 'void *'
Message-ID: <202503181741.vcHyKenV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a304375c0bb304fd38fa85987919aff3d831cf9b
commit: d2e5767132d657577127f1d35764bb4721dd3cc5 [1501/1501] ubsan: Fix nasty -Wbuiltin-declaration-mismatch GCC-9 warnings
config: arm64-randconfig-001-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181741.vcHyKenV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181741.vcHyKenV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181741.vcHyKenV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ubsan.c:195:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_add_overflow'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     195 | void __ubsan_handle_add_overflow(struct overflow_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:203:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_sub_overflow'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     203 | void __ubsan_handle_sub_overflow(struct overflow_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:210:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_mul_overflow'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     210 | void __ubsan_handle_mul_overflow(struct overflow_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:217:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_negate_overflow'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     217 | void __ubsan_handle_negate_overflow(struct overflow_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:238:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_divrem_overflow'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     238 | void __ubsan_handle_divrem_overflow(struct overflow_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/ubsan.c:323:6: warning: no previous prototype for '__ubsan_handle_type_mismatch' [-Wmissing-prototypes]
     323 | void __ubsan_handle_type_mismatch(struct type_mismatch_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:337:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_type_mismatch_v1'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     337 | void __ubsan_handle_type_mismatch_v1(struct type_mismatch_data_v1 *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:352:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_vla_bound_not_positive'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     352 | void __ubsan_handle_vla_bound_not_positive(struct vla_bound_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:370:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_out_of_bounds'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     370 | void __ubsan_handle_out_of_bounds(struct out_of_bounds_data *data, void *index)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:387:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_shift_out_of_bounds'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     387 | void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/ubsan.c:427:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_builtin_unreachable'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     427 | void __ubsan_handle_builtin_unreachable(struct unreachable_data *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.c:438:6: warning: mismatch in argument 1 type of built-in function '__ubsan_handle_load_invalid_value'; expected 'void *' [-Wbuiltin-declaration-mismatch]
     438 | void __ubsan_handle_load_invalid_value(struct invalid_value_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +195 lib/ubsan.c

c6d308534aef6c Andrey Ryabinin 2016-01-20  194  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @195  void __ubsan_handle_add_overflow(struct overflow_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  196  				void *lhs, void *rhs)
c6d308534aef6c Andrey Ryabinin 2016-01-20  197  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  198  
c6d308534aef6c Andrey Ryabinin 2016-01-20  199  	handle_overflow(data, lhs, rhs, '+');
c6d308534aef6c Andrey Ryabinin 2016-01-20  200  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  201  EXPORT_SYMBOL(__ubsan_handle_add_overflow);
c6d308534aef6c Andrey Ryabinin 2016-01-20  202  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @203  void __ubsan_handle_sub_overflow(struct overflow_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  204  				void *lhs, void *rhs)
c6d308534aef6c Andrey Ryabinin 2016-01-20  205  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  206  	handle_overflow(data, lhs, rhs, '-');
c6d308534aef6c Andrey Ryabinin 2016-01-20  207  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  208  EXPORT_SYMBOL(__ubsan_handle_sub_overflow);
c6d308534aef6c Andrey Ryabinin 2016-01-20  209  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @210  void __ubsan_handle_mul_overflow(struct overflow_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  211  				void *lhs, void *rhs)
c6d308534aef6c Andrey Ryabinin 2016-01-20  212  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  213  	handle_overflow(data, lhs, rhs, '*');
c6d308534aef6c Andrey Ryabinin 2016-01-20  214  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  215  EXPORT_SYMBOL(__ubsan_handle_mul_overflow);
c6d308534aef6c Andrey Ryabinin 2016-01-20  216  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @217  void __ubsan_handle_negate_overflow(struct overflow_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  218  				void *old_val)
c6d308534aef6c Andrey Ryabinin 2016-01-20  219  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  220  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  221  	char old_val_str[VALUE_LENGTH];
c6d308534aef6c Andrey Ryabinin 2016-01-20  222  
c6d308534aef6c Andrey Ryabinin 2016-01-20  223  	if (suppress_report(&data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  224  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  225  
c6d308534aef6c Andrey Ryabinin 2016-01-20  226  	ubsan_prologue(&data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  227  
c6d308534aef6c Andrey Ryabinin 2016-01-20  228  	val_to_string(old_val_str, sizeof(old_val_str), data->type, old_val);
c6d308534aef6c Andrey Ryabinin 2016-01-20  229  
c6d308534aef6c Andrey Ryabinin 2016-01-20  230  	pr_err("negation of %s cannot be represented in type %s:\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  231  		old_val_str, data->type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  232  
c6d308534aef6c Andrey Ryabinin 2016-01-20  233  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  234  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  235  EXPORT_SYMBOL(__ubsan_handle_negate_overflow);
c6d308534aef6c Andrey Ryabinin 2016-01-20  236  
c6d308534aef6c Andrey Ryabinin 2016-01-20  237  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @238  void __ubsan_handle_divrem_overflow(struct overflow_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  239  				void *lhs, void *rhs)
c6d308534aef6c Andrey Ryabinin 2016-01-20  240  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  241  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  242  	char rhs_val_str[VALUE_LENGTH];
c6d308534aef6c Andrey Ryabinin 2016-01-20  243  
c6d308534aef6c Andrey Ryabinin 2016-01-20  244  	if (suppress_report(&data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  245  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  246  
c6d308534aef6c Andrey Ryabinin 2016-01-20  247  	ubsan_prologue(&data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  248  
c6d308534aef6c Andrey Ryabinin 2016-01-20  249  	val_to_string(rhs_val_str, sizeof(rhs_val_str), data->type, rhs);
c6d308534aef6c Andrey Ryabinin 2016-01-20  250  
c6d308534aef6c Andrey Ryabinin 2016-01-20  251  	if (type_is_signed(data->type) && get_signed_val(data->type, rhs) == -1)
c6d308534aef6c Andrey Ryabinin 2016-01-20  252  		pr_err("division of %s by -1 cannot be represented in type %s\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  253  			rhs_val_str, data->type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  254  	else
c6d308534aef6c Andrey Ryabinin 2016-01-20  255  		pr_err("division by zero\n");
c6d308534aef6c Andrey Ryabinin 2016-01-20  256  
c6d308534aef6c Andrey Ryabinin 2016-01-20  257  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  258  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  259  EXPORT_SYMBOL(__ubsan_handle_divrem_overflow);
c6d308534aef6c Andrey Ryabinin 2016-01-20  260  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  261  static void handle_null_ptr_deref(struct type_mismatch_data_common *data)
c6d308534aef6c Andrey Ryabinin 2016-01-20  262  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  263  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  264  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  265  	if (suppress_report(data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  266  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  267  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  268  	ubsan_prologue(data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  269  
c6d308534aef6c Andrey Ryabinin 2016-01-20  270  	pr_err("%s null pointer of type %s\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  271  		type_check_kinds[data->type_check_kind],
c6d308534aef6c Andrey Ryabinin 2016-01-20  272  		data->type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  273  
c6d308534aef6c Andrey Ryabinin 2016-01-20  274  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  275  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  276  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  277  static void handle_misaligned_access(struct type_mismatch_data_common *data,
c6d308534aef6c Andrey Ryabinin 2016-01-20  278  				unsigned long ptr)
c6d308534aef6c Andrey Ryabinin 2016-01-20  279  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  280  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  281  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  282  	if (suppress_report(data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  283  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  284  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  285  	ubsan_prologue(data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  286  
c6d308534aef6c Andrey Ryabinin 2016-01-20  287  	pr_err("%s misaligned address %p for type %s\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  288  		type_check_kinds[data->type_check_kind],
c6d308534aef6c Andrey Ryabinin 2016-01-20  289  		(void *)ptr, data->type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  290  	pr_err("which requires %ld byte alignment\n", data->alignment);
c6d308534aef6c Andrey Ryabinin 2016-01-20  291  
c6d308534aef6c Andrey Ryabinin 2016-01-20  292  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  293  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  294  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  295  static void handle_object_size_mismatch(struct type_mismatch_data_common *data,
c6d308534aef6c Andrey Ryabinin 2016-01-20  296  					unsigned long ptr)
c6d308534aef6c Andrey Ryabinin 2016-01-20  297  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  298  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  299  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  300  	if (suppress_report(data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  301  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  302  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  303  	ubsan_prologue(data->location, &flags);
901d805c33fc4c Nicolas Iooss   2016-08-02  304  	pr_err("%s address %p with insufficient space\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  305  		type_check_kinds[data->type_check_kind],
c6d308534aef6c Andrey Ryabinin 2016-01-20  306  		(void *) ptr);
c6d308534aef6c Andrey Ryabinin 2016-01-20  307  	pr_err("for an object of type %s\n", data->type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  308  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  309  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  310  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  311  static void ubsan_type_mismatch_common(struct type_mismatch_data_common *data,
c6d308534aef6c Andrey Ryabinin 2016-01-20  312  				unsigned long ptr)
c6d308534aef6c Andrey Ryabinin 2016-01-20  313  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  314  
c6d308534aef6c Andrey Ryabinin 2016-01-20  315  	if (!ptr)
c6d308534aef6c Andrey Ryabinin 2016-01-20  316  		handle_null_ptr_deref(data);
c6d308534aef6c Andrey Ryabinin 2016-01-20  317  	else if (data->alignment && !IS_ALIGNED(ptr, data->alignment))
b8fe1120b4ba34 Andrew Morton   2018-02-06  318  		handle_misaligned_access(data, ptr);
c6d308534aef6c Andrey Ryabinin 2016-01-20  319  	else
c6d308534aef6c Andrey Ryabinin 2016-01-20  320  		handle_object_size_mismatch(data, ptr);
c6d308534aef6c Andrey Ryabinin 2016-01-20  321  }
42440c1f9911b4 Andrey Ryabinin 2018-02-06  322  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  323  void __ubsan_handle_type_mismatch(struct type_mismatch_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  324  				void *ptr)
42440c1f9911b4 Andrey Ryabinin 2018-02-06  325  {
42440c1f9911b4 Andrey Ryabinin 2018-02-06  326  	struct type_mismatch_data_common common_data = {
42440c1f9911b4 Andrey Ryabinin 2018-02-06  327  		.location = &data->location,
42440c1f9911b4 Andrey Ryabinin 2018-02-06  328  		.type = data->type,
42440c1f9911b4 Andrey Ryabinin 2018-02-06  329  		.alignment = data->alignment,
42440c1f9911b4 Andrey Ryabinin 2018-02-06  330  		.type_check_kind = data->type_check_kind
42440c1f9911b4 Andrey Ryabinin 2018-02-06  331  	};
42440c1f9911b4 Andrey Ryabinin 2018-02-06  332  
d2e5767132d657 Andrey Ryabinin 2019-05-13  333  	ubsan_type_mismatch_common(&common_data, (unsigned long)ptr);
42440c1f9911b4 Andrey Ryabinin 2018-02-06  334  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  335  EXPORT_SYMBOL(__ubsan_handle_type_mismatch);
c6d308534aef6c Andrey Ryabinin 2016-01-20  336  
42440c1f9911b4 Andrey Ryabinin 2018-02-06 @337  void __ubsan_handle_type_mismatch_v1(struct type_mismatch_data_v1 *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  338  				void *ptr)
42440c1f9911b4 Andrey Ryabinin 2018-02-06  339  {
42440c1f9911b4 Andrey Ryabinin 2018-02-06  340  
42440c1f9911b4 Andrey Ryabinin 2018-02-06  341  	struct type_mismatch_data_common common_data = {
42440c1f9911b4 Andrey Ryabinin 2018-02-06  342  		.location = &data->location,
42440c1f9911b4 Andrey Ryabinin 2018-02-06  343  		.type = data->type,
42440c1f9911b4 Andrey Ryabinin 2018-02-06  344  		.alignment = 1UL << data->log_alignment,
42440c1f9911b4 Andrey Ryabinin 2018-02-06  345  		.type_check_kind = data->type_check_kind
42440c1f9911b4 Andrey Ryabinin 2018-02-06  346  	};
42440c1f9911b4 Andrey Ryabinin 2018-02-06  347  
d2e5767132d657 Andrey Ryabinin 2019-05-13  348  	ubsan_type_mismatch_common(&common_data, (unsigned long)ptr);
42440c1f9911b4 Andrey Ryabinin 2018-02-06  349  }
42440c1f9911b4 Andrey Ryabinin 2018-02-06  350  EXPORT_SYMBOL(__ubsan_handle_type_mismatch_v1);
42440c1f9911b4 Andrey Ryabinin 2018-02-06  351  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @352  void __ubsan_handle_vla_bound_not_positive(struct vla_bound_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  353  					void *bound)
c6d308534aef6c Andrey Ryabinin 2016-01-20  354  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  355  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  356  	char bound_str[VALUE_LENGTH];
c6d308534aef6c Andrey Ryabinin 2016-01-20  357  
c6d308534aef6c Andrey Ryabinin 2016-01-20  358  	if (suppress_report(&data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  359  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  360  
c6d308534aef6c Andrey Ryabinin 2016-01-20  361  	ubsan_prologue(&data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  362  
c6d308534aef6c Andrey Ryabinin 2016-01-20  363  	val_to_string(bound_str, sizeof(bound_str), data->type, bound);
c6d308534aef6c Andrey Ryabinin 2016-01-20  364  	pr_err("variable length array bound value %s <= 0\n", bound_str);
c6d308534aef6c Andrey Ryabinin 2016-01-20  365  
c6d308534aef6c Andrey Ryabinin 2016-01-20  366  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  367  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  368  EXPORT_SYMBOL(__ubsan_handle_vla_bound_not_positive);
c6d308534aef6c Andrey Ryabinin 2016-01-20  369  
d2e5767132d657 Andrey Ryabinin 2019-05-13 @370  void __ubsan_handle_out_of_bounds(struct out_of_bounds_data *data, void *index)
c6d308534aef6c Andrey Ryabinin 2016-01-20  371  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  372  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  373  	char index_str[VALUE_LENGTH];
c6d308534aef6c Andrey Ryabinin 2016-01-20  374  
c6d308534aef6c Andrey Ryabinin 2016-01-20  375  	if (suppress_report(&data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  376  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  377  
c6d308534aef6c Andrey Ryabinin 2016-01-20  378  	ubsan_prologue(&data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  379  
c6d308534aef6c Andrey Ryabinin 2016-01-20  380  	val_to_string(index_str, sizeof(index_str), data->index_type, index);
c6d308534aef6c Andrey Ryabinin 2016-01-20  381  	pr_err("index %s is out of range for type %s\n", index_str,
c6d308534aef6c Andrey Ryabinin 2016-01-20  382  		data->array_type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  383  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  384  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  385  EXPORT_SYMBOL(__ubsan_handle_out_of_bounds);
c6d308534aef6c Andrey Ryabinin 2016-01-20  386  
c6d308534aef6c Andrey Ryabinin 2016-01-20 @387  void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
d2e5767132d657 Andrey Ryabinin 2019-05-13  388  					void *lhs, void *rhs)
c6d308534aef6c Andrey Ryabinin 2016-01-20  389  {
c6d308534aef6c Andrey Ryabinin 2016-01-20  390  	unsigned long flags;
c6d308534aef6c Andrey Ryabinin 2016-01-20  391  	struct type_descriptor *rhs_type = data->rhs_type;
c6d308534aef6c Andrey Ryabinin 2016-01-20  392  	struct type_descriptor *lhs_type = data->lhs_type;
c6d308534aef6c Andrey Ryabinin 2016-01-20  393  	char rhs_str[VALUE_LENGTH];
c6d308534aef6c Andrey Ryabinin 2016-01-20  394  	char lhs_str[VALUE_LENGTH];
c6d308534aef6c Andrey Ryabinin 2016-01-20  395  
c6d308534aef6c Andrey Ryabinin 2016-01-20  396  	if (suppress_report(&data->location))
c6d308534aef6c Andrey Ryabinin 2016-01-20  397  		return;
c6d308534aef6c Andrey Ryabinin 2016-01-20  398  
c6d308534aef6c Andrey Ryabinin 2016-01-20  399  	ubsan_prologue(&data->location, &flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  400  
c6d308534aef6c Andrey Ryabinin 2016-01-20  401  	val_to_string(rhs_str, sizeof(rhs_str), rhs_type, rhs);
c6d308534aef6c Andrey Ryabinin 2016-01-20  402  	val_to_string(lhs_str, sizeof(lhs_str), lhs_type, lhs);
c6d308534aef6c Andrey Ryabinin 2016-01-20  403  
c6d308534aef6c Andrey Ryabinin 2016-01-20  404  	if (val_is_negative(rhs_type, rhs))
c6d308534aef6c Andrey Ryabinin 2016-01-20  405  		pr_err("shift exponent %s is negative\n", rhs_str);
c6d308534aef6c Andrey Ryabinin 2016-01-20  406  
c6d308534aef6c Andrey Ryabinin 2016-01-20  407  	else if (get_unsigned_val(rhs_type, rhs) >=
c6d308534aef6c Andrey Ryabinin 2016-01-20  408  		type_bit_width(lhs_type))
c6d308534aef6c Andrey Ryabinin 2016-01-20  409  		pr_err("shift exponent %s is too large for %u-bit type %s\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  410  			rhs_str,
c6d308534aef6c Andrey Ryabinin 2016-01-20  411  			type_bit_width(lhs_type),
c6d308534aef6c Andrey Ryabinin 2016-01-20  412  			lhs_type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  413  	else if (val_is_negative(lhs_type, lhs))
c6d308534aef6c Andrey Ryabinin 2016-01-20  414  		pr_err("left shift of negative value %s\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  415  			lhs_str);
c6d308534aef6c Andrey Ryabinin 2016-01-20  416  	else
c6d308534aef6c Andrey Ryabinin 2016-01-20  417  		pr_err("left shift of %s by %s places cannot be"
c6d308534aef6c Andrey Ryabinin 2016-01-20  418  			" represented in type %s\n",
c6d308534aef6c Andrey Ryabinin 2016-01-20  419  			lhs_str, rhs_str,
c6d308534aef6c Andrey Ryabinin 2016-01-20  420  			lhs_type->type_name);
c6d308534aef6c Andrey Ryabinin 2016-01-20  421  
c6d308534aef6c Andrey Ryabinin 2016-01-20  422  	ubsan_epilogue(&flags);
c6d308534aef6c Andrey Ryabinin 2016-01-20  423  }
c6d308534aef6c Andrey Ryabinin 2016-01-20  424  EXPORT_SYMBOL(__ubsan_handle_shift_out_of_bounds);
c6d308534aef6c Andrey Ryabinin 2016-01-20  425  
c6d308534aef6c Andrey Ryabinin 2016-01-20  426  

:::::: The code at line 195 was first introduced by commit
:::::: c6d308534aef6c99904bf5862066360ae067abc4 UBSAN: run-time undefined behavior sanity checker

:::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
