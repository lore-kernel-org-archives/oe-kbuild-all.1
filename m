Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197D1191F7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726729950; cv=none; b=tbTx/krSgRV5Oj9xtx3hITKFIWYIZbZFvXnweKi6JeDsm2yOoOFgIdy9xBgrVVnWwRb6kFWSWMpaemVGJt8NKs2MmpdBL3l/GLBbts88L1hFhS8Ku+p+6YmBs2B+Hvo+u1pWr+R5KMDkVOcaVrwtr5qeTE7LPtuNVpXONdPglIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726729950; c=relaxed/simple;
	bh=/jgnX+ABOI2z3m4Qx4fkTR24jfiYP85AWYoL8PMuYjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciYiejdOEn+bg7W8fR3EeB9fnRC3bFspuk9U7AbVEKRC5/nR6jW7EpNtO08kl9SJ3eKtAF6rY8BEN+vj8fcq38YI2W+B5czy7Bx5yzXucYoqQiPzvb0tidLFMAqktP0DuWz37NTogm+YMCfZSXpBKp5pP40oNg++3RZyFn6NxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 190C81007;
	Thu, 19 Sep 2024 00:12:50 -0700 (PDT)
Received: from [10.163.34.169] (unknown [10.163.34.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 109FE3F64C;
	Thu, 19 Sep 2024 00:12:11 -0700 (PDT)
Message-ID: <6191a730-1a0f-476e-8041-a0a51094b6b3@arm.com>
Date: Thu, 19 Sep 2024 12:42:08 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/7] mm: Use pmdp_get() for accessing PMD entries
To: kernel test robot <lkp@intel.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Muchun Song <muchun.song@linux.dev>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>
References: <20240917073117.1531207-5-anshuman.khandual@arm.com>
 <202409190244.JcrD4CwD-lkp@intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <202409190244.JcrD4CwD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/24 00:37, kernel test robot wrote:
> Hi Anshuman,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on char-misc/char-misc-testing]
> [also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus brauner-vfs/vfs.all dennis-percpu/for-next linus/master v6.11]
> [cannot apply to akpm-mm/mm-everything next-20240918]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/m68k-mm-Change-pmd_val/20240917-153331
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20240917073117.1531207-5-anshuman.khandual%40arm.com
> patch subject: [PATCH V2 4/7] mm: Use pmdp_get() for accessing PMD entries
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240919/202409190244.JcrD4CwD-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190244.JcrD4CwD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409190244.JcrD4CwD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/asm-generic/bug.h:22,
>                     from arch/openrisc/include/asm/bug.h:5,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:6,
>                     from include/linux/pagemap.h:8,
>                     from mm/pgtable-generic.c:10:
>    mm/pgtable-generic.c: In function 'pmd_clear_bad':
>>> arch/openrisc/include/asm/pgtable.h:369:36: error: lvalue required as unary '&' operand
>      369 |                __FILE__, __LINE__, &(e), pgd_val(e))
>          |                                    ^
>    include/linux/printk.h:437:33: note: in definition of macro 'printk_index_wrap'
>      437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                                 ^~~~~~~~~~~
>    arch/openrisc/include/asm/pgtable.h:368:9: note: in expansion of macro 'printk'
>      368 |         printk(KERN_ERR "%s:%d: bad pgd %p(%08lx).\n", \
>          |         ^~~~~~
>    include/asm-generic/pgtable-nop4d.h:25:50: note: in expansion of macro 'pgd_ERROR'
>       25 | #define p4d_ERROR(p4d)                          (pgd_ERROR((p4d).pgd))
>          |                                                  ^~~~~~~~~
>    include/asm-generic/pgtable-nopud.h:32:50: note: in expansion of macro 'p4d_ERROR'
>       32 | #define pud_ERROR(pud)                          (p4d_ERROR((pud).p4d))
>          |                                                  ^~~~~~~~~
>    include/asm-generic/pgtable-nopmd.h:36:50: note: in expansion of macro 'pud_ERROR'
>       36 | #define pmd_ERROR(pmd)                          (pud_ERROR((pmd).pud))
>          |                                                  ^~~~~~~~~
>    mm/pgtable-generic.c:54:9: note: in expansion of macro 'pmd_ERROR'
>       54 |         pmd_ERROR(pmdp_get(pmd));
>          |         ^~~~~~~~~
> 
> 
> vim +369 arch/openrisc/include/asm/pgtable.h
> 
> 61e85e367535a7 Jonas Bonn 2011-06-04  363  
> 61e85e367535a7 Jonas Bonn 2011-06-04  364  #define pte_ERROR(e) \
> 61e85e367535a7 Jonas Bonn 2011-06-04  365  	printk(KERN_ERR "%s:%d: bad pte %p(%08lx).\n", \
> 61e85e367535a7 Jonas Bonn 2011-06-04  366  	       __FILE__, __LINE__, &(e), pte_val(e))
> 61e85e367535a7 Jonas Bonn 2011-06-04  367  #define pgd_ERROR(e) \
> 61e85e367535a7 Jonas Bonn 2011-06-04  368  	printk(KERN_ERR "%s:%d: bad pgd %p(%08lx).\n", \
> 61e85e367535a7 Jonas Bonn 2011-06-04 @369  	       __FILE__, __LINE__, &(e), pgd_val(e))
> 61e85e367535a7 Jonas Bonn 2011-06-04  370  
> 

This build failure can be fixed with dropping address output from
pxd_ERROR() helpers as is being done for the x86 platform. Similar
fix is also required for the UM architecture as well.

diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 60c6ce7ff2dc..831efb71ab54 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -362,11 +362,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pfn_pte(pfn, prot)  __pte((((pfn) << PAGE_SHIFT)) | pgprot_val(prot))
 
 #define pte_ERROR(e) \
-       printk(KERN_ERR "%s:%d: bad pte %p(%08lx).\n", \
-              __FILE__, __LINE__, &(e), pte_val(e))
+       printk(KERN_ERR "%s:%d: bad pte (%08lx).\n", \
+              __FILE__, __LINE__, pte_val(e))
 #define pgd_ERROR(e) \
-       printk(KERN_ERR "%s:%d: bad pgd %p(%08lx).\n", \
-              __FILE__, __LINE__, &(e), pgd_val(e))
+       printk(KERN_ERR "%s:%d: bad pgd (%08lx).\n", \
+              __FILE__, __LINE__, pgd_val(e))
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD]; /* defined in head.S */
