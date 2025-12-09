Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC3B2512C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267225; cv=none; b=McbiroOCRJbVywtkV4IqiaN4FagsBqlqDP4awXrhvyI63JZGOhd27PLWtMnSLC5lOQQL9+oT9bFk+bsKlpahw4stWm6Jy6h2nLFAuqWoOYKHwBKq3cwLYnJX/R+aNRlmTlcAzlmDPEP0OxwKVV2FNDgUIua2Fv8GYVO9A5jbHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267225; c=relaxed/simple;
	bh=tApgGYeSMlR/7JztI6d0Tn10tbfM/mEi4njj8311WGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyaUEjIcfGxRddyh0FZ0Y2ny+wilV8AvP2vip9DrYKoaJHngx0RJf/2/nSM4RAXUC1S0531p79WrWX/hU88HxZLFDDoJWp17p9kKovrEUpTuLqvEhrQ2B0nEfp4nrVSwWxERGtkDoJ9JR/zguwKUH4mejUcMMOxxuBfKHW+sNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5QV15fv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5QV15fv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765267223; x=1796803223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tApgGYeSMlR/7JztI6d0Tn10tbfM/mEi4njj8311WGs=;
  b=a5QV15fvquau0SYm5rIz85romyiLBipy3HifoFYWFqCnsjOyN8CBNgmR
   4S53ck/DF5zccIpuBF7zNbUMhbRj5wUFEehmJysO4cBhweJ32fuDgJ/qP
   12Ik1n2Ry27U+Ct14Y34CBvYJ99s1x8vK5vLLIEiS8R3cvFEtntqPwyc+
   BjYhZodVtljxvu9FRghPa5V7h0mvO6GM2vgATt+DbfYLA5kdqHdhp1695
   5UfwfOxliSORaSFQOcGsnVmH1rmuGDHL1gW3K6wQPNs/WcmXJNRRbrLP2
   EReQMSAC0L4qhNfhR8O0ZMWjhp/YXMpVno4CUzRkuNAKTWc/icdKrxnH7
   w==;
X-CSE-ConnectionGUID: jq4/khkXTWmeXv1dPOdK3A==
X-CSE-MsgGUID: Jt57tRxXQCSShbcpRZ5RNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67297846"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67297846"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 00:00:21 -0800
X-CSE-ConnectionGUID: +s0k0oLjRCC/tULSbBEq/A==
X-CSE-MsgGUID: FYLgaDrfRrmydnka+Dyshw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="227195601"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 00:00:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSsdu-000000001Ua-12HB;
	Tue, 09 Dec 2025 08:00:18 +0000
Date: Tue, 9 Dec 2025 15:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/dynamic_pool.c:1577:25: sparse:
 sparse: symbol 'pagelist_dpool_ops' was not declared. Should it be static?
Message-ID: <202512091544.YzqAeHFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0189df7df2ef7f7dbbabf7ff8398e45adf306e24
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [3493/3493] mm/dynamic_pool: fill dpool with pagelist
config: x86_64-randconfig-r122-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091544.YzqAeHFm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091544.YzqAeHFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091544.YzqAeHFm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/dynamic_pool.c:999:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cgroup_subsys_state *css @@     got struct cgroup_subsys_state [noderef] __rcu * @@
   mm/dynamic_pool.c:999:55: sparse:     expected struct cgroup_subsys_state *css
   mm/dynamic_pool.c:999:55: sparse:     got struct cgroup_subsys_state [noderef] __rcu *
>> mm/dynamic_pool.c:1577:25: sparse: sparse: symbol 'pagelist_dpool_ops' was not declared. Should it be static?

vim +/pagelist_dpool_ops +1577 mm/dynamic_pool.c

  1576	
> 1577	struct dynamic_pool_ops pagelist_dpool_ops = {
  1578		.fill_pool = dpool_fill_from_pagelist,
  1579		.drain_pool = dpool_drain_to_pagelist,
  1580		.restore_pool = dpool_migrate_used_pages,
  1581	};
  1582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
