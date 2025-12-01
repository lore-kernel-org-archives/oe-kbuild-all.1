Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C6C26F476
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623679; cv=none; b=Q/VdA3sQ2050TXALIX/+QvXPWcaWeHM95F7GYoWMFSVod/p3g+cflrOV3gGiyj4/Iy2kwwvtJ5nomlVrCDKhzhi08MadkEFy2zue9XSMFAWNZ3+cSI0u2TkYYP4TZg5toW7HkaefmdcOSkh8ImxjCjkliQH15ARuh67wQOsiu1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623679; c=relaxed/simple;
	bh=1Bcb5XYa4DFbzIbQm19isi8b/XMPFBWmuSe457NUsMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZHcD/oUZe41HEpi/KYNwQJGrYpGd5ZNlaCSYb8KyNGjWIIWeIf6riKLb784x+kx2ZqynAHsIkK3nw7L5gt5Y17bS1sCSADYByDFSplZ2j8CRANsy8uSWZja1GSL/ikSemErbr1P1XMkgVOyuJUA/877GulIb/aiT8PIjLLnFRgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB/aY7ru; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB/aY7ru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764623678; x=1796159678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Bcb5XYa4DFbzIbQm19isi8b/XMPFBWmuSe457NUsMY=;
  b=MB/aY7ruBx47XebnBdR99BS+vUx47xBgzKLuptAt0Uv2bs3xOt57HAdi
   QA3CXN4iUzet34evZewzVW5aDAcAMWHpaf9wRaCBkK0rdGwaZ4gUfujfr
   /XtHfL48w6aEY3Cd5ThshIhwecsw5nX3lLsIoxLSxw1eVZ2yKPXn92uG1
   wZSFn0ovjBDwyOPJx930t0AvixOMI9YR4bZXPU1J9FqJzZD522qmbri4g
   yeD0A6J6uV+6HVjzVAHcGV3t8fv43oeeO6WdNa/BhcIllnFbmdqNWKSIj
   PpGByhFc3nbbbxrNIHMlToBhzWPqJbsKSecvqAqPApoflvefzB5qV876b
   g==;
X-CSE-ConnectionGUID: hivuDed5TMW5CEoAbu33zw==
X-CSE-MsgGUID: PQbhQooWSiGn8p4OKiArOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66741811"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66741811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 13:14:37 -0800
X-CSE-ConnectionGUID: XVhlROFeT36mpvQm9QOIMQ==
X-CSE-MsgGUID: DlTyus0kRUOc/Gal3wKhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198381863"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 13:14:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQBE9-0000000099P-3B8q;
	Mon, 01 Dec 2025 21:14:33 +0000
Date: Tue, 2 Dec 2025 05:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3415/3415]
 drivers/iommu/hisilicon/ummu_main.c:267:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202512020558.hXS2BgSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   118b4e18ae4e19cd4e1245306fe243d21aee3d82
commit: 0db2fc397b9d432df0233d7bed29df427df74aac [3415/3415] iommu/ummu: Support UMMU device
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020558.hXS2BgSg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020558.hXS2BgSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020558.hXS2BgSg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/hisilicon/ummu_main.c:267:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     267 |         default:
         |         ^
   drivers/iommu/hisilicon/ummu_main.c:267:2: note: insert 'break;' to avoid fall-through
     267 |         default:
         |         ^
         |         break; 
   drivers/iommu/hisilicon/ummu_main.c:280:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     280 |         default:
         |         ^
   drivers/iommu/hisilicon/ummu_main.c:280:2: note: insert 'break;' to avoid fall-through
     280 |         default:
         |         ^
         |         break; 
   2 warnings generated.


vim +267 drivers/iommu/hisilicon/ummu_main.c

   258	
   259	static void ummu_device_get_stall_model(struct ummu_device *ummu, u32 reg)
   260	{
   261		switch (FIELD_GET(CAP3_STALL_MODEL_MASK, reg)) {
   262		case CAP3_STALL_MODE_FORCE:
   263			ummu->cap.features |= UMMU_FEAT_STALL_FORCE;
   264			fallthrough;
   265		case CAP3_STALL_MODE:
   266			ummu->cap.features |= UMMU_FEAT_STALLS;
 > 267		default:
   268			break;
   269		}
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
