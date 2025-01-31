Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C814AD3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350233; cv=none; b=mR3a038vHXppn6Jl5Cjmzh6vYYwbZB9oMpNLpTWaA/ZI6ylJgbSykLPPpjISD2seUsZIDgs7Ik2OQqfhEq6ahWkZZqk14ZeSuNmTjTJ1IUHWXUIUcjcCNUeIPAU1dR/X/KRmqMRjW7v9d1nHBBrQpGAedkqfwsJXmJxw3SgucQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350233; c=relaxed/simple;
	bh=Htl4UFOxVwBPor1/KWpi8+JvmpgqDvU6HbWUZXQw9tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URtP59SNm+e5Dk9nvYun+MaW42OLROHBOo7Jo4mJgpePfGl1dBOn7ORZF435+gCmUnoPoPWN0pfb4OklJ1Mkzgl9+DUwonv9PQa3nU2IIdmX0heIgaMPL/PD5T1t/bV3AtXjWfhsJ/Rt8rexMVHylDVy0XDrBL5o+OZWkrO/VF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrU9dypi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrU9dypi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738350233; x=1769886233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Htl4UFOxVwBPor1/KWpi8+JvmpgqDvU6HbWUZXQw9tU=;
  b=BrU9dypi1xzJh5RYDInw/h6sLPTdcdhq7ovUtAdrYAUcWFCBHfseOJdh
   wCEWV0a/NTB+uBVWo1ZqUisR8IAmT7O3ELGitXHTivZjWWswSxZ8ezJvz
   D5aSE7BRQf+PoIC1CACLBiNUSiFf/xsNy7UQYLIdKQ1SiVeSKkVc1K38n
   U9cDfo1Kt3Nz/TUo1Yf+awMoQgAuKl/wTNJwSF5piQjEuKcWGOlI7mEE9
   7ZJzT7AxHd1H6JDNQq+VOMCjvSF3r/gWedfhSgvnQkrQFnFCRT8JhA2Bd
   qNTkBXDNj4miz1/nCdJm1v3vMYs28te3U0O8W68KeQK5lqPyr/2co3y9H
   g==;
X-CSE-ConnectionGUID: LB+kCOOoSKqMGQkJzhCC1w==
X-CSE-MsgGUID: MHTqnE8ZROKmjGVKH3lXgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38954644"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="38954644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:03:52 -0800
X-CSE-ConnectionGUID: yb41CWwOQ/insre01S5viQ==
X-CSE-MsgGUID: +d/WDnU/QPetiUSh7ckWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109600641"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jan 2025 11:03:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdwIu-000mld-2A;
	Fri, 31 Jan 2025 19:03:48 +0000
Date: Sat, 1 Feb 2025 03:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 5/9] include/linux/mm.h:1922:16:
 error: implicit declaration of function 'pfn_pte'
Message-ID: <202502010321.rEuqyIfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-mk-pte
head:   44333e58349adcdfcb5b34f6086bf7c01dfd9c9a
commit: f440c1507240c6d4edbb5c3e336375dd186f9a91 [5/9] mm: Introduce a common definition of mk_pte()
config: arm-randconfig-004-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010321.rEuqyIfw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010321.rEuqyIfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010321.rEuqyIfw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   include/linux/mm.h: In function 'mk_pte':
>> include/linux/mm.h:1922:16: error: implicit declaration of function 'pfn_pte' [-Wimplicit-function-declaration]
    1922 |         return pfn_pte(page_to_pfn(page), pgprot);
         |                ^~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2997902050
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2997902050
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2997902050
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2997902050
   make: Target 'prepare' not remade because of errors.


vim +/pfn_pte +1922 include/linux/mm.h

  1918	
  1919	#ifndef mk_pte
  1920	static inline pte_t mk_pte(struct page *page, pgprot_t pgprot)
  1921	{
> 1922		return pfn_pte(page_to_pfn(page), pgprot);
  1923	}
  1924	#endif
  1925	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
