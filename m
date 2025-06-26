Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E53E2F002E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966962; cv=none; b=P/VHAhmc26fzlrX9WP1UgFFe+pFO4rOWpJQLxiqPDc/2Lmxq0bQInh+4nhhPDh3J+zhaFQ0BcLruvSQd9Xb9Q3tjcXvoWxT8zCOmLHydqFNztpDWL5KCKUNb7aKG3XAP9QPaoxDJ4Eo9usH19bSl2Zdk7pxrNBYOc3WwnusOvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966962; c=relaxed/simple;
	bh=2kACzHQ7qArNuYO+GBmVuAbSWAyLTO5F4cXujl/wkTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OyVjOWWN0O/xex9cwDYO8w7kdgWTyRPbQuvqlF/ld1uG9p+LOMGy/39RNHSfU6yxGs7LKOqk6bZH2glt+E/nhWv4RTn7ytUIgnBHNOqcTCLl3y0kL6h6JkqXOFN5wGYiVl9BQr8DEIQjylvKhyvU5S35gwHbC6Zww6ksRYiJfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDliL7dL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDliL7dL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750966960; x=1782502960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2kACzHQ7qArNuYO+GBmVuAbSWAyLTO5F4cXujl/wkTo=;
  b=ZDliL7dLmEXS3QffiatzcNSLw8mWaFl+dQAexHMc3EJpBC1/uSrAiwgI
   SN2ru90kpshCEKNlvGW/qT9SzYO01yIEcvl4rcDQWdrbPIFH10jQ3Rfd+
   r192kjVTMuGx7rHpIveA3In/msdlABYkm7JzbY/9BIfWyyE/HTLmOA7xh
   QLnA350PE3safzN1WwjmnAP6hx750+Flij2Ve4SdM9rAZCWXcTeeapAGP
   jDG9BuJxCEv7now+pqh5fICoaAM/V3JzfHijyHe3hCXI+WLJM/oUxNMcC
   CqWderT2kmWWMzfW7DI6pJTs1ulxD2GO0oMHeDaGbCA0hCh6AmNGsE2WJ
   A==;
X-CSE-ConnectionGUID: AKg417gARE2yU+tq0sORlg==
X-CSE-MsgGUID: 8GrbNkNISQCEXqhjAfZMJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53138751"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53138751"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:42:39 -0700
X-CSE-ConnectionGUID: aiLoypVaSUi9hS2Ph2LgHQ==
X-CSE-MsgGUID: S+O02a2VQ8eW0VUNx1Udrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152710555"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 12:42:38 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUsUV-0000Zb-2Z;
	Thu, 26 Jun 2025 19:42:35 +0000
Date: Thu, 26 Jun 2025 21:42:27 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 0/10] include/linux/fortify-string.h:421:19:
 warning: writing 1 byte into a region of size 0
