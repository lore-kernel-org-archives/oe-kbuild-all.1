Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE107214204
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762209992; cv=none; b=BqV8afgiU6POuE8oYM7LefeuALEGkNOQTNfNe++powZGH444aem08qhwy5FgP3HV41fKsW+o2kl4YoW0SDBbhi4QvyH1jXb5u6BEIfGmu4vcRAdJ6G1SEkwC5S+tDM8wgZNWPRYzJKq/NBlm2gaWVk6M+NF/PUs7chOjN/IFv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762209992; c=relaxed/simple;
	bh=vKZ5KIBm5SK5zrxLPdK6L6t+Peqdm/9FLh0LeOZpBAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2Cr3i2OJkTHnn/gioHS5YiSCkrV5KXYQhoBppm/BcBDVlpa3kn0pOj5Clb4cHR12wP2wmLK5xgt791x2yA3X+8uRYkE+yWD4tXSasOD5Ee2XPVqH4p68PtY/Xz2Gh5C0ncMcwJLKybMZ5nrqdQ1o5QRgznDKjwXStOqEaMZ+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOz4TQdp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOz4TQdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762209990; x=1793745990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vKZ5KIBm5SK5zrxLPdK6L6t+Peqdm/9FLh0LeOZpBAk=;
  b=fOz4TQdpt3/Dlto55O2RBbKL1orEJJ4yfIJgoxYW+GTpwe1hopLOn6vA
   jj7/6YlpXycWiaGndfNxV88Cl/mkMWYgyyN8j8saMM5OiNCZqlyKAaCZV
   l29jcYW8sftJoMHpLXq8LZuJqaC3V+esr8vasQ0HpVNTMjeNhPRkpQh9H
   zP5V0oMF4c/AfLPq4zX3S/IXVQ3SJYZgKEiahxk40NeeghhikUXs97V0/
   0KzAG9xDkghK+JK7fHxxZSQ7B+htb7ateRvxgDReCNNz4SqC6HHUK8DJf
   EHRx5zVpwzjLFdEZan0vZKh7OTRVq/rbpyYmef1/nEZ/3HF8e299m73Z9
   g==;
X-CSE-ConnectionGUID: cSz7iT/3T2u+TJaje0Dl7A==
X-CSE-MsgGUID: MiteBVJaTsqPF1oSA6diKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="86921679"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="86921679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 14:46:30 -0800
X-CSE-ConnectionGUID: lxtXWtmGTKSbkE3PTLWAxg==
X-CSE-MsgGUID: g+4dqAA0QYKKfON65JrNzg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 14:46:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG3Jj-000Qam-04;
	Mon, 03 Nov 2025 22:46:27 +0000
Date: Tue, 4 Nov 2025 06:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lei Gong <gonglei25@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098]
 drivers/iommu/hisilicon/ummu-core/core_iova.c:252:19: warning: no previous
 prototype for function 'dma_alloc_iova'
