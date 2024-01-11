Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F7156C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV9GHInj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704971616; x=1736507616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIJZdXakKEgzzwoUOi9407r2/rdKUHENKgcXMCr4gtw=;
  b=LV9GHInjAT6FOTLo633wHs7FB8nloglhaFrVEt98FoeHC5iYwRnk5vhi
   lpu7aws2ukvIk6EHJMJY5vLLPSihOkSj2fLKVygeiyO5c0wTqbBbI30w8
   zrFIF9PmXtVZopBIKXVkBE/qUj2HhMpe8rA2gmakXuAzgYj9ePx7jbH2X
   nOoGK4WK6MSzhGpRplI/WjUznRVhDuHH4b3G+RkOBUfXslrERDt8UJTAv
   fByOmPWsr6ByO1mpO9WaatBEcUfuMkOtsdiI5iduVObviDSkZ9/3OpF/T
   ThAbeu06Dn61yBi7z7OUkw9x6d8jxa5A7iAzSawNnoclHWG47Pma8ow8G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5896981"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5896981"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 03:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="925968344"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="925968344"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2024 03:13:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNt07-0008Au-0y;
	Thu, 11 Jan 2024 11:13:31 +0000
Date: Thu, 11 Jan 2024 19:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2302/2336] mm/madvise.c:297:6: warning: no
 previous prototype for function 'force_swapin_vma'
Message-ID: <202401111947.IRuVFNsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cb3c3cb3ca9a0b06f501ef5e486aaf18220ac7a9
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [2302/2336] memcg: introduce per-memcg swapin interface
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240111/202401111947.IRuVFNsA-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111947.IRuVFNsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111947.IRuVFNsA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:297:6: warning: no previous prototype for function 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^
   mm/madvise.c:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         | ^
         | static 
   1 warning generated.


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
