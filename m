Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A219D07E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501195; cv=none; b=FicCMQuOcUeRKcQIRwAUXKqU/NNIE3Q7LVuj7GkuJvXhlpCWTF3987zwbQl+pbneFDxNB3epYUn/BUhEeE5xVFoaLWAZXq0d/Ml+PwgwRo+8YBFXPuj0RWi+/eeR4OYR2Bs3xH33YCsbZ9TS80phFNVulm3CbZOgJADwPavtwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501195; c=relaxed/simple;
	bh=UEVrycChQPkE7Qknp/THPJAOy70fo2Fxmih/E9JdhKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCj34IjKc44huepT3LFoPWWIQ19ct9F4lMsQJTfz2ikGXrQ5LJSUfBL7Y5zV0JOam5v1t/5EiwO/IPDtZvyyWu8fOCg4XdiUczYLPHzvqIyAS41YhEbvMYnxVTrqjPfPPRWnT0PSWvQdbJuo4ziWDowb3PFv4pR9xt7t29zaZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1kxwzRY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1kxwzRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762501194; x=1794037194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEVrycChQPkE7Qknp/THPJAOy70fo2Fxmih/E9JdhKY=;
  b=X1kxwzRYFkJpdcSXDP2gUf0L4niBTJuYN7CgB8aRQOf2btk1o1AssbRV
   Bp3KLLo6YqjeoZpO21i8MVlVV7/8po4Y7WPcHQCE4Uy0cLfLcPLOokpcP
   CnG8Giz2sg5mgCoyVR6Y8/IHuhpwdlUiVKa6c7qvnVzYgEQyBfSmXAzMf
   q5pOdhiBQSV8J38sb13/y81jIkQnjlqeGJAoKLNVw4yMYyCNmh6wnkx3I
   PdtMXw4FFmP5eIt1nOCPj8WNtiqjJbP+x4mzne0Gv0ECp8KdTkDZK4hob
   +rorFyM140bGeI28o9qNhOWHjnouQe2qXS26xTl6xlcQwwtYE/7uo8pLt
   g==;
X-CSE-ConnectionGUID: 1InodmocSfyBoc8vLHokMQ==
X-CSE-MsgGUID: 4BujFP1cTCajyeMlRHsHFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="82051632"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="82051632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 23:39:53 -0800
X-CSE-ConnectionGUID: a8aLf3D1RG2tnIs5nOtX9Q==
X-CSE-MsgGUID: cipzsLE4QmegxOgaDo7ZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187230502"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2025 23:39:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHH4Y-000UqM-29;
	Fri, 07 Nov 2025 07:39:50 +0000
Date: Fri, 7 Nov 2025 15:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Li Chen <me@linux.beauty>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] gcc-plugins: add cleanup_plugin for
 uninitialized cleanup detection
Message-ID: <202511071503.SwmZ6V4M-lkp@intel.com>
References: <20251105084733.3598704-6-me@linux.beauty>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105084733.3598704-6-me@linux.beauty>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on kees/for-next/pstore kees/for-next/kspp linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Chen/gcc-plugins-cleanup_plugin-detect-NULL-init/20251105-174800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20251105084733.3598704-6-me%40linux.beauty
patch subject: [RFC PATCH 1/2] gcc-plugins: add cleanup_plugin for uninitialized cleanup detection
config: s390-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071503.SwmZ6V4M-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071503.SwmZ6V4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071503.SwmZ6V4M-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/gcc-plugins/cleanup_plugin.c: In function 'void warn_if_uninitialized(tree)':
>> scripts/gcc-plugins/cleanup_plugin.c:70:45: error: 'struct diagnostic_context' has no member named 'warning_as_error_requested_p'; did you mean 'warning_as_error_requested'?
      70 |         saved_warning_as_error = global_dc->warning_as_error_requested_p();
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             warning_as_error_requested
>> scripts/gcc-plugins/cleanup_plugin.c:71:20: error: 'struct diagnostic_context' has no member named 'set_warning_as_error_requested'; did you mean 'warning_as_error_requested'?
      71 |         global_dc->set_warning_as_error_requested(false);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    warning_as_error_requested
   scripts/gcc-plugins/cleanup_plugin.c:77:20: error: 'struct diagnostic_context' has no member named 'set_warning_as_error_requested'; did you mean 'warning_as_error_requested'?
      77 |         global_dc->set_warning_as_error_requested(saved_warning_as_error);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    warning_as_error_requested
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/cleanup_plugin.so] Error 1 shuffle=3970265060
   make[4]: Target 'scripts/gcc-plugins/' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:556: scripts/gcc-plugins] Error 2 shuffle=3970265060
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1263: scripts] Error 2 shuffle=3970265060
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3970265060
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3970265060
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [m]:
   - REGULATOR_RT5133 [=m] && REGULATOR [=y] && I2C [=m] && GPIOLIB [=y] && OF [=y]


vim +70 scripts/gcc-plugins/cleanup_plugin.c

    56	
    57	static void warn_if_uninitialized(tree var)
    58	{
    59		location_t loc;
    60		bool saved_warning_as_error;
    61	
    62		if (has_declaration_initializer(var))
    63			return;
    64	
    65		loc = DECL_SOURCE_LOCATION(var);
    66		if (loc == UNKNOWN_LOCATION)
    67			return;
    68	
    69		/* Temporarily disable treating warnings as errors for this specific warning */
  > 70		saved_warning_as_error = global_dc->warning_as_error_requested_p();
  > 71		global_dc->set_warning_as_error_requested(false);
    72		warning_at(
    73			loc, 0,
    74			"%qD declared with cleanup attribute is not initialized at declaration",
    75			var);
    76		/* Restore the original setting */
    77		global_dc->set_warning_as_error_requested(saved_warning_as_error);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
