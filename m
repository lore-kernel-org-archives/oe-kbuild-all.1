Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B683074B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590129; cv=none; b=kfDvoVOfVC/4pcXt8s9yzTL+I839QYI6GWorbPrl1fBU5PbE1C7BT3nJGFOJ01MNiKZ4MZuIg1sv8X7EqycsMcoVMoEiZy7NpasnIfwAJB+B0VmbwnhQn5STKlvp2sTaFHPdViJJTV7yAroB/EY/ONlo4/7pA6yiWu9CQ5j0wNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590129; c=relaxed/simple;
	bh=oeOWMhuyAg0ZQ1ymngVmXzVPqgC/1tap5hMJKFwyAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s887zmwQIXBBzanjQg4BxuXaKGEQ5yuYTaPwiAiFvK+aECSZtgBHlojg2pX7XPCafguZm2AXUvZD5X4eis6JfINGRiCkwSy6iEQtrGYJXuObFWidXD7QPxX4ZqbV+L3DplIbOH7AIfi2aG5HFMAKmU0Ihk96cbZ4VpiBET1mdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS4zKQXz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS4zKQXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763590127; x=1795126127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oeOWMhuyAg0ZQ1ymngVmXzVPqgC/1tap5hMJKFwyAdM=;
  b=GS4zKQXz8ii65ega2rpWmGpCgiwqltZOWdSSUF2rqoM0Bk+qetUcHDkm
   qcVUYOUF05gfxvVq/aQjACVAXC5/kSpiSPAeXXoFS2XaCzaM7LSCXHoem
   LZvfWgKF8uOKRQZSgechK8alOiK+6IFhQO1Ysjr7kkLG7u1nihfTlrQ3g
   YvH3jsZDxLlGpV+RbyvPznUpO21O6l5r9yH6RxrA6dwLJ2HjaJwU4sUFZ
   ME/5YGCyUwBXXI9Ibtj/3DmjsNnW+SEp3CfoqXhF7hxGQPLQzfMV6g6/C
   4gxs6qKwGqNYG4unFAOnRx1KQF7JNmTyE1rU6TeyHpRVBRRLwbP5Xw2Mr
   A==;
X-CSE-ConnectionGUID: JgYiTN/4RlqsXqpRP1IRlQ==
X-CSE-MsgGUID: UInfo84sSOCRavCWFgLFGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65685653"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65685653"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 14:08:47 -0800
X-CSE-ConnectionGUID: 92wLpZuuTS6wOC2bYI7RHg==
X-CSE-MsgGUID: z1M7GhDwTTG3n57HQHEVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="190447680"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Nov 2025 14:08:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLqLz-0003MJ-0I;
	Wed, 19 Nov 2025 22:08:43 +0000
Date: Thu, 20 Nov 2025 06:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3281/3281]
 drivers/crypto/ccp/hygon/ccp-mdev.c:226:9: error: call to undeclared
 function 'pci_user_read_config_byte'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202511200645.o5HzMq38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dfb9bd9242c2350c127d51a126976ed386e9cc48
commit: 592817a30ddc0ef43c7f5b5fe906ae37cf3bea3b [3281/3281] crypto: ccp: add ccp-mdev functionality to the ccp module.
config: arm64-randconfig-003-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200645.o5HzMq38-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200645.o5HzMq38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200645.o5HzMq38-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/ccp-mdev.c:226:9: error: call to undeclared function 'pci_user_read_config_byte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     226 |                 ret = pci_user_read_config_byte(pdev, offset, &tmp);
         |                       ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:226:9: note: did you mean 'pci_read_config_byte'?
   include/linux/pci.h:1962:1: note: 'pci_read_config_byte' declared here
    1962 | _PCI_NOP_ALL(read, *)
         | ^
   include/linux/pci.h:1959:28: note: expanded from macro '_PCI_NOP_ALL'
    1959 | #define _PCI_NOP_ALL(o, x)      _PCI_NOP(o, byte, u8 x) \
         |                                 ^
   include/linux/pci.h:1955:20: note: expanded from macro '_PCI_NOP'
    1955 |         static inline int pci_##o##_config_##s(struct pci_dev *dev, \
         |                           ^
   <scratch space>:32:1: note: expanded from here
      32 | pci_read_config_byte
         | ^
