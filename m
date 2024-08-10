Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC29132124
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 04:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723265822; cv=none; b=AcdtNlV9bsRrwuunw2gMNiQteU19YYjpjD1M7/5vKjx1dzkXbG249GOBxLjZw0uAH1cUlTtWv6nVjE7xtIZWv9bPQaKgctOZ0BcWO1rz598BqH+hCn8eaQryy1L06B09HHukjKSPQTA54CBM2RV3iSarXMHEzniJ/OfSlev77nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723265822; c=relaxed/simple;
	bh=zGTTmOujNFrRhjsqW87nn9gQOpJTl9QJdbyhX7xaous=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gooxOv8RuksNR//FEnn5AhyLqb4sJ2Odba5t9HxR2/CbdxY/YmoA84S5wdUJPOJ+rnU1krE/xhcDywhZbvzpFRqZxHMN27P6l/P+htg/QVMxIz5bgFUsMRZl1mVHH7L2aTa6PMS1uB1mDYqSOKJCqs8GLPrBDdu4jh7F7ncJcoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krw0NjAY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krw0NjAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723265821; x=1754801821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGTTmOujNFrRhjsqW87nn9gQOpJTl9QJdbyhX7xaous=;
  b=krw0NjAYKAerZPmQZnuqjKt15dSNh3YddF4NyBPiHMu2HK5WqDVRr2Z/
   G12oEiCPO4Qgew+fVht+FIUBmSF5dCpK8bXDQobxDNurLrf+xKJmUIUyf
   lTNr02We8iKb1uDbmLMm6WuJySCObn+GYCyKe0lK66goqp4emyLr7WfmT
   lYfXl5zZHVS7pLuyephkQsV4nU1jkkXdo3X/UO9M0UKw4tq2ovRDU3Yry
   3BDgaOVWGolmXinbu/cjR2rcFcfgDYspG3YWTdNPGqO8I0xNLE8Tebcty
   Qc8QdeXGugy0iocwZWcSgzqWnYXwUmXMUnBlkUIzNr0S0/FfFQaKF9aYI
   Q==;
X-CSE-ConnectionGUID: EJS3eF0LRNGCDPvCfz4Wgg==
X-CSE-MsgGUID: /Vd+YNi8RI+z0oLdpEXwTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25244996"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="25244996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 21:57:00 -0700
X-CSE-ConnectionGUID: /00kqqaBS/uj4DL5mpBZHA==
X-CSE-MsgGUID: O2Dn1+C9QPWBV9r86uwC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="62596994"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Aug 2024 21:56:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sce9w-0009dJ-0S;
	Sat, 10 Aug 2024 04:56:56 +0000
Date: Sat, 10 Aug 2024 12:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7838/23480]
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o: warning: objtool:
 nvkm_mmu_oneinit()+0x7b2: unreachable instruction
Message-ID: <202408101202.aWgNk9Gj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1ee05443d1dbf5cf95dcc762bb2baa828e2ccbcc
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [7838/23480] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-161-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101202.aWgNk9Gj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101202.aWgNk9Gj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101202.aWgNk9Gj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c:65:1: warning: no previous prototype for function 'nvkm_mmu_ptp_get' [-Wmissing-prototypes]
      65 | nvkm_mmu_ptp_get(struct nvkm_mmu *mmu, u32 size, bool zero)
         | ^
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      64 | struct nvkm_mmu_pt *
         | ^
         | static 
   1 warning generated.
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o: warning: objtool: nvkm_mmu_oneinit()+0x7b2: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
