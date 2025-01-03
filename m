Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8AC1AA1C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902536; cv=none; b=LfVBeGRgTcIs4l3sgr/iyspqFphYnHop7B8yMY1ncNw7gNlr3O5Ar2aIHSvXA6aCH7IMhpSc7OKX2ObfLDGTXhyuDVpR8l+0MuaWjo0TpjYvQ0Y1bkVvdk+aRwtAlo/xcKzekdc13jmAne3mCeSh5Me/0CHakLOEyNbdqcEgznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902536; c=relaxed/simple;
	bh=jOlOaZY1ZaKUOPK24U87o9WGc9ZkUbQjatFtWBohXZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGO9asCQ928FFzSzscW1iWLP0ICewu80SGZrwOtcM8H/J3yRcerwJdyTlfx/flNzUUzSz9Az7QROcSpiLe7xRdTuO15XdVskQ25XnWAtKsxifaSKozcDwir5TLTXDNeYs37Um90AiY1V/u174se2GkueMq/rd0a9lGtErSLVIn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVyotlzM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVyotlzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735902534; x=1767438534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jOlOaZY1ZaKUOPK24U87o9WGc9ZkUbQjatFtWBohXZA=;
  b=ZVyotlzM0eZUV0G93x5BBSlRVRIW96TtVGKvH4wXbhaGHrdTFcnQUUU5
   xXjhJZr7+4MBJSuziBoNWu6s12bfSDyrC9iSvHND2N3UyQsTKxy4wkEJQ
   5qZkACtaV6Ce6zYC+l3RJfwiGVcRXpG9V7oqCXMkwLaZxkA6QMTCqynHd
   AXuJHAJ4K3Ocxcu3DbGmVtY0B+/vW3IPFhC1slJ1zbiUWYbqaoej5kRMI
   Mm+Xj5uwYsdJyLJCuS9G5xuWTYksxSeJhLesHD/LYTuj0Jym8flKGscBT
   ki1O84ZtC4qUxAYFiR9yS48AHe5iDgziMV6L819ypqMDRhu4UXqBSc6Ru
   Q==;
X-CSE-ConnectionGUID: bc2AIc9QQQWNs01b/FJS9g==
X-CSE-MsgGUID: AjiLc24HSTSNJTceJKk19A==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="39831792"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39831792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 03:08:54 -0800
X-CSE-ConnectionGUID: 8NBQnlWRS32996NC0rMH9Q==
X-CSE-MsgGUID: LiZwzT9uSO6Knv8sWHWahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105827675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jan 2025 03:08:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTfXu-0009dJ-2S;
	Fri, 03 Jan 2025 11:08:50 +0000
Date: Fri, 3 Jan 2025 19:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682] mm/dynamic_pool.c:1577:25: sparse:
 sparse: symbol 'pagelist_dpool_ops' was not declared. Should it be static?
Message-ID: <202501031919.9n6qbVhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   604e996dd0189ddb0875f389b87fa2084b3a9424
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [1682/1682] mm/dynamic_pool: fill dpool with pagelist
config: x86_64-randconfig-121-20250101 (https://download.01.org/0day-ci/archive/20250103/202501031919.9n6qbVhX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031919.9n6qbVhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031919.9n6qbVhX-lkp@intel.com/

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
