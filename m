Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3A41632FC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733056813; cv=none; b=M3HUX+07iOoquY2CJJPOThvfO/2so6u6UoMhN6pYX7OlVcifJK7UebIgiuLZVt0JGWgPxkPqNtV14hfGPDcjse/veE/+cidvNKWKtYuz3px2Dxxvl8HWHGID/OZi/5zM8c+R7QwPiTblZt25DpRW+3+Tmq97/np1t5zkSlRVeTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733056813; c=relaxed/simple;
	bh=TGaMYmNkwZM3Ug2ppeGJc2Fw+Inq/K/QuGhoNyzuBZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXC/CQMDMU/IDqDr/gZulIcN+iC0DOqmBiufe1zcB9fex2MVX56rzkTJfvyBhZJUGVhFfqov7QmyjzaskdvURHcQGd6Hfo9D0kC+VNjtHNH8pPWRnAcejJe+6XkteKARET9gFIcPD22vG2mLUFPdiRii4wFaKf0vhjiAc/POKZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VT31iOfD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VT31iOfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733056811; x=1764592811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGaMYmNkwZM3Ug2ppeGJc2Fw+Inq/K/QuGhoNyzuBZ4=;
  b=VT31iOfDLPbohkWHL6MZ/Lf6oiAUVEdQ2K2mDfuanCt36koCtr1fv8v+
   MDJaIrCl22/A40/vc49l4msbGsQBvXeLPM+2T8x047CFMktUWIzfXDBik
   Yw3SXqDeDcMx8u7YMD2+EM/hEzWctdJ+Z6fRL8vHrLLJGZzaT1bdKL+95
   dpKX+nrwPIhpGvHJzrpbuH/B8zPRhOYJziLzRllhdx5iyIxGUlqhx5XSk
   KB25/kPNtWxauOQBCJ8m2jLWc2jOPeulXWYQ886dOuL66st4+wRMQcPry
   vOzW6n5qXMvQsw727OTBW6Ofs6J/hY/ZsQ5wJm7coeNR9CG8mIt25hD2G
   g==;
X-CSE-ConnectionGUID: WI9J+lX2SQmmQeCFmh8pyA==
X-CSE-MsgGUID: tJWLNz0USNmQmkvopOJRvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43835441"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="43835441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 04:40:10 -0800
X-CSE-ConnectionGUID: MFNzzhOuSQCa2FD9+/WeRA==
X-CSE-MsgGUID: xYEmuIdQTm2nqQwF51siFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92677623"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2024 04:40:09 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHjF9-0001Wr-0e;
	Sun, 01 Dec 2024 12:40:07 +0000
Date: Sun, 1 Dec 2024 20:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 27/29]
 drivers/android/binder_alloc.c:889:25: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202412012002.4tlnrxWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a887a44ace2a27d86308356a7ea0db00d79f2c44
