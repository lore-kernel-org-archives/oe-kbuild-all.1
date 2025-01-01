Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6578C17543
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735715237; cv=none; b=L65HU7zbbTvlDD2GVoLXVnnxnBlWkU8uCJ3+D5J6yqPA7Yx3Qhf4ppd1h61Abn2nGKBvUeAhDIwPuEzVPZgc5dDXbPSbK5xRTmX1yQ45Q1EYXWV05GJsnmgOhTE8/fVwpB0H6QeS9pxjxeDFP+fZzQu2EH5fhsSlZ5gJc6N6pWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735715237; c=relaxed/simple;
	bh=0Hvg23PGSdbcqRe1ZiGVqDnIlgU6yzS6X+UJ7A3Z9nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1nqU1aMOc8fo0SRPrkhnbFOxRoJ9g+iNuDRYjg0aeGYydccrOMX5LJaRCr/rpuylxAnOtDfW2gC3pLwk8MaD/3QjoBzIII2oalxve/iHObd9C795PIkxPyii5EU0VHzKxxlyO5x/AvzV/CzbxbszbpA1OJ7KH0XIXN0JSU4FTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJwL7vo+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJwL7vo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735715235; x=1767251235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Hvg23PGSdbcqRe1ZiGVqDnIlgU6yzS6X+UJ7A3Z9nQ=;
  b=eJwL7vo+oBaQbg54KRtICOmo9hhQwyxecTHiwaOPyJ7RIocNVNUpuQiy
   0QxSt9BhPMYz3cofQPaHFjhIyNR/cVtz1zZPvsKPQes2NfWeNV+F4qKQT
   uFajOad8Uoe3q2LOOzqEJM/bRrdyhhvsKF+QigPy/4FaalRnHbp+cXPT7
   HHFO4J1u8LEnQSjq0KVNfFxdyURci8Gj4nfCw8FkCI0kccYNeLupEsPDo
   YIY5JT5ISSl3JhcWxG1oGdCphHa1/4rcog/w45SIDTi8P3W0YBGSoAu6i
   Zqx5VVZZ9OqvbH1EFBDPt406run7f1md+UCrJHgcqDIijotTlgt5I096t
   w==;
X-CSE-ConnectionGUID: 4yecV3cITuiXHQgZjD9vJQ==
X-CSE-MsgGUID: IdNLO+AhQ6uyAbswPxKy/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47333405"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="47333405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 23:07:15 -0800
X-CSE-ConnectionGUID: FtgMx18lRqO/jWN0XCrjag==
X-CSE-MsgGUID: hd55NHDATSyywtABK9g3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106217705"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Dec 2024 23:07:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSsox-0007h3-1X;
	Wed, 01 Jan 2025 07:07:11 +0000
Date: Wed, 1 Jan 2025 15:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682] mm/dynamic_pool.c:1577:25: sparse:
 sparse: symbol 'pagelist_dpool_ops' was not declared. Should it be static?
Message-ID: <202501011500.zzJzjVne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1e531b8351b843cd4a160764c0f67e4c9805234d
commit: cf98ffbc116bc49dc4506c68e20b02e26519ad35 [1682/1682] mm/dynamic_pool: fill dpool with pagelist
config: x86_64-randconfig-121-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011500.zzJzjVne-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011500.zzJzjVne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011500.zzJzjVne-lkp@intel.com/

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