>> drivers/crypto/ccp/hygon/ccp-mdev.c:231:9: error: call to undeclared function 'pci_user_read_config_word'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |                 ret = pci_user_read_config_word(pdev, offset, &tmp);
         |                       ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:231:9: note: did you mean 'pci_read_config_word'?
   include/linux/pci.h:1962:1: note: 'pci_read_config_word' declared here
    1962 | _PCI_NOP_ALL(read, *)
         | ^
   include/linux/pci.h:1960:5: note: expanded from macro '_PCI_NOP_ALL'
    1960 |                                 _PCI_NOP(o, word, u16 x) \
         |                                 ^
   include/linux/pci.h:1955:20: note: expanded from macro '_PCI_NOP'
    1955 |         static inline int pci_##o##_config_##s(struct pci_dev *dev, \
         |                           ^
   <scratch space>:35:1: note: expanded from here
      35 | pci_read_config_word
         | ^
>> drivers/crypto/ccp/hygon/ccp-mdev.c:234:9: error: call to undeclared function 'pci_user_read_config_dword'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |                 ret = pci_user_read_config_dword(pdev, offset, (u32 *)&tmp_val);
         |                       ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:234:9: note: did you mean 'pci_read_config_dword'?
   include/linux/pci.h:1962:1: note: 'pci_read_config_dword' declared here
    1962 | _PCI_NOP_ALL(read, *)
         | ^
   include/linux/pci.h:1961:5: note: expanded from macro '_PCI_NOP_ALL'
    1961 |                                 _PCI_NOP(o, dword, u32 x)
         |                                 ^
   include/linux/pci.h:1955:20: note: expanded from macro '_PCI_NOP'
    1955 |         static inline int pci_##o##_config_##s(struct pci_dev *dev, \
         |                           ^
   <scratch space>:38:1: note: expanded from here
      38 | pci_read_config_dword
         | ^
>> drivers/crypto/ccp/hygon/ccp-mdev.c:255:9: error: call to undeclared function 'pci_user_write_config_byte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |                 ret = pci_user_write_config_byte(pdev, offset, tmp_val);
         |                       ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:255:9: note: did you mean 'pci_write_config_byte'?
   include/linux/pci.h:1963:1: note: 'pci_write_config_byte' declared here
    1963 | _PCI_NOP_ALL(write,)
         | ^
   include/linux/pci.h:1959:28: note: expanded from macro '_PCI_NOP_ALL'
    1959 | #define _PCI_NOP_ALL(o, x)      _PCI_NOP(o, byte, u8 x) \
         |                                 ^
   include/linux/pci.h:1955:20: note: expanded from macro '_PCI_NOP'
    1955 |         static inline int pci_##o##_config_##s(struct pci_dev *dev, \
         |                           ^
   <scratch space>:41:1: note: expanded from here
      41 | pci_write_config_byte
         | ^
>> drivers/crypto/ccp/hygon/ccp-mdev.c:257:9: error: call to undeclared function 'pci_user_write_config_word'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |                 ret = pci_user_write_config_word(pdev, offset, tmp_val);
         |                       ^
>> drivers/crypto/ccp/hygon/ccp-mdev.c:259:9: error: call to undeclared function 'pci_user_write_config_dword'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     259 |                 ret = pci_user_write_config_dword(pdev, offset, tmp_val);
         |                       ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1144:15: warning: no previous prototype for function 'ccp_pin_memory' [-Wmissing-prototypes]
    1144 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1144 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         | ^
         | static 
>> drivers/crypto/ccp/hygon/ccp-mdev.c:1788:46: error: use of undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
    1788 |                 ccp_mdev_data.domain = iommu_domain_alloc(&pci_bus_type);
         |                                                            ^~~~~~~~~~~~
         |                                                            pci_pcie_type
   include/linux/pci.h:2489:19: note: 'pci_pcie_type' declared here
    2489 | static inline int pci_pcie_type(const struct pci_dev *dev)
         |                   ^
