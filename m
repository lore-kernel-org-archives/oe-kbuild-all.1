Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D0430170F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167942; cv=none; b=ff2Ks/RamfOQoQw0iGpLxREY0QGwo2rQy7kRZpT5t4xDJhCXt1Zl7jlGIr/DnLcQ7yMoWqbbeOIJRWZQToRVE1zNmtBHjw8B8dPCf5MZKUi6UBCsgzdetGZ3vy4FSNjB4L9TceOzizVsYvUFjMtXMSQe+6CreOU6Mz6stm8QCro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167942; c=relaxed/simple;
	bh=XuuzzC/osA6Onn7+LL9BOX1goIZ2y0zffNKVBzNnfKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNPrCJYRw3LElxiXqyjK0IfD90Rp5b0hMmMEaLYHXjMu5TFsATVp2mXkRucA70bVXy9w+p2gK/wzJTMPGTLJXeqrsH1p0NkhCuh82pu3LbClqB5CsTf91ulWc05BLtAzlnazTH+fj3Pub8uwhcZKg6pOHgbT7RGccvTjcBQNEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O61258L/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O61258L/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762167939; x=1793703939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XuuzzC/osA6Onn7+LL9BOX1goIZ2y0zffNKVBzNnfKk=;
  b=O61258L/Zxotyjx6F8aHIHB5Su41hmRG27Wh8x1SKheu+2GeRBODvXVR
   sl1ZplPtE703jOYd8hfCLbUzsi6qLngFVJSVjEi9RCL0/yp28xVVW6gNl
   YmLBnAG+AGiV1JiYsi9lM4aHEwE7Xjc+23uD0QVntyOQztxLHdoY2JcWF
   OLcA6wEQGPFInIssWqSzePQG8dQo6a2DW06O1IeA4M+2UEDnawQh+tZ25
   HENaq+98ujYKKXmGVaiJF7qiM+WW6aKIQSWB5iT+DCST8YxH6gyPV6pcN
   VfzvwV4p0ynOAG4hD9eWNrM4wxXRaVEVYx66IW+lKgj+Ei9BRzhwfso+P
   A==;
X-CSE-ConnectionGUID: Jdf6YXXbQ+iOJ48GoPMXWA==
X-CSE-MsgGUID: OaQD+F90TuOkTBNO9cMjZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="68100723"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="68100723"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 03:05:38 -0800
X-CSE-ConnectionGUID: DmCmiqrOT5+0q8SwPWMRog==
X-CSE-MsgGUID: WfAUKj8DTy6lmuA9hpmtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="191180518"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Nov 2025 03:05:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFsNS-000Q3d-3B;
	Mon, 03 Nov 2025 11:05:34 +0000
Date: Mon, 3 Nov 2025 19:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lei Gong <gonglei25@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] include/linux/iommu.h:2001:12:
 warning: declaration of 'struct iommu_plb_gather' will not be visible
 outside of this function
Message-ID: <202511031912.GYyUucHm-lkp@intel.com>
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
commit: d46a4bd5bdfd7f1d6e2fa159398df4c54345070c [3098/3098] iommu/ummu-core: introduce iommu sva permission operation
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251103/202511031912.GYyUucHm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031912.GYyUucHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031912.GYyUucHm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:101:
>> include/linux/iommu.h:2001:12: warning: declaration of 'struct iommu_plb_gather' will not be visible outside of this function [-Wvisibility]
    2001 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^
   1 warning generated.


vim +2001 include/linux/iommu.h

  1993	
  1994	static inline int iommu_sva_ungrant(struct iommu_sva *sva, void *va,
  1995					    size_t size, void *cookie)
  1996	{
  1997		return -EOPNOTSUPP;
  1998	}
  1999	static inline void iommu_plb_sync_all(struct iommu_domain *domain) {}
  2000	static inline void iommu_plb_sync(struct iommu_domain *domain,
> 2001					struct iommu_plb_gather *plb_gather) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
