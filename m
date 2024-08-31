Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61616A940
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092939; cv=none; b=FrNF/ZrasseowHh/6dK5/2k2YRHHe0Oxfh1mq1qrsBvfNWItWeJIkCXiW58AtRdxn9cYRxeLuGNGP+aIN5tE8uG3BW5K3/2NZJlJEvd1A3r9Zisy0dyuDF0kGoZgkKfFvOoYntAHLhXHVt+ZJXFgeCzU1HYinCfNdjvVxdIKWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092939; c=relaxed/simple;
	bh=H/GZC35DYYTJfWjO28e/bEHzJmQUOefydoas9j7Bj4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9ETj12NP/e3isuWt+q0BJ6hUEgT1Wao73DlvqYxn/Bu5juqbqgDh7jkeFO46mlwNd2YZoF6rlUkH8KDzsjeLMBgJ8d3nuyg4z74ywpCg94pLWXJdcy8Fbp6nl8K/PhjTNj2bO8H46xZ2Kr7Z8VSMBIZVBYif1TeHk/f71LEVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjVh9F1b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjVh9F1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725092938; x=1756628938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H/GZC35DYYTJfWjO28e/bEHzJmQUOefydoas9j7Bj4Y=;
  b=cjVh9F1bp0QXZk1b6eGS4THP/19CFAeaGGmKn13fRlISUlOuIGFQT8wY
   JhB54XK0dnVOfFJus2hZ83GG5AIaFUggOQ85zevmMnUGLjzdOJAUd2Iuv
   +duEOifO5lZKx3QsEXKN8NEfhbFlalpR+7VLg8kKBXIOWUN2TkVM6HRJn
   6uVB9ahSPmkftVNKIfMidkPbo/2FvEwVywcDttZKr2pexi3QrYSRw0gHq
   4u58L62VbvGl2eSl+N6juC9Y4ngAACMlUx9HGWz+ZBxefhY17mMpTzSOe
   dgwGvJZFIMVKtVIq2NuPRx7n24+gmJtii/5eSd52q2EhD288RGMw9pUQp
   w==;
X-CSE-ConnectionGUID: iOZfPngAQmy0Ivm2Nsyfgw==
X-CSE-MsgGUID: dDV7jyoDSSCTVISb9OdgQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23923587"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23923587"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:28:55 -0700
X-CSE-ConnectionGUID: 0NDosdVJRSaRq6MpDgFhwA==
X-CSE-MsgGUID: PDAcD3PcSfuR88qKaZ+TZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64476381"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 01:28:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJTV-0002Su-2i;
	Sat, 31 Aug 2024 08:28:49 +0000
Date: Sat, 31 Aug 2024 16:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhong Jiang <yunhong.jiang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/9] x86/dt: Support the ACPI multiprocessor wakeup
 for device tree
Message-ID: <202408311604.j94hA3Md-lkp@intel.com>
References: <20240823232327.2408869-4-yunhong.jiang@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823232327.2408869-4-yunhong.jiang@linux.intel.com>

