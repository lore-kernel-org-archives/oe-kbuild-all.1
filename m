Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A22F3614
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477963; cv=none; b=X2hQzDRoWv3ipwZehgxtryOIj5XU6kHWFdJgPJYktFtO2G6D5N2Q05ImHFG1HJmShhRfrNdFTd88PbBn5dnLkvwFThfS//wYZu2G+5cruNAw5HLrxmsOluIK92/Ra5JmSvwokLfWxc9yz5SGXlf5NYpVGYPpx++wzvLgu0YYeCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477963; c=relaxed/simple;
	bh=lYdCQIFm2qk65kUoXFtLbmYlPQoDXbYea+SAGtSWTno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HznEHSL56Rgat8tjlyoGkP4fvjaRQR3f0vtFo+mIljCgv9eIBpC+vfLbjfA5pYV+hTvPgyqlYYHjn1GXCERJrmSqRhREMivDz33/KEebAQVNkyjhzUQDMDjbUkE+9OrOEerWI6MSLd0zwQc4GpWJXEO2ihOnGN5iy8wdfVTMuzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlraC8E+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlraC8E+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790477961; x=1822013961;
  h=date:from:to:cc:subject:message-id;
  bh=lYdCQIFm2qk65kUoXFtLbmYlPQoDXbYea+SAGtSWTno=;
  b=DlraC8E+g14TvbuA28dEBxI76zKSiwB15PVLCZRVzg2y/hnnqPTsFpnI
   OTngkAceqzXKF/e0T/En3zayFbbSzvvWfR05CEP3rcQy/J8ujH7l41Y3G
   HXHH4fjL7R9EeWkbWnDPmdqbWfIhycxCTqYbKen2qhnnqTDbBl1oun/ra
   3pnXnG/NIqgVwmJ80fbhDMzGTFFCovr1oa7+ZvQ1oe9IM4+JZDcQGLp8V
   mW4u5pHOng/ZZoM6iLn+QnSIF2Ivk7XYWOR9/GIEzW91KPUXm7JIZVefI
   9wZ8jvPGOcWCs12Yo8HYKSoZumXAVP+E3N5wL3k7FeUVKrb2DPA3PMfgu
   A==;
X-CSE-ConnectionGUID: og4LTQ0eStqxzEdFquSh3A==
X-CSE-MsgGUID: 2GAzfOhNQRuOiCklwkJMeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="93929509"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="93929509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 19:59:20 -0700
X-CSE-ConnectionGUID: OuE8DNC8TuOV/6GSJ5K46A==
X-CSE-MsgGUID: ljsDaphuS7+2LLOkpu/ngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="273925329"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2026 19:59:18 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAf6h-000000000Oh-2mZo;
	Sun, 27 Sep 2026 02:59:15 +0000
Date: Sun, 27 Sep 2026 04:59:00 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] drivers/pci/pci.c:4137:9:
 error: implicit declaration of function 'vunmap_range'
Message-ID: <202609270416.rEtAiqyF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-randconfig-2000-20260927 (https://download.01.org/0day-ci/archive/20260927/202609270416.rEtAiqyF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270416.rEtAiqyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270416.rEtAiqyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'pci_unmap_iospace':
>> drivers/pci/pci.c:4137:9: error: implicit declaration of function 'vunmap_range' [-Wimplicit-function-declaration]
    4137 |         vunmap_range(vaddr, vaddr + resource_size(res));
         |         ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI
   Depends on [n]: HAVE_PCI [=y] && MMU [=n]
   Selected by [y]:
   - FORCE_PCI [=y]


vim +/vunmap_range +4137 drivers/pci/pci.c

8b921acfeffdb0b Liviu Dudau     2014-09-29  4123  
4d3f13845957a87 Sinan Kaya      2016-06-10  4124  /**
4d3f13845957a87 Sinan Kaya      2016-06-10  4125   * pci_unmap_iospace - Unmap the memory mapped I/O space
4d3f13845957a87 Sinan Kaya      2016-06-10  4126   * @res: resource to be unmapped
4d3f13845957a87 Sinan Kaya      2016-06-10  4127   *
74356addc0b32e8 Bjorn Helgaas   2019-01-09  4128   * Unmap the CPU virtual address @res from virtual address space.  Only
74356addc0b32e8 Bjorn Helgaas   2019-01-09  4129   * architectures that have memory mapped IO functions defined (and the
74356addc0b32e8 Bjorn Helgaas   2019-01-09  4130   * PCI_IOBASE value defined) should call this function.
4d3f13845957a87 Sinan Kaya      2016-06-10  4131   */
4d3f13845957a87 Sinan Kaya      2016-06-10  4132  void pci_unmap_iospace(struct resource *res)
4d3f13845957a87 Sinan Kaya      2016-06-10  4133  {
8fe743b5eba0abf Arnd Bergmann   2025-04-23  4134  #if defined(PCI_IOBASE)
4d3f13845957a87 Sinan Kaya      2016-06-10  4135  	unsigned long vaddr = (unsigned long)PCI_IOBASE + res->start;
4d3f13845957a87 Sinan Kaya      2016-06-10  4136  
4ad0ae8c64ac8f8 Nicholas Piggin 2021-04-29 @4137  	vunmap_range(vaddr, vaddr + resource_size(res));
4d3f13845957a87 Sinan Kaya      2016-06-10  4138  #endif
4d3f13845957a87 Sinan Kaya      2016-06-10  4139  }
f90b0875463e450 Brian Norris    2017-03-09  4140  EXPORT_SYMBOL(pci_unmap_iospace);
4d3f13845957a87 Sinan Kaya      2016-06-10  4141  

:::::: The code at line 4137 was first introduced by commit
:::::: 4ad0ae8c64ac8f81a3651bca11be7c3cb086df80 mm/vmalloc: remove unmap_kernel_range

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
