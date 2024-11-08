Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6257F1DFDE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731107666; cv=none; b=RBXR20l1RTD7FRKvBQBBNiWPdK1qVEXeZch2Q8Kky0Ce4ZCR8Ynh0UBf6sTXIBs2zB6K9QhiJFT1UQlNYIobcvwf8ruU7cFAHyDI5MmCgXQgnsu7VEAAHjaDBr4CkZJiJjsinJJI+zrA+Js7GlaI/qp7iILddZHDuOc9l6yh7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731107666; c=relaxed/simple;
	bh=Qak+qcjYErfWoDIlBcaEieDfNgBnJQ1NZCHIcHNlDqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4i2c2apiVbj8aNFmwIDboLEc+znfWcwNlSgEGex9IScIF5aBKEi3PjJm6/gnn+wyFyHaQ9/GANTAhkPLj17pbNfe66tO/+rXPPw7kUYkHCzxjBKdbgQUUVPlqRBM9WekYnTwfqYch8hReUE48H4LYGGHlJTn+Rvw44NqGcpxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv7EpC6C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv7EpC6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731107665; x=1762643665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qak+qcjYErfWoDIlBcaEieDfNgBnJQ1NZCHIcHNlDqo=;
  b=Cv7EpC6CPchvRruuq/V3hj0EoIH3wDxEeEVfFehyvEqpQy5fCmSJMa3z
   wI//GRAVLCI0NRd6EmARJreojHp8JfryH5fLoQ50A8lkoWp8Mcvnx92pU
   yzJsx0HbkmKBCY0gK/wU5loP+DAcUvcivEXJCJtd3yJX++XjojPjQw69F
   z462bfIlTbgTeJo5VZK/7rKV1MLpNJR4k5Sux4N3RT4PoWm6kahG1RuEi
   XuEdGcfu0FaxqIsxqyVngCPTn1HcCHZmNb/qK8bx/GFL2duP4pM2Y2Okn
   aaLqZcmyYuMxhmClehiROLCcJ1cuQ+ZSL+ZhzxhYzgnMBO/ctG8cKT1s2
   A==;
X-CSE-ConnectionGUID: mrmgA/aoQvuFZFQSQnjISw==
X-CSE-MsgGUID: B8KEUDstTdqFbt+npykoAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18631073"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="18631073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 15:14:24 -0800
X-CSE-ConnectionGUID: 8fVpuGd8QIqA7Sqp37mgng==
X-CSE-MsgGUID: /io8NZ96SpSy6K+Rd8ajTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="90615283"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2024 15:14:23 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9YBI-000rsA-0R;
	Fri, 08 Nov 2024 23:14:20 +0000
Date: Sat, 9 Nov 2024 07:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1436/1436]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c:120:37: warning:
 'nbl_hwmon_chip_info' defined but not used
Message-ID: <202411090733.29Mri3oi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9586f809caca17d909e778ce0c1e7c479e094166
commit: 432279e0c75d8281a75ace15d6039cb895a5aa86 [1436/1436] Net: nebula_matrix: fix ci build err
config: x86_64-randconfig-012-20241108 (https://download.01.org/0day-ci/archive/20241109/202411090733.29Mri3oi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090733.29Mri3oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090733.29Mri3oi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c:120:37: warning: 'nbl_hwmon_chip_info' defined but not used [-Wunused-const-variable=]
     120 | static const struct hwmon_chip_info nbl_hwmon_chip_info = {
         |                                     ^~~~~~~~~~~~~~~~~~~


vim +/nbl_hwmon_chip_info +120 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c

bad535d287c9c1 Bennie Yan 2024-09-24  119  
bad535d287c9c1 Bennie Yan 2024-09-24 @120  static const struct hwmon_chip_info nbl_hwmon_chip_info = {
bad535d287c9c1 Bennie Yan 2024-09-24  121  	.ops = &nbl_hwmon_ops,
bad535d287c9c1 Bennie Yan 2024-09-24  122  	.info = nbl_hwmon_info,
bad535d287c9c1 Bennie Yan 2024-09-24  123  };
bad535d287c9c1 Bennie Yan 2024-09-24  124  

:::::: The code at line 120 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