Hi Yunhong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fedb9ddeb1445f85d8f691b20f3faaa6dab8dd3f]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhong-Jiang/x86-acpi-Move-ACPI-MADT-wakeup-to-generic-code/20240826-135414
base:   fedb9ddeb1445f85d8f691b20f3faaa6dab8dd3f
patch link:    https://lore.kernel.org/r/20240823232327.2408869-4-yunhong.jiang%40linux.intel.com
patch subject: [PATCH v2 3/9] x86/dt: Support the ACPI multiprocessor wakeup for device tree
config: x86_64-buildonly-randconfig-006-20240831 (https://download.01.org/0day-ci/archive/20240831/202408311604.j94hA3Md-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311604.j94hA3Md-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311604.j94hA3Md-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/madt_wakeup.c:81:19: warning: 'init_transition_pgtable' defined but not used [-Wunused-function]
      81 | static int __init init_transition_pgtable(pgd_t *pgd)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/madt_wakeup.c:70:20: warning: 'free_pgt_page' defined but not used [-Wunused-function]
      70 | static void __init free_pgt_page(void *pgt, void *dummy)
         |                    ^~~~~~~~~~~~~
>> arch/x86/kernel/madt_wakeup.c:40:13: warning: 'acpi_mp_cpu_die' defined but not used [-Wunused-function]
      40 | static void acpi_mp_cpu_die(unsigned int cpu)
         |             ^~~~~~~~~~~~~~~
>> arch/x86/kernel/madt_wakeup.c:34:13: warning: 'acpi_mp_play_dead' defined but not used [-Wunused-function]
      34 | static void acpi_mp_play_dead(void)
         |             ^~~~~~~~~~~~~~~~~
>> arch/x86/kernel/madt_wakeup.c:29:13: warning: 'acpi_mp_stop_this_cpu' defined but not used [-Wunused-function]
      29 | static void acpi_mp_stop_this_cpu(void)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/init_transition_pgtable +81 arch/x86/kernel/madt_wakeup.c

1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   28  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  @29  static void acpi_mp_stop_this_cpu(void)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   30  {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   31  	asm_acpi_mp_play_dead(acpi_mp_reset_vector_paddr, acpi_mp_pgd);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   32  }
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   33  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  @34  static void acpi_mp_play_dead(void)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   35  {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   36  	play_dead_common();
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   37  	asm_acpi_mp_play_dead(acpi_mp_reset_vector_paddr, acpi_mp_pgd);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   38  }
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   39  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  @40  static void acpi_mp_cpu_die(unsigned int cpu)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   41  {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   42  	u32 apicid = per_cpu(x86_cpu_to_apicid, cpu);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   43  	unsigned long timeout;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   44  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   45  	/*
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   46  	 * Use TEST mailbox command to prove that BIOS got control over
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   47  	 * the CPU before declaring it dead.
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   48  	 *
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   49  	 * BIOS has to clear 'command' field of the mailbox.
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   50  	 */
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   51  	acpi_mp_wake_mailbox->apic_id = apicid;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   52  	smp_store_release(&acpi_mp_wake_mailbox->command,
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   53  			  ACPI_MP_WAKE_COMMAND_TEST);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   54  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   55  	/* Don't wait longer than a second. */
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   56  	timeout = USEC_PER_SEC;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   57  	while (READ_ONCE(acpi_mp_wake_mailbox->command) && --timeout)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   58  		udelay(1);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   59  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   60  	if (!timeout)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   61  		pr_err("Failed to hand over CPU %d to BIOS\n", cpu);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   62  }
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   63  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   64  /* The argument is required to match type of x86_mapping_info::alloc_pgt_page */
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   65  static void __init *alloc_pgt_page(void *dummy)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   66  {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   67  	return memblock_alloc(PAGE_SIZE, PAGE_SIZE);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   68  }
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   69  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  @70  static void __init free_pgt_page(void *pgt, void *dummy)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   71  {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   72  	return memblock_free(pgt, PAGE_SIZE);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   73  }
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   74  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   75  /*
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   76   * Make sure asm_acpi_mp_play_dead() is present in the identity mapping at
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   77   * the same place as in the kernel page tables. asm_acpi_mp_play_dead() switches
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   78   * to the identity mapping and the function has be present at the same spot in
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   79   * the virtual address space before and after switching page tables.
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   80   */
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  @81  static int __init init_transition_pgtable(pgd_t *pgd)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   82  {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   83  	pgprot_t prot = PAGE_KERNEL_EXEC_NOENC;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   84  	unsigned long vaddr, paddr;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   85  	p4d_t *p4d;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   86  	pud_t *pud;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   87  	pmd_t *pmd;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   88  	pte_t *pte;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   89  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   90  	vaddr = (unsigned long)asm_acpi_mp_play_dead;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   91  	pgd += pgd_index(vaddr);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   92  	if (!pgd_present(*pgd)) {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   93  		p4d = (p4d_t *)alloc_pgt_page(NULL);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   94  		if (!p4d)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   95  			return -ENOMEM;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   96  		set_pgd(pgd, __pgd(__pa(p4d) | _KERNPG_TABLE));
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   97  	}
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   98  	p4d = p4d_offset(pgd, vaddr);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14   99  	if (!p4d_present(*p4d)) {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  100  		pud = (pud_t *)alloc_pgt_page(NULL);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  101  		if (!pud)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  102  			return -ENOMEM;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  103  		set_p4d(p4d, __p4d(__pa(pud) | _KERNPG_TABLE));
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  104  	}
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  105  	pud = pud_offset(p4d, vaddr);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  106  	if (!pud_present(*pud)) {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  107  		pmd = (pmd_t *)alloc_pgt_page(NULL);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  108  		if (!pmd)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  109  			return -ENOMEM;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  110  		set_pud(pud, __pud(__pa(pmd) | _KERNPG_TABLE));
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  111  	}
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  112  	pmd = pmd_offset(pud, vaddr);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  113  	if (!pmd_present(*pmd)) {
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  114  		pte = (pte_t *)alloc_pgt_page(NULL);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  115  		if (!pte)
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  116  			return -ENOMEM;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  117  		set_pmd(pmd, __pmd(__pa(pte) | _KERNPG_TABLE));
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  118  	}
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  119  	pte = pte_offset_kernel(pmd, vaddr);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  120  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  121  	paddr = __pa(vaddr);
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  122  	set_pte(pte, pfn_pte(paddr >> PAGE_SHIFT, prot));
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  123  
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  124  	return 0;
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  125  }
1ceebe2e46720d arch/x86/kernel/acpi/madt_wakeup.c Kirill A. Shutemov 2024-06-14  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
