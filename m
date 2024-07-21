Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377468BE5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721548453; cv=none; b=hSsrvNqmRifgBQcj75acujYiEXLsRu762KNBDVDGwxLolyP4i1x0XxE28aisn6ExCNycv7d7/+DbTX5iprb/osU/VfCLKCVw3Qcs4yWZFdgptDx7Znf33fH8GsTpxz62KkZyM7S16nWZrJx3kPxtc1JN4deeFlmZrWpoDVioAUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721548453; c=relaxed/simple;
	bh=dDlQ3JCprJbN3ZsxLUKPgT4XOV0IVQwQQqrKGO2B7r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYFHdQIy2LU1kdJ6jxmHmsOLYGqYWUorsOoKMkBuoml7dngQNm0LsxpJq9QmJAi7bHQNzYZRP9qpan8NxZSISUqzd7qQsY7kdjzyKAPlaboTyfsC0vZuLC9Yer7hwnJeew3DAKj60pIj4xiWbSG6MVU1HZbANL9FnQ2dL7o+i50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UK7/n//l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UK7/n//l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721548451; x=1753084451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDlQ3JCprJbN3ZsxLUKPgT4XOV0IVQwQQqrKGO2B7r0=;
  b=UK7/n//l5dtIoLh2vY0foB+YCLgZduNRHqcM9ozAtiruN8w2P7gKn0Lz
   eOcGur46Lh95oHWr68JsM0AYksLraoSzAXP21kDX2vrSfb61K43aU6EWZ
   MhQF+rZ0sd2qyftkmvGaMC7Cv/Ew/8XPgDuQsvn0ohpvyyBLIKigv5JVs
   uTu/QF8vXaLtjao8FSu7YtLCAA3fiwfsmwxpDvUhbNOBPp0gTYBqQuSRw
   lfgRnDw5CbhM+8CbS//K3YfMJLSPstDmjKe0ywiSs78cpBIjkLYFZpV5n
   jvw765x1VrjDRiDSYycyD1pwUXlPnqTZ5D4f66/KJgO59b4KdRMcV9Xx8
   g==;
X-CSE-ConnectionGUID: 1kAac2YpRq+JvC900oEqIg==
X-CSE-MsgGUID: 25EfwiiGTzOg+M+CaveuGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="29713456"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="29713456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 00:54:10 -0700
X-CSE-ConnectionGUID: O8l9NvhWQnqpYgFeSH7/Wg==
X-CSE-MsgGUID: DhOWeF0eSyC4PEYU4stYKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="74763390"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2024 00:54:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVROR-000k46-22;
	Sun, 21 Jul 2024 07:54:07 +0000
Date: Sun, 21 Jul 2024 15:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 11/12] iommu_armv8_4k.c:undefined reference to
 `__umoddi3'
Message-ID: <202407211542.zcw4jSdq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   3bfbe508e9fa71038507cc93408130b73fd54d2e
commit: 3ae5398fab5bf2de6b5118f70450c4a13b3dcbaf [11/12] iommupt: Add the 64 bit ARMv8 page table format
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240721/202407211542.zcw4jSdq-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211542.zcw4jSdq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211542.zcw4jSdq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_4k.o: in function `do_unmap':
>> iommu_armv8_4k.c:(.text+0x2ef): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_4k.o: in function `do_cmp_map.constprop.0':
>> iommu_armv8_4k.c:(.text.unlikely+0x65): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_16k.o: in function `do_unmap':
>> iommu_armv8_16k.c:(.text+0x2ef): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_16k.o: in function `do_cmp_map.constprop.0':
>> iommu_armv8_16k.c:(.text.unlikely+0x65): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_64k.o: in function `do_unmap':
>> iommu_armv8_64k.c:(.text+0x2ef): undefined reference to `__umoddi3'
   ld: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8_64k.o:iommu_armv8_64k.c:(.text.unlikely+0x65): more undefined references to `__umoddi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
