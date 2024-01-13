Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26B7470
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 23:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrbwSwES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705189076; x=1736725076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXzOokhxYKM4L4sgDwKspDooEYPWkOhQ+PlMwSjBCUA=;
  b=mrbwSwESwfZJ93y3eIfoULPqj0iVhKZr2p+CiyRTs01n802G/ZRWahvM
   cZfgGnloK3MPs6MHWyq6vjpNfzfMNIX0wZDPqOjW0oCLT/FB6JvIgWVes
   +CMA1JpTdIyvXe0jLSRN7bNfASLmWAAkx2p5xT+7wlLMfDpavQ8Vtk44m
   +l9hnkGwugnTMtx4f5OAHfLqT8l3NS8iFXHJJvc0VXiKF/7EPEJUyUvq3
   VMdVrarPhx1ub2oU3AZeruBiQ9fYnXjsco+8C1KQRc4VaWIoHQsszJ/SB
   s+/eMsNBlkMUXy11sw2YmV4/AbvWSYpoRkt8v6/sMSsOyNltrwe2eXxp4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="18019101"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="18019101"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 15:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="786728771"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="786728771"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2024 15:37:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOnZX-000B08-1Q;
	Sat, 13 Jan 2024 23:37:51 +0000
Date: Sun, 14 Jan 2024 07:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 4606/12555]
 drivers/char/aml-gpiomem.c:128:29: error: implicit declaration of function
 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'?
Message-ID: <202401140742.scrhGu7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   b0ba08f75cf1fc43c19f57ea6930f3358bd2e196
commit: 7ff99842a2f49291177856844102f1aa00687214 [4606/12555] ODROID-N2/C4: char: Add /dev/gpiomem device
config: arc-randconfig-001-20240114 (https://download.01.org/0day-ci/archive/20240114/202401140742.scrhGu7v-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140742.scrhGu7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140742.scrhGu7v-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/aml-gpiomem.c: In function 'aml_gpiomem_mmap':
>> drivers/char/aml-gpiomem.c:128:29: error: implicit declaration of function 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'? [-Werror=implicit-function-declaration]
     128 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             phys_mem_access_prot_allowed
>> drivers/char/aml-gpiomem.c:128:29: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   cc1: some warnings being treated as errors


vim +128 drivers/char/aml-gpiomem.c

   111	
   112	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   113	{
   114		int gpio_area = 0;
   115		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   116		unsigned long end   = start + vma->vm_end - vma->vm_start;
   117	
   118		while (gpio_area < inst->gpio_area_count) {
   119			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   120			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   121				goto found;
   122			gpio_area++;
   123		}
   124	
   125		return -EACCES;
   126	
   127	found:
 > 128		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   129				vma->vm_end - vma->vm_start,
   130				vma->vm_page_prot);
   131	
   132		vma->vm_ops = &aml_gpiomem_vm_ops;
   133	
   134		if (remap_pfn_range(vma, vma->vm_start,
   135					vma->vm_pgoff,
   136					vma->vm_end - vma->vm_start,
   137					vma->vm_page_prot)) {
   138			return -EAGAIN;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
