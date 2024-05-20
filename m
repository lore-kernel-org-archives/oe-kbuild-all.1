Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AB86626
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716209841; cv=none; b=K88fsHqMV+KuZ9eCcDHHrkYxQcqcKbaYR8nU3xNOEGBBqXaOKgGeTIri8TqvA31Yisx0x6UT7QiYwJkwIHUCAcoWTx7mnEk5nBxQfu2UjSnjAyOI2dnxeKMguUne5ob/Z3o6/T6wpn4hQBktSTjY17Zjc0aMVNruQlp02EKiBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716209841; c=relaxed/simple;
	bh=l0vhOAQEg9hkHmDxzsG0hLopmSbQfW83zMFYt3k0i9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSqlBRkZa4oDiXI+HHnikKCZaInD7Wep5v2GcS7bchUaaC/C53jNoRh2PJrnona16/lZ0PTVd5j+NgPVG1k4OdYUzy2aCRfaTcNWcrgoqX89eLqg/l3lewuuoSOUKpn2XCihAYZCbexS/JoWsxK+qhDVucJ1T7/in5VAhQQAYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEYOl+wb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEYOl+wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716209839; x=1747745839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0vhOAQEg9hkHmDxzsG0hLopmSbQfW83zMFYt3k0i9s=;
  b=fEYOl+wbigBNBCfn996FNY/773rNflO1XdaStM54DeRVnhsViPbQ6hxx
   xuuTtOyoaS9oIHp4JZU4UJZlIZwzrXcnpoHP0OfTaZPMmtRlCAdQXFJ4d
   n8OYTxkjO8svo5/agoSMp54IXuHql5KVwrUWgh56JhSr5+Cz4fp5VUpzI
   chtX2ut4qyEbcwsNSEXSAH2tKII9MS+rJA+dPlszcGS8VmYVY/R/SGQLS
   26J2KQDPAEh+7oNOujKyaJeC/ILp05zyH2eJAZCUpC34L++iVHQA2ZWna
   fSutu8rrk8mBbqxBHQ/52GGeSu0VXhhAHRulYwJX+zFbckQvJ5KMmZB2a
   w==;
X-CSE-ConnectionGUID: jaoLUqakRUCBacloWQ7tkQ==
X-CSE-MsgGUID: DrboE5jpRda6fj4GbSrwGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23007592"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="23007592"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:57:19 -0700
X-CSE-ConnectionGUID: 6+rNf2ShT4aoB9poR9LAFQ==
X-CSE-MsgGUID: f+BzBYglRSuayHU0PtE56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="55754990"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2024 05:57:18 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s92Zn-0004re-2D;
	Mon, 20 May 2024 12:57:15 +0000
Date: Mon, 20 May 2024 20:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9619/9669]
 arch/x86/kernel/zhaoxin_kh40000.c:87:33: error: call to undeclared function
 'iommu_get_dma_domain'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202405202027.XOiN2dDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb74bc369fd2ab5f41a32c4ddc2e23bc76c3c550
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9619/9669] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-001-20240520 (https://download.01.org/0day-ci/archive/20240520/202405202027.XOiN2dDz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405202027.XOiN2dDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405202027.XOiN2dDz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c:47:30: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
      47 |         if (ZHAOXIN_P2CW_NODE_CHECK | zhaoxin_patch_code)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/zhaoxin_kh40000.c:87:33: error: call to undeclared function 'iommu_get_dma_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^
   arch/x86/kernel/zhaoxin_kh40000.c:87:33: note: did you mean 'iommu_is_dma_domain'?
   include/linux/iommu.h:273:20: note: 'iommu_is_dma_domain' declared here
     273 | static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
         |                    ^
>> arch/x86/kernel/zhaoxin_kh40000.c:87:24: error: incompatible integer to pointer conversion initializing 'struct iommu_domain *' with an expression of type 'int' [-Wint-conversion]
      87 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                      ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
>> kernel/dma/contiguous.c:228:6: error: use of undeclared identifier 'is_zhaoxin_kh40000'
     228 |         if (is_zhaoxin_kh40000)
         |             ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CRC32C_INTEL
   Depends on [n]: CRYPTO [=y] && !KMSAN [=y] && X86 [=y]
   Selected by [y]:
   - ISCSI_TARGET [=y] && TARGET_CORE [=y] && INET [=y] && X86 [=y]


vim +/iommu_get_dma_domain +87 arch/x86/kernel/zhaoxin_kh40000.c

    64	
    65	static void kh40000_sync_single_dma_for_cpu(struct device *dev, dma_addr_t paddr,
    66			enum dma_data_direction dir, bool is_iommu)
    67	{
    68		u8 vid;
    69		struct pci_dev *pci;
    70		u64 dma_mask = *dev->dma_mask;
    71	
    72		/* check direction */
    73		if ((dir != DMA_FROM_DEVICE) && (dir != DMA_BIDIRECTIONAL))
    74			return;
    75	
    76		/* check dma capability */
    77		if (dma_mask <= DMA_BIT_MASK(32))
    78			return;
    79	
    80		/* check device type */
    81		pci = kh40000_get_pci_dev(dev);
    82		if (pci == NULL)
    83			return;
    84	
    85		/* get real physical address */
    86		if (is_iommu) {
  > 87			struct iommu_domain *domain = iommu_get_dma_domain(dev);
    88	
    89			paddr = iommu_iova_to_phys(domain, paddr);
    90			if (!paddr)
    91				return;
    92		}
    93	
    94		/* check node or not */
    95		if ((zhaoxin_patch_code & ZHAOXIN_P2CW_NODE_CHECK)
    96		   && pfn_to_nid(PFN_DOWN(paddr)) == dev_to_node(dev))
    97			return;
    98	
    99		/* flush data by one pci read cycle */
   100		pci_read_config_byte(pci, PCI_VENDOR_ID, &vid);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
