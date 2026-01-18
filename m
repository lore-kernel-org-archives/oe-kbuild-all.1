Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4964330E0FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 22:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768776811; cv=none; b=TRRqN50ZhglI7Q2AHlYqeWb2SVPLu8g4b/sX+sM+EuU8HE5uiWQohH6Ef5nX/ha6+/AIj+59uqNfvDsKUs4MN27O/fC6Po3xs4uC00304MsLh4wViTwEszt/mZLvKpJ1iYFgl4Rp5kwPzCDcfnBB4lBi+xuXK4dx/EnOYPdZhbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768776811; c=relaxed/simple;
	bh=608xHY12VKThpAfrqL1UNPuJ4X3JTR73SykD6MTNbYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UZygPwUclFB8fwxnb3/aGbcCb+siJNdUKSI/wtLgxFTGq5LWQwJGA4q9hzYp5k4bMAIisB59l3mJr0RJVtjFn2J1O07M5lGhU5fRb2D6Nao73L8QkF+XxCTtOSt7jopWNC7FXn1ec2MgQRfYdbysHzabTFK6YUvAmA2HRyp7QqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLdaWHAb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLdaWHAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768776808; x=1800312808;
  h=date:from:to:cc:subject:message-id;
  bh=608xHY12VKThpAfrqL1UNPuJ4X3JTR73SykD6MTNbYE=;
  b=fLdaWHAbCArfnB8Snq0zWm1dk0CJMgY+tUi3w6apG+yMd5cm88XFszdS
   HC9HmZvF4FDAwHKIfz07JoUUKzRb9rylLQE7PMaOn62H82/lnED3DTjpi
   QMMRmLPftYS5cv8J9nTJdd6zyzl92bo0zBSuZQMV+or9XgM/EqMQk+O5y
   HryodyaGbusny66rbbDefDLULlqUDUAF5pE31Aio7uDROUsD5XKNdS3Gr
   wr0HpB+zxt7HkwQdz9Bp9KLb/EAgvKMzoNVXvQCjPm2pw6K4/H1xwgViu
   W9WEXfhfGFcE4Mcj/pHdyT4cx4Wsg3rYtHVGSRH0Wx2o2FhJyFcp6aZw8
   g==;
X-CSE-ConnectionGUID: XShAOCHjQuiGbyVOyxJ9Lw==
X-CSE-MsgGUID: AjhSS7tOSk62+WHV4jXzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81106947"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="81106947"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 14:53:27 -0800
X-CSE-ConnectionGUID: nqqjqtKVTBSnIEd7HeySlQ==
X-CSE-MsgGUID: C0+FRtbLTx2L2RiZL6ZHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="206086184"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jan 2026 14:53:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhbe7-00000000NH7-1xPt;
	Sun, 18 Jan 2026 22:53:23 +0000
Date: Mon, 19 Jan 2026 06:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>
Subject: [iommu:amd/amd-vi 12/15] drivers/iommu/amd/iommufd.c:62:27:
 warning: unused variable 'iommu'
Message-ID: <202601190634.bl7Mjx5Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git amd/amd-vi
head:   103f4e7c8544961c72dd9f68eed384a2f1194d03
commit: 757d2b1fdf5b7d6eead5963a49b5780617987ab8 [12/15] iommu/amd: Introduce gDomID-to-hDomID Mapping and handle parent domain invalidation
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190634.bl7Mjx5Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190634.bl7Mjx5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190634.bl7Mjx5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/amd/iommufd.c: In function 'amd_iommufd_viommu_destroy':
>> drivers/iommu/amd/iommufd.c:62:27: warning: unused variable 'iommu' [-Wunused-variable]
      62 |         struct amd_iommu *iommu = container_of(viommu->iommu_dev, struct amd_iommu, iommu);
         |                           ^~~~~

New smatch warnings:
drivers/iommu/amd/nested.c:161 amd_iommu_alloc_domain_nested() warn: 'gdom_info->hdom_id' unsigned <= 0
drivers/iommu/amd/iommu.c:1558 iommu_flush_pages_v1_hdom_ids() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/iommu/amd/iommu.c:1483 domain_flush_complete() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:1712 domain_flush_pages_v1() warn: iterator 'i' not incremented
drivers/iommu/amd/iommu.c:2247 init_gcr3_table() warn: missing error code? 'ret'
drivers/iommu/amd/iommu.c:2503 amd_iommu_probe_device() error: uninitialized symbol 'dev_data'.
drivers/iommu/amd/iommu.c:2505 amd_iommu_probe_device() error: uninitialized symbol 'dev_data'.

vim +/iommu +62 drivers/iommu/amd/iommufd.c

    58	
    59	static void amd_iommufd_viommu_destroy(struct iommufd_viommu *viommu)
    60	{
    61		unsigned long flags;
  > 62		struct amd_iommu *iommu = container_of(viommu->iommu_dev, struct amd_iommu, iommu);
    63		struct amd_iommu_viommu *aviommu = container_of(viommu, struct amd_iommu_viommu, core);
    64		struct protection_domain *pdom = aviommu->parent;
    65	
    66		spin_lock_irqsave(&pdom->lock, flags);
    67		list_del(&aviommu->pdom_list);
    68		spin_unlock_irqrestore(&pdom->lock, flags);
    69		xa_destroy(&aviommu->gdomid_array);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