Message-ID: <202506262103.SMoPpD39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9845c8cbe1257dc2076d42b3297bfd06b7a78029
commit: beb260292232956605c97414369a880d90cf9f56 [0/10] CHROMIUM: fortify: Downgrade to FORTIFY=2
config: i386-buildonly-randconfig-2003-20250626 (https://download.01.org/0day-ci/archive/20250626/202506262103.SMoPpD39-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506262103.SMoPpD39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506262103.SMoPpD39-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:295,
                    from include/acpi/platform/aclinux.h:52,
                    from include/acpi/platform/acenv.h:160,
                    from include/acpi/acpi.h:22,
                    from drivers/acpi/acpica/nsnames.c:8:
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:447:6,
       inlined from 'acpi_ns_build_prefixed_pathname' at drivers/acpi/acpica/nsnames.c:378:4:
>> include/linux/fortify-string.h:421:19: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     421 |         p[actual] = '\0';
         |         ~~~~~~~~~~^~~~~~
   In file included from include/acpi/platform/aclinux.h:58:
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:721:9,
       inlined from 'acpi_os_allocate_zeroed' at include/acpi/platform/aclinuxex.h:57:9,
       inlined from 'acpi_ns_build_prefixed_pathname' at drivers/acpi/acpica/nsnames.c:367:6:
   include/linux/slab.h:604:16: note: at offset -2 into destination object of size [2, 2147483647] allocated by '__kmalloc'
     604 |         return __kmalloc(size, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~


vim +421 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  361  
605395cd7ceded Kees Cook      2023-04-02  362  /* Defined after fortified strlen() to reuse it. */
605395cd7ceded Kees Cook      2023-04-02  363  extern size_t __real_strlcat(char *p, const char *q, size_t avail) __RENAME(strlcat);
605395cd7ceded Kees Cook      2023-04-02  364  /**
605395cd7ceded Kees Cook      2023-04-02  365   * strlcat - Append a string to an existing string
605395cd7ceded Kees Cook      2023-04-02  366   *
605395cd7ceded Kees Cook      2023-04-02  367   * @p: pointer to %NUL-terminated string to append to
605395cd7ceded Kees Cook      2023-04-02  368   * @q: pointer to %NUL-terminated string to append from
605395cd7ceded Kees Cook      2023-04-02  369   * @avail: Maximum bytes available in @p
605395cd7ceded Kees Cook      2023-04-02  370   *
605395cd7ceded Kees Cook      2023-04-02  371   * Appends %NUL-terminated string @q after the %NUL-terminated
605395cd7ceded Kees Cook      2023-04-02  372   * string at @p, but will not write beyond @avail bytes total,
605395cd7ceded Kees Cook      2023-04-02  373   * potentially truncating the copy from @q. @p will stay
605395cd7ceded Kees Cook      2023-04-02  374   * %NUL-terminated only if a %NUL already existed within
605395cd7ceded Kees Cook      2023-04-02  375   * the @avail bytes of @p. If so, the resulting number of
605395cd7ceded Kees Cook      2023-04-02  376   * bytes copied from @q will be at most "@avail - strlen(@p) - 1".
605395cd7ceded Kees Cook      2023-04-02  377   *
605395cd7ceded Kees Cook      2023-04-02  378   * Do not use this function. While FORTIFY_SOURCE tries to avoid
605395cd7ceded Kees Cook      2023-04-02  379   * read and write overflows, this is only possible when the sizes
605395cd7ceded Kees Cook      2023-04-02  380   * of @p and @q are known to the compiler. Prefer building the
605395cd7ceded Kees Cook      2023-04-02  381   * string with formatting, via scnprintf(), seq_buf, or similar.
605395cd7ceded Kees Cook      2023-04-02  382   *
605395cd7ceded Kees Cook      2023-04-02  383   * Returns total bytes that _would_ have been contained by @p
605395cd7ceded Kees Cook      2023-04-02  384   * regardless of truncation, similar to snprintf(). If return
605395cd7ceded Kees Cook      2023-04-02  385   * value is >= @avail, the string has been truncated.
605395cd7ceded Kees Cook      2023-04-02  386   *
605395cd7ceded Kees Cook      2023-04-02  387   */
605395cd7ceded Kees Cook      2023-04-02  388  __FORTIFY_INLINE
605395cd7ceded Kees Cook      2023-04-02  389  size_t strlcat(char * const POS p, const char * const POS q, size_t avail)
605395cd7ceded Kees Cook      2023-04-02  390  {
605395cd7ceded Kees Cook      2023-04-02  391  	const size_t p_size = __member_size(p);
605395cd7ceded Kees Cook      2023-04-02  392  	const size_t q_size = __member_size(q);
605395cd7ceded Kees Cook      2023-04-02  393  	size_t p_len, copy_len;
605395cd7ceded Kees Cook      2023-04-02  394  	size_t actual, wanted;
605395cd7ceded Kees Cook      2023-04-02  395  
605395cd7ceded Kees Cook      2023-04-02  396  	/* Give up immediately if both buffer sizes are unknown. */
605395cd7ceded Kees Cook      2023-04-02  397  	if (p_size == SIZE_MAX && q_size == SIZE_MAX)
605395cd7ceded Kees Cook      2023-04-02  398  		return __real_strlcat(p, q, avail);
605395cd7ceded Kees Cook      2023-04-02  399  
605395cd7ceded Kees Cook      2023-04-02  400  	p_len = strnlen(p, avail);
605395cd7ceded Kees Cook      2023-04-02  401  	copy_len = strlen(q);
605395cd7ceded Kees Cook      2023-04-02  402  	wanted = actual = p_len + copy_len;
605395cd7ceded Kees Cook      2023-04-02  403  
605395cd7ceded Kees Cook      2023-04-02  404  	/* Cannot append any more: report truncation. */
605395cd7ceded Kees Cook      2023-04-02  405  	if (avail <= p_len)
605395cd7ceded Kees Cook      2023-04-02  406  		return wanted;
605395cd7ceded Kees Cook      2023-04-02  407  
605395cd7ceded Kees Cook      2023-04-02  408  	/* Give up if string is already overflowed. */
605395cd7ceded Kees Cook      2023-04-02  409  	if (p_size <= p_len)
605395cd7ceded Kees Cook      2023-04-02  410  		fortify_panic(__func__);
605395cd7ceded Kees Cook      2023-04-02  411  
605395cd7ceded Kees Cook      2023-04-02  412  	if (actual >= avail) {
605395cd7ceded Kees Cook      2023-04-02  413  		copy_len = avail - p_len - 1;
605395cd7ceded Kees Cook      2023-04-02  414  		actual = p_len + copy_len;
605395cd7ceded Kees Cook      2023-04-02  415  	}
605395cd7ceded Kees Cook      2023-04-02  416  
605395cd7ceded Kees Cook      2023-04-02  417  	/* Give up if copy will overflow. */
605395cd7ceded Kees Cook      2023-04-02  418  	if (p_size <= actual)
605395cd7ceded Kees Cook      2023-04-02  419  		fortify_panic(__func__);
605395cd7ceded Kees Cook      2023-04-02  420  	__underlying_memcpy(p + p_len, q, copy_len);
605395cd7ceded Kees Cook      2023-04-02 @421  	p[actual] = '\0';
605395cd7ceded Kees Cook      2023-04-02  422  
605395cd7ceded Kees Cook      2023-04-02  423  	return wanted;
605395cd7ceded Kees Cook      2023-04-02  424  }
605395cd7ceded Kees Cook      2023-04-02  425  

:::::: The code at line 421 was first introduced by commit
:::::: 605395cd7ceded5842c8ba6763ea24feee690c87 fortify: Add protection for strlcat()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
