Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587628E8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709479; cv=none; b=dhZRSdXGMKc+AgbiFm3CsVhpD7GksptzL0yFPkwpaVv/6ghrH7iadDiOxb34ZQfvQSfvTOLrnwuGDJgWJ3w4lQuT5pQJ7oVPxpM/iq4q+opVm7Dg1vv6VsyAXbY2ukRccgEc5opmq1I3kOw1zEHBpMt4v414rFWctbxns40Uj1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709479; c=relaxed/simple;
	bh=w4DGhSfKWrtMXZ2crNGojhL/9GIkUfPK2+LHeejjjRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xhe4DlappQbXcJApPni8TCYsjOS2YkKvzF4m1yBsjYHX4kUwj1XytrOp3RFrEKycV/WNDi/TuFjdyvhnXW1CH0ohuhJDvWJE0Fi6BYwjFTs4GV7bSoPAD0Mkit4B5V+U+xlXfzJQ9+vr4hb3wK05u0b6RkL7FF491vit813ggRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+ieclCQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+ieclCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725709478; x=1757245478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w4DGhSfKWrtMXZ2crNGojhL/9GIkUfPK2+LHeejjjRI=;
  b=E+ieclCQ/83CsltByvlQKxid9YXi941FNzcKiVLMNe1GnEDpoBg2SNiF
   CXfxEztI935CwtxpwikHFiet6w3E0Rv/mUGb+hPuau929C4jH1JIDJ9MR
   ZJPrWpXAxqXNKjsPjImMT9cNmyLcHgSAyTuoyEKS8mGYJNFSRgXD8hcgI
   7dgjVQlP642ceFuXEMGvAg7H7iKhQRfTof2eeOICXOGG1ky8FkfsroPYD
   7XwNgn77y234Grvf/cTWY0WWMReX68bokCnZufXgNoNdd35zguA4zZqwh
   j/A0JvMZR/g0B3Z9UE+PUjsVNsy3bO7DYn1R4ja+n2KaeC1ELWDkrDkWZ
   A==;
X-CSE-ConnectionGUID: 7VjrDfaTTMGf/wuwDXLTkA==
X-CSE-MsgGUID: UKqrkItpT0qCaCXMnZ4+eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28201940"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="28201940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:44:38 -0700
X-CSE-ConnectionGUID: VkxI99GhTkyvhSIlR+ylSw==
X-CSE-MsgGUID: 8fS9AG1wTCi2bKOYLEHMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="103660942"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2024 04:44:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smtrl-000CWN-2m;
	Sat, 07 Sep 2024 11:44:33 +0000
Date: Sat, 7 Sep 2024 19:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.10.y 37/56] drivers/char/aml-gpiomem.c:129:22:
 error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202409071903.4J693UH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.10.y
head:   d464381853b77cfca0cc9bdd19b3edf4bac8f0c0
commit: 5c70fa7bdce06ef372ba87e68f1c1b8bb2174d76 [37/56] ODROID-N2/C4: char: Add /dev/gpiomem device
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409071903.4J693UH3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071903.4J693UH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071903.4J693UH3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/aml-gpiomem.c:51:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/aml-gpiomem.c:129:22: error: call to undeclared function 'phys_mem_access_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^
>> drivers/char/aml-gpiomem.c:129:20: error: assigning to 'pgprot_t' from incompatible type 'int'
     129 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     130 |                         vma->vm_end - vma->vm_start,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     131 |                         vma->vm_page_prot);
         |                         ~~~~~~~~~~~~~~~~~~
   5 warnings and 2 errors generated.


vim +/phys_mem_access_prot +129 drivers/char/aml-gpiomem.c

   112	
   113	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   114	{
   115		int gpio_area = 0;
   116		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   117		unsigned long end   = start + vma->vm_end - vma->vm_start;
   118	
   119		while (gpio_area < inst->gpio_area_count) {
   120			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   121			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   122				goto found;
   123			gpio_area++;
   124		}
   125	
   126		return -EACCES;
   127	
   128	found:
 > 129		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   130				vma->vm_end - vma->vm_start,
   131				vma->vm_page_prot);
   132	
   133		vma->vm_ops = &aml_gpiomem_vm_ops;
   134	
   135		if (remap_pfn_range(vma, vma->vm_start,
   136					vma->vm_pgoff,
   137					vma->vm_end - vma->vm_start,
   138					vma->vm_page_prot)) {
   139			return -EAGAIN;
   140		}
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
