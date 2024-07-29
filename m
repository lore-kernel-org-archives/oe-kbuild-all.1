Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B7F1891A1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 20:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283204; cv=none; b=jKhvCZJNwOQaT2aq0xcpUse8ED0oilM5xCul7WCyCPxv1+Fs5yVyu6TZkgwpfDJeTIt0HkZLIjzLzRoisNzeSUFmqFhptfsLa4Z71hH30vDlGKvQiqObz9//FGENkxYNoi+q2pjgRr/JOBSFt3IYA+Q9lY/hRYC0GTywyRKN/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283204; c=relaxed/simple;
	bh=0LE6AUOUT5elsb1IiU1xHEMfNpFrbb2HUfN6BTl5kfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAmplXix3tqcSO6QloTWh0Ssc0fXi+z48q0twDzJWYm71hO02vvSfLX7zkw3LhreAYiIPjiTjFx/eO3qL9+vzuUmEOlESfdZvAIHWgO5dkYhE79jVcgrKlkcdEyUGTd1l/0vHbpd4TNKb5KYdAKWoGIyImwYW3RAJxki3NiRzIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTDFP9fo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTDFP9fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722283201; x=1753819201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0LE6AUOUT5elsb1IiU1xHEMfNpFrbb2HUfN6BTl5kfo=;
  b=cTDFP9foRk6jrx7o4Nyx33QZvGwIOdp4fsb7fRQLBrVCtLDPqpELqFrC
   jGE2Xv/PG9tRKGgzPkWyNa6i+4jSNjEgD5FAweHah0mWDxl9LH75DJcxU
   JCoR9moIl7S2JikUc96GU0k2ekiAOgP8bbLstyVeR9tLj/a7VB+YgpqKK
   8N4J1hS9cRIclaAEgfOVM8D8YqaB8j+LUqmfva9RUU8WH1WzwCfRcPlM7
   gCya654cF406m6SeoLGCG5Tfc9ODTp+uiFkTrbebCcHURfYD3IEn5tsRG
   cFN7pLicdD2061nJrBb1vyQT3q9UVhwwUO/tLiiOFJlNKlRzv14e0w7ml
   w==;
X-CSE-ConnectionGUID: fsMEyjp6SfSf4ewyH+ghbA==
X-CSE-MsgGUID: gTCXdKJBT5yvWH3n0wp9Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23928371"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="23928371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 13:00:00 -0700
X-CSE-ConnectionGUID: JxJzXbPASdW3S5//FuizVg==
X-CSE-MsgGUID: YFWdiJDXQ2iXjc2dPm/E2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="54058142"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 13:00:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYWXG-000s0y-0h;
	Mon, 29 Jul 2024 19:59:58 +0000
Date: Tue, 30 Jul 2024 03:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 23/25] iommu_armv8_64k.c:undefined reference to
 `__umoddi3'
Message-ID: <202407300346.ZrKJQtOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   fdbabce35e6ecdfd15c336a368e411e0ac7450f6
commit: dca06dac59465b43fe0a5fc6c9fa61107d3042c0 [23/25] iommupt: Add the 64 bit ARMv8 page table format
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240730/202407300346.ZrKJQtOu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300346.ZrKJQtOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300346.ZrKJQtOu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_4k.o: in function `do_cmp_map.constprop.0':
   iommu_armv8_4k.c:(.text.unlikely+0xe8): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_16k.o: in function `do_cmp_map.constprop.0':
   iommu_armv8_16k.c:(.text.unlikely+0xe8): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_64k.o: in function `do_cmp_map.constprop.0':
>> iommu_armv8_64k.c:(.text.unlikely+0xe8): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
