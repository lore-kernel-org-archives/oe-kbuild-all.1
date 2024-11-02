Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A12E40E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 04:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730520017; cv=none; b=m9rZJwM63aIsyZJwsUDq1mi3OYeflmRHw3AuCSjxBwsh26d1J3BlbQyhphOcCf+GGLPEuJuWS3Am9jwrEge9pFwKHlBJOKvQH3pkGwesbWZ2dzuVvOdzQm0Uorj0NZXbq+uiFMNJ4WAEZ3tD0gpZKxGYBbWV8HTWpFjQQpe90oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730520017; c=relaxed/simple;
	bh=as/YFYUSIHQPs5zPPukCKpWI+psrQxz3KyHA4llyoYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGuXh0z7R4/Nyq8JyUq4oETALtCXxLkRJMb72sgUuDNYf/pQeAxG9P93OoVAy66/MdI6tLokng6ebnZC0nhDyAO380ngjuv6NOrQ7UU7d0ptF46pglJ4OP4fxmPWRCBxrKy8YVgzeWmTW0kiIn5eAu1VvfD458qdwlHjwVYAdA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sx8TbMKY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sx8TbMKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730520016; x=1762056016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=as/YFYUSIHQPs5zPPukCKpWI+psrQxz3KyHA4llyoYg=;
  b=Sx8TbMKYc0jACGbiX6e5MWdn3mJJ0F/EfJ28hbopkyznUtgcsIi7mGWe
   hpqcsxuHF4KkhcrrX9wFI0/u+qeeUOVNy0RwC/qrgWy1gV3fYODFUoxHJ
   yo+1Aa6uP8l2YEfpbD2T7T2V0S3BG/ISATN81Hxd6JYE05KrZnfcY54wa
   EkYc34K1UPLGtIUaGJRls8Dn5eL2X0YaYyEb8i8cdSEjK1ZZ9RTUTdbMv
   n5tENWZ1Jo/A/5GDV/lpA/a7B/PS/IA2EG4ezy0Z2GZg/t80K5DdIbFrk
   3zeGt+ackLjOAf8FPE7CD9sfW/H9OUtZmZUQx98gokp5vY1e4awrW6n3p
   g==;
X-CSE-ConnectionGUID: g7mk798JRiS02frtJl4ZPg==
X-CSE-MsgGUID: S6GNHVI9RLGjlDAynbIgMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41657007"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="41657007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 21:00:15 -0700
X-CSE-ConnectionGUID: qt7jzscsTfWm/+Pm78BHkg==
X-CSE-MsgGUID: qGzPQwNeSe+9uLFUZk8KNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="83966267"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Nov 2024 21:00:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t75J5-000iO5-2i;
	Sat, 02 Nov 2024 04:00:11 +0000
Date: Sat, 2 Nov 2024 11:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 7014/8858] drivers/clk/clk-eyeq.c:131
 eqc_pll_downshift_factors() warn: always true condition '(*mult <= (~0)) =>
 (0-u32max <= u32max)'
Message-ID: <202411021153.lmUL4YKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 25d904946a0baf08b16204d95dc3624096d99c38 [7014/8858] clk: eyeq: add driver
config: csky-randconfig-r072-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021153.lmUL4YKc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021153.lmUL4YKc-lkp@intel.com/

smatch warnings:
drivers/clk/clk-eyeq.c:131 eqc_pll_downshift_factors() warn: always true condition '(*mult <= (~0)) => (0-u32max <= u32max)'
drivers/clk/clk-eyeq.c:131 eqc_pll_downshift_factors() warn: always true condition '(*div <= (~0)) => (0-u32max <= u32max)'

vim +131 drivers/clk/clk-eyeq.c

   112	
   113	/*
   114	 * Both factors (mult and div) must fit in 32 bits. When an operation overflows,
   115	 * this function throws away low bits so that factors still fit in 32 bits.
   116	 *
   117	 * Precision loss depends on amplitude of mult and div. Worst theorical
   118	 * loss is: (UINT_MAX+1) / UINT_MAX - 1 = 2.3e-10.
   119	 * This is 1Hz every 4.3GHz.
   120	 */
   121	static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
   122	{
   123		unsigned long biggest;
   124		unsigned int shift;
   125	
   126		/* This function can be removed if mult/div switch to unsigned long. */
   127		static_assert(sizeof_field(struct clk_fixed_factor, mult) == sizeof(unsigned int));
   128		static_assert(sizeof_field(struct clk_fixed_factor, div) == sizeof(unsigned int));
   129	
   130		/* No overflow, nothing to be done. */
 > 131		if (*mult <= UINT_MAX && *div <= UINT_MAX)
   132			return;
   133	
   134		/*
   135		 * Compute the shift required to bring the biggest factor into unsigned
   136		 * int range. That is, shift its highest set bit to the unsigned int
   137		 * most significant bit.
   138		 */
   139		biggest = max(*mult, *div);
   140		shift = __fls(biggest) - (BITS_PER_BYTE * sizeof(unsigned int)) + 1;
   141	
   142		*mult >>= shift;
   143		*div >>= shift;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
