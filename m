Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B662D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 03:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690774001; x=1722310001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DypFmop+maGwa3/RV2b/eHkJYUGq5qcv096wiYyfB+8=;
  b=hjHHeo5I5ArJ0HN5bo/tuW9bt9TEMpCUfB+J1Bb0vw+xYzNxvNwYszBO
   v5hJSLZ81evAK1LR0p0DIlgJq7Us/aIg7bywZWsui1HjCsNxTsT+oUexd
   jozKcAm/mT5bBIGyqt5CWt2yxAVhgsoc2j18b0EkpQS9j8ycJgKxwirNf
   KOf1l2PwpAgEyd1pEDBjQ5uvzdgaHlg0icAYR+O25tNuECFfKlzM3y/Mf
   J7Tvth9suHHvN8C1ZF0VxOU0a7rWRzwqhRLt9bfOyVHD3qkAYFzE0OC7V
   54pINqKuiRztOQZs1dmn8DihkdC+sI1/kS6UxKOsiXElQQXzFtabay8Jf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="366389025"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="366389025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 20:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678163366"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="678163366"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Jul 2023 20:26:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQJYI-0004uL-1u;
	Mon, 31 Jul 2023 03:26:35 +0000
Date: Mon, 31 Jul 2023 11:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4432/4710] arch/powerpc/mm/init_64.c:201:15:
 error: no previous prototype for '__vmemmap_populate'
Message-ID: <202307311138.bn4Pj1Ht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 30c80d3ed8d266bf42116b7f13dbb15b76989232 [4432/4710] powerpc/book3s64/radix: remove mmu_vmemmap_psize
config: powerpc-pasemi_defconfig (https://download.01.org/0day-ci/archive/20230731/202307311138.bn4Pj1Ht-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311138.bn4Pj1Ht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311138.bn4Pj1Ht-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/init_64.c:201:15: error: no previous prototype for '__vmemmap_populate' [-Werror=missing-prototypes]
     201 | int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
         |               ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/__vmemmap_populate +201 arch/powerpc/mm/init_64.c

   200	
 > 201	int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
   202					 struct vmem_altmap *altmap)
   203	{
   204		bool altmap_alloc;
   205		unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
   206	
   207		/* Align to the page size of the linear mapping. */
   208		start = ALIGN_DOWN(start, page_size);
   209	
   210		pr_debug("vmemmap_populate %lx..%lx, node %d\n", start, end, node);
   211	
   212		for (; start < end; start += page_size) {
   213			void *p = NULL;
   214			int rc;
   215	
   216			/*
   217			 * This vmemmap range is backing different subsections. If any
   218			 * of that subsection is marked valid, that means we already
   219			 * have initialized a page table covering this range and hence
   220			 * the vmemmap range is populated.
   221			 */
   222			if (vmemmap_populated(start, page_size))
   223				continue;
   224	
   225			/*
   226			 * Allocate from the altmap first if we have one. This may
   227			 * fail due to alignment issues when using 16MB hugepages, so
   228			 * fall back to system memory if the altmap allocation fail.
   229			 */
   230			if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
   231				p = vmemmap_alloc_block_buf(page_size, node, altmap);
   232				if (!p)
   233					pr_debug("altmap block allocation failed, falling back to system memory");
   234				else
   235					altmap_alloc = true;
   236			}
   237			if (!p) {
   238				p = vmemmap_alloc_block_buf(page_size, node, NULL);
   239				altmap_alloc = false;
   240			}
   241			if (!p)
   242				return -ENOMEM;
   243	
   244			if (vmemmap_list_populate(__pa(p), start, node)) {
   245				/*
   246				 * If we don't populate vmemap list, we don't have
   247				 * the ability to free the allocated vmemmap
   248				 * pages in section_deactivate. Hence free them
   249				 * here.
   250				 */
   251				int nr_pfns = page_size >> PAGE_SHIFT;
   252				unsigned long page_order = get_order(page_size);
   253	
   254				if (altmap_alloc)
   255					vmem_altmap_free(altmap, nr_pfns);
   256				else
   257					free_pages((unsigned long)p, page_order);
   258				return -ENOMEM;
   259			}
   260	
   261			pr_debug("      * %016lx..%016lx allocated at %p\n",
   262				 start, start + page_size, p);
   263	
   264			rc = vmemmap_create_mapping(start, page_size, __pa(p));
   265			if (rc < 0) {
   266				pr_warn("%s: Unable to create vmemmap mapping: %d\n",
   267					__func__, rc);
   268				return -EFAULT;
   269			}
   270		}
   271	
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
