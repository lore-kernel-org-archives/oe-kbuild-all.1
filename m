Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5D311967
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205962; cv=none; b=GijfAXpYfwB5rG/CKnvuIQJbsa+rVlnb2IA8KGBWOVvRZ0cQS1b9DAPoVYkYFna/8tazXaVJ3MchwJ10r6mgMuk1MG6liPGhGrEhkV8QmOszqies2rVgU0WKw53VfI076ILjmhMVMlmuQh+SFsJ9/ZgbROd8gzcyXPu51Yi9aZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205962; c=relaxed/simple;
	bh=DqSqol2mbFaG4KAynRfzxQC4FPVmNHgoLmcjO7uoHtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=irGf5IGTZAF0MeQyrnQc2ZVRgJuOkONYM0a3cqA1X0uqgMBv8lxT2QlHOcQdfh8sF9R9+0AnWdjag/IFwGhGvajEIxr7yjGrswo0kWf4TcZynYCF0nAqnZXuGDx6i4pTgPQaC/DVWZ2DB+dxBaAS3Yj4WmkfWRnxisO2ScndjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoksPwHV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoksPwHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205962; x=1806741962;
  h=date:from:to:cc:subject:message-id;
  bh=DqSqol2mbFaG4KAynRfzxQC4FPVmNHgoLmcjO7uoHtI=;
  b=BoksPwHVGxtwamP3dHEpCHrS7Pw/mp0BB+3fiyCpSM0Iut9OHXbn+JDQ
   Y6096/aIK1PfCNgkWaOmtHFz6kOPOgX5E18s8dJX5qaHv0hz1H2Op4MBn
   UkegxAMzFblO6W0KK8L7aV/IM7DquzRGk6VSNZhg4RKGoBRqonLjN5w69
   eoJZzYOYHLfCP5PLh0i5FZHzSosQPIEezl6NYsQDPoptLUHpCefrXbXPn
   QaMZk1Zcv/DOSROX2Gwt8E0xuKl5NlObEBbdA+tAY/iEFf8iK9klUMj5R
   /QIheS/0v58vqYQ0wWZ/UmAV+LGWulGpfmjjqiNRFegf+xX5ysXEbx7CC
   g==;
X-CSE-ConnectionGUID: YLyEsNVfSdqULL8Zt7MGQw==
X-CSE-MsgGUID: VkHvB2qBRIe8DWjax9Xskg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75993486"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75993486"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: OglLBkkzRlKWmarB5Ab0lw==
X-CSE-MsgGUID: ZNmabm7STsy6IUGRx9OL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232134361"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000016G-2dAm;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 16/53]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:62:22: warning: variable
 'item_lg2sz' set but not used
Message-ID: <202604030919.Gdy3tRkH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   386de42c67a6d6b567ec9167593768eec79b8ce5
commit: 9f2e457e1598eab7d293e370fef201274accfc35 [16/53] iommupt: Add PT_FEAT_DETAILED_GATHER
config: x86_64-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030919.Gdy3tRkH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030919.Gdy3tRkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030919.Gdy3tRkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:40,
                    from drivers/iommu/generic_pt/fmt/iommu_x86_64.c:11:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h: In function 'gather_add_leaf':
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:62:22: warning: variable 'item_lg2sz' set but not used [-Wunused-but-set-variable]
      62 |         unsigned int item_lg2sz;
         |                      ^~~~~~~~~~


vim +/item_lg2sz +62 drivers/iommu/generic_pt/fmt/../iommu_pt.h

    58	
    59	static void gather_add_leaf(struct iommupt_pending_gather *pending,
    60				    const struct pt_state *pts)
    61	{
  > 62		unsigned int item_lg2sz;
    63	
    64		if (!pts_feature(pts, PT_FEAT_DETAILED_GATHER))
    65			return;
    66	
    67		item_lg2sz = pt_table_item_lg2sz(pts);
    68	
    69		pending->leaf_levels_bitmap |= BIT(pts->level);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
