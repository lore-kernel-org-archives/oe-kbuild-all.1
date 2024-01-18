Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6631A94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 22:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705616383; cv=none; b=MWDmEwdDOg9CxuJlmQj1jil6TBKSVRa4P9WSrmF4kfV14Ek53VNWMPNeuSa3VDCMwe66YtMIuaNN7DrMC2aFLXvpVoV7EUSguggmQAxht7CeSuWg/i46ltNQC0vEy+M/5V6ZGvREkfJrkQdyIfWawJjGCVmZgIq5vdXErDtitGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705616383; c=relaxed/simple;
	bh=L0wo69bwUuKqWDOhJ7O+bOQ/3OKR1AzFmWwGR001hlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhsMtFk6bko/zYQIn+bwW92k+BZmGkVdau6gHnUz18i60pXmrJKRNxXGEwYKQBeMKLOqug5MrcC9AIdBwDECV7J65Rco/iHeKzswrJmNvfx6+YWkc8towXgrM1KS0xR2EuQfxDAcDjqZ4S0ofsvtWxemvJCp1ShCvvnGzvjv20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7OMv8/Q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7OMv8/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705616378; x=1737152378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0wo69bwUuKqWDOhJ7O+bOQ/3OKR1AzFmWwGR001hlo=;
  b=f7OMv8/QRooa6VQqe+4HnYKvvyw8jCCnCccEmmh8mzh8HHbEyEbqjy3M
   KfjAqhjMZqUU7TKrMGi4ZdH0/0EQvJAkByA1ajZnJ8kO+K3e0sfSsKcKW
   UgXxmP+7bg/VnURFbGx+S6ImNXlWw+1Ts844Vu2A8ZWHeJt7Mugj4VXpl
   IZ+aksg1ccfKBYsavNthrsA180033FumJRZVkCG/frD2peuB7gBhzONk/
   viw3EUsYTjWk/tQajl4U7+gmU3QxNF/3y0fKFs4Wx8ozC3nOd75MGzoW/
   kBfa3OgvSATm5jyXqgoDg2RGHw9tB2cLPqw28HFKzpvAP875LFEtipnXn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7992365"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7992365"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 14:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="875204464"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="875204464"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2024 14:19:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQajU-0003Nc-25;
	Thu, 18 Jan 2024 22:19:32 +0000
Date: Fri, 19 Jan 2024 06:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 32/33]
 drivers/android/binder_alloc.c:883:25: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202401190625.6EvaSCpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   d85e6cb67922e2ae0926f07dfcf79a975ef890ad
commit: 63f7ddea2e483bd4e475d03590c877d7d1837a71 [32/33] ANDROID: binder: fix KMI-break due to address type change
config: i386-randconfig-062-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190625.6EvaSCpr-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190625.6EvaSCpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190625.6EvaSCpr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder_alloc.c:883:25: sparse: sparse: Using plain integer as NULL pointer

vim +883 drivers/android/binder_alloc.c

