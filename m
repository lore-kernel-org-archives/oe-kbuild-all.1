Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7C186E2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735197281; cv=none; b=KX7EVMl2vk7Vj8ilM4VI3vVcdjPwHEKhwxay5te618R3x61n0SD4NNgpAnv+tyAnX/m287qakBUcfwINvzUBjgVIXLbHy5a1QTevLCPW2B01cBYJb7/u6FeqW9snPDp9msRfDfQqvX5T6dSTtHJ6CS+fdERZX8ZXgVdbib3OmGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735197281; c=relaxed/simple;
	bh=i/K9c8Yzbehv14qwbYgiIY+GgN8FaAf9OKd/cYCG7sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liBoDtXBhNtkmi41l2ZqGqCTt86i5jZOR5mRou4/IQs35rQdXTvACYEjHpwqvzU2E01W/GcUgjbcjFRd75zMDeWEVwTYskbVeFTsNCXBybDXVdbecMYEREdyIAyv48E/td4QqgxVQPKjXexAWmUzhuzmgvEB+bhHmLMALDrwM1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B46rw2l/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B46rw2l/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735197280; x=1766733280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/K9c8Yzbehv14qwbYgiIY+GgN8FaAf9OKd/cYCG7sg=;
  b=B46rw2l/nhV+yF9FcM11tgPq29Ldz15gNic7qlU9rYzNuK2F6TSrsdhu
   NqoIXuisudgo/WmwlqXt8uunaIsowInXje85CiudsPiGQX8DmBfj5ZPK5
   w6/0s8Sv0pa4z/j3m+iA8gEJbkiAZEBf2lBiz4YxpEKqh/tQC452JNyFT
   tUMn0p/cmaXu9R53cHUphGYqjshldJ84Lf6xCfOtGTaozamdNvLjpfQA3
   BjezEMO9ujEk8trGESQL+aCYuwY0bH5K4l6U9ZtPExAxNOp6CpH+YxreI
   3JQzRTk0DKSw/z0VvEiRctjPAfLVT9b1azZ5i/gdTOjzNDbQ8NjbURNWB
   w==;
X-CSE-ConnectionGUID: UL6CHBWHSP+SL+vq4NCQYQ==
X-CSE-MsgGUID: pXAq3fxSToaSY8yNA/YB+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="58077647"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="58077647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 23:14:39 -0800
X-CSE-ConnectionGUID: qkdw6inPQnSojXwRq0+5tQ==
X-CSE-MsgGUID: 264lJHn/S+i45d4D+hmySQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99727356"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Dec 2024 23:14:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQi4p-0002O8-20;
	Thu, 26 Dec 2024 07:14:35 +0000
Date: Thu, 26 Dec 2024 15:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mohan Kumar D <mkumard@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 33/46] tegra210-adma.c:undefined reference to
 `__udivdi3'
Message-ID: <202412261537.czKOXjQQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   98d187a989036096feaa2fef1ec3b2240ecdeacf
commit: 68811c928f88828f188656dd3c9c184eeec2ce86 [33/46] dmaengine: tegra210-adma: Support channel page
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241226/202412261537.czKOXjQQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261537.czKOXjQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261537.czKOXjQQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/dma/tegra210-adma.o: in function `tegra_adma_probe':
>> tegra210-adma.c:(.text+0x12cf): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
