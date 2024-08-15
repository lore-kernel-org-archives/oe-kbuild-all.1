Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020B154BEA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762594; cv=none; b=KjItlNNH1JB0O+JJnITYzdpb9vZVoOGDGWTRwO0XCA+d0qU8d+gCjo4QCLHxFKyysLRh7Z2S2Mu08Djt3ZVTQ6KKyyHm6r1zp33hWZTv6RBOfHn+ApME/i/4uyZi+R5+4By8CRGIjYTCpXh1zG5/QRSqnOosV5i7QcIOA3xmZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762594; c=relaxed/simple;
	bh=DnWQIIqu3hNQSN2Nb1clnrON51RvUjFBm/tcymd+D00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKy4FeQaowP1bzAM48sL1SPpiaHxE7NGxU4oj4/1fKPFfJQYHbgU9IhjLjhovHGmOSnfG34cAGYY6Dh3JZtSS55dKAqya2XEh5giuz4tpMuEwT0m7YXBiZEll0IwGuAZJGWo/sg+Mar7+EnTBuYwDesTkHOewyG9RV1AeHp7xao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7Eo9sVU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7Eo9sVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723762592; x=1755298592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DnWQIIqu3hNQSN2Nb1clnrON51RvUjFBm/tcymd+D00=;
  b=j7Eo9sVU1TxHonqTRj/Kg4fYq0poihZcNj5PzY6obxk3Po48J/MwobKm
   H07TqwO53ZbTRnJodphm3mX9XZDtz//5hYVpAayVBiQYIbo0VlukHXJbk
   rCy1g8j/YUxgUACek7SZsEccGpikfY2STSIoFTpUChUXSuBMRbWPe4+Rx
   /l/uH2bwNAiCnNZESq3wKpVxSm1kIChAmGAISRtQPmICrHfwaGkZGlAkI
   iv0uo8vu9o/t5MotPNT0sAZFmj6zvko2BVCsUqZLuCwAbdyI9XMa5LZgf
   /Tn0FEut0t7fWW3Iv21B+0Ld/z5Dc2xnRTFN08+NWrAp7Uiihvtds0rM/
   g==;
X-CSE-ConnectionGUID: M5iov465THWaEV9EaSm3Fw==
X-CSE-MsgGUID: KKCgO3ahSKGsx5NoVDqrFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32718288"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32718288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 15:56:32 -0700
X-CSE-ConnectionGUID: pNnSBi+4QnuPB1Eg0n47TA==
X-CSE-MsgGUID: 0pMppDA9RwGuvV5skoCVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="90275308"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2024 15:56:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sejOM-0005hO-03;
	Thu, 15 Aug 2024 22:56:26 +0000
Date: Fri, 16 Aug 2024 06:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
Message-ID: <202408160603.fDLxZmqp-lkp@intel.com>
References: <20240814195053.5564-6-jason.andryuk@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814195053.5564-6-jason.andryuk@amd.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on xen-tip/linux-next tip/master linus/master v6.11-rc3 next-20240815]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Andryuk/xen-sync-elfnote-h-from-xen-tree/20240815-035238
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240814195053.5564-6-jason.andryuk%40amd.com
patch subject: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
config: i386-randconfig-052-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160603.fDLxZmqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160603.fDLxZmqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160603.fDLxZmqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_64.h:6,
                    from arch/x86/platform/pvh/head.S:19:
   arch/x86/include/asm/pgtable_64_types.h:75: warning: "PGDIR_SHIFT" redefined
      75 | #define PGDIR_SHIFT             39
         | 
   In file included from arch/x86/include/asm/pgtable_32_types.h:15,
                    from arch/x86/include/asm/pgtable_types.h:275,
                    from arch/x86/include/asm/boot.h:6,
                    from arch/x86/platform/pvh/head.S:18:
   arch/x86/include/asm/pgtable-2level_types.h:29: note: this is the location of the previous definition
      29 | #define PGDIR_SHIFT     22
         | 
   arch/x86/include/asm/pgtable_64_types.h:76: warning: "PTRS_PER_PGD" redefined
      76 | #define PTRS_PER_PGD            512
         | 
   arch/x86/include/asm/pgtable-2level_types.h:30: note: this is the location of the previous definition
      30 | #define PTRS_PER_PGD    1024
         | 
>> arch/x86/include/asm/pgtable_64_types.h:97: warning: "PTRS_PER_PTE" redefined
      97 | #define PTRS_PER_PTE    512
         | 
   arch/x86/include/asm/pgtable-2level_types.h:38: note: this is the location of the previous definition
      38 | #define PTRS_PER_PTE    1024
         | 
   arch/x86/include/asm/pgtable_64_types.h:103: warning: "PGDIR_SIZE" redefined
     103 | #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_32_types.h:20: note: this is the location of the previous definition
      20 | #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_64_types.h:210: warning: "PGD_KERNEL_START" redefined
     210 | #define PGD_KERNEL_START        ((PAGE_SIZE / 2) / sizeof(pgd_t))
         | 
   arch/x86/include/asm/pgtable-2level_types.h:41: note: this is the location of the previous definition
      41 | #define PGD_KERNEL_START        (CONFIG_PAGE_OFFSET >> PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_64.h: Assembler messages:
   arch/x86/include/asm/pgtable_64.h:279: Error: invalid operands (*UND* and *ABS* sections) for `>>'


vim +/PTRS_PER_PTE +97 arch/x86/include/asm/pgtable_64_types.h

b8504058a06bd1 Kirill A. Shutemov  2017-03-30  71  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  72  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  73   * PGDIR_SHIFT determines what a top-level page table entry can map
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  74   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  75  #define PGDIR_SHIFT		39
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08 @76  #define PTRS_PER_PGD		512
c65e774fb3f6af Kirill A. Shutemov  2018-02-14  77  #define MAX_PTRS_PER_P4D	1
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  78  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30  79  #endif /* CONFIG_X86_5LEVEL */
b8504058a06bd1 Kirill A. Shutemov  2017-03-30  80  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  81  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  82   * 3rd level page
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  83   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  84  #define PUD_SHIFT	30
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  85  #define PTRS_PER_PUD	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  86  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  87  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  88   * PMD_SHIFT determines the size of the area a middle-level
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  89   * page table can map
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  90   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  91  #define PMD_SHIFT	21
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  92  #define PTRS_PER_PMD	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  93  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  94  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  95   * entries per page directory level
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  96   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08 @97  #define PTRS_PER_PTE	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
