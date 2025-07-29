Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC9286A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 02:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753755013; cv=none; b=kYJPPUhGeRGeEBq4Qhipm6KSxXy9RMc3ec5avuA9J63HWyEoovGlXkM/N5yyRGPLuZxVSRIQmPZB0Rt7OCyyKgu5NJkReeQYMh+RrqvpVC3bgXKmT6kgaW5Ki1QDtJRhidVn9Ug98fBrXlGCHrwwJaLdPfRp5vtuqn7EJxibclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753755013; c=relaxed/simple;
	bh=oMinagz7CraQJltPLjsPB/kXuuQJGO2Vp+POpL3IZ2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RvBaMI7qpd8gYLS6O3yfs4zIw78fz8qK0+a2cjkdbXoE4tmRjE2rBByvByxOowJBSjrnWmwCqu3D9qkmjxrLxFQm2DbZA4TzxkBFo6n8aso/q8URTsLlFK/wakxsvvkDsZo2CGn+HFskELxI1YF/p0CKkt6HwD8VkQUDZWsysBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBzuUrBc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBzuUrBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753755012; x=1785291012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMinagz7CraQJltPLjsPB/kXuuQJGO2Vp+POpL3IZ2s=;
  b=lBzuUrBcmNLH5aMv0NM04YbpQGtGLAQtQFM1OoRz78MnWJ8VV6/IdFAK
   hgPnWrDfpm9mMhUjGV7MLWpMEAp7tCAIaIOR0xA3wJbruMQK8ZJ4FUKgx
   vpryn2ssLWIrq20cmzheqBEsWBwU4RIr7OxwX8XBbu1NCuBZmx1MdbZ8V
   58AJaN0F63AkQ+d2+LgcLwbxarBgOJXd6Ti18Sz/NmpBM8RIwq3EPzMTv
   HSayOnodQWrFz0DyNQBpXy5BhZXvUoZWOoWV5h9/wTEQ71xIlrL1n+7dd
   GcyK7y9n08ycbbO4STJHaK1+O3Z0W6UyJt3dqz4dmfw1Z/QmyD+zzgX8y
   w==;
X-CSE-ConnectionGUID: rTeLkXooQwSFT/JMoL40+w==
X-CSE-MsgGUID: 8xFLhMk+QEClUPIdb0+ffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="81453473"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="81453473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 19:10:11 -0700
X-CSE-ConnectionGUID: zPhqzgQKRceL+TO7eyiqng==
X-CSE-MsgGUID: P6VLKCw6QemSuZ+9oB5W4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162615534"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jul 2025 19:10:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugZn5-0000tz-11;
	Tue, 29 Jul 2025 02:10:07 +0000
Date: Tue, 29 Jul 2025 10:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 73/80] mm/percpu.c:3137:17: error: implicit
 declaration of function 'pgd_populate_kernel'; did you mean
 'pmd_populate_kernel'?
Message-ID: <202507290917.T24WIcvt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   0709ddf8951fadadb38dd385d8b89a626b357edd
commit: f877c46d1de512489f0d15d9408b56e5b455ed37 [73/80] mm: introduce and use {pgd,p4d}_populate_kernel()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250729/202507290917.T24WIcvt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290917.T24WIcvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290917.T24WIcvt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/percpu.c: In function 'pcpu_populate_pte':
>> mm/percpu.c:3137:17: error: implicit declaration of function 'pgd_populate_kernel'; did you mean 'pmd_populate_kernel'? [-Wimplicit-function-declaration]
    3137 |                 pgd_populate_kernel(addr, pgd, p4d);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pmd_populate_kernel
>> mm/percpu.c:3143:17: error: implicit declaration of function 'p4d_populate_kernel'; did you mean 'pmd_populate_kernel'? [-Wimplicit-function-declaration]
    3143 |                 p4d_populate_kernel(addr, p4d, pud);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pmd_populate_kernel
--
   mm/sparse-vmemmap.c: In function 'vmemmap_p4d_populate':
>> mm/sparse-vmemmap.c:232:17: error: implicit declaration of function 'p4d_populate_kernel'; did you mean 'pmd_populate_kernel'? [-Wimplicit-function-declaration]
     232 |                 p4d_populate_kernel(addr, p4d, p);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pmd_populate_kernel
   mm/sparse-vmemmap.c: In function 'vmemmap_pgd_populate':
>> mm/sparse-vmemmap.c:244:17: error: implicit declaration of function 'pgd_populate_kernel'; did you mean 'pmd_populate_kernel'? [-Wimplicit-function-declaration]
     244 |                 pgd_populate_kernel(addr, pgd, p);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pmd_populate_kernel


vim +3137 mm/percpu.c

  3124	
  3125	#ifndef PTE_TABLE_SIZE
  3126	#define PTE_TABLE_SIZE PAGE_SIZE
  3127	#endif
  3128	void __init __weak pcpu_populate_pte(unsigned long addr)
  3129	{
  3130		pgd_t *pgd = pgd_offset_k(addr);
  3131		p4d_t *p4d;
  3132		pud_t *pud;
  3133		pmd_t *pmd;
  3134	
  3135		if (pgd_none(*pgd)) {
  3136			p4d = memblock_alloc_or_panic(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
> 3137			pgd_populate_kernel(addr, pgd, p4d);
  3138		}
  3139	
  3140		p4d = p4d_offset(pgd, addr);
  3141		if (p4d_none(*p4d)) {
  3142			pud = memblock_alloc_or_panic(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
> 3143			p4d_populate_kernel(addr, p4d, pud);
  3144		}
  3145	
  3146		pud = pud_offset(p4d, addr);
  3147		if (pud_none(*pud)) {
  3148			pmd = memblock_alloc_or_panic(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
  3149			pud_populate(&init_mm, pud, pmd);
  3150		}
  3151	
  3152		pmd = pmd_offset(pud, addr);
  3153		if (!pmd_present(*pmd)) {
  3154			pte_t *new;
  3155	
  3156			new = memblock_alloc_or_panic(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
  3157			pmd_populate_kernel(&init_mm, pmd, new);
  3158		}
  3159	
  3160		return;
  3161	}
  3162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
