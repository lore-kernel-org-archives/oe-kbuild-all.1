Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D0C328AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEnGi3tx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700146751; x=1731682751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iyfd7ENgOZJUmAVDLtU3CPNLSLiwUEcvm3AH+YpaPSk=;
  b=LEnGi3txtCJESquTGzSmtAl1Mz6OnhnO7DTxyDwxIjX40Qk9UXCyievE
   8+qBILUUk0F7on4xf1zXa7HyYaSd2rHpKEXMMrrRe+V1cWfzi9qc+uq/r
   vNKhr48mcR7IWvf1Wv+pV7Epj4XJ7sue4NHMJpgWvZcIWNJMqXmb8/9de
   /4qC43GXwQkhghVjCR8thOLxkYz2DvnXkCZdxpywqTWciRPoU8zQxlRDR
   p8/kVGnP/4LTIp/9QeXhVhpvhnQy4UQxK8ZpC9Rh1HzIQV7EEc/RfDq/Z
   UKL6DSZV4jqRtn4TeOHGPEVT8g5q2/YnM1aMb8vLvnqFV40lAMHpeTuCt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4227567"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="4227567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 06:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="6555547"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2023 06:59:09 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3dpi-0001nj-0n;
	Thu, 16 Nov 2023 14:59:06 +0000
Date: Thu, 16 Nov 2023 22:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 08/12] mm/gup: Handle hugetlb for no_page_table()
Message-ID: <202311162247.YlXRUifO-lkp@intel.com>
References: <20231116012908.392077-9-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116012908.392077-9-peterx@redhat.com>

Hi Peter,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-hugetlb-Export-hugetlbfs_pagecache_present/20231116-093155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231116012908.392077-9-peterx%40redhat.com
patch subject: [PATCH RFC 08/12] mm/gup: Handle hugetlb for no_page_table()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231116/202311162247.YlXRUifO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311162247.YlXRUifO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162247.YlXRUifO-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'no_page_table':
>> mm/gup.c:519:22: error: implicit declaration of function 'hugetlbfs_pagecache_present' [-Werror=implicit-function-declaration]
     519 |                 if (!hugetlbfs_pagecache_present(h, vma, address))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hugetlbfs_pagecache_present +519 mm/gup.c

   501	
   502	#ifdef CONFIG_MMU
   503	static struct page *no_page_table(struct vm_area_struct *vma,
   504					  unsigned int flags, unsigned long address)
   505	{
   506		if (!(flags & FOLL_DUMP))
   507			return NULL;
   508	
   509		/*
   510		 * When core dumping, we don't want to allocate unnecessary pages or
   511		 * page tables.  Return error instead of NULL to skip handle_mm_fault,
   512		 * then get_dump_page() will return NULL to leave a hole in the dump.
   513		 * But we can only make this optimization where a hole would surely
   514		 * be zero-filled if handle_mm_fault() actually did handle it.
   515		 */
   516		if (is_vm_hugetlb_page(vma)) {
   517			struct hstate *h = hstate_vma(vma);
   518	
 > 519			if (!hugetlbfs_pagecache_present(h, vma, address))
   520				return ERR_PTR(-EFAULT);
   521		} else if ((vma_is_anonymous(vma) || !vma->vm_ops->fault)) {
   522			return ERR_PTR(-EFAULT);
   523		}
   524	
   525		return NULL;
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
