Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223321FF2A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765030441; cv=none; b=ksvoOnSUIhsr2fuZneAH6/oeF0VYgKw8uviI/Q3Tar8t3shiRn8lQG/Y/b2Ili89HUe3ZzA+PvfkqEWn4zsPrDiNpHo7pSGn/jTkCKiszBcJD4RsW7RbjqqDGMa7DC+sDVPy/BW/RIOkssrB7ZyJofYMr5a5m45+xCd2Amjesp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765030441; c=relaxed/simple;
	bh=mxVcuw1bjJYc/td4nvDb/pLjItyY3N0iHXN/KN0XPU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uk2gRp2T8RqkJxtdbGB4pOmKR61UgTEj4l3LhgF8l6MtJ02pVhMKwhu4tJ3CSizInL0LoKv5bDpbnKuI5IvHFLvDSkPhad7II0qkLSFfoU1VyenzwGPZLZ48HdsMZsbXntBBg1+ui/CRHv/Wv7ZoejJeN2J8KrtRQdUZbq6jvM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cN4zvBZg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cN4zvBZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765030439; x=1796566439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mxVcuw1bjJYc/td4nvDb/pLjItyY3N0iHXN/KN0XPU0=;
  b=cN4zvBZgm96yVp26K1XNviqvc3fuEM8XB3hH+LVkYO7761MarPv6+wOL
   Thrg4qz1vGNtGelbdDbzr1zxUelStH7JyzO/wYBYWkL5yjufealHbqDIf
   CIbhqMU/dFxHBIeKUkAXV3RMNQgKia3Tgb28bbkDzx0P2yOKDWqcVhhY4
   yf8MmgSBtVnQFapsLIi6gBnzkbOdPGk0ysJaG/tLoLmoWlYAlbJn+wp+W
   lwv1dC3QIj4g/M0Aj31H2bpiDtfSmZ9ZlonBcTD899poolj6K9vIqVr2Y
   KwyPh1Z2bfYM1a+j36KV8alDt5CkyQVpQRk7JFsXDQ4bLJiiB/LLrTt/G
   Q==;
X-CSE-ConnectionGUID: o7gIGw4VQImysF4WcfIHAg==
X-CSE-MsgGUID: uabnbHbPQWKkVvO7tLURsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78396554"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="78396554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 06:13:59 -0800
X-CSE-ConnectionGUID: EggLI+vJRHOHsmhuYbBMKg==
X-CSE-MsgGUID: gysgDXFvTrmZym5QvO9iPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="195353126"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Dec 2025 06:13:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRt2p-00000000IEb-0ujB;
	Sat, 06 Dec 2025 14:13:55 +0000
Date: Sat, 6 Dec 2025 22:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <202512062100.BA1lJcqZ-lkp@intel.com>
References: <20251205175237.242022-5-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205175237.242022-5-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-i915/for-linux-next-fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18 next-20251205]
[cannot apply to mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov-NVIDIA/kernel-h-drop-STACK_MAGIC-macro/20251206-015505
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20251205175237.242022-5-yury.norov%40gmail.com
patch subject: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h to a dedicated header
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251206/202512062100.BA1lJcqZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062100.BA1lJcqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512062100.BA1lJcqZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:382,
                    from include/linux/trace_printk.h:9,
                    from include/linux/kernel.h:35,
                    from arch/x86/purgatory/purgatory.c:12:
>> include/linux/fortify-string.h:626:63: error: expected identifier or '(' before '{' token
     626 |                              p_size_field, q_size_field, op) ({         \
         |                                                               ^
   include/linux/fortify-string.h:694:27: note: in expansion of macro '__fortify_memcpy_chk'
     694 | #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
         |                           ^~~~~~~~~~~~~~~~~~~~
   arch/x86/purgatory/../boot/string.h:11:7: note: in expansion of macro 'memmove'
      11 | void *memmove(void *dst, const void *src, size_t len);
         |       ^~~~~~~
>> include/linux/fortify-string.h:258:9: error: expected identifier or '(' before '__builtin_choose_expr'
     258 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/purgatory/../boot/string.h:23:15: note: in expansion of macro 'strlen'
      23 | extern size_t strlen(const char *s);
         |               ^~~~~~


vim +626 include/linux/fortify-string.h

a28a6e860c6cf23 Francis Laniel  2021-02-25  618  
239d87327dcd361 Kees Cook       2024-12-12  619  /*
239d87327dcd361 Kees Cook       2024-12-12  620   * To work around what seems to be an optimizer bug, the macro arguments
239d87327dcd361 Kees Cook       2024-12-12  621   * need to have const copies or the values end up changed by the time they
239d87327dcd361 Kees Cook       2024-12-12  622   * reach fortify_warn_once(). See commit 6f7630b1b5bc ("fortify: Capture
239d87327dcd361 Kees Cook       2024-12-12  623   * __bos() results in const temp vars") for more details.
239d87327dcd361 Kees Cook       2024-12-12  624   */
f68f2ff91512c19 Kees Cook       2021-04-20  625  #define __fortify_memcpy_chk(p, q, size, p_size, q_size,		\
f68f2ff91512c19 Kees Cook       2021-04-20 @626  			     p_size_field, q_size_field, op) ({		\
6f7630b1b5bc672 Kees Cook       2022-10-28  627  	const size_t __fortify_size = (size_t)(size);			\
6f7630b1b5bc672 Kees Cook       2022-10-28  628  	const size_t __p_size = (p_size);				\
6f7630b1b5bc672 Kees Cook       2022-10-28  629  	const size_t __q_size = (q_size);				\
6f7630b1b5bc672 Kees Cook       2022-10-28  630  	const size_t __p_size_field = (p_size_field);			\
6f7630b1b5bc672 Kees Cook       2022-10-28  631  	const size_t __q_size_field = (q_size_field);			\
239d87327dcd361 Kees Cook       2024-12-12  632  	/* Keep a mutable version of the size for the final copy. */	\
239d87327dcd361 Kees Cook       2024-12-12  633  	size_t __copy_size = __fortify_size;				\
26f812ba75890c4 Kees Cook       2024-04-29  634  	fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,	\
6f7630b1b5bc672 Kees Cook       2022-10-28  635  				     __q_size, __p_size_field,		\
475ddf1fce1ec48 Kees Cook       2023-04-07  636  				     __q_size_field, FORTIFY_FUNC_ ##op), \
54d9469bc515dc5 Kees Cook       2021-06-24  637  		  #op ": detected field-spanning write (size %zu) of single %s (size %zu)\n", \
54d9469bc515dc5 Kees Cook       2021-06-24  638  		  __fortify_size,					\
5097a69d676f7e5 Alexey Dobriyan 2023-09-16  639  		  "field \"" #p "\" at " FILE_LINE,			\
6f7630b1b5bc672 Kees Cook       2022-10-28  640  		  __p_size_field);					\
239d87327dcd361 Kees Cook       2024-12-12  641  	/* Hide only the run-time size from value range tracking to */	\
239d87327dcd361 Kees Cook       2024-12-12  642  	/* silence compile-time false positive bounds warnings. */	\
239d87327dcd361 Kees Cook       2024-12-12  643  	if (!__builtin_constant_p(__copy_size))				\
239d87327dcd361 Kees Cook       2024-12-12  644  		OPTIMIZER_HIDE_VAR(__copy_size);			\
239d87327dcd361 Kees Cook       2024-12-12  645  	__underlying_##op(p, q, __copy_size);				\
f68f2ff91512c19 Kees Cook       2021-04-20  646  })
f68f2ff91512c19 Kees Cook       2021-04-20  647  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
