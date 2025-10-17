Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E02F3595C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 03:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760757443; cv=none; b=lfn9Bhqh9hwimZRVl8pg40rLI56Cxqg9IR92NCgWRDJPd3ZGSwRnBL9zTvKDiW9f2HhAzfi/l+wiynNCMW3j4SwXUCs9RtbZPgi7v6SKFGQ5t4jNnAQNQbyBU0aawy0frTpl2eoYOnFjPSdmBHGZPdzavotdbVRef90pP8L3SMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760757443; c=relaxed/simple;
	bh=4LEdStxS6AyFYp91UBkvt11xG4HZW0OkQEvApvbX9XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCHeVnCO9vNBAdPoJoWpiyX9FkZ/FdighFVtI9IiKee4ylE151WSeyEXVfPAsMCCcKsilRZm2i9Lenmtpj75rVIOmq2ZG+yE+U9HK9I9PcedQ6pNMZAvWJoctA7bhm4PHgjVt/MjydOCsAwXwEIz0UPf3GAc0oBy1nNyTfDmHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+9uJdFr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+9uJdFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760757441; x=1792293441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LEdStxS6AyFYp91UBkvt11xG4HZW0OkQEvApvbX9XU=;
  b=V+9uJdFraWx/Mv/FBoEoaAXnvlV7Pcb+BxBI3/AZ042YTq/PJakfpn8I
   K6n53Y8Azv3XxyM84RH+MRWt8TBrYSn8Ul8AuoC++knuZlKtXuTv/wsy8
   9AVxoKF1KUT1OGzT3QHT2mS+j+8yelj2BUjoCiOFTQoEUR274pQ4NOoU4
   Nth8y7HPSd/qMYEKGuPBXy/gYNDLsJG7tJVXgvGEcT1Vj1fkCBagiIf6Z
   srZ90nv0PViNV1ffmmVcgjywtjc4SSnoRok57XgeCwjsZ1Tz0tLhx3tMf
   zoFV0gEtNj9ZM9MQLZLmAmfRtoqc/lI9c0ORYS2kF7jozWUqd+Q/4PUJ4
   w==;
X-CSE-ConnectionGUID: kzZ+Zw2FRRWJ378YiheEtQ==
X-CSE-MsgGUID: oAoZPqfHTquIhP7ZR4vRhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63120458"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="63120458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:17:14 -0700
X-CSE-ConnectionGUID: 1HOTFB2rRduC6Ciu6pTZFg==
X-CSE-MsgGUID: 9q3HmR7CSS+6lWUKjEqtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="186830506"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2025 12:55:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9qXn-0007ir-0c;
	Fri, 17 Oct 2025 19:55:19 +0000
Date: Sat, 18 Oct 2025 03:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 20/24]
 drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of
 `iommufd_test_dma_buf_iommufd_map';
 drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742:
 first defined here
Message-ID: <202510180312.E1VVzjXy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   e1e0600b1a5699114df3ae378cd69a7f953e5b3d
commit: 5849b503c1771ec07a34aca7fa51ef3788514f29 [20/24] iommufd/selftest: Add some tests for the dmabuf flow
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251018/202510180312.E1VVzjXy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180312.E1VVzjXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180312.E1VVzjXy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/iommufd/eventq.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/hw_pagetable.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/ioas.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/main.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/pages.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/vfio_compat.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here
   ld: drivers/iommu/iommufd/viommu.o: in function `iommufd_test_dma_buf_iommufd_map':
>> drivers/iommu/iommufd/iommufd_private.h:742: multiple definition of `iommufd_test_dma_buf_iommufd_map'; drivers/iommu/iommufd/device.o:drivers/iommu/iommufd/iommufd_private.h:742: first defined here


vim +742 drivers/iommu/iommufd/iommufd_private.h

   706	
   707	#ifdef CONFIG_IOMMUFD_TEST
   708	int iommufd_test(struct iommufd_ucmd *ucmd);
   709	void iommufd_selftest_destroy(struct iommufd_object *obj);
   710	extern size_t iommufd_test_memory_limit;
   711	void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
   712					   unsigned int ioas_id, u64 *iova, u32 *flags);
   713	bool iommufd_should_fail(void);
   714	int __init iommufd_test_init(void);
   715	void iommufd_test_exit(void);
   716	bool iommufd_selftest_is_mock_dev(struct device *dev);
   717	int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
   718					     struct phys_vec *phys);
   719	#else
   720	static inline void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
   721							 unsigned int ioas_id,
   722							 u64 *iova, u32 *flags)
   723	{
   724	}
   725	static inline bool iommufd_should_fail(void)
   726	{
   727		return false;
   728	}
   729	static inline int __init iommufd_test_init(void)
   730	{
   731		return 0;
   732	}
   733	static inline void iommufd_test_exit(void)
   734	{
   735	}
   736	static inline bool iommufd_selftest_is_mock_dev(struct device *dev)
   737	{
   738		return false;
   739	}
   740	int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
   741					     struct phys_vec *phys)
 > 742	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
