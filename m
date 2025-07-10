Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E028BA87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135041; cv=none; b=jIGYAhV47k1ANADl+rhKKYPnyV5UF8dJCtOS487Jppqul5liRzrrvz+vzag5kkkuZawgDAh4WpzFaiut7EuRzo/YERj9ZvDE85KMVLgaiOQOpuCITO8DD4qUueLna4U2wwJY9Su0IMwaJ9WTtS2t20HQ2bPetAiUMIP0s6GPG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135041; c=relaxed/simple;
	bh=XR7+lrM0tpWXHkj2UVhOOYauEMQhqmdDrhfHcPpEGBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji7EOvQp0G27OnP9R9o9F0GFUr8JtLDaGOxob1UEr9pkwHh5oNuGMK1+k3KcWZhgD82mkOjURF3Brmwb3+9uPdAafhDuifgsDDIxCOa8Y0UWWci5S//36E0tQdeerR4Oguv5AG+ZlUiwaW7l1O/nDg8g/Xt/Zj9zy4oCXXwf+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPy6pU/N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPy6pU/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752135040; x=1783671040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XR7+lrM0tpWXHkj2UVhOOYauEMQhqmdDrhfHcPpEGBc=;
  b=VPy6pU/Ns/OV+AmRgYq/lt6a6lmYUPCer6JTV56MKaStNw5PGgPKU6P0
   vGADFdjlmUks9YAKVJSP8BaCHnVThGvY51mQYPLQHc3nxZM5QXBNNwwVm
   cyUrzJqrnkMVhvfx7O7PMOYKSmGMSZrB+932QCnKLy6LUozZFnF32uT8B
   edXe7+r9mZvQS6OdlfdOb1UJkqMhlwMoSMXZW4wgobmY/6zGVncSIqgCb
   zTCtDVYY42FU/0i6u47/qRk9ciugJeeeHvt1cWz5OOdySE/mYFw4ruxqe
   mgUMNPUUHXl5BU5tqn4X9BNYJkJj4EQyqKAI3LMXty+WrYLnZ5PzRkaKB
   A==;
X-CSE-ConnectionGUID: AK3SgaqTQ4iewVVsrhOZfQ==
X-CSE-MsgGUID: GRr5GSh3RLmLeV60De4s+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="42035556"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="42035556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 01:10:39 -0700
X-CSE-ConnectionGUID: NTEHuhKMSlWP8TYIy09RoA==
X-CSE-MsgGUID: Oi1QDEoRQ9m8b/GN3xwsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156133206"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jul 2025 01:10:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZmMV-0004lL-1P;
	Thu, 10 Jul 2025 08:10:35 +0000
Date: Thu, 10 Jul 2025 16:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V1 PATCH mm-hotfixes 2/3] x86/mm: define
 p*d_populate_kernel() and top-level page table sync
Message-ID: <202507101530.PwamBJGe-lkp@intel.com>
References: <20250709131657.5660-3-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709131657.5660-3-harry.yoo@oracle.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-introduce-and-use-pgd-p4d-_populate_kernel/20250709-211850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250709131657.5660-3-harry.yoo%40oracle.com
patch subject: [RFC V1 PATCH mm-hotfixes 2/3] x86/mm: define p*d_populate_kernel() and top-level page table sync
config: i386-buildonly-randconfig-001-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101530.PwamBJGe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101530.PwamBJGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101530.PwamBJGe-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/percpu.c: In function 'pcpu_populate_pte':
>> mm/percpu.c:3137:17: error: implicit declaration of function 'pgd_populate_kernel'; did you mean 'pmd_populate_kernel'? [-Werror=implicit-function-declaration]
    3137 |                 pgd_populate_kernel(addr, pgd, p4d);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pmd_populate_kernel
>> mm/percpu.c:3143:17: error: implicit declaration of function 'p4d_populate_kernel'; did you mean 'pmd_populate_kernel'? [-Werror=implicit-function-declaration]
    3143 |                 p4d_populate_kernel(addr, p4d, pud);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pmd_populate_kernel
   cc1: some warnings being treated as errors


