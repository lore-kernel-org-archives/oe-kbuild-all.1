Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B474E11
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 22:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714514881; cv=none; b=itXA4N0S5abTeuiFEqJfpwtOrzfdJtR7mEg4q6W9tEJxuNMs/TNNEaSM00Zcs84YSora0SGMSHAzWwdluUjNTMaT0sKS+eWQrq23R9Dp3+4TkINwT8Vn/8zt09hkxA65gKAIhtmJOx5BA4DSfdzMmsDkw8gH9yyahfRqV9xiyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714514881; c=relaxed/simple;
	bh=lfC4EyzWGIl3WNnkJgg2cM7BfLT75qBuUdiGZ7iSwNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VtURFSrNBBquhHB5EduiZ4RIs/ZtZLE+nhXoNabHnDOl6v5rRCaqC2Vz8HMGVJu/kmkZ1UDaD1//7xLp304ZolvZ+WOoL8hWrXG2KO3rqmjupc2HsdmXhlAmLVKzeSLMnm0fYxXbhVA/QuGY22feqwnr3zZifeMR0f9QWujPLkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAoEnmI6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAoEnmI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714514879; x=1746050879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfC4EyzWGIl3WNnkJgg2cM7BfLT75qBuUdiGZ7iSwNI=;
  b=OAoEnmI6I3q/aNaNoCZeF6SmJpV2cxR6DxP3XhUXJ7OAzhMDp3zAo26v
   L0DlGBHGtDkIMYxOKuZ9CLtNKHLn+IbI7BI2nEg4rZ36yLv5JgTrM59+t
   GJP0tPMqEEAT2wa5rcM8omk/AaTAJWqpR+sXOjLKHP/WAIgFAHCMwd3NX
   /hiZXHJ3wF9HLogYW6OpfNjTKwc0M0/lOW1octo2DOVuRI6sF+ouz+25d
   LTMuxifCh/TeDT5yhHjxHXvQMLC7kIVsxdMW1zwVkm9cUZkgajWyuDobO
   i8F+qdJi8cSnbxlawnthDmVeGG0sSmmu7PDA7tTxDGOqjxgr08EDXKYud
   w==;
X-CSE-ConnectionGUID: HCET0vcsTmiIU/IVi1CTVg==
X-CSE-MsgGUID: vEhPxbd6Sjuj8EdtY6VsYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="27766900"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="27766900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 15:07:59 -0700
X-CSE-ConnectionGUID: HPj/rxBHSJeat6kTAtjZtw==
X-CSE-MsgGUID: oD6wZE71Sd2JDa84Y8Py6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="26692705"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2024 15:07:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1vdj-0008eJ-1t;
	Tue, 30 Apr 2024 22:07:55 +0000
Date: Wed, 1 May 2024 06:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 4/17] arch/powerpc/include/asm/pci.h:49:42:
 warning: 'struct dma_map_ops' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202405010646.QOq02Gut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: c9054c6f609d4d89977171559cd16e48e5fdb8b8 [4/17] dma-mapping: check if IOVA can be used
config: powerpc-mpc837x_rdb_defconfig (https://download.01.org/0day-ci/archive/20240501/202405010646.QOq02Gut-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010646.QOq02Gut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010646.QOq02Gut-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:2106,
                    from include/linux/dma-map-ops.h:12,
                    from kernel/dma/mapping.c:11:
>> arch/powerpc/include/asm/pci.h:49:42: warning: 'struct dma_map_ops' declared inside parameter list will not be visible outside of this definition or declaration
      49 | void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
         |                                          ^~~~~~~~~~~
   kernel/dma/mapping.c: In function 'dma_get_memory_type':
   kernel/dma/mapping.c:877:13: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
     877 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
         |             ^~~~~~~~~~~~~~~
   kernel/dma/mapping.c:877:29: error: 'CC_ATTR_MEM_ENCRYPT' undeclared (first use in this function)
     877 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
         |                             ^~~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:877:29: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pci.h:2106,
                    from include/linux/dma-map-ops.h:12,
                    from kernel/dma/direct.c:10:
>> arch/powerpc/include/asm/pci.h:49:42: warning: 'struct dma_map_ops' declared inside parameter list will not be visible outside of this definition or declaration
      49 | void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
         |                                          ^~~~~~~~~~~


vim +49 arch/powerpc/include/asm/pci.h

^1da177e4c3f41 include/asm-ppc64/pci.h        Linus Torvalds 2005-04-16  47  
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  48  #ifdef CONFIG_PCI
d276960d9296b6 arch/powerpc/include/asm/pci.h Nick Child     2021-12-16 @49  void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  50  #else	/* CONFIG_PCI */
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  51  #define set_pci_dma_ops(d)
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  52  #endif
4fc665b88a79a4 arch/powerpc/include/asm/pci.h Becky Bruce    2008-09-12  53  

:::::: The code at line 49 was first introduced by commit
:::::: d276960d9296b6a9074795fe60a513abf8474e35 powerpc/kernel: Add __init attribute to eligible functions

:::::: TO: Nick Child <nick.child@ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
