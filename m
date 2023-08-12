Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ECB370
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691837896; x=1723373896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/8VYDfygzC/52VFy9+ytTHq9T5/W2xZbV+sXpEqpr8=;
  b=DY4teSjpKvFEiRm/+P9L2xVjNSkLBVnYlmdY3xYFrvjDHddOKYj3eUaO
   DOOD2CI8A/Ccb//wbrIiXqgu6QLu3rKUu54UnuAx+CO8GU4yoqVfkVQuu
   fLSkV4Mc6b4wbSZLFz2tSkuP4UnKIwFL3iM4hk/vmOJdpx7ARN0GAQgXt
   LsF07wCfMBZIShuEu7jwfLvQ/dPXqBqyXaGS9aW9DOhWiHWfuZYmx8EUD
   VdrAFgX0Gqx2KRY/WWj0e+/LdUA5wR0fCXRpByWu1adD9tfWzvC3Mt+yE
   yxLsYlZon0InqdwEaSAvLyH2bq6LCUqfY8hKW3bzc3m81UiZ7wDztVSh6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370720432"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="370720432"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 03:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709799179"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="709799179"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Aug 2023 03:58:12 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUmJv-0008Wa-2J;
	Sat, 12 Aug 2023 10:58:11 +0000
Date: Sat, 12 Aug 2023 18:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Kai Huang <kai.huang@intel.com>
Subject: arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202308121812.AERo19Sw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8de32cc060ba3f63171aaa0e8764d22d8c37978
commit: 540745ddbc70eabdc7dbd3fcc00fe4fb17cd59ba x86/sgx: Introduce virtual EPC for use by KVM guests
date:   2 years, 4 months ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230812/202308121812.AERo19Sw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121812.AERo19Sw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121812.AERo19Sw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted vm_fault_t @@
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     expected int [assigned] ret
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     got restricted vm_fault_t
>> arch/x86/kernel/cpu/sgx/virt.c:60:20: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/x86/kernel/cpu/sgx/virt.c:95:35: sparse: sparse: symbol 'sgx_vepc_vm_ops' was not declared. Should it be static?

vim +59 arch/x86/kernel/cpu/sgx/virt.c

    32	
    33	static int __sgx_vepc_fault(struct sgx_vepc *vepc,
    34				    struct vm_area_struct *vma, unsigned long addr)
    35	{
    36		struct sgx_epc_page *epc_page;
    37		unsigned long index, pfn;
    38		int ret;
    39	
    40		WARN_ON(!mutex_is_locked(&vepc->lock));
    41	
    42		/* Calculate index of EPC page in virtual EPC's page_array */
    43		index = vma->vm_pgoff + PFN_DOWN(addr - vma->vm_start);
    44	
    45		epc_page = xa_load(&vepc->page_array, index);
    46		if (epc_page)
    47			return 0;
    48	
    49		epc_page = sgx_alloc_epc_page(vepc, false);
    50		if (IS_ERR(epc_page))
    51			return PTR_ERR(epc_page);
    52	
    53		ret = xa_err(xa_store(&vepc->page_array, index, epc_page, GFP_KERNEL));
    54		if (ret)
    55			goto err_free;
    56	
    57		pfn = PFN_DOWN(sgx_get_epc_phys_addr(epc_page));
    58	
  > 59		ret = vmf_insert_pfn(vma, addr, pfn);
  > 60		if (ret != VM_FAULT_NOPAGE) {
    61			ret = -EFAULT;
    62			goto err_delete;
    63		}
    64	
    65		return 0;
    66	
    67	err_delete:
    68		xa_erase(&vepc->page_array, index);
    69	err_free:
    70		sgx_free_epc_page(epc_page);
    71		return ret;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
