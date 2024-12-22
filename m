Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0283184E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 00:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734828068; cv=none; b=ZzAgi9EgKb2NuEjB2xAtEnWNO+RND8pQ5j315o6uNe7jif4mksFUCeJp1ymIviWpebg+Rl4c2F2oCqJ1hpbqJELN8uKo1QXZAeGBS63id0y9nfMUZz2lt4hUs/LP45NtI87YSkLsHrfTDgbrVmuHzllFBcHl4aQIEpHZ0EA+owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734828068; c=relaxed/simple;
	bh=/QU+qi/qfF2KRagwoWQzH/+3/7ulEKIan+t+uZychts=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFAMD5Y3fIpKgavXwRDg5s30RHX7ZcxH669DyavLT5qq49OfQ5cq67ZQOx99YnKeCW8zHGPKLNlJtUf1/1bG0dNusCUVrt3tV474wHuTjnHPEGurxJBwu33P9tqBoVULX/1bnxdcIL3nszxaiZvgL6d6YAr79+TNeBrlaO98u4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbokBWWj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbokBWWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734828064; x=1766364064;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/QU+qi/qfF2KRagwoWQzH/+3/7ulEKIan+t+uZychts=;
  b=mbokBWWjoJiQ89vNyh9UkziITgjCG/z+TBwO1CFpi8h9SQEifCSERi3b
   vBG7PGLGC28KcC0RV5Rmbhj0r9YM3hXkTK1J5tivFt44+fufJYHxECM/l
   PWzrlda35WibaOdrLUo/cN4h4OFDfg+DpGQwUj7FEtHrZF+QgCU7niknm
   q/nO4gpAxhCvkMwBEQUOmjH2+Ja3vKckXm2CNwjT6guk3w5GanVRH5CnP
   wJ5h+QkKebm6p58BVp4w13q/F4NZwt0/OBh/cCDdrNQmH/je94/FTB5GR
   L7eMJ4ZNSI/TU18PQCqaKQxGn+mX288BdlCr0xnKdbSdaAFbcxcLEw1il
   Q==;
X-CSE-ConnectionGUID: kcCBZwX0Rw6aUb80uVyePg==
X-CSE-MsgGUID: SFEmKxb3Sx+e1w56xWu4rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34655579"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34655579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 16:41:04 -0800
X-CSE-ConnectionGUID: A5Pi9eV4Rx6Qzwz45CaN7A==
X-CSE-MsgGUID: 7r4Mle0cQnWDopegH73gMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99332605"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2024 16:41:03 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPA1k-0002cm-2l;
	Sun, 22 Dec 2024 00:41:00 +0000
Date: Sun, 22 Dec 2024 08:41:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 6/9]
 drivers/bus/mhi/host/pci_generic.c:349:38: warning: unused variable
 'mhi_qcom_sdx55_info'
Message-ID: <202412220810.scz52h3y-lkp@intel.com>
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
commit: 21705174a597c6046fdd394eec485c663acdd76f [6/9] drivers: bus: mhi: add FN980 v2 support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412220810.scz52h3y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220810.scz52h3y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220810.scz52h3y-lkp@intel.com/

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
>> drivers/bus/mhi/host/pci_generic.c:349:38: warning: unused variable 'mhi_qcom_sdx55_info' [-Wunused-const-variable]
     349 | static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
         |                                      ^~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/host/pci_generic.c:465:38: warning: unused variable 'mhi_foxconn_sdx55_info' [-Wunused-const-variable]
     465 | static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   18 warnings generated.


vim +/mhi_qcom_sdx55_info +349 drivers/bus/mhi/host/pci_generic.c

49d38ebb6faad9 drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt  2021-04-02  348  
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21 @349  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  350  	.name = "qcom-sdx55m",
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  351  	.fw = "qcom/sdx55m/sbl1.mbn",
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  352  	.edl = "qcom/sdx55m/edl.mbn",
48f98496b1de13 drivers/bus/mhi/host/pci_generic.c Qiang Yu       2024-04-24  353  	.edl_trigger = true,
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  354  	.config = &modem_qcom_v1_mhiv_config,
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  355  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
5c2c85315948c4 drivers/bus/mhi/pci_generic.c      Richard Laing  2021-07-15  356  	.dma_data_width = 32,
d2e11fd2b7fcd1 drivers/bus/mhi/pci_generic.c      Jakub Kicinski 2021-07-31  357  	.mru_default = 32768,
56f6f4c4eb2a71 drivers/bus/mhi/pci_generic.c      Bhaumik Bhatt  2021-07-16  358  	.sideband_wake = false,
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  359  };
855a70c12021bd drivers/bus/mhi/pci_generic.c      Loic Poulain   2020-10-21  360  

:::::: The code at line 349 was first introduced by commit
:::::: 855a70c12021bdc5df60512f1d3f6d492dc715be bus: mhi: Add MHI PCI support for WWAN modems

:::::: TO: Loic Poulain <loic.poulain@linaro.org>
:::::: CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