Message-ID: <202511040647.7fLTNmOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 80e4e47da66d941f2265d9d6c449880553254119 [3098/3098] iommu/ummu-core: support IOVA on demand mapping
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251104/202511040647.7fLTNmOG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040647.7fLTNmOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040647.7fLTNmOG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/hisilicon/ummu-core/core_iova.c:252:19: warning: no previous prototype for function 'dma_alloc_iova' [-Wmissing-prototypes]
     252 | struct iova_slot *dma_alloc_iova(struct device *dev, size_t size,
         |                   ^
   drivers/iommu/hisilicon/ummu-core/core_iova.c:252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     252 | struct iova_slot *dma_alloc_iova(struct device *dev, size_t size,
         | ^
         | static 
>> drivers/iommu/hisilicon/ummu-core/core_iova.c:290:6: warning: no previous prototype for function 'dma_free_iova' [-Wmissing-prototypes]
     290 | void dma_free_iova(struct iova_slot *slot)
         |      ^
   drivers/iommu/hisilicon/ummu-core/core_iova.c:290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     290 | void dma_free_iova(struct iova_slot *slot)
         | ^
         | static 
>> drivers/iommu/hisilicon/ummu-core/core_iova.c:298:5: warning: no previous prototype for function 'ummu_fill_pages' [-Wmissing-prototypes]
     298 | int ummu_fill_pages(struct iova_slot *slot, dma_addr_t iova, unsigned long nr_pages)
         |     ^
   drivers/iommu/hisilicon/ummu-core/core_iova.c:298:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     298 | int ummu_fill_pages(struct iova_slot *slot, dma_addr_t iova, unsigned long nr_pages)
         | ^
         | static 
>> drivers/iommu/hisilicon/ummu-core/core_iova.c:333:5: warning: no previous prototype for function 'ummu_drain_pages' [-Wmissing-prototypes]
     333 | int ummu_drain_pages(struct iova_slot *slot, dma_addr_t iova, unsigned long nr_pages)
         |     ^
   drivers/iommu/hisilicon/ummu-core/core_iova.c:333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     333 | int ummu_drain_pages(struct iova_slot *slot, dma_addr_t iova, unsigned long nr_pages)
         | ^
         | static 
   4 warnings generated.


vim +/dma_alloc_iova +252 drivers/iommu/hisilicon/ummu-core/core_iova.c

   251	
 > 252	struct iova_slot *dma_alloc_iova(struct device *dev, size_t size,
   253					 unsigned long attrs, dma_addr_t *iovap,
   254					 size_t *sizep)
   255	{
   256		struct iommu_domain *domain;
   257		struct iova_slot *slot;
   258		dma_addr_t iova;
   259		int ret;
   260	
   261		size = PAGE_ALIGN(size);
   262		domain = iommu_get_domain_for_dev(dev);
   263		if (!domain || !iommu_is_dma_domain(domain)) {
   264			ret = -ENODEV;
   265			goto err_out;
   266		}
   267		iova = domain_alloc_iova(domain, size, dev->coherent_dma_mask, dev);
   268		if (!iova) {
   269			ret = -EFAULT;
   270			goto err_out;
   271		}
   272	
   273		slot = alloc_iova_slot(dev, iova, size, attrs);
   274		if (!slot) {
   275			ret = -ENOMEM;
   276			goto err_free_iova;
   277		}
   278	
   279		*iovap = iova;
   280		*sizep = size;
   281		return slot;
   282	
   283	err_free_iova:
   284		domain_free_iova(domain, iova, size);
   285	err_out:
   286		return ERR_PTR(ret);
   287	}
   288	EXPORT_SYMBOL_GPL(dma_alloc_iova);
   289	
 > 290	void dma_free_iova(struct iova_slot *slot)
   291	{
   292		drain_pages(slot, slot->iova, slot->nr_pages);
   293		domain_free_iova(slot->domain, slot->iova, slot->nr_pages << PAGE_SHIFT);
   294		free_iova_slot(slot);
   295	}
   296	EXPORT_SYMBOL_GPL(dma_free_iova);
   297	
 > 298	int ummu_fill_pages(struct iova_slot *slot, dma_addr_t iova, unsigned long nr_pages)
   299	{
   300		struct page **pages;
   301		unsigned long i;
   302		int ret;
   303	
   304		if (!IS_ALIGNED(iova, PAGE_SIZE) || !nr_pages)
   305			return -EINVAL;
   306	
   307		if (!check_iova_range(slot, iova, nr_pages))
   308			return -EINVAL;
   309	
   310		if (!check_iova_bitmap_region(slot, iova_bitmap_offset(slot, iova), nr_pages, true))
   311			return -EEXIST;
   312	
   313		pages = allocate_pages(slot->dev, nr_pages, GFP_KERNEL | __GFP_ZERO);
   314		if (!pages)
   315			return -ENOMEM;
   316	
   317		ret = map_pages(slot, iova, nr_pages, pages);
   318		if (ret != 0)
   319			goto err_free_pages;
   320	
   321		bitmap_set(slot->bitmap, iova_bitmap_offset(slot, iova), nr_pages);
   322		kvfree(pages);
   323		return 0;
   324	
   325	err_free_pages:
   326		for (i = 0; i < nr_pages; i++)
   327			__free_page(pages[i]);
   328		kvfree(pages);
   329		return ret;
   330	}
   331	EXPORT_SYMBOL_GPL(ummu_fill_pages);
   332	
 > 333	int ummu_drain_pages(struct iova_slot *slot, dma_addr_t iova, unsigned long nr_pages)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
