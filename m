Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29139277CB4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753789458; cv=none; b=UU1ep46pMgkn9/bPJZ0eT0HPoMfIFQMeArLHzGRbdkdlWWfd8ha5LdjxsvH5KIzIzPjciWC+mB9KXkVEiDRAm/llbvTlA6hYan3lQBdp3WiFxbEsCAF6dGmNgAu7iB3KcJ03sBCuFivYrNYZgqLCAT95ppMZidFr9HaU1U94w2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753789458; c=relaxed/simple;
	bh=PnKL3Pyqyhz+bbQWojdZWWJxBLSJXrYz7i/hv3mYuu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLLPBy6Y5J/qxRbTlPSJXCctCWBz7VCR0n2bdWnIBuzNEJtcFluPC2nAJnzUx7nMhCvUZEJPtIb5ny8f40R/428ooFipyj7mp5/O+yVnXHOEyrcy66Rg3hbLk2bCEIw64MKwpEahYhiH60vxwnQsVow7QBuSIHgLnaAwKZYd6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc+LJVzE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc+LJVzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753789457; x=1785325457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PnKL3Pyqyhz+bbQWojdZWWJxBLSJXrYz7i/hv3mYuu8=;
  b=Dc+LJVzE3EJGXt5WLTxtEydVgP3Q6Hs8M9Ia9IAbOWQtW7xr4tArt6Gi
   Yan5JDDyO5U5NdZ8xz5D2DGng7bMBsbP5EAx/wgVwMQL0Pe8bo/n32Aa8
   I9cAoE3m515v0NG4ELWKFHNHpPslgG7NvG8v6QGxj9gXoJpSxZdY6/ZgS
   TN15fUb8Hygs6igX0bQNybWromk/KsDsi9y93d5Pp1uYfBpwBArWI4UOk
   SmBmZ+Jb5K3xZ5155tboLXwN6pZ+HvLkPE8sx8ELhxAq0BuYDPLO/XM6T
   Vm7gNVSlKwh5w0yfcAVuX3tJFx18zp7MY6emzFQJ9M8KgsgDOi8aqAdko
   w==;
X-CSE-ConnectionGUID: mOX9eM4ZRHKXkLPy3+O0vA==
X-CSE-MsgGUID: CXIgtz2cQgGC6n0gZD6++w==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56201181"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="56201181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:44:15 -0700
X-CSE-ConnectionGUID: 4+hpF88NTZyzNYZafdPOGg==
X-CSE-MsgGUID: TN+w/QwzRluX085lDlwpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163126446"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2025 04:44:12 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugikc-0001FH-1Q;
	Tue, 29 Jul 2025 11:44:10 +0000
Date: Tue, 29 Jul 2025 19:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: oe-kbuild-all@lists.linux.dev, quic_jiangenj@quicinc.com,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	Dmitry Vyukov <dvyukov@google.com>,
	Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 04/10] mm/kasan: define __asan_before_dynamic_init,
 __asan_after_dynamic_init
Message-ID: <202507291913.UMbUQv95-lkp@intel.com>
References: <20250728152548.3969143-5-glider@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728152548.3969143-5-glider@google.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on akpm-mm/mm-everything shuah-kselftest/next shuah-kselftest/fixes linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/x86-kcov-disable-instrumentation-of-arch-x86-kernel-tsc-c/20250728-232935
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250728152548.3969143-5-glider%40google.com
patch subject: [PATCH v3 04/10] mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250729/202507291913.UMbUQv95-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291913.UMbUQv95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291913.UMbUQv95-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/kasan/kasan_test_c.c:32:
>> mm/kasan/kasan.h:585:6: warning: conflicting types for built-in function '__asan_before_dynamic_init'; expected 'void(const void *)' [-Wbuiltin-declaration-mismatch]
     585 | void __asan_before_dynamic_init(const char *module_name);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +585 mm/kasan/kasan.h

   577	
   578	/*
   579	 * Exported functions for interfaces called from assembly or from generated
   580	 * code. Declared here to avoid warnings about missing declarations.
   581	 */
   582	
   583	void __asan_register_globals(void *globals, ssize_t size);
   584	void __asan_unregister_globals(void *globals, ssize_t size);
 > 585	void __asan_before_dynamic_init(const char *module_name);
   586	void __asan_after_dynamic_init(void);
   587	void __asan_handle_no_return(void);
   588	void __asan_alloca_poison(void *, ssize_t size);
   589	void __asan_allocas_unpoison(void *stack_top, ssize_t stack_bottom);
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
