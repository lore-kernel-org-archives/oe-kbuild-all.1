Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834A49625
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 02:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753066651; cv=none; b=ezp+nmnEREQMMtzbOOBAzePXasMPkH594ONq3s5KBNwZ0DhhcGi2zZVmTsv4HPG6GrkyG8g6vIit+DoLDAixsJIVvBLpZ49FS6BrI1fqALZ6vwwHnQ+AkXAqL2tUfsxJYTt4AanEP8ne9wErmoMhDAYQm9EIBvHmzvmYcJK265Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753066651; c=relaxed/simple;
	bh=CfH9GDsPDC6iXmk748SEDXMIwhrqDdqpUpf6HVK6eRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/BWg7M1d9qZdy7pmGUZGYW7LzaaiqhbJV1YK5vefHo/4hWVvYTeh/HTXW4HQJOUm8Bcza009PsOdr6BHmNh6r8SikB39DVfBvZBMn46k4Qkz9mfLtyZE664EcN42boBBgwoRp39cc/jSg0jCIU8q/WN/DRK//i5DgrslreTMDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mmd6skAs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mmd6skAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753066649; x=1784602649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CfH9GDsPDC6iXmk748SEDXMIwhrqDdqpUpf6HVK6eRA=;
  b=Mmd6skAs5OED1sjdO52UmWBxqLDmouHBItbaZtdDkcksR+xivPlp8P2g
   tUl5COHbq7VGO89IsGFn6YEL2ImW5ttPDPWCZLAB6/7IDN/sZeSnMgm9U
   83EdaE4aFu974KNqjP9ufywfEoveWVcGL32A90I2qkg5yvt9eg5OF15XJ
   U9VGvQ1yJ08ykn4Xu5jrhb2dMK9a+pk2pyD8U8yDkIZWC2ADhCNkGy8gV
   oeQODF/2IOdODAEW0XCMb+wzXb/jC0QD7ULKVKN1dvLhWvT5vBAaNeE4G
   nHfkAZ2AILGDfA6RllA74G44T2je/NzKSUEN0iPzC0DIHFI3qHCpppZtQ
   w==;
X-CSE-ConnectionGUID: 5uPVC3y9TY2RFFnVKyFmwA==
X-CSE-MsgGUID: EIxvqvNBQkmKrNmQDoDwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="77808205"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="77808205"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 19:57:28 -0700
X-CSE-ConnectionGUID: PoHzLZg6TTWlG7SAu/hqHg==
X-CSE-MsgGUID: YVc7OMs1QOGOsSASSF4GWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="163257039"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jul 2025 19:57:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udgiN-000GQb-0U;
	Mon, 21 Jul 2025 02:57:19 +0000
Date: Mon, 21 Jul 2025 10:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Joao Martins <joao.m.martins@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations
 to asm/pgalloc.h
Message-ID: <202507211059.kHMi8xEC-lkp@intel.com>
References: <20250720234203.9126-2-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250720234203.9126-2-harry.yoo@oracle.com>

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-asm-pgalloc-h/20250721-074448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250720234203.9126-2-harry.yoo%40oracle.com
patch subject: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations to asm/pgalloc.h
config: sparc-randconfig-001-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211059.kHMi8xEC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211059.kHMi8xEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211059.kHMi8xEC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__apply_to_page_range':
>> mm/memory.c:3155:20: error: 'ARCH_PAGE_TABLE_SYNC_MASK' undeclared (first use in this function)
    3155 |         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:3155:20: note: each undeclared identifier is reported only once for each function it appears in
>> mm/memory.c:3156:17: error: implicit declaration of function 'arch_sync_kernel_mappings' [-Wimplicit-function-declaration]
    3156 |                 arch_sync_kernel_mappings(start, start + size);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   mm/vmalloc.c: In function 'vmap_range_noflush':
>> mm/vmalloc.c:315:20: error: 'ARCH_PAGE_TABLE_SYNC_MASK' undeclared (first use in this function)
     315 |         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:315:20: note: each undeclared identifier is reported only once for each function it appears in
