Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0081F12E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738349572; cv=none; b=KVJzukGfyuaBqycPiWCb3hsdBFvT5YChx8SXtb17R3LETN5en1oedDHPRw837CBGP/4eyT/PRs39PdhZR1CU/bjtlhTvgNmmQJ8l9KYHhYeVEbcNRCSbOWE9qQTkfzPPPAU7gO8HIDQvMwh2exi0MYj/yMf4+ghUFsfxEOdNkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738349572; c=relaxed/simple;
	bh=yPAvtVEmw1T96gBFNDjVkHq9We4kN/pg06nVVFK0FDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hvc1G6J7xxEd+wKlAYVFJcQxK3/LhgQft4/mW5CiokVWdp2LQwgC71Zn7KL6RttGxhUGMMBhQKhLjGvuYXKP5Yfncv+7tKpxjGXN2Kmdsm82oSSpkDCH9ihYhWMqyO0OqodnPSFE6yHp9q6eQNhnGwWP9+UWytM2thbMA1EsgHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUlEL+K4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUlEL+K4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738349571; x=1769885571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPAvtVEmw1T96gBFNDjVkHq9We4kN/pg06nVVFK0FDc=;
  b=BUlEL+K4pXaZ5Trn9jys60UvW6sZfILZUjBsg6qkfyru9YcqdHnqsPgu
   3hAiqYz2LIFCJQrJykcs+/kR0rwf4TG6tRHfwoCdidgWdeD1clKvtvnsG
   cv+uy9zsfx2vMwic2wDhTljrnySt/FDZZpaweKcsNoRtq5HHP9O8cuknH
   5gdgjpAyH2jtoehYUyWR3C4O0ve3sZC+H1IV3A/UDjznb0M3jZ1l/It0+
   NxW+DiljdI6TwGwWr0Ocv7uqvf9yvqxho3jNfsVj8riHZcxKyI2qfPZo1
   OBZbH3br/cw6SQCrnc5TmXPBh+QOYjyoh+O6bcPDe0JqR+d0OIH0tQPLB
   Q==;
X-CSE-ConnectionGUID: fHAMNV7lQj27uuFjGXx8Xg==
X-CSE-MsgGUID: 9hQHVbnKSkCLU/B2EQScrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49185898"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49185898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 10:52:50 -0800
X-CSE-ConnectionGUID: z5q+hl3JRKer5ttkbZotkA==
X-CSE-MsgGUID: RTw1b/hlQk26SjVHoIMzuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114693785"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2025 10:52:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdw8F-000mkp-02;
	Fri, 31 Jan 2025 18:52:47 +0000
Date: Sat, 1 Feb 2025 02:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 5/9] include/linux/mm.h:1922:9: error:
 call to undeclared function 'pfn_pte'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202502010204.Ln8w1D59-lkp@intel.com>
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
config: arm-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010204.Ln8w1D59-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010204.Ln8w1D59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010204.Ln8w1D59-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/mm.h:1922:9: error: call to undeclared function 'pfn_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1922 |         return pfn_pte(page_to_pfn(page), pgprot);
         |                ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2726695158
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2726695158
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2726695158
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2726695158
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
