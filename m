Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824A283FE5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169989; cv=none; b=Cs4/QFP0M6gpQt0oySWVrIBPV1GxdjdzwNI2wuUUKGwyMU8ULxeqTSH10/s1wWiteKedyVr8G5rY2lobsMSI72GcvPfTd9lnzS43wr8EfiynJeYciJecc9iDLvJmypCsU68kc84oax+ZAGr9IRir7GZkCvwsQtHYIqQk7Siaw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169989; c=relaxed/simple;
	bh=Ru4tNLGTudaBdAYnHZJymCoZHMDiGZS0dlaWNEwTd+g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SjKddQc6B66zNBSbGjHYBgZeFM5LKHbFJbNNQzSEm9G+4iG/+o2ywTi5+wM1ZysCdqX4hz8xLsgoXy4nquCi9E/PNoK0PcOtu1es6buFGf3Jp+D1TtTQl9vraFrc3omjwtXkepaACOD7aRUcHb8r/GmhqG7ih4GuAxns25BvB2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsvVz///; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsvVz///"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775169989; x=1806705989;
  h=date:from:to:cc:subject:message-id;
  bh=Ru4tNLGTudaBdAYnHZJymCoZHMDiGZS0dlaWNEwTd+g=;
  b=TsvVz///utCuJTEa8xk4KOb4tuMhgSSaWachcKDyz2E5+lfnmQhrvYZw
   hSPgFYVP85lAbhsbcnT2gdSPv0OSoHPrBuNbS1rIUS+giqCUZeilHywsL
   a7Z6KMt6a5uJiyclU2LIKy51VQLnwsVw6ZFryHkGJrvcdzzQ2jxC/na2f
   IVRr7rMwswSdbcPa4CK2z+GhkofhCu24yxRVdSb6ChMgVBc4YD/5sFFYN
   D+QZFGdUI9RiTMctuV2NCVZCOHaxDj4vqU40jtdLsq60b1R/wZg5SuzGE
   ufmTC5rK2qicVSeppsiWJc4nsgiBTuDb6FspOEQK+kj3D9xGFVIt5FhAJ
   Q==;
X-CSE-ConnectionGUID: jmS43XitT7+0u6OlKYQrxA==
X-CSE-MsgGUID: 03uBQS3jQPeG3/1CJ+pS1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75958638"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75958638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 15:46:28 -0700
X-CSE-ConnectionGUID: qJy7YeVtQ+iCesHOAYSr6w==
X-CSE-MsgGUID: fisIRmOTRv66sLIo1CFlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="222749920"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2026 15:46:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8Qnw-000000009B3-30bS;
	Thu, 02 Apr 2026 22:46:24 +0000
Date: Fri, 03 Apr 2026 00:46:22 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 2/53] error[E0063]: missing field
 `tlb_add_range` in initializer of `bindings::iommu_flush_ops`
Message-ID: <202604030016.kaqF7YGb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   386de42c67a6d6b567ec9167593768eec79b8ce5
commit: 8d60c0982024bbd9eb8a2e118fc8b55e67b0edff [2/53] iommu: Always fill in gather when unmapping
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260403/202604030016.kaqF7YGb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030016.kaqF7YGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030016.kaqF7YGb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `tlb_add_range` in initializer of `bindings::iommu_flush_ops`
   --> rust/kernel/iommu/pgtable.rs:225:52
   |
   225 | static NOOP_FLUSH_OPS: bindings::iommu_flush_ops = bindings::iommu_flush_ops {
   |                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^ missing `tlb_add_range`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
