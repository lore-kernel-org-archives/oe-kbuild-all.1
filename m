Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED3D38F9D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3khQuOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699568192; x=1731104192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XvbWatV+TMvmfMSFU8YnsezB65vwvmADldykBD94GGA=;
  b=R3khQuOeuwRo+rakBHH50YZDqFwCsSEEYApog93r+XReJDRKzlITyfwU
   Gxj7mfhGr+AwdEMQ6qkyaPep7RHOAssr28oUNhrawyjFC6xkTqLe8zoD/
   NpgHbWgI9o63eAKiEKLlEMdFa8tFAKddsy9YjkGe/F5xBtdto9GrCDJWH
   FXb8BaoF92h7ILovtaJD7imAOkzBInjVLdKjjrCQuyKsXVctk5yCVqm4A
   8N/coGi+q4PMsmWQOsZBCxxTqX8bw5SSDC7eAbAzx2E5iXRQLobUh7q44
   7MaCuN8o3vyLMTHD0vCor5k5K5CihBXG7j9hcrc3ujgvZ/mzrGEpI859z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454386977"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="454386977"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="739974135"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="739974135"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2023 14:16:31 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1DK8-0009CU-1c;
	Thu, 09 Nov 2023 22:16:28 +0000
Date: Fri, 10 Nov 2023 06:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Xie <jeff.xie@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 3/4] filemap: implement filemap allocate post
 callback for page_owner
Message-ID: <202311100526.70VEx4fn-lkp@intel.com>
References: <20231109032521.392217-4-jeff.xie@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109032521.392217-4-jeff.xie@linux.dev>

Hi Jeff,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Xie/mm-page_owner-add-folio-allocate-post-callback-for-struct-page_owner-to-make-the-owner-clearer/20231109-165052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231109032521.392217-4-jeff.xie%40linux.dev
patch subject: [RFC][PATCH 3/4] filemap: implement filemap allocate post callback for page_owner
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231110/202311100526.70VEx4fn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100526.70VEx4fn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100526.70VEx4fn-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/filemap.c: In function 'filemap_alloc_post_page_owner':
>> mm/filemap.c:862:29: error: implicit declaration of function 'page_mapped_in_vma' [-Werror=implicit-function-declaration]
     862 |                         if (page_mapped_in_vma(&folio->page, vma)) {
         |                             ^~~~~~~~~~~~~~~~~~
>> mm/filemap.c:863:49: error: implicit declaration of function 'vma_address'; did you mean 'page_address'? [-Werror=implicit-function-declaration]
     863 |                                 virtual_start = vma_address(&folio->page, vma);
         |                                                 ^~~~~~~~~~~
         |                                                 page_address
   cc1: some warnings being treated as errors


vim +/page_mapped_in_vma +862 mm/filemap.c

   841	
   842	#ifdef CONFIG_PAGE_OWNER
   843	static int filemap_alloc_post_page_owner(struct folio *folio, struct task_struct *tsk,
   844				void *data, char *kbuf, size_t count)
   845	{
   846		int ret;
   847		int mapcount;
   848		dev_t s_dev;
   849		struct inode *inode;
   850		struct vm_area_struct *vma;
   851		struct mm_struct *mm;
   852		unsigned long virtual_start = 0x0;
   853		unsigned long virtual_end = 0x0;
   854		struct address_space *mapping = data;
   855	
   856		mapcount = folio_mapcount(folio);
   857		if (mapcount && tsk && tsk->mm) {
   858			mm = tsk->mm;
   859			VMA_ITERATOR(vmi, mm, 0);
   860			mmap_read_lock(mm);
   861			for_each_vma(vmi, vma) {
 > 862				if (page_mapped_in_vma(&folio->page, vma)) {
 > 863					virtual_start = vma_address(&folio->page, vma);
   864					virtual_end = virtual_start + folio_nr_pages(folio) * PAGE_SIZE;
   865					break;
   866				}
   867			}
   868			mmap_read_unlock(mm);
   869		}
   870	
   871		inode = mapping->host;
   872		if (mapping->host->i_sb)
   873			s_dev = mapping->host->i_sb->s_dev;
   874		else
   875			s_dev = mapping->host->i_rdev;
   876		ret = scnprintf(kbuf, count, "FILE_PAGE dev %d:%d ino:%lu index:0x%lx mapcount:%d refcount:%d 0x%lx - 0x%lx\n",
   877			MAJOR(s_dev), MINOR(s_dev), inode->i_ino, folio->index, mapcount, folio_ref_count(folio),
   878			virtual_start, virtual_end);
   879	
   880		return ret;
   881	}
   882	#endif
   883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
