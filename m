Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3BE18F2FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 23:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728515258; cv=none; b=g+puxmMzMyDVeq4T59ZBmB91VeV9DTsyJEqtIoFiL2JkXPPiA1XS29WGVw+egKvhETBVYidjBV7lj5+/kdwa4Vt61fhoNkfQ9qX8MAShx72ULoaAPJQRfhVhAu5aRdS0R5UTCZ5LJNP68htb0MFEM3TxSkWGAaKbXbHpsz5147c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728515258; c=relaxed/simple;
	bh=Vp0ilngeKL3FP5KnLcNHxqs78IkXv+9ZZZg2SDpaBcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhBMl9WhVGTfkp8JqjFyLHKxo/+W+k4vBp5b82XYicwNr/uiXHOL2+lOtzPo8nlqj93nw8dmsAikRlwPRDQc2w/tMdPu/i/tBRpmZUp51ZRVnzR3tlb525cZtZ5oXH8ti0KzGfNnuREZAwj2W6NyIbCceTuE1l+EvkZ4zrkCeWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/Fa5GIY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/Fa5GIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728515256; x=1760051256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vp0ilngeKL3FP5KnLcNHxqs78IkXv+9ZZZg2SDpaBcY=;
  b=X/Fa5GIYkn4Y+tIXI7TJHlw7+XD2lXaiBxzn4t3poZ3UUUVgdT7N/eaC
   1tbVFpjUWCcx5+vQHZPIHb/V0pSm1RVEWfItFx82/cLNFFVyYcMyx0Zdn
   PQUeg90nR9MreRddZsOyV6Nd2Gpwd0c0qm70kKQm8mkN77/VUNR+o+6D1
   4PaodOp2ZzHvUuujj0tZW2v17MjSuv7XL/tHYYK60pHFP0jPCL/J4wsyb
   DScwJXCaunrNnaHrWdrrPKleRk7njUIM8983aO+jgJDnRU7dM61UK2w8F
   cuwvXXThj2c3wZqGgTDgkxjNEPccblObf5vlrtp2QtBsfkszk2C1Rn53X
   g==;
X-CSE-ConnectionGUID: +3vY0yKrTbCGhGR/909DLQ==
X-CSE-MsgGUID: hQ+mN0iySrWAM51QzjvoLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45363300"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="45363300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 16:07:28 -0700
X-CSE-ConnectionGUID: 6mEAXWQiSvuBMYULEyXN5w==
X-CSE-MsgGUID: Z59XJY3vSkyXHrghnBWK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="99723087"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2024 16:07:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syfm8-0009ty-2s;
	Wed, 09 Oct 2024 23:07:24 +0000
Date: Thu, 10 Oct 2024 07:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 2858/3432] arch/x86/mm/init_64.c:992:42: error:
 implicit declaration of function 'bootmem_type'
Message-ID: <202410100651.b7lLTUtA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: cdaa5412be9ac6dcf7649c5f5ab8f8874b9716a8 [2858/3432] bootmem: stop using page->index
config: x86_64-randconfig-121-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100651.b7lLTUtA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100651.b7lLTUtA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100651.b7lLTUtA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/init_64.c: In function 'free_pagetable':
>> arch/x86/mm/init_64.c:992:42: error: implicit declaration of function 'bootmem_type' [-Werror=implicit-function-declaration]
     992 |                 enum bootmem_type type = bootmem_type(page);
         |                                          ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bootmem_type +992 arch/x86/mm/init_64.c

   987	
   988	static void __meminit free_pagetable(struct page *page, int order)
   989	{
   990		/* bootmem page has reserved flag */
   991		if (PageReserved(page)) {
 > 992			enum bootmem_type type = bootmem_type(page);
   993			unsigned long nr_pages = 1 << order;
   994	
   995			if (type == SECTION_INFO || type == MIX_SECTION_INFO) {
   996				while (nr_pages--)
   997					put_page_bootmem(page++);
   998			} else
   999				while (nr_pages--)
  1000					free_reserved_page(page++);
  1001		} else
  1002			free_pages((unsigned long)page_address(page), order);
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
