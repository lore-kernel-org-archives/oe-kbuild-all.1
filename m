Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEFBA23
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680812712; x=1712348712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOshTE0/ByIBiaswK1t62gO9RDhd2UlJjcj0SsZvVrw=;
  b=mbNPYVYgbN0PR6U1Vue/hjTLTUI8v6UUAoIntWhgcvkHCNkPkhDWsKKe
   clujbTB6jAw2WK1lXK3SH6KX2kGMc4o4DK8MWRFdzCh/w+dCArB68S6Zy
   gKjMt3fGcyGB3ishGz7n6MtjBqZmL/YSLe/vVvDio3yvCWtUmjK/xI6SP
   Qi0F8aR31PUGaD3k4SM0xUErNZj9EYwbSDZ7ag1QOm9dIevMOG/udXtTn
   iQrw+lIcnoCqlrFhhaipkKdX5653nw4m/0QgdWcyquexyvW7yJUQIqMId
   Ro96idQDfHtgH/fKMaSUEfSzf5TGRa/QdGP/+3iDOYAFbMPI0UZ3+1Sr8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331473967"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="331473967"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="811132537"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="811132537"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2023 13:25:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWAP-000Rjm-32;
	Thu, 06 Apr 2023 20:25:09 +0000
Date: Fri, 7 Apr 2023 04:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 89/90] drivers/char/aml-gpiomem.c:128:29:
 error: implicit declaration of function 'phys_mem_access_prot'; did you mean
 'phys_mem_access_prot_allowed'?
Message-ID: <202304070439.wuTy4SMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   3a163dc2f239e1dbfed4cdb9ee515ef542684d1f
commit: 3dff2db83a0cbaa4ba7b9862f13391363e3c3d60 [89/90] ODROID-N2/C4: char: Add /dev/gpiomem device
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230407/202304070439.wuTy4SMv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/tobetter/linux/commit/3dff2db83a0cbaa4ba7b9862f13391363e3c3d60
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.1.y
        git checkout 3dff2db83a0cbaa4ba7b9862f13391363e3c3d60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070439.wuTy4SMv-lkp@intel.com/

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
https://github.com/intel/lkp-tests