>> mm/vmalloc.c:316:17: error: implicit declaration of function 'arch_sync_kernel_mappings' [-Wimplicit-function-declaration]
     316 |                 arch_sync_kernel_mappings(start, end);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c: In function '__vunmap_range_noflush':
   mm/vmalloc.c:488:20: error: 'ARCH_PAGE_TABLE_SYNC_MASK' undeclared (first use in this function)
     488 |         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c: In function 'vmap_small_pages_range_noflush':
   mm/vmalloc.c:633:20: error: 'ARCH_PAGE_TABLE_SYNC_MASK' undeclared (first use in this function)
     633 |         if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ARCH_PAGE_TABLE_SYNC_MASK +3155 mm/memory.c

c2febafc67734a Kirill A. Shutemov  2017-03-09  3121  
be1db4753ee6a0 Daniel Axtens       2019-12-17  3122  static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
be1db4753ee6a0 Daniel Axtens       2019-12-17  3123  				 unsigned long size, pte_fn_t fn,
be1db4753ee6a0 Daniel Axtens       2019-12-17  3124  				 void *data, bool create)
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3125  {
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3126  	pgd_t *pgd;
e80d3909be42f7 Joerg Roedel        2020-09-04  3127  	unsigned long start = addr, next;
57250a5bf0f6ff Jeremy Fitzhardinge 2010-08-09  3128  	unsigned long end = addr + size;
e80d3909be42f7 Joerg Roedel        2020-09-04  3129  	pgtbl_mod_mask mask = 0;
be1db4753ee6a0 Daniel Axtens       2019-12-17  3130  	int err = 0;
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3131  
9cb65bc3b11140 Mika Penttilä       2016-03-15  3132  	if (WARN_ON(addr >= end))
9cb65bc3b11140 Mika Penttilä       2016-03-15  3133  		return -EINVAL;
9cb65bc3b11140 Mika Penttilä       2016-03-15  3134  
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3135  	pgd = pgd_offset(mm, addr);
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3136  	do {
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3137  		next = pgd_addr_end(addr, end);
0c95cba4925509 Nicholas Piggin     2021-04-29  3138  		if (pgd_none(*pgd) && !create)
be1db4753ee6a0 Daniel Axtens       2019-12-17  3139  			continue;
3685024edd270f Ryan Roberts        2025-02-26  3140  		if (WARN_ON_ONCE(pgd_leaf(*pgd))) {
3685024edd270f Ryan Roberts        2025-02-26  3141  			err = -EINVAL;
3685024edd270f Ryan Roberts        2025-02-26  3142  			break;
3685024edd270f Ryan Roberts        2025-02-26  3143  		}
0c95cba4925509 Nicholas Piggin     2021-04-29  3144  		if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
0c95cba4925509 Nicholas Piggin     2021-04-29  3145  			if (!create)
0c95cba4925509 Nicholas Piggin     2021-04-29  3146  				continue;
0c95cba4925509 Nicholas Piggin     2021-04-29  3147  			pgd_clear_bad(pgd);
0c95cba4925509 Nicholas Piggin     2021-04-29  3148  		}
0c95cba4925509 Nicholas Piggin     2021-04-29  3149  		err = apply_to_p4d_range(mm, pgd, addr, next,
0c95cba4925509 Nicholas Piggin     2021-04-29  3150  					 fn, data, create, &mask);
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3151  		if (err)
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3152  			break;
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3153  	} while (pgd++, addr = next, addr != end);
57250a5bf0f6ff Jeremy Fitzhardinge 2010-08-09  3154  
e80d3909be42f7 Joerg Roedel        2020-09-04 @3155  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
e80d3909be42f7 Joerg Roedel        2020-09-04 @3156  		arch_sync_kernel_mappings(start, start + size);
e80d3909be42f7 Joerg Roedel        2020-09-04  3157  
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3158  	return err;
aee16b3cee2746 Jeremy Fitzhardinge 2007-05-06  3159  }
be1db4753ee6a0 Daniel Axtens       2019-12-17  3160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
