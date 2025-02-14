Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D419263C9F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739535927; cv=none; b=CojNFQQUQRoa6WjfV2FX9UE8BU5mzs7wGbGSWE8UuA7OdGCPEvEGUD0ZRrZpVZN1YTAusJEXiMts5Weda0UcjVOYQyEVjhjJQXEb8d5zCq/i9sNHk5ZrqbtSrvQWCrW1IB/Kn/4Bwy4pxxs+QmlYWzTI402cOLUBXmIT5LwCTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739535927; c=relaxed/simple;
	bh=Uw2qgI7EBwp98+on6iMTcHmBI564tkvcj6mfNFuhcVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubXslrGi7omrAewzczXTz3U6LbjIQSF+Wp0XoV+tbvz74xcF1tF0uO+1GEGirJHCQZ0fo8kBsY76yKbY4JdCvmAFYdJOr7GXEZ26yMXH2nCujRDB3m2ORK/JT3P4PvI0JuITQ/FVM2GtGucNM+avHdYHm2Kqd1f7t9vPzoleIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Glj69R0l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Glj69R0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739535925; x=1771071925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uw2qgI7EBwp98+on6iMTcHmBI564tkvcj6mfNFuhcVg=;
  b=Glj69R0lspZYhncei652+Kym8Bq3M0/NxlUoGNPzG6kfgdcHCfuNEIfL
   jCx7NKnXlm4gA6ofFmA8PopXAPFivGaqmhk1F/DYLutSBz7A2+jwrv0SU
   dcTowAEQYUbx5E5OpiJEye9juLlJ73NgAL11EkLkO+roai2otQdXb4ZBO
   zCgfk+zMyUrJN9y8Fma2GYphehhr258xv9kUxSBNgpuhzTxLXX64y9L7e
   QJMU8K2eJrWm9c5/TzU/s1OEQNgRGqdf2f+htJvG9HtjRzyCqU2vggtO3
   4ukkRObjiC+SYp/2StkM49Hf3xctyQp0GnkkXSti1Fqlq2iTDGTZiFtgs
   Q==;
X-CSE-ConnectionGUID: 0KPO2glsTHmSOWNfvMiEYA==
X-CSE-MsgGUID: cR3Brk+tSFeljDzc7ydYxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40316933"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40316933"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:25:10 -0800
X-CSE-ConnectionGUID: JkN3lXo3QweEFcwV68Ne1Q==
X-CSE-MsgGUID: 9fHUcBvdQ8G7eGo3D5kPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113181402"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2025 04:25:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiukl-0019XG-1Q;
	Fri, 14 Feb 2025 12:25:07 +0000
Date: Fri, 14 Feb 2025 20:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 10/10] include/linux/mm.h:1938:9:
 error: call to undeclared function 'pfn_pte'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502142049.EqSuSt3B-lkp@intel.com>
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
config: arm-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142049.EqSuSt3B-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142049.EqSuSt3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142049.EqSuSt3B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/mm.h:1938:9: error: call to undeclared function 'pfn_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return pfn_pte(folio_pfn(folio), pgprot);
                  ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=1883943376
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=1883943376
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1883943376
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1883943376
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
