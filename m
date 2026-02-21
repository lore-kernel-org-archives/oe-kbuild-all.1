Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462F5477E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771684033; cv=none; b=qTJZDSvzi1QQbRSgYorZfuSpnNTXODFhpoFnbOXI0CQRaRj5RaLqy43As7W8i5764h8fBnRWgHZ2sO4vlOUYPFdud1hxjmdE7qjD/MMCqAJOttLZKQZNzNoagDOAWd/39fYEUwYw6ECc5Dua4r2ts97bxi4dY5qfT2tsYUx1sq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771684033; c=relaxed/simple;
	bh=nJ3z6ieFvZijK3NnRaribvMQDhkxy7unwmFn5uZM4VI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sKnk64ilAFosuSjzovj5R83PH1o4OQfzO9fIfnX52a4K1HhEeTh8/y5YxILHiwOTWQwRHco6FdENVgvfTv70rmgEt7QMqbtx6dcA81exlIaWhMrB4lFhTmd5IWm9MSYuXNGVoWev2P6VJKPevvKknAZVFukxNzRAeFORI2wPH9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwixtYe3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwixtYe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771684031; x=1803220031;
  h=date:from:to:cc:subject:message-id;
  bh=nJ3z6ieFvZijK3NnRaribvMQDhkxy7unwmFn5uZM4VI=;
  b=RwixtYe3YT7hwHLeY98YKzkDN7WYB5wCuAV6UR6NzDezN/sK3X1AcwVc
   7Vi78evIoduKHE070NsFbpuZ16kSR4O2CCk+POIIucJqgDrEuPQ8Af54e
   IttnkPhJx7anl6TjzZAM0FuEgsZOWsdXKbwc3CjYO2UNrDHr6smVO8GMw
   TcfU5difIqZRR1BjV5jLkguEXuLkKNXrKGSeNSa6JV7bWurYdiZp9SlQH
   r/Sb5qJpxaAvxIEW37Tc07CSv/GW5haW9cApUPHGsSoni7+fos1i7neRp
   T44kvfo4YKm4pGQ/c1c+ZfruK42piEzNn7JjmS0ITZsVvvgM8s5Xo1Tn2
   Q==;
X-CSE-ConnectionGUID: 96kzxyHoQIKGyZqwGI55hQ==
X-CSE-MsgGUID: qm8GeI6sTniaXtTP8Q6bTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="60322787"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="60322787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 06:27:10 -0800
X-CSE-ConnectionGUID: 4i+wakh/QKuMCmoiU8ES1Q==
X-CSE-MsgGUID: Yh4qo6UsSBiLvqldmTPmUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="219246956"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Feb 2026 06:27:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtnwp-000000014y0-02QX;
	Sat, 21 Feb 2026 14:27:07 +0000
Date: Sat, 21 Feb 2026 22:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 5/9] ERROR: modpost:
 "iommu_sync_map" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko]
 undefined!
Message-ID: <202602212208.LogosKhJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   09254cd790f7046b6736c1ac67720dea42e1b3f2
commit: db31fcad055cef9dc786eeee506f6c9ed62a0373 [5/9] iommupt/kunit: Use batching iommu operations
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260221/202602212208.LogosKhJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212208.LogosKhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212208.LogosKhJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iommu_sync_map" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!
>> ERROR: modpost: "iommu_map_nosync" [drivers/iommu/generic_pt/fmt/iommu_pt_kunit_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
