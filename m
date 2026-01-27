Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324F836680D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541286; cv=none; b=OV1w9GnZtxraJXpCUEtisG0D5rGPfjQ3sowYpCx/jt9vL4AtQyQWr5fXKfDntYRlH6m2rRNXE3su9GHpMP+bFZyboC3ajggaSdhH2XjWJpDo20FhSFED0/E73FrUrgSQgZcumXuYTM8m43Op4cOGR2ngXZmhddWraiJecunh8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541286; c=relaxed/simple;
	bh=kQs4g0Hj1ItK/QiIzgpxVcFUJqnU6e1/jMgmoaFBUsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftijstVoz2zpQoVEAtAkBZpNlfMsk4Q67wnNV5OHwqcl9Iy7mKQHQ7pSKLxELbgOmwgmzHkI1gU+3Wv/w5szCj44KeOBZEoFtvQSRBaCI4TFDXLB6B1irxRk3afClQiaP25TtzBN3dB/1A/sN/+2Bkwwg+2cZ1Gw1S5sdJBZstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CH7vYiZL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CH7vYiZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769541284; x=1801077284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQs4g0Hj1ItK/QiIzgpxVcFUJqnU6e1/jMgmoaFBUsw=;
  b=CH7vYiZL72m81zm3EL+XFofBp+C9jDqbjBB9HKgXQZKs8gBFfW3Q/0Zs
   oenDs4uTifiZF2HvKw0zeJ5ACrseHqz5iBGUpEemn6JcNSVkoZM3i3fR/
   ivkGzclRHeA3hdNxb/ABHihDXBCTQEy49bCwTKk1qxyJDKdp5342IvT6v
   lgzzPiqKgqIW9JAppbFILfWMCgaIPo+Ip+w5L49wrLaaQ8iXFJRP54HzU
   o5dFbJn7YyI0aTJ0fJTP6pKJzkdiTKL3AgZbOWRUsu/0jRO3hrOvRwym5
   K46HCELYv+hr9Ky2luJ3UgeE19lpH9bmMmAyhW8TlPPH8gFs2SdP7JlpB
   Q==;
X-CSE-ConnectionGUID: SBNGDrOdTQubXNEqfmrmmA==
X-CSE-MsgGUID: pWTR4hZpSa+zIQH30RbSpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73336238"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="73336238"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:14:41 -0800
X-CSE-ConnectionGUID: 92Woe+I6ROehAEhwqVIEMA==
X-CSE-MsgGUID: QO/jNyD9R4i0G7V/8wwXJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212604699"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2026 11:14:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkoWK-000000001vN-3e9X;
	Tue, 27 Jan 2026 19:14:36 +0000
Date: Tue, 27 Jan 2026 20:13:41 +0100
From: kernel test robot <lkp@intel.com>
To: Austin Kim <austindh.kim@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, austindh.kim@gmail.com
Subject: Re: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF
 notes
Message-ID: <202601272006.NUdRcAIi-lkp@intel.com>
References: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525>

Hi Austin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Austin-Kim/riscv-export-kaslr-offset-and-satp-in-VMCOREINFO-ELF-notes/20260127-173528
base:   linus/master
patch link:    https://lore.kernel.org/r/aXiF55y5D49gcpUg%40adminpc-PowerEdge-R7525
patch subject: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF notes
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260127/202601272006.NUdRcAIi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272006.NUdRcAIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272006.NUdRcAIi-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/vmcore_info.o: in function `arch_crash_save_vmcoreinfo':
>> arch/riscv/kernel/vmcore_info.c:23:(.text+0x240): undefined reference to `kaslr_offset'


vim +23 arch/riscv/kernel/vmcore_info.c

cfe94d456775a4 arch/riscv/kernel/vmcore_info.c Austin Kim      2026-01-27  10  
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  11  void arch_crash_save_vmcoreinfo(void)
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  12  {
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  13  	VMCOREINFO_NUMBER(phys_ram_base);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  14  
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  15  	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  16  	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
c41bd2514184d7 arch/riscv/kernel/crash_core.c  Ignat Korchagin 2023-11-29  17  #ifdef CONFIG_MMU
c41bd2514184d7 arch/riscv/kernel/crash_core.c  Ignat Korchagin 2023-11-29  18  	VMCOREINFO_NUMBER(VA_BITS);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  19  	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  20  	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  21  #ifdef CONFIG_64BIT
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26  22  	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26 @23  	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
