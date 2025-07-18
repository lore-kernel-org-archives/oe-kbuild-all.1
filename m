Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6C1C84C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 04:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752813742; cv=none; b=hCv3FQCM9uBuI4MQp6trP6qKE+LJldk5Vhc1r58RXdfUuGZIACmbEqBCAXK0+N2ZTV3G3ZxIVYhXPFCXE7+IcXOikWTWrw8P6gkXiRhWAXym2YClfzYIKse49CiybDXVqAmKFQM4OhE38ESyk8tgJ6sJx7/J3SuUzvHuBHtsZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752813742; c=relaxed/simple;
	bh=3WazD1Fkc8LBOaX51HcKFq6c+cQzHjBextt4EnJ82bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/l3iEQ5fPCwW6xP+uV2VQ1OVFMsJEHr5cWW9By9RGBNl03cRHctlQUdG0sA4mfRarCJDKqE/5qdcgPIS5h1YePr0VUCYgY/67B0yuLtwSSvM4iPqtdMMFYxCvdeOkSl4TJmiuYG9m2feX8fvUs9My+TQ2VVxXk8EPdgZx8H6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9ILM2Va; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9ILM2Va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752813740; x=1784349740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WazD1Fkc8LBOaX51HcKFq6c+cQzHjBextt4EnJ82bA=;
  b=P9ILM2VaQSyk9K1cE6Z/OcDnpFULA+sm0sJmbsDsbhszO3K5FPLfmz/g
   /N8tR/rhemrmEg3UJXWwc4WMlUVRLS9TVhBNUIhsx2lMwgV5vgXENR0dB
   xkC38RbIy49QUpfuCZrJm4zklZWQBlvqiwXHb46vWol9nCzD+F3J15a/s
   7NkKTwjpB7KBA8OA6MnPBwvHPin4GGwxJAjlU70q8Sz8SKmy4Wr7HuT64
   BBueyIcCAdyAhvx8l23K912K+2yk9OblUlwCK/LxhJ507hhRAvAgn2aOs
   m1RvmhQQGq/k5nZ9hALDuIQaNgL3UdvLiJZIiAEGz6yjoYZC6SY3caKhG
   A==;
X-CSE-ConnectionGUID: 8iIYk+v+TbOCBzfmYzt83g==
X-CSE-MsgGUID: AoksjBkiSm+xB0ZmqjuqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72554177"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72554177"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 21:42:19 -0700
X-CSE-ConnectionGUID: 3modBa7vTv+RtrLk/DL0Uw==
X-CSE-MsgGUID: ggowfk5sSdSqmXmmSg9jJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="161992810"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2025 21:42:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uccvH-000EIV-0z;
	Fri, 18 Jul 2025 04:42:15 +0000
Date: Fri, 18 Jul 2025 12:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o: warning: objtool:
 missing symbol for section .init.text
Message-ID: <202507181245.Yorkn9cA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Naixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   700db19c02e9c8dcf291aa7a6a29337c97ea1805
commit: ea190d90c609e9909f37afa0d1a19f938ffb95d3 [1732/1732] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-buildonly-randconfig-005-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181245.Yorkn9cA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181245.Yorkn9cA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181245.Yorkn9cA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:21:
   In file included from drivers/net/ethernet/huawei/bma/edma_drv/bma_devintf.h:21:
   In file included from drivers/net/ethernet/huawei/bma/edma_drv/edma_host.h:20:
   drivers/net/ethernet/huawei/bma/edma_drv/../include/bma_ker_intf.h:19:15: warning: redefinition of typedef '__kernel_time_t' is a C11 feature [-Wtypedef-redefinition]
      19 | typedef long            __kernel_time_t;
         |                         ^
   include/uapi/asm-generic/posix_types.h:89:25: note: previous definition is here
      89 | typedef __kernel_long_t __kernel_time_t;
         |                         ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:67:5: warning: no previous prototype for function 'edma_param_get_statics' [-Wmissing-prototypes]
      67 | int edma_param_get_statics(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:67:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      67 | int edma_param_get_statics(char *buf, const struct kernel_param *kp)
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:142:5: warning: no previous prototype for function '__atu_config_H' [-Wmissing-prototypes]
     142 | s32 __atu_config_H(struct pci_dev *pdev, unsigned int region,
         |     ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     142 | s32 __atu_config_H(struct pci_dev *pdev, unsigned int region,
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:328:5: warning: no previous prototype for function 'pme_pci_enable_msi' [-Wmissing-prototypes]
     328 | int pme_pci_enable_msi(struct pci_dev *pdev)
         |     ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     328 | int pme_pci_enable_msi(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:354:5: warning: no previous prototype for function 'pci_device_init' [-Wmissing-prototypes]
     354 | int pci_device_init(struct pci_dev *pdev, struct bma_pci_dev_s *bma_pci_dev)
         |     ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:354:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     354 | int pci_device_init(struct pci_dev *pdev, struct bma_pci_dev_s *bma_pci_dev)
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:383:5: warning: no previous prototype for function 'pci_device_config' [-Wmissing-prototypes]
     383 | int pci_device_config(struct pci_dev *pdev)
         |     ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:383:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     383 | int pci_device_config(struct pci_dev *pdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:505:12: warning: no previous prototype for function 'bma_pci_init' [-Wmissing-prototypes]
     505 | int __init bma_pci_init(void)
         |            ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:505:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     505 | int __init bma_pci_init(void)
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:518:13: warning: no previous prototype for function 'bma_pci_cleanup' [-Wmissing-prototypes]
     518 | void __exit bma_pci_cleanup(void)
         |             ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:518:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     518 | void __exit bma_pci_cleanup(void)
         | ^
         | static 
   8 warnings generated.
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
