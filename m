Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48D1917FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531670; cv=none; b=lg4vgMAWEt8A9KX0diYY6RsRRYSqwUBGrLIplQmFpDWyUZVVQycpZnwCA9UTNproMh+O8Y6XBAd5NHE5tBt9udHfPJYBk6kIz7rlCbPCUYeqFHNnsJlpm1jd08z3JAz+VAa10qqR43gtw7lF8EkLphkwabqcTeQZSzgoJp3qq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531670; c=relaxed/simple;
	bh=VyAWP+3/dLW7IOMW6olT3uFS2P6TsvsGrrJwLD2HYq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWGjO73HNu6YMUu74M6zOKeVajKymNcDZ44h1mPIboMtFj8/OQoBj9cu6ljHV0ehWHe2+y+bJji02rDMa+LFmvVzulkQf7TWv/J3jwOngxGbtNn162vwBai+gXRbr6gBeMqSH4kd8/L2Qk+z5ldDWnAWMZHUtY4ctva2ljqOAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNLIXUj0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNLIXUj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732531668; x=1764067668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VyAWP+3/dLW7IOMW6olT3uFS2P6TsvsGrrJwLD2HYq8=;
  b=ZNLIXUj0eYKIRHOmkgZ1sRUsCDUXSzO51d9ri3FghtdL6OWT36OEhvCL
   0wz53hHNEHcQaRXhXItAJ7zjqTaUd2vQYQujI+Oxej/pKW61z6OOOkjxT
   9igxr8rQ2DmdKWhWFiiSsubK5t5pFVRKa3kt03gJR0H0AvKaw996Azagu
   Zo2rG7UrS9hCldMdlLKS9f60RuxEOIH5W+dvNZT2Et5cOj8gmkcOrJYkN
   vHU+C3kH7BrcrHOiGt8Du72RV4uvKePoUw5iUUB+Vr/O3qYs3kpOCqWfb
   Ua5s536FMnAJjJJKN7vMjgBbnw8UfwLWjlq9MYZSjrakQEw11ItSJqpYW
   Q==;
X-CSE-ConnectionGUID: cZoywxMCTBqEPHN6L0x3mQ==
X-CSE-MsgGUID: xwtwH2jASyKDyWzzOxAN0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43289041"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43289041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 02:47:46 -0800
X-CSE-ConnectionGUID: oHJwdjcKRsaUtOu4el1ZAA==
X-CSE-MsgGUID: hpUF9BkxQxudDHzTPKFEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96285525"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 02:47:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFWd4-0006Ar-1t;
	Mon, 25 Nov 2024 10:47:42 +0000
Date: Mon, 25 Nov 2024 18:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] objtool: Add noinstr validation for static
 branches/calls
Message-ID: <202411251822.MQI8kf80-lkp@intel.com>
References: <b5746646456eb030673cdb62c23d69ed83c2702a.1732326588.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5746646456eb030673cdb62c23d69ed83c2702a.1732326588.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/jump_label-Add-annotations-for-validating-noinstr-usage/20241125-105905
base:   linus/master
patch link:    https://lore.kernel.org/r/b5746646456eb030673cdb62c23d69ed83c2702a.1732326588.git.jpoimboe%40kernel.org
patch subject: [PATCH 3/3] objtool: Add noinstr validation for static branches/calls
config: i386-buildonly-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251822.MQI8kf80-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251822.MQI8kf80-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251822.MQI8kf80-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/context_tracking.h:5,
                    from arch/x86/kernel/kvm.c:12:
   include/linux/jump_label.h:388:9: warning: data definition has no type or storage class
     388 |         ANNOTATE_NOINSTR_ALLOWED(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kvm.c:48:1: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
      48 | DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:388:9: error: type defaults to 'int' in declaration of 'ANNOTATE_NOINSTR_ALLOWED' [-Werror=implicit-int]
     388 |         ANNOTATE_NOINSTR_ALLOWED(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kvm.c:48:1: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
      48 | DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/jump_label.h:371:39: warning: parameter names (without types) in function declaration
     371 | #define STATIC_KEY_FALSE_INIT (struct static_key_false){ .key = STATIC_KEY_INIT_FALSE, }
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:387:56: note: in expansion of macro 'STATIC_KEY_FALSE_INIT'
     387 |         struct static_key_false name __ro_after_init = STATIC_KEY_FALSE_INIT;   \
         |                                                        ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kvm.c:48:1: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
      48 | DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from arch/x86/kernel/tsc.c:5:
   include/linux/jump_label.h:388:9: warning: data definition has no type or storage class
     388 |         ANNOTATE_NOINSTR_ALLOWED(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/tsc.c:48:8: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
      48 | static DEFINE_STATIC_KEY_FALSE_RO(__use_tsc);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:388:9: error: type defaults to 'int' in declaration of 'ANNOTATE_NOINSTR_ALLOWED' [-Werror=implicit-int]
     388 |         ANNOTATE_NOINSTR_ALLOWED(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/tsc.c:48:8: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
      48 | static DEFINE_STATIC_KEY_FALSE_RO(__use_tsc);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/jump_label.h:371:39: warning: parameter names (without types) in function declaration
     371 | #define STATIC_KEY_FALSE_INIT (struct static_key_false){ .key = STATIC_KEY_INIT_FALSE, }
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:387:56: note: in expansion of macro 'STATIC_KEY_FALSE_INIT'
     387 |         struct static_key_false name __ro_after_init = STATIC_KEY_FALSE_INIT;   \
         |                                                        ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/tsc.c:48:8: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
      48 | static DEFINE_STATIC_KEY_FALSE_RO(__use_tsc);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from arch/x86/kernel/cpu/common.c:5:
   include/linux/jump_label.h:388:9: warning: data definition has no type or storage class
     388 |         ANNOTATE_NOINSTR_ALLOWED(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/common.c:404:8: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
     404 | static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:388:9: error: type defaults to 'int' in declaration of 'ANNOTATE_NOINSTR_ALLOWED' [-Werror=implicit-int]
     388 |         ANNOTATE_NOINSTR_ALLOWED(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/common.c:404:8: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
     404 | static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/jump_label.h:371:39: warning: parameter names (without types) in function declaration
     371 | #define STATIC_KEY_FALSE_INIT (struct static_key_false){ .key = STATIC_KEY_INIT_FALSE, }
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:387:56: note: in expansion of macro 'STATIC_KEY_FALSE_INIT'
     387 |         struct static_key_false name __ro_after_init = STATIC_KEY_FALSE_INIT;   \
         |                                                        ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/common.c:404:8: note: in expansion of macro 'DEFINE_STATIC_KEY_FALSE_RO'
     404 | static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +371 include/linux/jump_label.h

11276d5306b8e5 Peter Zijlstra 2015-07-24  369  
11276d5306b8e5 Peter Zijlstra 2015-07-24  370  #define STATIC_KEY_TRUE_INIT  (struct static_key_true) { .key = STATIC_KEY_INIT_TRUE,  }
11276d5306b8e5 Peter Zijlstra 2015-07-24 @371  #define STATIC_KEY_FALSE_INIT (struct static_key_false){ .key = STATIC_KEY_INIT_FALSE, }
11276d5306b8e5 Peter Zijlstra 2015-07-24  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
