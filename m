Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747737F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 02:33:59 +0000 (UTC)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVCxK6KvkztRsW;
	Tue, 22 Aug 2023 10:30:13 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 22 Aug 2023 10:33:55 +0800
Message-ID: <3506ca92-837b-462e-8cbf-9ed484c71164@huawei.com>
Date: Tue, 22 Aug 2023 10:33:55 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault
 handler
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <surenb@google.com>, <willy@infradead.org>, Russell
 King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20230821123056.2109942-2-wangkefeng.wang@huawei.com>
 <202308212249.dZG3d55u-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202308212249.dZG3d55u-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected

Hi

On 2023/8/21 23:13, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20230821]
> [cannot apply to akpm-mm/mm-everything arm64/for-next/core tip/x86/mm s390/features powerpc/next powerpc/fixes arm/for-next arm/fixes linus/master v6.5-rc7 v6.5-rc6 v6.5-rc5 v6.5-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-add-a-generic-VMA-lock-based-page-fault-handler/20230821-203442
> base:   next-20230821
> patch link:    https://lore.kernel.org/r/20230821123056.2109942-2-wangkefeng.wang%40huawei.com
> patch subject: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault handler
> config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230821/202308212249.dZG3d55u-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212249.dZG3d55u-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308212249.dZG3d55u-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/memcontrol.h:20,
>                      from include/linux/swap.h:9,
>                      from include/linux/suspend.h:5,
>                      from arch/x86/kernel/asm-offsets.c:14:
>>> include/linux/mm.h:810:38: error: redefinition of 'lock_vma_under_rcu'
>       810 | static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>           |                                      ^~~~~~~~~~~~~~~~~~
>     include/linux/mm.h:794:38: note: previous definition of 'lock_vma_under_rcu' with type 'struct vm_area_struct *(struct mm_struct *, long unsigned int)'
>       794 | static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>           |                                      ^~~~~~~~~~~~~~~~~~
>     make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
>     make[3]: Target 'prepare' not remade because of errors.
>     make[2]: *** [Makefile:1203: prepare0] Error 2
>     make[2]: Target 'prepare' not remade because of errors.
>     make[1]: *** [Makefile:234: __sub-make] Error 2
>     make[1]: Target 'prepare' not remade because of errors.
>     make: *** [Makefile:234: __sub-make] Error 2
>     make: Target 'prepare' not remade because of errors.
> 
> 

Yes, the following change should be drop as it is miscopied...

> vim +/lock_vma_under_rcu +810 include/linux/mm.h
> 
>     809	
>   > 810	static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>     811			unsigned long address)
>     812	{
>     813		return NULL;
>     814	}
>     815	
> 
