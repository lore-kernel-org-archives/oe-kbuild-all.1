Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877195;
	b=chlxI7jZicrTZ85s3dtYZa1D92RGsWxwfKp9f2zwEFPacHS07UBbERC0L9bKrakbemhV
	 maFvVjh980Dui4Gqi3ZN2DBgM3FW4wSJcIcVWSYu7USuSWikACYNboz38Zqs89S/2YZeV
	 oCflwuN8j14m2j8OOpoYZ7Y0/rKgHZH63utWBXMH0/Mqf6y5XtZ/fRL/S+6aiuKKqs7oq
	 8jn/nZP0f3TvSmJHlCLOahkx6KNTjI2md5sKHASq/q0cRiromS/Hg4Gy4ligCHarOlEo+
	 b98YTedtoLhNql5wtKBLZIvCgC39bSf8RqO68cg2moMJaSuVhFvkAbfB1munUTIfV/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877195;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aGl46+N8Xnvpx+1HMouaXbxjBBivaLrxbTBn22e7f+w=;
	b=C3xRIIQnqgQFSDMMrP9YN4jFa4hwaWr5R6sjUPIgMsH3aW9hluv4CapsHqk68k3qH/sk
	 DfdI3FA5APsAV8LHasfi8vUskAGXkwdFXMCpQmjjJuq4oB2tV30QI3l5/hjNKHZ3NJVEl
	 auGK48if0lkLYyu/yGCHPp0jZ28kwn+1CbpFUMdR8XWzeeD3FOA3AXjYmExE2roqh+C2F
	 VWBQ079a4+5yggSx3O/BLFfvo/w7jeUk3b0egzt6rj28Xv2sWZY10/oOS9NLekfoFs0FA
	 znw5sYHEvyyAZAUgkYq3FnY+TQ4ZlGWjc58Ltaqh05N9hV3zpMWQRY4W3ybGCQ6Z/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQp6L9T9;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A488606D835
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 11:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A488606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQp6L9T9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793877194; x=1825413194;
  h=date:from:to:cc:subject:message-id;
  bh=E6zJrW8sFgjf72eqZySRjWNAz3vS5k/jT8WF3imo2Ok=;
  b=GQp6L9T9DP64RaywTtEGIJwwf2Q4lEwiQK8yE4dOweaRAz3szEd+WJzm
   HChD4a5aXPODs+k13BFARel5KcoC1ToLY7zKv2dr0lsyUbbEJxf50JAEF
   NLXH0UKBVsr8jWSVjYX/57zfcv9RVAtifA1tiitmHtm9jZLR7jE0jhlOe
   str9ZY7x5HgaeFSdrwa0xzshmOJns0+jqwLLSAQnaUmMot7CwjvmTcs94
   Ux7qDH1Dm491hWnHeKh9W9pGHtC+W0whxY8X4Si3obtMTlT6hPou18yAL
   jLLUboaOBs2iKe71gl9BU0ZJ+8YXyzxbEHBTaawrG+8C7QFdkQXJ6755a
   g==;
X-CSE-ConnectionGUID: /eP2wNiIQS6Wquhj7IZqkg==
X-CSE-MsgGUID: zqoNKXBZQ3iq3onwH/LClw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2568368"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2568368"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:13:14 -0800
X-CSE-ConnectionGUID: sPLg639KQyiL78e+YQvLsw==
X-CSE-MsgGUID: KC/jHfyRT16u0HXfmzUCaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7390150"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2026 03:13:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOvP4-000000009dn-0I69;
	Thu, 05 Nov 2026 11:13:10 +0000
Date: Thu, 05 Nov 2026 12:12:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6/6]
 drivers/android/binder_alloc.c:889:25: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202611051241.xcpNBwYr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2e8ed1192bdfba1592fdf7720e748e175448d8b0
commit: d30de4c7b0d22cc045a011428e778e40d762b5c0 [6/6] ANDROID: binder: fix KMI-break due to address type change
config: arm64-randconfig-r2309-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051241.xcpNBwYr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051241.xcpNBwYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051241.xcpNBwYr-lkp@intel.com/

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
