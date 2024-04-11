Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32B33EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 23:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712877841; cv=none; b=cpBE9aGOczQbYAQs9y1SVRrX8XmhcbEnVPZilgdOwr8ZpnJf33GrrgqMQuItK/F8bedh/XFmT66eGk5ImruzZK4cFB9fbEFt9/2GAyya7pCUfm/fAnbwmo6+/Xf/7Cs6VFRJKiMuOxUKDNJjWy9FSkyucZ/CpRIDAfTRgeOXdfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712877841; c=relaxed/simple;
	bh=m0t5rMGaSPVSio97ZmuMubzChlEpDLwr2Iwl149yJDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhCjnTyQiYcb15Ej2Qyh3R2R/S+QRwTO032Hh80ElUb9ZQYgjOg0v6U3/hNhLSnLt9J8B3Vgh6MbQn7npKfDgpY961jFVkOPNWaDhxFiYY4w3QFIgBQq/oozw9/H/6mkY2J2g/1OlPt6sQ7vP3O0zP6gMAsav4blcur+crZ5puE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuYWA5lF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuYWA5lF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712877839; x=1744413839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0t5rMGaSPVSio97ZmuMubzChlEpDLwr2Iwl149yJDM=;
  b=ZuYWA5lF2VbpfdCYnkIdPqkMA5PUjo4k6Qei68ugW9jLwrxEiPjFIdYX
   LbSXsl8ksaXVwcIa+pfpG4EyXUVfL2HkOwRjvIXfDqcyO3scQynQ+bC5n
   Bm3ppIRjxrkXkWh9X5QEvUjBz+EshlPJ/BaptNrnOjL8kLuxvFYguHYgi
   +yTRJFbpluGZWwU3lCiMKPWlTHSru/EWJtF73jUq1b7uypVNT4mxt7Mgo
   UB4S3MDWhQ2kI0XvODp2wWpbFJch+HiUySKJh/1ty+WybrGbLhwc2nlvN
   g7k+8et8bwX8uORe4zmSquTRRBEhqOrS8WmooAmPInHFxiPgRuPjbv3Sd
   Q==;
X-CSE-ConnectionGUID: TQpG0Ug7R8COaOwkSQzhxA==
X-CSE-MsgGUID: +1GwzlOpQOa2pGsasoUMDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11284851"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="11284851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 16:23:59 -0700
X-CSE-ConnectionGUID: 6vFgBPIHQy+XabBJl4y70w==
X-CSE-MsgGUID: JP6R0wbsQYmUDuj5pd65pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21548745"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2024 16:23:57 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv3lr-00095V-0h;
	Thu, 11 Apr 2024 23:23:55 +0000
Date: Fri, 12 Apr 2024 07:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2454/7374] mm/dynamic_pool.c:1577:25: sparse:
 sparse: symbol 'pagelist_dpool_ops' was not declared. Should it be static?
Message-ID: <202404120700.UpU5X98Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8f7c77eb69ee331fb66fad8eec5ca81b8843eaf3
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [2454/7374] mm/dynamic_pool: fill dpool with pagelist
config: arm64-randconfig-r132-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120700.UpU5X98Y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce: (https://download.01.org/0day-ci/archive/20240412/202404120700.UpU5X98Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120700.UpU5X98Y-lkp@intel.com/

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
