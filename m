Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD0354AFD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570657; cv=none; b=U8t2HmHHBIWHpDyW0flxssXBhyKc4xjK79OxWnNk1TdGF0iPkEmoLynucNY43qIFPnIQG6BbcEWUNdckC6IS1yIAQHKo1QUyX72iszEyvQgP91xUwQ1bshbHuiRICUYafF0B8I3vbcVrw9Ufth+teJB5T54V5UKhKZwD2PSQKFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570657; c=relaxed/simple;
	bh=eub64uio5Ps/p38AfEvPQIOvdkxJPhoC+X9HSUPkSbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxCwiSnOS1q2x99ZHYtz3StDReA9vH/Fd1epzH+nZcju1uDG3JqiHjgFwxWZivOz1TZ2zOKbsh3gssw2amXxbsrfT3eR2r1dpALEN48V8iyBag/F6O2sT56UCpWTc6JnaA5iK4nQnuvNUEBDvfZaCl7eRTDnJo6QVyWztJZ06q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+IdkHFJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+IdkHFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763570654; x=1795106654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eub64uio5Ps/p38AfEvPQIOvdkxJPhoC+X9HSUPkSbw=;
  b=W+IdkHFJZaDZkxIz3bEE5fKMS5gaSUYw89mhBFkm47OvcwYRSKY2EaLW
   9viDg0AgnxKYOHlN5cFMwcJWHskD2JlcNnwBivVGimrext5USNJTJj0lb
   3DShSQMY4j/ZoZFKk6sbqmP1r00bwP3tTFlG2yzbSKAwKNZytJXXImtc0
   5oA5XNmGca25f2QnnWbAYnoBJNaUKtFonlhvslyZHvaWweoh0t7lPkxef
   7m/qAlrvro0XvizEZ7Ekf605KmNgqDeHRyMWyB85NRAUOz/PhYjlqgwWu
   xUXc3LvCOK8RVStrJ09uwy1cDDSa3thAEYIr+1HO8n9WicYN9/y9tw/mM
   w==;
X-CSE-ConnectionGUID: kLzCKWedSQaOMV0KZJ1+KQ==
X-CSE-MsgGUID: QrRwYxwhSBeUwP63LYHjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77085715"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77085715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:44:12 -0800
X-CSE-ConnectionGUID: n0GIg+PnQPae6JOqTOHwGw==
X-CSE-MsgGUID: N8LP4wKCQT2y4T/JqJAXHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228435270"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 08:44:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLlHt-00035t-0N;
	Wed, 19 Nov 2025 16:44:09 +0000
Date: Thu, 20 Nov 2025 00:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-borah 2/2] ERROR: modpost:
 "pt_iommu_amdv1_mock_reflush"
 [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!
Message-ID: <202511200017.tEdnoAWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-borah
head:   10635ad3ff26a0e94b4ab147ac32c63f9b7c42ff
commit: 10635ad3ff26a0e94b4ab147ac32c63f9b7c42ff [2/2] DEBUGGING: Force flush the whole cpu cache for the page table on every map operation
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251120/202511200017.tEdnoAWr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200017.tEdnoAWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200017.tEdnoAWr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "pt_iommu_amdv1_mock_reflush" [drivers/iommu/iommufd/iommufd.ko] undefined!
ERROR: modpost: "pt_iommu_amdv1_reflush" [drivers/iommu/iommufd/iommufd.ko] undefined!
>> ERROR: modpost: "pt_iommu_amdv1_mock_reflush" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!
>> ERROR: modpost: "pt_iommu_x86_64_reflush" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!
>> ERROR: modpost: "pt_iommu_amdv1_reflush" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!
>> ERROR: modpost: "pt_iommu_vtdss_reflush" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
