Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501361A5BAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791851064; cv=none; b=bCzt0MYU5DKEsoLxo9NOJ9pO2m6Aba2p1aLvwu89pdl1rE9goYxkQt7TK8/nNo8fqHqycoDaEaeJdlGYoKTw5XhhKln4pQQT1z8wD9SjtSf3tMKvhskXu8IalvDAZlwE08bH1lI9XU5DcrO+pMD6p5o/wkMHvwOaJ95f9gYd4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791851064; c=relaxed/simple;
	bh=tEWf7mLCxh0Zx6uu4Ea2nDAzVE7igBxcSZf5cjkKYgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WN0bNZYLmenkFK/wND43VSL5bGPBG2j6ka1WMlDj5hp0t7yb3tUjAhXMa+jOmQ35VSyd62hUmyCnihOAqKIj3xSNmlUZ0ui/DUuC9vCj9xfriID/SJeEIp89E2FhNacs1nbXpT6gLszlHdPMZzbGaZYy8MerzMq3ADx7JHL5PnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnglvDq7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnglvDq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791851062; x=1823387062;
  h=date:from:to:cc:subject:message-id;
  bh=tEWf7mLCxh0Zx6uu4Ea2nDAzVE7igBxcSZf5cjkKYgg=;
  b=UnglvDq7hIQmjPWza5dPZ6wWF/YxHiD3U/kvLdC3lFCGRZp6dPpKG0Z/
   JOztbkSpgKYwY8hbOsptX3dwfhlQePLApCk0oZRB3DQFznJt5UDgCOUU7
   ss2Q5NB0olV+ziHZXq8Eg+aw3hwiHp8c//gcKTJxAgpW7TmKzaOSas/Ss
   YfDGv3i4LLMA5VHYv1haBieFC6Yb1ilyJrXFJ83oaE5x168aUjb6+BLhf
   E3B77tk02MlpJ2EVOEAE5iIkJYsLKj0DHGAVJ4+tyamNlviB5M39657YN
   /1trm6RhiIZwmqegLFKP+kNMMVBFldxShNkuVbhUeomyFHR3g+Px4XhxC
   A==;
X-CSE-ConnectionGUID: tzt/RTPaRIejJvf8c0PZeg==
X-CSE-MsgGUID: Ejmp+SB/SEqoTbhzOq5hYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="469116"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="469116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 17:24:22 -0700
X-CSE-ConnectionGUID: f8GgA0AyRYy5FfUIwbuJaw==
X-CSE-MsgGUID: Um9qwZDdS6WvQhrNV8UaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1116355"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Oct 2026 17:24:20 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGQJW-00000000AJP-3UTM;
	Tue, 13 Oct 2026 00:24:18 +0000
Date: Tue, 13 Oct 2026 02:23:57 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 52/88] WARNING: modpost:
 drivers/infiniband/core/virt_dma_test.ko: missing MODULE_DESCRIPTION()
Message-ID: <202610130243.ymXFtFaZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fe52737deab42b438e356282106b9418915da058
commit: ef8b8e473b3dff2b8af5d5d0f69f25d0cdbc544f [52/88] RDMA/core: Track virtual DMA mappings for bounded software access
config: loongarch-randconfig-r2101-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130243.ymXFtFaZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130243.ymXFtFaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130243.ymXFtFaZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/infiniband/core/virt_dma_test.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
