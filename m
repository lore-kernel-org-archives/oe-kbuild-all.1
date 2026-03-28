Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059F396B9B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774721451; cv=none; b=eqhDO3+GQoM/WRBLmPgi/Qhra6BlGqnCdzh+S/x7cdJW1P7gjwjZ0z3vBaGv8GEyeO/1i4TzmWh7K2XI0g5dFZB/Iv36Qj0yIROulJY0WGfxMn00ym0MVjcYPkVt2ItB1HGeenBsIrkah1+wDL6hFbWYBQ0PLdss9jLFbeJgpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774721451; c=relaxed/simple;
	bh=a1Q1Mx8UfVvcWGxRtcxIZV3cXBaMXCB2jyqAzIBHDno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLT9EL57A8UWlhmwGxj5s5U6lJJqLuxhIAR43sWbtys7orY++S/CXc7U0ASwPtN1hchs/yR/0v88dyu2hSdRKWcqtRiBScLa8EyasoadzideJiYSf74JF5PLzPfCopV5qvIF976MxTbpxDTBijqfnrnexLaH/hz2uYRPg9yOkP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkKpvPIr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkKpvPIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774721449; x=1806257449;
  h=date:from:to:cc:subject:message-id;
  bh=a1Q1Mx8UfVvcWGxRtcxIZV3cXBaMXCB2jyqAzIBHDno=;
  b=jkKpvPIrvyrskmYaWIGjqTzc38zek9DRFuv/i611sERFEAsOTyqUWLNA
   IhIvzFTuP0IWpXmvyGSneDizRvtIEotX4poTloaCE3SM6uR2AgOaET8pz
   UFLwjGJGkh7Wg/10IDdImicsUGLPMgS6xhmrXe8pA9N0phzR9NowjU0jz
   gmZtJASCZIxtmfBxt+GpKqISIIevp9vORIR81ULeuxGhAlY1VMink/Sz7
   QVkS5xxH1ClCgr9wCVF2UxVBEDFJ6vSMLE0h8H5Utg9zQXOB2M9KvDaHr
   8WBQo70l60kOyP+dEZiakOgROZREu0yEjHSBtwexm6ynjbab1AHBFGJIb
   A==;
X-CSE-ConnectionGUID: 5sVDJ6+1RaC1Zd3qrgjWPg==
X-CSE-MsgGUID: brFghkTeRgiyZFygyAVZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86459497"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86459497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 11:10:48 -0700
X-CSE-ConnectionGUID: dMfM5AMxSq2F7tYXHvMoPQ==
X-CSE-MsgGUID: 5l1042EoS5OKmhef9BK1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="227227329"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 11:10:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Y7Q-00000000BeX-2AnC;
	Sat, 28 Mar 2026 18:10:44 +0000
Date: Sun, 29 Mar 2026 02:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/2]
 drivers/android/binder_alloc.c:889:25: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202603290207.9AskSUqQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   1c08e57193aa5219b8fa24e666d79da02af3adab
commit: d30de4c7b0d22cc045a011428e778e40d762b5c0 [0/2] ANDROID: binder: fix KMI-break due to address type change
config: i386-randconfig-061-20260327 (https://download.01.org/0day-ci/archive/20260329/202603290207.9AskSUqQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290207.9AskSUqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290207.9AskSUqQ-lkp@intel.com/

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
