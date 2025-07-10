Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461ADD27E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144417; cv=none; b=gpfqpHCwJaVzH+e/+G9R+Sru1yyNMg6m+vi71xsuMEC3fH5dLlhzs6MKebQPTO+DBvz5S0vXUu+Rh5jp9nCEibiw/Oq7HyWBA3EDUDeBRPKBP0WkyJJoNKtdOOrCkiD4el9x+zWtu1AH/8pyYZS/mFWK3qFZEygFUo9oxPULC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144417; c=relaxed/simple;
	bh=cn4loCB+cTUCZ1xpp/z9ubk3R1ghNlF8G9+BtrZTNOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao6g65yb5q1WyCbZq293qZellMlUXOOgyUTclMTmsyfjXy0SVXpTbXQHghgu5/jUWQ7znl7L2puJn6MilXnjQCXYXSkHZgb63fNtvyOYUQcW5W7m2QIiMae4nbH2ANT9bjAo2L6UGukCs12hoL8ceXZrtcpAfCD8zmmE5Oi5k/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQ9ZO/fJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQ9ZO/fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752144416; x=1783680416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cn4loCB+cTUCZ1xpp/z9ubk3R1ghNlF8G9+BtrZTNOg=;
  b=hQ9ZO/fJ+5JQ4Vl/mt/QtRGIpnOJ0IKf3bGvDzX1OYRtutyWCZOV/7mt
   L7GR4Za2rpf/cLplSoE6fqr7yuXunDu35OX4bEPxMW9hofS4ASiTkAORb
   y515bG+D0o4grUNZM4GnEB69Zgnc+rIm2JCWoKn/H0+C4nmu+c75XahhI
   V4vhzAtD0kiSf91PQHTJ9lGuG/sGow5bqfjo2E/i95al11xvb4kQCK6Jq
   1HTb3iLTeWZcdce2YllG5lgRhQW7j+fJ4pkWOBhJ2aqY93cYsL2d09qQN
   20s3Ld7scPEr4VK8LmxdSR/Xiyw2SjcGiQJSBW9V1hYPQFpOpraEmZ+iU
   A==;
X-CSE-ConnectionGUID: 1V5tZbglQIujt53f1l0MKA==
X-CSE-MsgGUID: CTHlFbMaTBqpuyFOD0oD1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65870250"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65870250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 03:46:56 -0700
X-CSE-ConnectionGUID: S1pLUneRQRm4la9zyNhOUg==
X-CSE-MsgGUID: 0JM+LHnsR8qnNVQlTLESBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="155813830"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jul 2025 03:46:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZonk-0004wJ-1r;
	Thu, 10 Jul 2025 10:46:52 +0000
Date: Thu, 10 Jul 2025 18:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V1 PATCH mm-hotfixes 3/3] x86/mm: convert
 {pgd,p4d}_populate{,_init} to _kernel variant
Message-ID: <202507101816.sVROo3Mj-lkp@intel.com>
References: <20250709131657.5660-4-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709131657.5660-4-harry.yoo@oracle.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-introduce-and-use-pgd-p4d-_populate_kernel/20250709-211850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250709131657.5660-4-harry.yoo%40oracle.com
patch subject: [RFC V1 PATCH mm-hotfixes 3/3] x86/mm: convert {pgd,p4d}_populate{,_init} to _kernel variant
config: x86_64-buildonly-randconfig-001-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101816.sVROo3Mj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101816.sVROo3Mj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101816.sVROo3Mj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/init_64.c: In function '__kernel_physical_mapping_init':
>> arch/x86/mm/init_64.c:735:30: warning: variable 'vaddr_start' set but not used [-Wunused-but-set-variable]
     735 |         unsigned long vaddr, vaddr_start, vaddr_end, vaddr_next, paddr_last;
         |                              ^~~~~~~~~~~


vim +/vaddr_start +735 arch/x86/mm/init_64.c

