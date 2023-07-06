Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753691548B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688678988; x=1720214988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKkrO1g3OQ0mVB3u2lypD3U9+ddD96o0/zqvP7TQbkI=;
  b=CSsONpV2arIkLp6chayGRjuuvOPfQzIP2fOz62nvMSikhZYgQrrrQYdC
   UTYbFmGbqq+ocxICTuocCRSXmhKCxLqdkV13Z7IgP7lm9goplPGXeL6NY
   o90mkf/oJzDmpRMQds06gPLws4Z74cz+yoD+RGUn7BfMoYvk2SUMjmoWz
   j92W2OxsllXMo6bVbv8qhoHqnhksVGbAJL9oQn15PdtkVR3rCA87fkA6z
   /jfkrtDtVVTffqJ95lE4ziLT413uRKYQ1TvO+xeIT/vmkzIO3s0OQN/R5
   0BUl/ykb0cuqfPJBCgk/DAMhLXBy5iHdgIEEQhfhr240DVsVHUACrjx03
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="348524702"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="348524702"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 14:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="789709454"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="789709454"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2023 14:29:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHWXm-0001ZY-2E;
	Thu, 06 Jul 2023 21:29:42 +0000
Date: Fri, 7 Jul 2023 05:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 4606/7271] drivers/char/aml-gpiomem.c:128:29:
 error: implicit declaration of function 'phys_mem_access_prot'; did you mean
 'phys_mem_access_prot_allowed'?
Message-ID: <202307070524.dPTAZKu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   75d4aa9f650a9465ed7109062e98625502745688
commit: 7ff99842a2f49291177856844102f1aa00687214 [4606/7271] ODROID-N2/C4: char: Add /dev/gpiomem device
config: parisc-randconfig-r081-20230703 (https://download.01.org/0day-ci/archive/20230707/202307070524.dPTAZKu6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070524.dPTAZKu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070524.dPTAZKu6-lkp@intel.com/

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