commit: d30de4c7b0d22cc045a011428e778e40d762b5c0 [27/29] ANDROID: binder: fix KMI-break due to address type change
config: i386-randconfig-062-20241201 (https://download.01.org/0day-ci/archive/20241201/202412012002.4tlnrxWn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012002.4tlnrxWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012002.4tlnrxWn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder_alloc.c:889:25: sparse: sparse: Using plain integer as NULL pointer

vim +889 drivers/android/binder_alloc.c

0c972a05cde66e Todd Kjos     2017-06-29  814  
0c972a05cde66e Todd Kjos     2017-06-29  815  /**
0c972a05cde66e Todd Kjos     2017-06-29  816   * binder_alloc_mmap_handler() - map virtual address space for proc
0c972a05cde66e Todd Kjos     2017-06-29  817   * @alloc:	alloc structure for this proc
0c972a05cde66e Todd Kjos     2017-06-29  818   * @vma:	vma passed to mmap()
0c972a05cde66e Todd Kjos     2017-06-29  819   *
0c972a05cde66e Todd Kjos     2017-06-29  820   * Called by binder_mmap() to initialize the space specified in
0c972a05cde66e Todd Kjos     2017-06-29  821   * vma for allocating binder buffers
0c972a05cde66e Todd Kjos     2017-06-29  822   *
0c972a05cde66e Todd Kjos     2017-06-29  823   * Return:
0c972a05cde66e Todd Kjos     2017-06-29  824   *      0 = success
0c972a05cde66e Todd Kjos     2017-06-29  825   *      -EBUSY = address space already mapped
0c972a05cde66e Todd Kjos     2017-06-29  826   *      -ENOMEM = failed to map memory to given address space
0c972a05cde66e Todd Kjos     2017-06-29  827   */
0c972a05cde66e Todd Kjos     2017-06-29  828  int binder_alloc_mmap_handler(struct binder_alloc *alloc,
0c972a05cde66e Todd Kjos     2017-06-29  829  			      struct vm_area_struct *vma)
0c972a05cde66e Todd Kjos     2017-06-29  830  {
0c972a05cde66e Todd Kjos     2017-06-29  831  	struct binder_buffer *buffer;
2b6af2f338be89 Carlos Llamas 2023-12-01  832  	const char *failure_string;
2b6af2f338be89 Carlos Llamas 2023-12-01  833  	int ret, i;
0c972a05cde66e Todd Kjos     2017-06-29  834  
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  835  	if (unlikely(vma->vm_mm != alloc->mm)) {
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  836  		ret = -EINVAL;
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  837  		failure_string = "invalid vma->vm_mm";
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  838  		goto err_invalid_mm;
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  839  	}
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  840  
0c972a05cde66e Todd Kjos     2017-06-29  841  	mutex_lock(&binder_alloc_mmap_lock);
a7a74d7ff55a0c Jann Horn     2019-10-18  842  	if (alloc->buffer_size) {
0c972a05cde66e Todd Kjos     2017-06-29  843  		ret = -EBUSY;
0c972a05cde66e Todd Kjos     2017-06-29  844  		failure_string = "already mapped";
0c972a05cde66e Todd Kjos     2017-06-29  845  		goto err_already_mapped;
0c972a05cde66e Todd Kjos     2017-06-29  846  	}
a7a74d7ff55a0c Jann Horn     2019-10-18  847  	alloc->buffer_size = min_t(unsigned long, vma->vm_end - vma->vm_start,
a7a74d7ff55a0c Jann Horn     2019-10-18  848  				   SZ_4M);
a7a74d7ff55a0c Jann Horn     2019-10-18  849  	mutex_unlock(&binder_alloc_mmap_lock);
0c972a05cde66e Todd Kjos     2017-06-29  850  
d30de4c7b0d22c Carlos Llamas 2023-12-05  851  	alloc->buffer = (void __user *)vma->vm_start;
0c972a05cde66e Todd Kjos     2017-06-29  852  
45d02f79b53907 Jann Horn     2019-10-16  853  	alloc->pages = kcalloc(alloc->buffer_size / PAGE_SIZE,
6396bb221514d2 Kees Cook     2018-06-12  854  			       sizeof(alloc->pages[0]),
0c972a05cde66e Todd Kjos     2017-06-29  855  			       GFP_KERNEL);
0c972a05cde66e Todd Kjos     2017-06-29  856  	if (alloc->pages == NULL) {
0c972a05cde66e Todd Kjos     2017-06-29  857  		ret = -ENOMEM;
0c972a05cde66e Todd Kjos     2017-06-29  858  		failure_string = "alloc page array";
0c972a05cde66e Todd Kjos     2017-06-29  859  		goto err_alloc_pages_failed;
0c972a05cde66e Todd Kjos     2017-06-29  860  	}
0c972a05cde66e Todd Kjos     2017-06-29  861  
2b6af2f338be89 Carlos Llamas 2023-12-01  862  	for (i = 0; i < alloc->buffer_size / PAGE_SIZE; i++) {
2b6af2f338be89 Carlos Llamas 2023-12-01  863  		alloc->pages[i].alloc = alloc;
2b6af2f338be89 Carlos Llamas 2023-12-01  864  		INIT_LIST_HEAD(&alloc->pages[i].lru);
2b6af2f338be89 Carlos Llamas 2023-12-01  865  	}
2b6af2f338be89 Carlos Llamas 2023-12-01  866  
74310e06be4d74 Sherry Yang   2017-08-23  867  	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
74310e06be4d74 Sherry Yang   2017-08-23  868  	if (!buffer) {
0c972a05cde66e Todd Kjos     2017-06-29  869  		ret = -ENOMEM;
74310e06be4d74 Sherry Yang   2017-08-23  870  		failure_string = "alloc buffer struct";
74310e06be4d74 Sherry Yang   2017-08-23  871  		goto err_alloc_buf_struct_failed;
0c972a05cde66e Todd Kjos     2017-06-29  872  	}
74310e06be4d74 Sherry Yang   2017-08-23  873  
bde4a19fc04f5f Todd Kjos     2019-02-08  874  	buffer->user_data = alloc->buffer;
0c972a05cde66e Todd Kjos     2017-06-29  875  	list_add(&buffer->entry, &alloc->buffers);
0c972a05cde66e Todd Kjos     2017-06-29  876  	buffer->free = 1;
0c972a05cde66e Todd Kjos     2017-06-29  877  	binder_insert_free_buffer(alloc, buffer);
0c972a05cde66e Todd Kjos     2017-06-29  878  	alloc->free_async_space = alloc->buffer_size / 2;
62c6dbdccda090 Carlos Llamas 2023-05-02  879  
62c6dbdccda090 Carlos Llamas 2023-05-02  880  	/* Signal binder_alloc is fully initialized */
62c6dbdccda090 Carlos Llamas 2023-05-02  881  	binder_alloc_set_vma(alloc, vma);
0c972a05cde66e Todd Kjos     2017-06-29  882  
0c972a05cde66e Todd Kjos     2017-06-29  883  	return 0;
0c972a05cde66e Todd Kjos     2017-06-29  884  
74310e06be4d74 Sherry Yang   2017-08-23  885  err_alloc_buf_struct_failed:
0c972a05cde66e Todd Kjos     2017-06-29  886  	kfree(alloc->pages);
0c972a05cde66e Todd Kjos     2017-06-29  887  	alloc->pages = NULL;
0c972a05cde66e Todd Kjos     2017-06-29  888  err_alloc_pages_failed:
b66dacff3db812 Carlos Llamas 2023-12-01 @889  	alloc->buffer = 0;
a7a74d7ff55a0c Jann Horn     2019-10-18  890  	mutex_lock(&binder_alloc_mmap_lock);
a7a74d7ff55a0c Jann Horn     2019-10-18  891  	alloc->buffer_size = 0;
0c972a05cde66e Todd Kjos     2017-06-29  892  err_already_mapped:
0c972a05cde66e Todd Kjos     2017-06-29  893  	mutex_unlock(&binder_alloc_mmap_lock);
3ce00bb7e91cf5 Carlos Llamas 2022-11-04  894  err_invalid_mm:
128f3804103500 Sherry Yang   2018-08-07  895  	binder_alloc_debug(BINDER_DEBUG_USER_ERROR,
128f3804103500 Sherry Yang   2018-08-07  896  			   "%s: %d %lx-%lx %s failed %d\n", __func__,
128f3804103500 Sherry Yang   2018-08-07  897  			   alloc->pid, vma->vm_start, vma->vm_end,
128f3804103500 Sherry Yang   2018-08-07  898  			   failure_string, ret);
0c972a05cde66e Todd Kjos     2017-06-29  899  	return ret;
0c972a05cde66e Todd Kjos     2017-06-29  900  }
0c972a05cde66e Todd Kjos     2017-06-29  901  

:::::: The code at line 889 was first introduced by commit
:::::: b66dacff3db81260bda82f588fe00f31fb605051 UPSTREAM: binder: keep vma addresses type as unsigned long

:::::: TO: Carlos Llamas <cmllamas@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
