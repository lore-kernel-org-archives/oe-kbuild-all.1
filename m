Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586B222FE0E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777804822; cv=none; b=BKot8MOZwDxqvXYSOu/DjPAHHVxg1cNOQdR1MMmbIPmbw4vIOsPJXkdXpLlGYQCpeb6fHKjpaR+ugk1eel3sGJERENzBLvECBC6JTbQqNIAG0C3Yp59uoYeAVMKUphDEGV/XFxmhYCgYhS0blbfvhkzXJp8UV4m3l4Dp/sGiZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777804822; c=relaxed/simple;
	bh=xEKw+aRFkzWMBacJyDMo1HN0rHUaCqLRt9sK5e6Cbpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E1rsQ4Y7VZ0B3YNm4snocU4ytxzAAu4RTfMtB7g925W+h1JSUQ6RQSfUeknxGjOBiAixt/NYcdisQlhT4gUz5eS4Td+gs94w4ra3En87RQSNFh+9GFnf0Z9SE0jRp5TNpfB4YCq2L1OodEzfrlTW90g8b7hqkoq063Q1Dv3DCJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgHWvoDG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgHWvoDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777804819; x=1809340819;
  h=date:from:to:cc:subject:message-id;
  bh=xEKw+aRFkzWMBacJyDMo1HN0rHUaCqLRt9sK5e6Cbpo=;
  b=kgHWvoDGJmQWkczmicl5Zt6Hw/mRHjVsw4AHWyteNq4tltR6IswOYT42
   C/pzdgjH0ylEV+5mDqkBu7Bc52ifzuCjf3atkjq2QsqAhtACa5MdF0Sot
   UgizXE/FblcfUfmsJ8e5lec04jIn2JpTqh8yzSjqlJTbJSvrq4CJFFfU4
   6uvtGKNJSwcmcsSMEJgE/Bk18BGgSZH5EVh32ITzTE+F73koPoES5hRpB
   DW0K2HjzbwOwMTcAZ3bIR8U4GE2nRToNndypLrdIKdT59vXpyba4bIYzJ
   7clLsOUwxnmLyGMR6iSJpzE/rPnwQ28gUqYDVjpT1pIQAFr4vXjHj0oIR
   A==;
X-CSE-ConnectionGUID: tZv7I24NQASPU1FqPpF6Fw==
X-CSE-MsgGUID: vxhycU0xSP+STvr2V1RmAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82563786"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82563786"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 03:40:19 -0700
X-CSE-ConnectionGUID: Srn4ftCAQCuw0nJxwZskmA==
X-CSE-MsgGUID: ix00cRX2RwCdpYjzJQriKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258620304"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 03:40:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJUFD-000000005Wr-1KL5;
	Sun, 03 May 2026 10:40:15 +0000
Date: Sun, 03 May 2026 12:40:06 +0200
From: kernel test robot <lkp@intel.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/include/asm/mshyperv.h:277: multiple definition of
 `hv_build_devid_type_pci';
 arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined
 here
Message-ID: <202605031213.PRvyoCZS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mukesh-R/iommu-hyperv-rename-hyperv-iommu-c-to-hyperv-irq-c/20260503-090312
head:   f5351a96a6b1fd376b752c66714c4ae3b7598e18
commit: 28dd2164538308ef48df1f61c05c3cd1f6296c5f PCI: hv: Build device id for a VMBus device, export PCI devid function
date:   10 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260503/202605031213.PRvyoCZS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031213.PRvyoCZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031213.PRvyoCZS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mshyperv.c:23:
>> arch/x86/include/asm/mshyperv.h:277:5: warning: no previous prototype for 'hv_build_devid_type_pci' [-Wmissing-prototypes]
     277 | u64 hv_build_devid_type_pci(struct pci_dev *pdev) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   ld: arch/x86/kvm/vmx/pmu_intel.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined here
   ld: arch/x86/kvm/vmx/nested.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined here
   ld: arch/x86/kvm/vmx/posted_intr.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined here
   ld: arch/x86/kvm/vmx/main.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined here
   ld: arch/x86/kvm/vmx/sgx.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined here
   ld: arch/x86/kvm/vmx/hyperv.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/vmx/vmx.o:arch/x86/include/asm/mshyperv.h:277: first defined here
--
   ld: arch/x86/kvm/hyperv.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/x86.o:arch/x86/include/asm/mshyperv.h:277: first defined here
--
   ld: arch/x86/kvm/svm/nested.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/svm/svm.o:arch/x86/include/asm/mshyperv.h:277: first defined here
   ld: arch/x86/kvm/svm/hyperv.o: in function `hv_build_devid_type_pci':
>> arch/x86/include/asm/mshyperv.h:277: multiple definition of `hv_build_devid_type_pci'; arch/x86/kvm/svm/svm.o:arch/x86/include/asm/mshyperv.h:277: first defined here


vim +277 arch/x86/include/asm/mshyperv.h

   273	
   274	#if IS_ENABLED(CONFIG_HYPERV_IOMMU)
   275	u64 hv_build_devid_type_pci(struct pci_dev *pdev);
   276	#else
 > 277	u64 hv_build_devid_type_pci(struct pci_dev *pdev) { return 0; }
   278	#endif /* IS_ENABLED(CONFIG_HYPERV_IOMMU) */
   279	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
