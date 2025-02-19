Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94DB1EB9E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975526; cv=none; b=gMpA/cASRPNBN0w49ep4CU71Oid4nz6SLLm94a7KGH2xCmLBEU7fhzNAQlCIqCV1sajNzULeSstN8ZQLSnVL2Eovlsssh68UnP435bAn4sThD+tAkGjZ6WvtgqOoLf2u2XmL+4EIhGV3T3Zft2A8EVFJpotDsncEu1E53HH9vsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975526; c=relaxed/simple;
	bh=V3iBwK81FJFF1CSLVpWnQxi+XrY/LAv7wDChn1ewiPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdrLrvU9x807oBn188KZReJTh/8mFnyvuSg/PI9QOIv9R2agPVbPOrlLP8Gwl5nlHOW1HQq9ssE7YKHjrNICS31RKUiY4HJY+7z0Aa7aME+aU+20hlr13BBkCVU5m+T+T/V+kbPZYFZpm5MiRaniDgZc+z0ek4cbPmZVNrG9J2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuEhih+v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuEhih+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739975525; x=1771511525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3iBwK81FJFF1CSLVpWnQxi+XrY/LAv7wDChn1ewiPk=;
  b=YuEhih+vqSNwv8HJY+YLv6s5jNpJfRNgZoSeYeVyNisV+w8FNsujdkW+
   D8BGplGWmSRSxoop7CyUuziqV0UfvU6lpa15jIU/UYVvp1oMrTuQ+mfZF
   zoXtRE3/7g6k494UoEA85Az7H9cAeXYZjkZoIezPq7bo1MhsRHWG8o+Ez
   CcyvdFJPFj8mf4lgZTWSc/uALU97+Q0r4z4H+COVQzlH4+w9LkHVYj0m8
   ML2zFAGXOTt/3mPn9AfM87XcZ05DbSJct4hER7HH7m7JBZqJq/GdAF+66
   t9//sKHgW6D85yZ5rh0vW/iGO2l80XCs+BD6eh2mb3c/FIT0eRnoEesXQ
   Q==;
X-CSE-ConnectionGUID: CIaout9TSimHVEDFifTMyw==
X-CSE-MsgGUID: y8Kpw8rASayiOFf1Wesk0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39944431"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="39944431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 06:32:04 -0800
X-CSE-ConnectionGUID: 0kyrzObjQA6KmLNZ//KLgw==
X-CSE-MsgGUID: pADNT238T0Wv7scNPOeikQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118866010"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2025 06:32:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkl5V-000335-2W;
	Wed, 19 Feb 2025 14:30:53 +0000
Date: Wed, 19 Feb 2025 22:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Keyon Jie <yang.jie@linux.intel.com>
Subject: [intel-lts:pr/59 1/1] sound/soc/sof/ops.c:26:6: warning: 'ret' is
 used uninitialized in this function
Message-ID: <202502192218.1p8oJd7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 027aacc3174e407c766ae7d63bfc6f471302a833 [1/1] ASoC: SOF: Add Build support for SOF core and Intel drivers
config: xtensa-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192218.1p8oJd7U-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192218.1p8oJd7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192218.1p8oJd7U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/bug.h:59:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:59:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:58:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
   include/asm-generic/bug.h:59:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:59:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:58:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
   include/asm-generic/bug.h:59:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:59:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:69:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   include/asm-generic/bug.h:59:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:59:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:69:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   include/asm-generic/bug.h:59:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:59:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   sound/soc/sof/ops.c: In function 'snd_sof_pci_update_bits_unlocked':
>> sound/soc/sof/ops.c:26:6: warning: 'ret' is used uninitialized in this function [-Wuninitialized]
     u32 ret;
         ^~~


vim +/ret +26 sound/soc/sof/ops.c

26780556c9a794 Liam Girdwood 2018-01-08  20  
26780556c9a794 Liam Girdwood 2018-01-08  21  int snd_sof_pci_update_bits_unlocked(struct snd_sof_dev *sdev, u32 offset,
26780556c9a794 Liam Girdwood 2018-01-08  22  				     u32 mask, u32 value)
26780556c9a794 Liam Girdwood 2018-01-08  23  {
26780556c9a794 Liam Girdwood 2018-01-08  24  	bool change;
26780556c9a794 Liam Girdwood 2018-01-08  25  	unsigned int old, new;
26780556c9a794 Liam Girdwood 2018-01-08 @26  	u32 ret;
26780556c9a794 Liam Girdwood 2018-01-08  27  
26780556c9a794 Liam Girdwood 2018-01-08  28  	pci_read_config_dword(sdev->pci, offset, &ret);
26780556c9a794 Liam Girdwood 2018-01-08  29  	dev_dbg(sdev->dev, "Debug PCIR: %8.8x at  %8.8x\n",
26780556c9a794 Liam Girdwood 2018-01-08  30  		pci_read_config_dword(sdev->pci, offset, &ret), offset);
26780556c9a794 Liam Girdwood 2018-01-08  31  
26780556c9a794 Liam Girdwood 2018-01-08  32  	old = ret;
26780556c9a794 Liam Girdwood 2018-01-08  33  	new = (old & (~mask)) | (value & mask);
26780556c9a794 Liam Girdwood 2018-01-08  34  
26780556c9a794 Liam Girdwood 2018-01-08  35  	change = (old != new);
26780556c9a794 Liam Girdwood 2018-01-08  36  	if (change) {
26780556c9a794 Liam Girdwood 2018-01-08  37  		pci_write_config_dword(sdev->pci, offset, new);
26780556c9a794 Liam Girdwood 2018-01-08  38  		dev_dbg(sdev->dev, "Debug PCIW: %8.8x at  %8.8x\n", value,
26780556c9a794 Liam Girdwood 2018-01-08  39  			offset);
26780556c9a794 Liam Girdwood 2018-01-08  40  	}
26780556c9a794 Liam Girdwood 2018-01-08  41  
26780556c9a794 Liam Girdwood 2018-01-08  42  	return change;
26780556c9a794 Liam Girdwood 2018-01-08  43  }
26780556c9a794 Liam Girdwood 2018-01-08  44  EXPORT_SYMBOL(snd_sof_pci_update_bits_unlocked);
26780556c9a794 Liam Girdwood 2018-01-08  45  

:::::: The code at line 26 was first introduced by commit
:::::: 26780556c9a794c4de6fe9fb19d186bec3906d6e ASoC: SOF: Add DSP HW abstraction operations

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Keyon Jie <yang.jie@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
