Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27B1A5A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 18:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695233040; x=1726769040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XAdS6Tj+vPPVLgsNQ+1iicu6aJUFMgTrUPO7+uCZqA4=;
  b=gtujgDfn66wolaDQIOHGLYYtGpd2j+2EbFfI+RAcnPhy5aUHJDVN3hbL
   Imporu09knTFVVwC+PT0Ix63CtFEyP5dKbStzu8aAFG5uRlWk1w7Fxl9c
   dgqddfP5woEz5RYAnjQZ8RZ4SAepxpj/isUZXjQFGHBtQdHUSMnXeBB/Y
   pbN8wxdIIqPWXbbUXcOzgfAC5zS6yaPifBVK3MVfhiwzLnguhEPqPvmdJ
   rvSiPgcN3/g9VUa7Yo2C4fnMQBPmoVn7+qBaOr/z75I9L+gnSCgkKU6bA
   0wkOQ6IVlh2Uh84l8uM/mJUWQe9SYXMM6reJ/kInC9EWSTkPxCrGOc/5O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383048406"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="383048406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 11:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776089903"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="776089903"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Sep 2023 11:03:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj1YK-00090q-2m;
	Wed, 20 Sep 2023 18:03:56 +0000
Date: Thu, 21 Sep 2023 02:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/6] shmem: add file length in shmem_get_folio path
Message-ID: <202309210143.LTEqtr2H-lkp@intel.com>
References: <20230919135536.2165715-6-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919135536.2165715-6-da.gomez@samsung.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/shmem-drop-BLOCKS_PER_PAGE-macro/20230920-005146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230919135536.2165715-6-da.gomez%40samsung.com
patch subject: [PATCH v2 5/6] shmem: add file length in shmem_get_folio path
config: sparc-randconfig-001-20230920 (https://download.01.org/0day-ci/archive/20230921/202309210143.LTEqtr2H-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210143.LTEqtr2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210143.LTEqtr2H-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/userfaultfd.c: In function 'mfill_atomic_pte_continue':
>> mm/userfaultfd.c:259:15: error: too few arguments to function 'shmem_get_folio'
     259 |         ret = shmem_get_folio(inode, pgoff, &folio, SGP_NOALLOC);
         |               ^~~~~~~~~~~~~~~
   In file included from mm/userfaultfd.c:17:
   include/linux/shmem_fs.h:135:5: note: declared here
     135 | int shmem_get_folio(struct inode *inode, pgoff_t index, struct folio **foliop,
         |     ^~~~~~~~~~~~~~~


vim +/shmem_get_folio +259 mm/userfaultfd.c

c1a4de99fada21 Andrea Arcangeli        2015-09-04  246  
153132571f0204 Axel Rasmussen          2021-06-30  247  /* Handles UFFDIO_CONTINUE for all shmem VMAs (shared or private). */
61c5004022f56c Axel Rasmussen          2023-03-14  248  static int mfill_atomic_pte_continue(pmd_t *dst_pmd,
153132571f0204 Axel Rasmussen          2021-06-30  249  				     struct vm_area_struct *dst_vma,
153132571f0204 Axel Rasmussen          2021-06-30  250  				     unsigned long dst_addr,
d9712937037e0c Axel Rasmussen          2023-03-14  251  				     uffd_flags_t flags)
153132571f0204 Axel Rasmussen          2021-06-30  252  {
153132571f0204 Axel Rasmussen          2021-06-30  253  	struct inode *inode = file_inode(dst_vma->vm_file);
153132571f0204 Axel Rasmussen          2021-06-30  254  	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  255) 	struct folio *folio;
153132571f0204 Axel Rasmussen          2021-06-30  256  	struct page *page;
153132571f0204 Axel Rasmussen          2021-06-30  257  	int ret;
153132571f0204 Axel Rasmussen          2021-06-30  258  
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02 @259) 	ret = shmem_get_folio(inode, pgoff, &folio, SGP_NOALLOC);
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  260) 	/* Our caller expects us to return -EFAULT if we failed to find folio */
73f37dbcfe1763 Axel Rasmussen          2022-06-10  261  	if (ret == -ENOENT)
73f37dbcfe1763 Axel Rasmussen          2022-06-10  262  		ret = -EFAULT;
153132571f0204 Axel Rasmussen          2021-06-30  263  	if (ret)
153132571f0204 Axel Rasmussen          2021-06-30  264  		goto out;
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  265) 	if (!folio) {
153132571f0204 Axel Rasmussen          2021-06-30  266  		ret = -EFAULT;
153132571f0204 Axel Rasmussen          2021-06-30  267  		goto out;
153132571f0204 Axel Rasmussen          2021-06-30  268  	}
153132571f0204 Axel Rasmussen          2021-06-30  269  
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  270) 	page = folio_file_page(folio, pgoff);
a7605426666196 Yang Shi                2022-01-14  271  	if (PageHWPoison(page)) {
a7605426666196 Yang Shi                2022-01-14  272  		ret = -EIO;
a7605426666196 Yang Shi                2022-01-14  273  		goto out_release;
a7605426666196 Yang Shi                2022-01-14  274  	}
a7605426666196 Yang Shi                2022-01-14  275  
61c5004022f56c Axel Rasmussen          2023-03-14  276  	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
d9712937037e0c Axel Rasmussen          2023-03-14  277  				       page, false, flags);
153132571f0204 Axel Rasmussen          2021-06-30  278  	if (ret)
153132571f0204 Axel Rasmussen          2021-06-30  279  		goto out_release;
153132571f0204 Axel Rasmussen          2021-06-30  280  
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  281) 	folio_unlock(folio);
153132571f0204 Axel Rasmussen          2021-06-30  282  	ret = 0;
153132571f0204 Axel Rasmussen          2021-06-30  283  out:
153132571f0204 Axel Rasmussen          2021-06-30  284  	return ret;
153132571f0204 Axel Rasmussen          2021-06-30  285  out_release:
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  286) 	folio_unlock(folio);
12acf4fbc4f78b Matthew Wilcox (Oracle  2022-09-02  287) 	folio_put(folio);
153132571f0204 Axel Rasmussen          2021-06-30  288  	goto out;
153132571f0204 Axel Rasmussen          2021-06-30  289  }
153132571f0204 Axel Rasmussen          2021-06-30  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
