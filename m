Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A30190489
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723137756; cv=none; b=M6jB/ByRTCXsrny6SiJRGOZlc2U/Y+ytB356/kjP4csdAcPu4nxcJBd6bzJ162+S6C83LW1muSx/MVnYjMMpuuds0jgPukBx73OmrYcN6f9c4vmLIATZKc0LLaRMopXxJbja491xYitnJMC3Urlod+T5EG5Z8c8y3mcdD45QOY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723137756; c=relaxed/simple;
	bh=AeCnoAqNiZffDwrPdaPgWkr0L/ovo55SDMCNKmnzA/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0paCjwKrRc+0653X9jpts5z8XfF3ZNoPNYiSFR3Xw3Yrx42xCTSGKSEs9xFdLMtpYEOfpoZt3f5lvSInSw88c3DhB5yCV4y1R8ecQVbQI/R4FKL63C84/E3AFY+J7NQmVW0Nkd4pfpzxi35IMA5BYrOOFuhlt6FeOtDugrfuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOBsmyAw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOBsmyAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723137754; x=1754673754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AeCnoAqNiZffDwrPdaPgWkr0L/ovo55SDMCNKmnzA/c=;
  b=bOBsmyAwJMIwj4jzOuKPySx9QL4aFTn7GFY95xSO7iK9UcUr1E5if2EW
   Qc3j/uPbPYrykF6eoz6zYhlaeo67swHyHlrH+PtqlfrijtgZKDeL7FpEC
   n+/GEtp1Y/qWyhoYQjq1EPtVYDrPqRJCGBFdmfluue4ZSsO3KPE5adRoE
   CdGowaahS+uHgYWhZ0YItW2F2cVCCmgIASpCA/YuMAKPQjbL+yzNa90aO
   jS4sfNmO7yNcKCvi564c4HbY4R2QpIxqi4typf0L0orGORZEhLMsHwcOn
   +cvrrTOLH78XvW9kmaT8ISjELU6cEZR1hN5g482swzmvqs+CATiSCQoNz
   Q==;
X-CSE-ConnectionGUID: ND+YOxEkSZuhmea8p7rj5Q==
X-CSE-MsgGUID: Ywht1X9LQxqm9TFqZ+nLaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="46688137"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="46688137"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 10:22:33 -0700
X-CSE-ConnectionGUID: TTCKFslURnKljpuZW9m/SA==
X-CSE-MsgGUID: 8C/8HL7XQRCPyO55TTyX7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57271633"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Aug 2024 10:22:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc6qM-0006Mg-0Q;
	Thu, 08 Aug 2024 17:22:30 +0000
Date: Fri, 9 Aug 2024 01:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 23/225] mm/page_ext.c:323:29: warning: variable
 'pgdat' set but not used
Message-ID: <202408090125.PxGk56zJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   275d686abcb590d862b74e2670533d93fd10e58c
commit: 129bae385a761c7fd88874ad46e27d7eb739bd80 [23/225] mm: don't account memmap per node
config: i386-randconfig-141-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090125.PxGk56zJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090125.PxGk56zJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090125.PxGk56zJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_ext.c: In function 'free_page_ext':
>> mm/page_ext.c:323:29: warning: variable 'pgdat' set but not used [-Wunused-but-set-variable]
     323 |         struct pglist_data *pgdat;
         |                             ^~~~~


vim +/pgdat +323 mm/page_ext.c

76af6a054da405 Dave Hansen     2021-10-18  318  
eefa864b701d78 Joonsoo Kim     2014-12-12  319  static void free_page_ext(void *addr)
eefa864b701d78 Joonsoo Kim     2014-12-12  320  {
eefa864b701d78 Joonsoo Kim     2014-12-12  321  	size_t table_size;
15995a35247442 Sourav Panda    2024-06-05  322  	struct page *page;
15995a35247442 Sourav Panda    2024-06-05 @323  	struct pglist_data *pgdat;
eefa864b701d78 Joonsoo Kim     2014-12-12  324  
5556cfe8d994d5 Vlastimil Babka 2019-10-14  325  	table_size = page_ext_size * PAGES_PER_SECTION;
eefa864b701d78 Joonsoo Kim     2014-12-12  326  
15995a35247442 Sourav Panda    2024-06-05  327  	if (is_vmalloc_addr(addr)) {
15995a35247442 Sourav Panda    2024-06-05  328  		page = vmalloc_to_page(addr);
15995a35247442 Sourav Panda    2024-06-05  329  		pgdat = page_pgdat(page);
129bae385a761c Pasha Tatashin  2024-08-07  330  		mod_memmap(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
15995a35247442 Sourav Panda    2024-06-05  331  		vfree(addr);
15995a35247442 Sourav Panda    2024-06-05  332  	} else {
15995a35247442 Sourav Panda    2024-06-05  333  		page = virt_to_page(addr);
15995a35247442 Sourav Panda    2024-06-05  334  		pgdat = page_pgdat(page);
129bae385a761c Pasha Tatashin  2024-08-07  335  		mod_memmap(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
eefa864b701d78 Joonsoo Kim     2014-12-12  336  		BUG_ON(PageReserved(page));
0c81585499601a Qian Cai        2019-03-05  337  		kmemleak_free(addr);
eefa864b701d78 Joonsoo Kim     2014-12-12  338  		free_pages_exact(addr, table_size);
eefa864b701d78 Joonsoo Kim     2014-12-12  339  	}
eefa864b701d78 Joonsoo Kim     2014-12-12  340  }
eefa864b701d78 Joonsoo Kim     2014-12-12  341  

:::::: The code at line 323 was first introduced by commit
:::::: 15995a35247442aefa0ffe36a6dad51cb46b0918 mm: report per-page metadata information

:::::: TO: Sourav Panda <souravpanda@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