0c972a05cde66e Todd Kjos     2017-06-29  808  
0c972a05cde66e Todd Kjos     2017-06-29  809  /**
0c972a05cde66e Todd Kjos     2017-06-29  810   * binder_alloc_mmap_handler() - map virtual address space for proc
0c972a05cde66e Todd Kjos     2017-06-29  811   * @alloc:	alloc structure for this proc
0c972a05cde66e Todd Kjos     2017-06-29  812   * @vma:	vma passed to mmap()
0c972a05cde66e Todd Kjos     2017-06-29  813   *
0c972a05cde66e Todd Kjos     2017-06-29  814   * Called by binder_mmap() to initialize the space specified in
0c972a05cde66e Todd Kjos     2017-06-29  815   * vma for allocating binder buffers
0c972a05cde66e Todd Kjos     2017-06-29  816   *
0c972a05cde66e Todd Kjos     2017-06-29  817   * Return:
0c972a05cde66e Todd Kjos     2017-06-29  818   *      0 = success
0c972a05cde66e Todd Kjos     2017-06-29  819   *      -EBUSY = address space already mapped
0c972a05cde66e Todd Kjos     2017-06-29  820   *      -ENOMEM = failed to map memory to given address space
0c972a05cde66e Todd Kjos     2017-06-29  821   */
0c972a05cde66e Todd Kjos     2017-06-29  822  int binder_alloc_mmap_handler(struct binder_alloc *alloc,
0c972a05cde66e Todd Kjos     2017-06-29  823  			      struct vm_area_struct *vma)
0c972a05cde66e Todd Kjos     2017-06-29  824  {
0c972a05cde66e Todd Kjos     2017-06-29  825  	struct binder_buffer *buffer;
af711934126ebb Carlos Llamas 2023-12-01  826  	const char *failure_string;
af711934126ebb Carlos Llamas 2023-12-01  827  	int ret, i;
0c972a05cde66e Todd Kjos     2017-06-29  828  
d276fb4a7eb8be Carlos Llamas 2022-11-04  829  	if (unlikely(vma->vm_mm != alloc->vma_vm_mm)) {
d276fb4a7eb8be Carlos Llamas 2022-11-04  830  		ret = -EINVAL;
d276fb4a7eb8be Carlos Llamas 2022-11-04  831  		failure_string = "invalid vma->vm_mm";
d276fb4a7eb8be Carlos Llamas 2022-11-04  832  		goto err_invalid_mm;
d276fb4a7eb8be Carlos Llamas 2022-11-04  833  	}
d276fb4a7eb8be Carlos Llamas 2022-11-04  834  
0c972a05cde66e Todd Kjos     2017-06-29  835  	mutex_lock(&binder_alloc_mmap_lock);
a7a74d7ff55a0c Jann Horn     2019-10-18  836  	if (alloc->buffer_size) {
0c972a05cde66e Todd Kjos     2017-06-29  837  		ret = -EBUSY;
0c972a05cde66e Todd Kjos     2017-06-29  838  		failure_string = "already mapped";
0c972a05cde66e Todd Kjos     2017-06-29  839  		goto err_already_mapped;
0c972a05cde66e Todd Kjos     2017-06-29  840  	}
a7a74d7ff55a0c Jann Horn     2019-10-18  841  	alloc->buffer_size = min_t(unsigned long, vma->vm_end - vma->vm_start,
a7a74d7ff55a0c Jann Horn     2019-10-18  842  				   SZ_4M);
a7a74d7ff55a0c Jann Horn     2019-10-18  843  	mutex_unlock(&binder_alloc_mmap_lock);
0c972a05cde66e Todd Kjos     2017-06-29  844  
63f7ddea2e483b Carlos Llamas 2023-12-05  845  	alloc->buffer = (void __user *)vma->vm_start;
0c972a05cde66e Todd Kjos     2017-06-29  846  
45d02f79b53907 Jann Horn     2019-10-16  847  	alloc->pages = kcalloc(alloc->buffer_size / PAGE_SIZE,
6396bb221514d2 Kees Cook     2018-06-12  848  			       sizeof(alloc->pages[0]),
0c972a05cde66e Todd Kjos     2017-06-29  849  			       GFP_KERNEL);
0c972a05cde66e Todd Kjos     2017-06-29  850  	if (alloc->pages == NULL) {
0c972a05cde66e Todd Kjos     2017-06-29  851  		ret = -ENOMEM;
0c972a05cde66e Todd Kjos     2017-06-29  852  		failure_string = "alloc page array";
0c972a05cde66e Todd Kjos     2017-06-29  853  		goto err_alloc_pages_failed;
0c972a05cde66e Todd Kjos     2017-06-29  854  	}
0c972a05cde66e Todd Kjos     2017-06-29  855  
af711934126ebb Carlos Llamas 2023-12-01  856  	for (i = 0; i < alloc->buffer_size / PAGE_SIZE; i++) {
af711934126ebb Carlos Llamas 2023-12-01  857  		alloc->pages[i].alloc = alloc;
af711934126ebb Carlos Llamas 2023-12-01  858  		INIT_LIST_HEAD(&alloc->pages[i].lru);
af711934126ebb Carlos Llamas 2023-12-01  859  	}
af711934126ebb Carlos Llamas 2023-12-01  860  
74310e06be4d74 Sherry Yang   2017-08-23  861  	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
74310e06be4d74 Sherry Yang   2017-08-23  862  	if (!buffer) {
0c972a05cde66e Todd Kjos     2017-06-29  863  		ret = -ENOMEM;
74310e06be4d74 Sherry Yang   2017-08-23  864  		failure_string = "alloc buffer struct";
74310e06be4d74 Sherry Yang   2017-08-23  865  		goto err_alloc_buf_struct_failed;
0c972a05cde66e Todd Kjos     2017-06-29  866  	}
74310e06be4d74 Sherry Yang   2017-08-23  867  
bde4a19fc04f5f Todd Kjos     2019-02-08  868  	buffer->user_data = alloc->buffer;
0c972a05cde66e Todd Kjos     2017-06-29  869  	list_add(&buffer->entry, &alloc->buffers);
0c972a05cde66e Todd Kjos     2017-06-29  870  	buffer->free = 1;
0c972a05cde66e Todd Kjos     2017-06-29  871  	binder_insert_free_buffer(alloc, buffer);
0c972a05cde66e Todd Kjos     2017-06-29  872  	alloc->free_async_space = alloc->buffer_size / 2;
b094b047791717 Carlos Llamas 2023-05-30  873  
b094b047791717 Carlos Llamas 2023-05-30  874  	/* Signal binder_alloc is fully initialized */
da1b9564e85b1d Minchan Kim   2018-08-23  875  	binder_alloc_set_vma(alloc, vma);
0c972a05cde66e Todd Kjos     2017-06-29  876  
0c972a05cde66e Todd Kjos     2017-06-29  877  	return 0;
0c972a05cde66e Todd Kjos     2017-06-29  878  
74310e06be4d74 Sherry Yang   2017-08-23  879  err_alloc_buf_struct_failed:
0c972a05cde66e Todd Kjos     2017-06-29  880  	kfree(alloc->pages);
0c972a05cde66e Todd Kjos     2017-06-29  881  	alloc->pages = NULL;
0c972a05cde66e Todd Kjos     2017-06-29  882  err_alloc_pages_failed:
c38a89805ff5b8 Carlos Llamas 2023-12-01 @883  	alloc->buffer = 0;
a7a74d7ff55a0c Jann Horn     2019-10-18  884  	mutex_lock(&binder_alloc_mmap_lock);
a7a74d7ff55a0c Jann Horn     2019-10-18  885  	alloc->buffer_size = 0;
0c972a05cde66e Todd Kjos     2017-06-29  886  err_already_mapped:
0c972a05cde66e Todd Kjos     2017-06-29  887  	mutex_unlock(&binder_alloc_mmap_lock);
d276fb4a7eb8be Carlos Llamas 2022-11-04  888  err_invalid_mm:
128f3804103500 Sherry Yang   2018-08-07  889  	binder_alloc_debug(BINDER_DEBUG_USER_ERROR,
128f3804103500 Sherry Yang   2018-08-07  890  			   "%s: %d %lx-%lx %s failed %d\n", __func__,
128f3804103500 Sherry Yang   2018-08-07  891  			   alloc->pid, vma->vm_start, vma->vm_end,
128f3804103500 Sherry Yang   2018-08-07  892  			   failure_string, ret);
0c972a05cde66e Todd Kjos     2017-06-29  893  	return ret;
0c972a05cde66e Todd Kjos     2017-06-29  894  }
0c972a05cde66e Todd Kjos     2017-06-29  895  

:::::: The code at line 883 was first introduced by commit
:::::: c38a89805ff5b8e40d61d1f581c2b784ab04df87 FROMGIT: binder: keep vma addresses type as unsigned long

:::::: TO: Carlos Llamas <cmllamas@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
