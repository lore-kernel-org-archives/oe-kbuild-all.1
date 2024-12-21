Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC321DE3C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 00:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734825604; cv=none; b=jAH36dht1/VYVmlVS8KQ+x0hARD6PNmF+pvL49GBV6sPgRbL38hq0cBm5k2YtKOxNKDctUtUa3f2ppdjvB3CB9DHu3Ipuwuydm2ZjLU68FLtSpcYoHo7T3f/TNSbeXQm2OQiToVZi1+Iz1Tpoj/u2xk0xsn1qQgGJ5yDCENa2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734825604; c=relaxed/simple;
	bh=8SZaFhocqrfpwUKpuXoSoPQm8CCcAzErv/M4Jv2hZ9w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jcqSfApeGeLdbT8DVeA/PIfuC2CkXb1zm8orU0eehfca1PFgJlER11H9J44Jc7VdHTCAjiC22PNUwlqyTRVnFrOOOSX3f2wB2LTfFkHNc4RkuW+WlEq/o1Ug14z3sTQBsvDqxtpQ0ZDBecX7Mm8lzfAJoQ02/omZeV9NY8xhN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZA6Yn8gc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZA6Yn8gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734825603; x=1766361603;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8SZaFhocqrfpwUKpuXoSoPQm8CCcAzErv/M4Jv2hZ9w=;
  b=ZA6Yn8gcsvfyMueoNt9HRhvlpZ0yfwoEikia1fAV4WAlbf1hcY487Vvn
   xqjMCz25axw4cRkch49TN/hwQIF5T0NrTlk78BFZNLpFGS32NATHzraAr
   E9epaczoVPr4TcTyqDaTtOVmpoMW3T/yGJBIdxxWEtxBLjvQUokN5bZ49
   SM6FC1YL4hQ75aBSpbpZ20ch0i+4CGLs/k7vTK1Ot1S5ckSEm7loeB5fa
   +f/vEvI5OkW01dGVaTQBzeeaEdjY/1mBKRbduKJrQMbKzYHgQhYSE5jXS
   671oPxzH5V4INqmXrP4Rdlna7z8mW+p/8B87F3jskmvcQK7eoNo8msrlj
   Q==;
X-CSE-ConnectionGUID: gLlJfEThSli4rbL2veU8FQ==
X-CSE-MsgGUID: wxxzhn1BRBGlepXakEAQ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35228228"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35228228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 16:00:00 -0800
X-CSE-ConnectionGUID: sr6IVhDBTIai0SoxVQyn3w==
X-CSE-MsgGUID: TV6GSazdSpaKMoifuQN1wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98630860"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 15:59:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP9O0-0002a1-0n;
	Sat, 21 Dec 2024 23:59:56 +0000
Date: Sun, 22 Dec 2024 07:59:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 1/9]
 drivers/bus/mhi/host/pci_generic.c:435:38: warning: unused variable
 'mhi_foxconn_sdx55_info'
Message-ID: <202412220747.JvhymY4s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: 4ee10246e0dd22818f20b3812c5ca74b3f0a1148 [1/9] Revert "bus: mhi: host: pci_generic: add support for sc8280xp-crd SDX55 variant"
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412220747.JvhymY4s-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220747.JvhymY4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220747.JvhymY4s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bus/mhi/host/pci_generic.c:12:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/bus/mhi/host/pci_generic.c:13:
   In file included from include/linux/mhi.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/bus/mhi/host/pci_generic.c:13:
   In file included from include/linux/mhi.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/bus/mhi/host/pci_generic.c:13:
   In file included from include/linux/mhi.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/bus/mhi/host/pci_generic.c:435:38: warning: unused variable 'mhi_foxconn_sdx55_info' [-Wunused-const-variable]
     435 | static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +/mhi_foxconn_sdx55_info +435 drivers/bus/mhi/host/pci_generic.c

bf30a75e6e0001 Slark Xiao            2024-07-01  434  
f08d4bdad612dc Manivannan Sadhasivam 2024-06-26 @435  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
f08d4bdad612dc Manivannan Sadhasivam 2024-06-26  436  	.name = "foxconn-sdx55",
a7bc66fe8093b4 Slark Xiao            2024-07-25  437  	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
84a5ae5b23ba63 Slark Xiao            2024-07-25  438  	.edl_trigger = true,
c2dbd34f6a9558 Slark Xiao            2023-03-29  439  	.config = &modem_foxconn_sdx55_config,
c2dbd34f6a9558 Slark Xiao            2023-03-29  440  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
c2dbd34f6a9558 Slark Xiao            2023-03-29  441  	.dma_data_width = 32,
c2dbd34f6a9558 Slark Xiao            2023-03-29  442  	.mru_default = 32768,
c2dbd34f6a9558 Slark Xiao            2023-03-29  443  	.sideband_wake = false,
c2dbd34f6a9558 Slark Xiao            2023-03-29  444  };
c2dbd34f6a9558 Slark Xiao            2023-03-29  445  

:::::: The code at line 435 was first introduced by commit
:::::: f08d4bdad612dcff6827f8cd2b20f13413c392d3 bus: mhi: host: pci_generic: Use unique 'mhi_pci_dev_info' for product families

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
