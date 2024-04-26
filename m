Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6B2E84A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 21:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167614; cv=none; b=X3RRQhwPXdafUQQt8AogjBGpwuwrJ4Eao1UxZoy69N2Q1YsPLaRlTcuRH70PBJ0svOQ2Fv3dKI1vqPgJ6PLQNoGrGRkkOgWctBZZzpF6al99vgDKhmz7HoF0djw9QTeJuF+mPXggGCuqVO34IonMJeH8jGFg63JiiyZqBEvOgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167614; c=relaxed/simple;
	bh=kCCxyYIBoZZk7Bo4YQnHILsKwvjQ+j9XRedhXvKyIFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/8yfJwZSySPb2+v6bStsarLginWT9yMZqhJdLEhpF1bmrZTTM5pGscKfLIr5MsSZ2GqmwTBz4FAZ3NgK4ZQN6LU2ldNI8zWKUT+iBPPz1Rd0kSsXtbzx3sC+s/BdbpauRwXN6sT3flxtEWedQ9HmXuuOzonhagP21ORN0eYsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFqQ8Z84; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFqQ8Z84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714167613; x=1745703613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kCCxyYIBoZZk7Bo4YQnHILsKwvjQ+j9XRedhXvKyIFk=;
  b=oFqQ8Z846Nh65bH0OjlOESFaV6NTVowBGhrn4W6cphy6rIa2L0J+M7HP
   yR7nptNkFltyw/MBSJY4pK2T5cT8P+S78VXpsrPq1kLYhszQuoqLllc2U
   so6pX0MSLnZrKTphfFP7b54o2sgWBp44k7hWgnT/RNk/7+F7gZveG7ZXG
   yfrDvh/+UawmazYlY5JU/61X2/aww4SqEi0FpVIVJF4PzdMDSX3faq0Pr
   4DLqzwJnOzxQzGwpENaD8YdfrMo75N1jVrQuQv108kWvFrGflUwyZwPSs
   SvjbLT9A3yUMgMzonheggUhVWdu8FAQInGHqNy432gYt5bI0GoaCcxQ9V
   Q==;
X-CSE-ConnectionGUID: QuxlDvuiSLK42Mfq4Uy6+Q==
X-CSE-MsgGUID: ewMJAlyKTRaG7vyDHSDtOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10038653"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="10038653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 14:40:12 -0700
X-CSE-ConnectionGUID: 5TAExqfjTP+PFr09xnVR7A==
X-CSE-MsgGUID: Bh2SJdtrQqeDFhpJRC28NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25512564"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Apr 2024 14:40:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0TIf-0004Jc-0P;
	Fri, 26 Apr 2024 21:40:09 +0000
Date: Sat, 27 Apr 2024 05:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/2]
 drivers/virt/gunyah/rsc_mgr.c:303:47: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202404270558.Suh6r63T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   fa87a072a7fccf51d1c23869af2cb6b423e7b38a
commit: 4db95aa21ae4d2b0fc50c8e538e692bca8fd8c4c [1/2] ANDROID: virt: gunyah: Do not allocate irq for GH_RM_RESOURCE_NO_VIRQ
config: arm64-randconfig-r113-20240427 (https://download.01.org/0day-ci/archive/20240427/202404270558.Suh6r63T-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404270558.Suh6r63T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270558.Suh6r63T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/gunyah/rsc_mgr.c:303:47: sparse: sparse: restricted __le32 degrades to integer

vim +303 drivers/virt/gunyah/rsc_mgr.c

   289	
   290	struct gh_resource *gh_rm_alloc_resource(struct gh_rm *rm, struct gh_rm_hyp_resource *hyp_resource)
   291	{
   292		struct gh_resource *ghrsc;
   293		int ret;
   294	
   295		ghrsc = kzalloc(sizeof(*ghrsc), GFP_KERNEL);
   296		if (!ghrsc)
   297			return NULL;
   298	
   299		ghrsc->type = hyp_resource->type;
   300		ghrsc->capid = le64_to_cpu(hyp_resource->cap_id);
   301		ghrsc->irq = IRQ_NOTCONNECTED;
   302		ghrsc->rm_label = le32_to_cpu(hyp_resource->resource_label);
 > 303		if (hyp_resource->virq && hyp_resource->virq != GH_RM_RESOURCE_NO_VIRQ) {
   304			struct gh_irq_chip_data irq_data = {
   305				.gh_virq = le32_to_cpu(hyp_resource->virq),
   306			};
   307	
   308			ret = irq_domain_alloc_irqs(rm->irq_domain, 1, NUMA_NO_NODE, &irq_data);
   309			if (ret < 0) {
   310				dev_err(rm->dev,
   311					"Failed to allocate interrupt for resource %d label: %d: %d\n",
   312					ghrsc->type, ghrsc->rm_label, ret);
   313				kfree(ghrsc);
   314				return NULL;
   315			} else {
   316				ghrsc->irq = ret;
   317			}
   318		}
   319	
   320		return ghrsc;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