7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  728  
eccd906484d1cd arch/x86/mm/init_64.c Brijesh Singh       2019-04-17  729  static unsigned long __meminit
eccd906484d1cd arch/x86/mm/init_64.c Brijesh Singh       2019-04-17  730  __kernel_physical_mapping_init(unsigned long paddr_start,
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  731  			       unsigned long paddr_end,
eccd906484d1cd arch/x86/mm/init_64.c Brijesh Singh       2019-04-17  732  			       unsigned long page_size_mask,
c164fbb40c43f8 arch/x86/mm/init_64.c Logan Gunthorpe     2020-04-10  733  			       pgprot_t prot, bool init)
^1da177e4c3f41 arch/x86_64/mm/init.c Linus Torvalds      2005-04-16  734  {
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21 @735  	unsigned long vaddr, vaddr_start, vaddr_end, vaddr_next, paddr_last;
^1da177e4c3f41 arch/x86_64/mm/init.c Linus Torvalds      2005-04-16  736  
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  737  	paddr_last = paddr_end;
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  738  	vaddr = (unsigned long)__va(paddr_start);
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  739  	vaddr_end = (unsigned long)__va(paddr_end);
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  740  	vaddr_start = vaddr;
^1da177e4c3f41 arch/x86_64/mm/init.c Linus Torvalds      2005-04-16  741  
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  742  	for (; vaddr < vaddr_end; vaddr = vaddr_next) {
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  743  		pgd_t *pgd = pgd_offset_k(vaddr);
f2a6a7050109e0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-03-17  744  		p4d_t *p4d;
44df75e629106e arch/x86_64/mm/init.c Matt Tolentino      2006-01-17  745  
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  746  		vaddr_next = (vaddr & PGDIR_MASK) + PGDIR_SIZE;
4f9c11dd49fb73 arch/x86/mm/init_64.c Jeremy Fitzhardinge 2008-06-25  747  
7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  748  		if (pgd_val(*pgd)) {
7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  749  			p4d = (p4d_t *)pgd_page_vaddr(*pgd);
7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  750  			paddr_last = phys_p4d_init(p4d, __pa(vaddr),
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  751  						   __pa(vaddr_end),
eccd906484d1cd arch/x86/mm/init_64.c Brijesh Singh       2019-04-17  752  						   page_size_mask,
c164fbb40c43f8 arch/x86/mm/init_64.c Logan Gunthorpe     2020-04-10  753  						   prot, init);
4f9c11dd49fb73 arch/x86/mm/init_64.c Jeremy Fitzhardinge 2008-06-25  754  			continue;
4f9c11dd49fb73 arch/x86/mm/init_64.c Jeremy Fitzhardinge 2008-06-25  755  		}
4f9c11dd49fb73 arch/x86/mm/init_64.c Jeremy Fitzhardinge 2008-06-25  756  
7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  757  		p4d = alloc_low_page();
7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  758  		paddr_last = phys_p4d_init(p4d, __pa(vaddr), __pa(vaddr_end),
c164fbb40c43f8 arch/x86/mm/init_64.c Logan Gunthorpe     2020-04-10  759  					   page_size_mask, prot, init);
8ae3a5a8dff2c9 arch/x86/mm/init_64.c Jan Beulich         2008-08-21  760  
8ae3a5a8dff2c9 arch/x86/mm/init_64.c Jan Beulich         2008-08-21  761  		spin_lock(&init_mm.page_table_lock);
ed7588d5dc6f5e arch/x86/mm/init_64.c Kirill A. Shutemov  2018-05-18  762  		if (pgtable_l5_enabled())
f7dd285ef7a44b arch/x86/mm/init_64.c Harry Yoo           2025-07-09  763  			pgd_populate_kernel_init(vaddr, pgd, p4d, init);
7e82ea946ae4d0 arch/x86/mm/init_64.c Kirill A. Shutemov  2017-06-06  764  		else
f7dd285ef7a44b arch/x86/mm/init_64.c Harry Yoo           2025-07-09  765  			p4d_populate_kernel_init(vaddr, p4d_offset(pgd, vaddr),
eccd906484d1cd arch/x86/mm/init_64.c Brijesh Singh       2019-04-17  766  						 (pud_t *) p4d, init);
eccd906484d1cd arch/x86/mm/init_64.c Brijesh Singh       2019-04-17  767  
8ae3a5a8dff2c9 arch/x86/mm/init_64.c Jan Beulich         2008-08-21  768  		spin_unlock(&init_mm.page_table_lock);
^1da177e4c3f41 arch/x86_64/mm/init.c Linus Torvalds      2005-04-16  769  	}
9b861528a8012e arch/x86/mm/init_64.c Haicheng Li         2010-08-20  770  
59b3d0206d74a7 arch/x86/mm/init_64.c Thomas Garnier      2016-06-21  771  	return paddr_last;
b50efd2a55fc13 arch/x86/mm/init_64.c Yinghai Lu          2008-07-08  772  }
7b16eb8930d1e2 arch/x86/mm/init_64.c Yinghai Lu          2008-07-09  773  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