vim +3137 mm/percpu.c

20c035764626c5 Kefeng Wang 2022-01-19  3124  
20c035764626c5 Kefeng Wang 2022-01-19  3125  #ifndef PTE_TABLE_SIZE
20c035764626c5 Kefeng Wang 2022-01-19  3126  #define PTE_TABLE_SIZE PAGE_SIZE
20c035764626c5 Kefeng Wang 2022-01-19  3127  #endif
20c035764626c5 Kefeng Wang 2022-01-19  3128  void __init __weak pcpu_populate_pte(unsigned long addr)
20c035764626c5 Kefeng Wang 2022-01-19  3129  {
20c035764626c5 Kefeng Wang 2022-01-19  3130  	pgd_t *pgd = pgd_offset_k(addr);
20c035764626c5 Kefeng Wang 2022-01-19  3131  	p4d_t *p4d;
20c035764626c5 Kefeng Wang 2022-01-19  3132  	pud_t *pud;
20c035764626c5 Kefeng Wang 2022-01-19  3133  	pmd_t *pmd;
20c035764626c5 Kefeng Wang 2022-01-19  3134  
20c035764626c5 Kefeng Wang 2022-01-19  3135  	if (pgd_none(*pgd)) {
c6f239796b55db Guo Weikang 2025-01-02  3136  		p4d = memblock_alloc_or_panic(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
eb1f92deca7a01 Harry Yoo   2025-07-09 @3137  		pgd_populate_kernel(addr, pgd, p4d);
20c035764626c5 Kefeng Wang 2022-01-19  3138  	}
20c035764626c5 Kefeng Wang 2022-01-19  3139  
20c035764626c5 Kefeng Wang 2022-01-19  3140  	p4d = p4d_offset(pgd, addr);
20c035764626c5 Kefeng Wang 2022-01-19  3141  	if (p4d_none(*p4d)) {
c6f239796b55db Guo Weikang 2025-01-02  3142  		pud = memblock_alloc_or_panic(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
eb1f92deca7a01 Harry Yoo   2025-07-09 @3143  		p4d_populate_kernel(addr, p4d, pud);
20c035764626c5 Kefeng Wang 2022-01-19  3144  	}
20c035764626c5 Kefeng Wang 2022-01-19  3145  
20c035764626c5 Kefeng Wang 2022-01-19  3146  	pud = pud_offset(p4d, addr);
20c035764626c5 Kefeng Wang 2022-01-19  3147  	if (pud_none(*pud)) {
c6f239796b55db Guo Weikang 2025-01-02  3148  		pmd = memblock_alloc_or_panic(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
41fd59b7f9bdde Bibo Mao    2023-07-12  3149  		pud_populate(&init_mm, pud, pmd);
20c035764626c5 Kefeng Wang 2022-01-19  3150  	}
20c035764626c5 Kefeng Wang 2022-01-19  3151  
20c035764626c5 Kefeng Wang 2022-01-19  3152  	pmd = pmd_offset(pud, addr);
20c035764626c5 Kefeng Wang 2022-01-19  3153  	if (!pmd_present(*pmd)) {
20c035764626c5 Kefeng Wang 2022-01-19  3154  		pte_t *new;
20c035764626c5 Kefeng Wang 2022-01-19  3155  
c6f239796b55db Guo Weikang 2025-01-02  3156  		new = memblock_alloc_or_panic(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
20c035764626c5 Kefeng Wang 2022-01-19  3157  		pmd_populate_kernel(&init_mm, pmd, new);
20c035764626c5 Kefeng Wang 2022-01-19  3158  	}
20c035764626c5 Kefeng Wang 2022-01-19  3159  
20c035764626c5 Kefeng Wang 2022-01-19  3160  	return;
20c035764626c5 Kefeng Wang 2022-01-19  3161  }
20c035764626c5 Kefeng Wang 2022-01-19  3162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
