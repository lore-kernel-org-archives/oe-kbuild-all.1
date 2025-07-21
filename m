Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271358F5A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 03:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753069234; cv=none; b=qjzhga3q+WWqTbV+7frvX0tCHSPf2wnXHbuy/pdBgwW8C0Bj/sLN0cpf5rg1rJpz1UN2WhZdDv74FzRFXnTN302t+pGa+5Tp0xEL/HzM+IKDn3SI3MYEi4hBwzuEWAG6jzthzN5808hmdTORumFxoRJNLPI4ZSyJeoJzctyRzN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753069234; c=relaxed/simple;
	bh=EAIGX6VFt0N/8zfUAynpaqkrmNtYZy4V1e4nCLbJnK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyb+qU2Qfq2Tabcz2XO1cgweDTrlaJo0svq6uRAH3oliSutzneNpU3z4pxR2E0Cmf8ryKvmnYEQcfSEGFnnAREimXbsMiS4/xoi3HwqFZAcD7qee9FzxGnXBN5ZsTOVp9kGMgRaVCWn3yIPuZTU9lRQrG4NYoGdaZDFyWrSF17g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO1h6x2d; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO1h6x2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753069232; x=1784605232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EAIGX6VFt0N/8zfUAynpaqkrmNtYZy4V1e4nCLbJnK4=;
  b=YO1h6x2dCso7ILYxqi5fwKSbvl0N7HDhjlc7e6RgfmFctywKG4rAFhwh
   fJNF5/AsRf7SFI7Yr5mmUKo/OPhjKwxTJJa98VQ1qyZ1p7j3x3l/CDBYS
   KdQoQmwWI3E+kLvY0epXXA9znpmaJEiuvOo1RRsYlof82CNglYA4XfcEF
   Q40Ki0lx62EagUH/uCcJI1b7bmPfuIuQfIFLy9bDCcExabaZuCPgjeckw
   UGZGMiZwZht1jHQYtUd3gmi3aYqc0QvizeufGbqtxF1Ip6T4+4BmVp4UQ
   4WOLv5VxhIw5vGYheo/YIBxLH+xaC0+NJbG4OcyX9nJLcUBoTj3vzahoy
   g==;
X-CSE-ConnectionGUID: prbqm/EzTB6UNs1lBlOiXA==
X-CSE-MsgGUID: YVifAT+gROStqGhjooS+ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59089238"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="59089238"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 20:40:31 -0700
X-CSE-ConnectionGUID: /+ssA10cTSWtFTWMY27gPg==
X-CSE-MsgGUID: R3HQvRZqTbajQ7Na1fKYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="159424496"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2025 20:40:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udhO2-000GRp-2I;
	Mon, 21 Jul 2025 03:40:22 +0000
Date: Mon, 21 Jul 2025 11:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <202507211129.Xbn2bAOg-lkp@intel.com>
References: <20250720234203.9126-2-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720234203.9126-2-harry.yoo@oracle.com>

Hi Harry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-asm-pgalloc-h/20250721-074448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250720234203.9126-2-harry.yoo%40oracle.com
patch subject: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations to asm/pgalloc.h
config: i386-buildonly-randconfig-003-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211129.Xbn2bAOg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211129.Xbn2bAOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211129.Xbn2bAOg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.c:265:6: warning: no previous prototype for 'arch_sync_kernel_mappings' [-Wmissing-prototypes]
     265 | void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_sync_kernel_mappings +265 arch/x86/mm/fault.c

4819e15f740ec88 Joerg Roedel        2020-09-02  264  
1e15d374bb1cb95 Alexander Potapenko 2023-01-11 @265  void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
f2f13a8535174db Ingo Molnar         2009-02-20  266  {
86cf69f1d893d48 Joerg Roedel        2020-06-01  267  	unsigned long addr;
f2f13a8535174db Ingo Molnar         2009-02-20  268  
86cf69f1d893d48 Joerg Roedel        2020-06-01  269  	for (addr = start & PMD_MASK;
86cf69f1d893d48 Joerg Roedel        2020-06-01  270  	     addr >= TASK_SIZE_MAX && addr < VMALLOC_END;
86cf69f1d893d48 Joerg Roedel        2020-06-01  271  	     addr += PMD_SIZE) {
f2f13a8535174db Ingo Molnar         2009-02-20  272  		struct page *page;
f2f13a8535174db Ingo Molnar         2009-02-20  273  
a79e53d85683c6d Andrea Arcangeli    2011-02-16  274  		spin_lock(&pgd_lock);
f2f13a8535174db Ingo Molnar         2009-02-20  275  		list_for_each_entry(page, &pgd_list, lru) {
617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  276  			spinlock_t *pgt_lock;
617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  277  
a79e53d85683c6d Andrea Arcangeli    2011-02-16  278  			/* the pgt_lock only for Xen */
617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  279  			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  280  
617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  281  			spin_lock(pgt_lock);
86cf69f1d893d48 Joerg Roedel        2020-06-01  282  			vmalloc_sync_one(page_address(page), addr);
617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  283  			spin_unlock(pgt_lock);
f2f13a8535174db Ingo Molnar         2009-02-20  284  		}
a79e53d85683c6d Andrea Arcangeli    2011-02-16  285  		spin_unlock(&pgd_lock);
f2f13a8535174db Ingo Molnar         2009-02-20  286  	}
f2f13a8535174db Ingo Molnar         2009-02-20  287  }
f2f13a8535174db Ingo Molnar         2009-02-20  288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
