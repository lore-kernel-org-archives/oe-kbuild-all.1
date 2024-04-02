Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC805D75F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052666; cv=none; b=Sr5CH21MSlTIVS3IwEVtVP3/HcTXuYKuG2ac19BM9JmpzMsyNcgPzxIAgMaZIUbqKJuebjXXdMQyTfur6faKaWeV2lB2nNBwVPy9waOW92/ga9009+htwAQa3pmWIbtqhk62ILnRPDohhZzTHw2/rvOM8QI+/QKct2c8rAY0xU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052666; c=relaxed/simple;
	bh=nHhBe2OOjtY8cfSKSO8fdJJSzEWPeSGhQKemkb6dJIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TotJ3Imr5e12+Cm3cZDXJ85QU/nhC6O5+isF7IqcJjWcKpUux65aEH65WYS6LsgaJ4/Z/DdFLpV9xg41hwM3UA33O8JukRqzMbwMZ3l+93zCbDJO7hSj2KuVAf4LG4eTC11Ro+/8hVLncdBkyC/IZhqyTD+ClOb7js8TFsHFWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/NHP9RI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/NHP9RI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712052662; x=1743588662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHhBe2OOjtY8cfSKSO8fdJJSzEWPeSGhQKemkb6dJIo=;
  b=A/NHP9RISIzvNrsuqrIWViMaB8CLd1mLj/02x5WAzjmkVfeICTR+qnCE
   gi8ITwY/0BYHDRC8VtIOF1cTaeaoFJP07foVe5VMNhyMQwlRD5VgsmRwR
   pAE3m3O30L4OSs4TU/bB5ikDl+wTLG42TKjwnANLIMeQVs515UtrfwLjZ
   lXCYrKM627H+WcmnqYXDgZN6D3pA1+ZQHyTgOCFphqEtJlP1o1V/sdPIz
   qogsNMHIK99oGRtSFpsUB9KkNL/OOafRNxX6+bJPqhcHnTTkZGe5+wCgx
   VA5HiPAHuR+PiXHlUijAugspxyHlNk7YuGoTCJn/jHlvUcUmOkYLkuTH4
   A==;
X-CSE-ConnectionGUID: NSI+rbdMQW+QebkEtPXdOA==
X-CSE-MsgGUID: bLvOC6HYSyqClvnH1P3toA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11045502"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="11045502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="22700900"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2024 03:11:00 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrb6Y-00016b-1f;
	Tue, 02 Apr 2024 10:10:58 +0000
Date: Tue, 2 Apr 2024 18:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommufd-io-pgfault-delivery-v4 4/12]
 include/linux/iommu.h:1527:1: error: expected identifier or '(' before '{'
 token
Message-ID: <202404021853.vrUq3dBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommufd-io-pgfault-delivery-v4
head:   91344398110065da3f748b104d4b54d44414e3d6
commit: 962e4c5599b0bd8a513c2f1ee3261373b8ca996a [4/12] iommu: Replace sva_iommu with iommu_attach_handle
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240402/202404021853.vrUq3dBo-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021853.vrUq3dBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021853.vrUq3dBo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:102:
>> include/linux/iommu.h:1527:1: error: expected identifier or '(' before '{' token
    1527 | {
         | ^
   include/linux/iommu.h:1526:1: warning: 'iommu_sva_bind_device' declared 'static' but never defined [-Wunused-function]
    1526 | iommu_sva_bind_device(struct device *dev, struct mm_struct *mm);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/io-pgtable.h:6,
                    from drivers/iommu/amd/iommu.c:30:
>> include/linux/iommu.h:1527:1: error: expected identifier or '(' before '{' token
    1527 | {
         | ^
   drivers/iommu/amd/iommu.c: In function 'iommu_poll_ppr_log':
   drivers/iommu/amd/iommu.c:833:21: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     833 |                 u64 entry[2];
         |                     ^~~~~
   include/linux/iommu.h: At top level:
   include/linux/iommu.h:1526:1: warning: 'iommu_sva_bind_device' declared 'static' but never defined [-Wunused-function]
    1526 | iommu_sva_bind_device(struct device *dev, struct mm_struct *mm);
         | ^~~~~~~~~~~~~~~~~~~~~


vim +1527 include/linux/iommu.h

2396046d75d3c0 Tina Zhang 2023-10-27  1516  
cd3891158a7768 Jacob Pan  2023-03-22  1517  void mm_pasid_drop(struct mm_struct *mm);
962e4c5599b0bd Lu Baolu   2024-04-02  1518  struct iommu_attach_handle *iommu_sva_bind_device(struct device *dev,
be51b1d6bbff48 Lu Baolu   2022-10-31  1519  						  struct mm_struct *mm);
962e4c5599b0bd Lu Baolu   2024-04-02  1520  void iommu_sva_unbind_device(struct iommu_attach_handle *handle);
962e4c5599b0bd Lu Baolu   2024-04-02  1521  u32 iommu_sva_get_pasid(struct iommu_attach_handle *handle);
17c51a0ea36b80 Lu Baolu   2024-02-12  1522  struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
17c51a0ea36b80 Lu Baolu   2024-02-12  1523  					    struct mm_struct *mm);
be51b1d6bbff48 Lu Baolu   2022-10-31  1524  #else
962e4c5599b0bd Lu Baolu   2024-04-02  1525  static inline struct iommu_attach_handle *
962e4c5599b0bd Lu Baolu   2024-04-02  1526  iommu_sva_bind_device(struct device *dev, struct mm_struct *mm);
be51b1d6bbff48 Lu Baolu   2022-10-31 @1527  {
962e4c5599b0bd Lu Baolu   2024-04-02  1528  	return ERR_PTR(-ENODEV);
be51b1d6bbff48 Lu Baolu   2022-10-31  1529  }
be51b1d6bbff48 Lu Baolu   2022-10-31  1530  

:::::: The code at line 1527 was first introduced by commit
:::::: be51b1d6bbff48c7d1943a8ff1e5a55777807f6e iommu/sva: Refactoring iommu_sva_bind/unbind_device()

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
