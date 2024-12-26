Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F71C3C16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198001; cv=none; b=NYgdL9ngu46bhWuw3J2/0/KnHPK6F1Csym/YgWWPLSvoxQFxydEAv6PylqzEVzfLtx3L8ZKCSsLafFZQruiVCPjpvlkpGzqWWrE2GELrEsreYhNHvgyG6S5LIXPlOPze4kz9GqW7uoYR/+yljVTIiPoD9277K6J0aWLI03rcoUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198001; c=relaxed/simple;
	bh=jJZjbCiP0RlvJOBVhejWioJmLddZR/8ceM/MiPrcGww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZ2QywINOU0Z5R9MA1VXukEnWw97ApYueWlNCSh5mvl8xtDdds/UAxo3nARxIvGwiDQtB0G6RYcZltcb8kPQwOe6DAyDUDXjvR0aHeOngP3EPhtlX1V1ATlYuTA2qoonVnY7kOOu95p4+eJIXC91vZMeZvwfi7QjLnn0fYg6PCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO+GHqQt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO+GHqQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735198000; x=1766734000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJZjbCiP0RlvJOBVhejWioJmLddZR/8ceM/MiPrcGww=;
  b=UO+GHqQtwCq1Hz0H+9Zz+sSZ/lIUnRj3XbWWuSXJfpGVPM+E2TPVR8wk
   RfjwANx5ESwrv6FN1cEJlyvxpy4I4pcwSBsdu6b8SFEfBU0R1ihTlp+vL
   cJK3JgqXhgPQA+peRKgLNPNx2/LzmC3agmOHBBuPyV7vooesZ9pdC/E0T
   5LbPptk0kXVMwlRyvf2ZgM9X/yeZGs0qwRsUp4F+M7TEJJ7vTj4p7vZZW
   Egtf3R5hJCgiJ89INA35gpCTqxMKUewdVSwpEextzl+rXI1GhiBdBdd2s
   u7OkoFp9rYMGY52MyjJTOqp4+kK/MThNedZ4qdCJOgUBgs6sZ955tD5/R
   g==;
X-CSE-ConnectionGUID: Hzx/KkWHSM2bOyq0LzQNXw==
X-CSE-MsgGUID: 60HXY+57RpKIWZjGyJqrtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39394241"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="39394241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 23:26:39 -0800
X-CSE-ConnectionGUID: msqHl0JHQuikbo9lbd0wFw==
X-CSE-MsgGUID: Bnj6udMqQDiX17x8DA20IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="104714141"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Dec 2024 23:26:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQiGS-0002OO-1S;
	Thu, 26 Dec 2024 07:26:36 +0000
Date: Thu, 26 Dec 2024 15:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662] drivers/iommu/amd/iommu.c:69:30:
 sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be
 static?
Message-ID: <202412261534.t0pLjUDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   589aaab51b2a3b112b232f89fd29a5302222d946
commit: ebb4f9309c67ec7e9a872dbd5e7cacaaf78f4bf2 [1662/1662] iommu/amd: Access/Dirty bit support in IOPTEs
config: x86_64-randconfig-123-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261534.t0pLjUDz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261534.t0pLjUDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261534.t0pLjUDz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd/iommu.c:69:30: sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be static?

vim +/amd_dirty_ops +69 drivers/iommu/amd/iommu.c

    67	
    68	const struct iommu_ops amd_iommu_ops;
  > 69	const struct iommu_dirty_ops amd_dirty_ops;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
