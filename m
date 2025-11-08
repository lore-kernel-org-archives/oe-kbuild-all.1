Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96E484039
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762631322; cv=none; b=On8AhR9CNnjvEWKD4GFBV9iAetDyvwsorkna228Pxo0VtGoFu0Br9ZLbnXZgZsYzx8s50Q640riegrKDly+22cMRq/c2PwN+JTcAdwnb9vFU9yU6Zv1585PrDWtPd2VI+iVrAvZINnSUa8+bljRoSp7tgImlXRvXUFdTRRAMjVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762631322; c=relaxed/simple;
	bh=T733m99Mlwu8rv2uYiu8ATVzOflQpr56V2ewOAgY2Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTzbqavIZrhPqUXl5Q4wuiMV0XLVHuC+QfOx1PYxNTowDNF2aJWRmph3NV2sz8gPPwOx4I4Jq8mMnt9IjaYJHmRo6FyduXgzP7DSKg4828ueo2bbWDRLIhMgwWdQY2ArkMi/HtslSZ23Pef4W4jE2qxBtllL3q1irSVfmjFO3O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kx92ERKo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kx92ERKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762631321; x=1794167321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T733m99Mlwu8rv2uYiu8ATVzOflQpr56V2ewOAgY2Pw=;
  b=kx92ERKoBQO7Db0tVgrvTPbsv5FCnFB3Wdflbygjs6EY9fe+W1wraSjg
   Y1DtaCM9+inYGWS4PsvW/dEgPyE8nxDdDHcD61+xf/+4ATVVlaxXN5ICO
   9QjchiwBdg6hmkwevej98mhHXkrvxyWD3H+IAoCWTNyM5GIzAPYn45vvv
   pEaWffpv04ZuorxPpSWE05Gs9h+sVrZAAmaPXF8JLQbq/E0MaUzTwkOK+
   nVtw084k6Kwp1b+6Dq6qjRV69+txIcGOMmq9khL9TNhYq1+OoABeWmjle
   XCe1Gw8nBdsPRUmgjHYePR7PLzygmIdOq7LSHlQRDfL9Bb+0d1CnkGww+
   g==;
X-CSE-ConnectionGUID: IWxYDlQ3RkShjA3+ZiqrAg==
X-CSE-MsgGUID: zTNkqU6PThG6FUrekDGFKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="63953658"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="63953658"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 11:48:40 -0800
X-CSE-ConnectionGUID: bex0Bto3SMKn1pgb5/ecFA==
X-CSE-MsgGUID: 71qK2XjYQcW5mR9/giF/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="187581125"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2025 11:48:39 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHovM-0001Nz-2I;
	Sat, 08 Nov 2025 19:48:36 +0000
Date: Sun, 9 Nov 2025 03:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan Mu <mufengyan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3124] drivers/ub/ubase/ubase_ubus.c:355:35:
 warning: unused variable 'ubase_ue_driver'
Message-ID: <202511090331.elnR753P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: 727362c0978ca7ecd007ea2f3fc0f7873a615821 [3124/3124] ub: ubase: Support for ELR and entity reset.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251109/202511090331.elnR753P-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090331.elnR753P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090331.elnR753P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubase/ubase_ubus.c:355:35: warning: unused variable 'ubase_ue_driver' [-Wunused-const-variable]
     355 | static const struct device_driver ubase_ue_driver = {
         |                                   ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/ubase_ue_driver +355 drivers/ub/ubase/ubase_ubus.c

   354	
 > 355	static const struct device_driver ubase_ue_driver = {
   356		.pm = &ubase_ubus_pm_ops,
   357	};
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