>> drivers/crypto/ccp/hygon/ccp-mdev.c:1788:45: error: incompatible pointer types passing 'int (*)(const struct pci_dev *)' to parameter of type 'const struct bus_type *' [-Wincompatible-pointer-types]
    1788 |                 ccp_mdev_data.domain = iommu_domain_alloc(&pci_bus_type);
         |                                                           ^~~~~~~~~~~~~
   include/linux/iommu.h:970:71: note: passing argument to parameter 'bus' here
     970 | extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
         |                                                                       ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1977:22: error: use of undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
    1977 |         if (!iommu_present(&pci_bus_type)) {
         |                             ^~~~~~~~~~~~
         |                             pci_pcie_type
   include/linux/pci.h:2489:19: note: 'pci_pcie_type' declared here
    2489 | static inline int pci_pcie_type(const struct pci_dev *dev)
         |                   ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1977:21: error: incompatible pointer types passing 'int (*)(const struct pci_dev *)' to parameter of type 'const struct bus_type *' [-Wincompatible-pointer-types]
    1977 |         if (!iommu_present(&pci_bus_type)) {
         |                            ^~~~~~~~~~~~~
   include/linux/iommu.h:967:50: note: passing argument to parameter 'bus' here
     967 | extern bool iommu_present(const struct bus_type *bus);
         |                                                  ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:2018:22: error: use of undeclared identifier 'pci_bus_type'; did you mean 'pci_pcie_type'?
    2018 |         if (!iommu_present(&pci_bus_type)) {
         |                             ^~~~~~~~~~~~
         |                             pci_pcie_type
   include/linux/pci.h:2489:19: note: 'pci_pcie_type' declared here
    2489 | static inline int pci_pcie_type(const struct pci_dev *dev)
         |                   ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:2018:21: error: incompatible pointer types passing 'int (*)(const struct pci_dev *)' to parameter of type 'const struct bus_type *' [-Wincompatible-pointer-types]
    2018 |         if (!iommu_present(&pci_bus_type)) {
         |                            ^~~~~~~~~~~~~
   include/linux/iommu.h:967:50: note: passing argument to parameter 'bus' here
     967 | extern bool iommu_present(const struct bus_type *bus);
         |                                                  ^
   1 warning and 12 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/pci_user_read_config_byte +226 drivers/crypto/ccp/hygon/ccp-mdev.c

   208	
   209	static int handle_pci_cfg_read(struct mdev_state *mdev_state, int offset,
   210					 __le32 *val, int count)
   211	{
   212		struct pci_dev *pdev = NULL;
   213		u32 tmp_val = 0;
   214		int ret = -EINVAL;
   215	
   216		if (!mdev_state || !mdev_state->iommu) {
   217			pr_err("ccp: invalid mdev_state.\n");
   218			return ret;
   219		}
   220	
   221		pdev = mdev_state->iommu->pdev;
   222	
   223		if (count == 1) {
   224			u8 tmp;
   225	
 > 226			ret = pci_user_read_config_byte(pdev, offset, &tmp);
   227			tmp_val = tmp;
   228		} else if (count == 2) {
   229			u16 tmp;
   230	
 > 231			ret = pci_user_read_config_word(pdev, offset, &tmp);
   232			tmp_val = tmp;
   233		} else if (count == 4)
 > 234			ret = pci_user_read_config_dword(pdev, offset, (u32 *)&tmp_val);
   235	
   236		*val = cpu_to_le32(tmp_val);
   237		return ret;
   238	}
   239	
   240	static int handle_pci_cfg_write(struct mdev_state *mdev_state, u16 offset,
   241					 u8 *buf, u32 count)
   242	{
   243		u32 tmp_val = le32_to_cpu(*(u32 *)buf);
   244		struct pci_dev *pdev = NULL;
   245		int ret = -EINVAL;
   246	
   247		if (!mdev_state || !mdev_state->iommu) {
   248			pr_err("ccp: invalid mdev_state.\n");
   249			return ret;
   250		}
   251	
   252		pdev = mdev_state->iommu->pdev;
   253	
   254		if (count == 1)
 > 255			ret = pci_user_write_config_byte(pdev, offset, tmp_val);
   256		else if (count == 2)
 > 257			ret = pci_user_write_config_word(pdev, offset, tmp_val);
   258		else if (count == 4)
 > 259			ret = pci_user_write_config_dword(pdev, offset, tmp_val);
   260	
   261		return ret;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
