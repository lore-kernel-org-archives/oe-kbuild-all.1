Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37625D548
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739535925; cv=none; b=DVPBeWBcmG8LaHavYTP2eg3ySX9KYvOX8I4Z0Pz0QtowmZodxyXClnSxQ3yJfrY19lEp9EX89ipHqsm36GfNtmGgo8AJHnavird/XIgHk7WTSD9iadOsDbJkBtEUpqFB5VArfW2F/BalffsyFIxzpoxxjbJIzzpKI+k+yoYI3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739535925; c=relaxed/simple;
	bh=gJ2f75TYkfWCn89Wfjliu35MKSOjKiT5h4bWv84/WmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfkAvJYswdLpZIdpgUPqNHCWMx0xiDoyytugF6JWbZPpg9wevpxa6vHOSMNMfWLmQnGSI0WHVgcQvipkggX9zlRCY+wZyMEHV4YyJs6hWoYJijwMIv5ynArjDb2+9qyhvNGXaDyDUrRyLyKLBfjS7W0oJ1uIG7vuSTTtXn1B6Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmEYlY/5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmEYlY/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739535923; x=1771071923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJ2f75TYkfWCn89Wfjliu35MKSOjKiT5h4bWv84/WmU=;
  b=AmEYlY/5sADdA/nqDMuZ8UMl3eMPABtBxhHtt4QKaktcKX9R2qpXC7ND
   IJ9Ea8ozfMCaQe1v/upAhyHtuFmQ7OdBC2H65RqoetawTQFZO5BRR/RMp
   VsOLMGj0CZsbEs6LbZdc1lNqoIF0mchvuHq6AqaiEhVF3Iznf/1jacOMr
   Ib2Q3WwhJjpMVyIfihoxa99lN+dslbkYlhJWXBTr1YJPfMnO8thGUcxgz
   AHU9wZrt4Syt5PjaLTX7VwDjV+3Bw5RPKBQRj8Mye3O2HKocggWeTQhXt
   PjlFcHEiuFek1WhXf9oH0p9WL1IJ3N7KKeOEaST/zuJYMXOnsronShwD0
   w==;
X-CSE-ConnectionGUID: IYk3LFm+Tfm0kULVmP1vPg==
X-CSE-MsgGUID: PXhs4IwvTQmvLGI5neKwWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40316931"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40316931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:25:10 -0800
X-CSE-ConnectionGUID: v0XhS4IORzSqwCiLhIsVyA==
X-CSE-MsgGUID: qzFWgN+vTkueIY46XGJY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113181399"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2025 04:25:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiukl-0019XD-1C;
	Fri, 14 Feb 2025 12:25:07 +0000
Date: Fri, 14 Feb 2025 20:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 10/10] include/linux/mm.h:1938:16:
 error: implicit declaration of function 'pfn_pte'
Message-ID: <202502142011.16ePxdej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-mk-pte
head:   67fcb49ae3b2d66d35862b2be955f193b8f204c0
commit: 67fcb49ae3b2d66d35862b2be955f193b8f204c0 [10/10] mm: Add folio_mk_pte()
config: arm-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142011.16ePxdej-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142011.16ePxdej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142011.16ePxdej-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   include/linux/mm.h: In function 'folio_mk_pte':
>> include/linux/mm.h:1938:16: error: implicit declaration of function 'pfn_pte' [-Wimplicit-function-declaration]
    1938 |         return pfn_pte(folio_pfn(folio), pgprot);
         |                ^~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2018612442
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2018612442
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2018612442
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2018612442
   make: Target 'prepare' not remade because of errors.


vim +/pfn_pte +1938 include/linux/mm.h

  1925	
  1926	/**
  1927	 * folio_mk_pte - Create a PTE for this folio
  1928	 * @folio: The folio to create a PTE for
  1929	 * @pgprot: The page protection bits to use
  1930	 *
  1931	 * Create a page table entry for the first page of this folio.
  1932	 * This is suitable for passing to set_ptes().
  1933	 *
  1934	 * Return: A page table entry suitable for mapping this folio.
  1935	 */
  1936	static inline pte_t folio_mk_pte(struct folio *folio, pgprot_t pgprot)
  1937	{
> 1938		return pfn_pte(folio_pfn(folio), pgprot);
  1939	}
  1940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
