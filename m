Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C9923183C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 02:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778035453; cv=none; b=OzqBYNAA7wXTUhge4TnliaMMC1RQCFVM/yaTSIc65lADODp0URI7VE8yTDYBT9SbyGD9ruIthaRixfoARjcPv1oOuhgHproOScgBmBgtNGCN2CILoMtdZnGAB30Yutllb0Cra/hJQqPZzz7lSnFArYU4AJBqR8AUhEWvTaoIpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778035453; c=relaxed/simple;
	bh=GNFM3iNK492RisaR+k0nyja2/ehg1otPsgZR0uAeBFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YlDRfuqQ/kDQYdUzj9G1LonqLYxI/wpgNjBsNco5OtwVklgSlHBm5bkh5ruom72PNe5klNbtFizKzuFQkzXdlNGQ479tEb7LP9O88MhklahA+EC5KgxCpn8xwNylcUEP0oNAOVL1O7N1h0fqkaXvdI4CBm+8dWoQGWAvLPbWkis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZKPX2xN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZKPX2xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778035452; x=1809571452;
  h=date:from:to:cc:subject:message-id;
  bh=GNFM3iNK492RisaR+k0nyja2/ehg1otPsgZR0uAeBFc=;
  b=CZKPX2xNHJJ3POROvL3Rf7IoqkYKgZaT7yJj7hEDvvY1F7WEhO1tfBsT
   HCRjpDX6E7X2YScng36UK3hoU+L7ioM26Ro5FNbKO+NRu7jLUI2FvR0WJ
   UUKDE9rYUDNuHhAise56n6uvi9UXtG3odNLPyF5khOmyAJn1hyYrUdH9P
   0eR6xgSBFoyhZ91qTUxdAZSyoeBZdHsTeUBKMAVfc6LX/RuBvqFbfSwM3
   KUcZjkS1o4tPALoDR7Q0HPYz/+TDqbFCbhZEEr5v6OdhnkOcfCFn23cML
   WLxo4LUbSjUMB+fzgLvqORaE5DhlpzWnVFd/tuy+NRMDk/iJxJ7OzKa8w
   A==;
X-CSE-ConnectionGUID: jV3OQuSZRR6hQ3aWV+ZxPg==
X-CSE-MsgGUID: v0HMilIFSMytTJmKP3PkHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81480946"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="81480946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 19:44:12 -0700
X-CSE-ConnectionGUID: nYOOMJghQACP33YWKuxWnA==
X-CSE-MsgGUID: s+NYO3RISoqgXmpl8P5KQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="231602459"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2026 19:44:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKSF6-000000006Qf-12nn;
	Wed, 06 May 2026 02:44:08 +0000
Date: Wed, 06 May 2026 04:43:38 +0200
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/bootmem_info 10/19]
 arch/s390/mm/vmem.c:42:22: warning: unused variable 'nr_pages'
Message-ID: <202605060456.ObYmLlHg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/bootmem_info
head:   9bd8b9ac2bf1b3e7ffee070da9c2f0607c507207
commit: ad0ab8ac08f34bb72542795d52e15d8b5d174973 [10/19] s390/mm: use free_reserved_pages() in vmem_free_pages()
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260506/202605060456.ObYmLlHg-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060456.ObYmLlHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060456.ObYmLlHg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/mm/vmem.c: In function 'vmem_free_pages':
>> arch/s390/mm/vmem.c:42:22: warning: unused variable 'nr_pages' [-Wunused-variable]
      42 |         unsigned int nr_pages = 1 << order;
         |                      ^~~~~~~~


vim +/nr_pages +42 arch/s390/mm/vmem.c

67060d9c1f5d91 Heiko Carstens          2008-05-30  39  
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  40  static void vmem_free_pages(unsigned long addr, int order, struct vmem_altmap *altmap)
9ec8fa8dc331be David Hildenbrand       2020-07-22  41  {
d5e88d32de4e4c Sumanth Korikkar        2025-10-10 @42  	unsigned int nr_pages = 1 << order;
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  43  	struct page *page;
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  44  
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  45  	if (altmap) {
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  46  		vmem_altmap_free(altmap, 1 << order);
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  47  		return;
1a65b73ae9abd6 Sumanth Korikkar        2024-01-08  48  	}
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  49  	page = virt_to_page((void *)addr);
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  50  	if (PageReserved(page)) {
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  51  		/* allocated from memblock */
ad0ab8ac08f34b David Hildenbrand (Arm  2026-03-12  52) 		free_reserved_pages(page, order);
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  53  	} else {
9ec8fa8dc331be David Hildenbrand       2020-07-22  54  		free_pages(addr, order);
9ec8fa8dc331be David Hildenbrand       2020-07-22  55  	}
d5e88d32de4e4c Sumanth Korikkar        2025-10-10  56  }
9ec8fa8dc331be David Hildenbrand       2020-07-22  57  

:::::: The code at line 42 was first introduced by commit
:::::: d5e88d32de4e4ce289d107939da970763669d631 s390/mm: Support removal of boot-allocated virtual memory map

:::::: TO: Sumanth Korikkar <sumanthk@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
