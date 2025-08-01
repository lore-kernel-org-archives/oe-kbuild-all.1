Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6917E4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 00:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754007292; cv=none; b=oUSNaIa02TZAOPjNqBhmdxXn9Y/yOHMh1O/6PnLHxWu9C4Ujsp1rPWlhcuQxJeFaUL3Ln45kga8cid4fbXdfUrSPhwdfPM9ElYHr22lfoWG18finCQg7HJHAog+VxzdwQcL6pDq+SwDSYMmmzVEQZECuUsEOAXrviHBIFE3gSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754007292; c=relaxed/simple;
	bh=QQZ6LGGyvwEd5hfO/YbGSGENUwycHu4zCTkMCjFOsmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uw2FHURq3kyhZ6XVn1cFz01swVAsIBAUadg5YVnekh3aGZhyOPs+pBkUuIWkTIXkFzQoUhQ5UgabCSqP5cxaOQsx3QJtRyZoBOqLGhra8hnrpl59dzdbJWYhrzuoIvPF8bmJr6Ec1cQ+P6jnYrszxTYhdh08isgi92wY3g4W5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4KNTCFU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4KNTCFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754007290; x=1785543290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQZ6LGGyvwEd5hfO/YbGSGENUwycHu4zCTkMCjFOsmw=;
  b=J4KNTCFUk15yq33hrp2IgRLIRZgnfC2G3Gi3oNHF+pcXrcK023EBSRSp
   CTRd1MI7oWecLCxh+9RFX65gzX//+QvAaeJrmDZELMJkeMhgzMty6kZ3Q
   wXHnt7GJrTdNhLgcb+0BPFgXaqRYOs6yXnsTOiD4NQm3XAatohyOYgaY8
   p21ydeYcXU14ieble8i+kTRIjNLwHQ7FgZDw143OZkNsAnyX+IFKGak/f
   cj+OP8oDLDXZwMSr/E99FpsRWHILRiYHGoCVd+xYWSrOU0bCzAcwb24r/
   zbSIC8RJbahTpjnlAT8T15sVHznYeKQoDBWTKUS/MSVnZrUsrw2owRcSK
   A==;
X-CSE-ConnectionGUID: vHyXS4qxT9WYLVoIXQ/ybg==
X-CSE-MsgGUID: b0guBBbES8uHF9XtxvAHdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56234957"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56234957"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 17:14:50 -0700
X-CSE-ConnectionGUID: rWyNSE2pR8y5ynKD1+0p1g==
X-CSE-MsgGUID: 6U02RQ0RQ8+3zgc5Cti2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194383242"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 17:14:49 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhdQ6-0004EY-04;
	Fri, 01 Aug 2025 00:14:46 +0000
Date: Fri, 1 Aug 2025 08:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2613/2613] mm/dynamic_pool.c:1577:25: sparse:
 sparse: symbol 'pagelist_dpool_ops' was not declared. Should it be static?
Message-ID: <202508010808.vY0Jq6pD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   27e11e2b193b780ecfb0c4f0d0a73a0a28879c20
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [2613/2613] mm/dynamic_pool: fill dpool with pagelist
config: x86_64-randconfig-r113-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010808.vY0Jq6pD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010808.vY0Jq6pD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010808.vY0Jq6pD-lkp@intel.com/

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
