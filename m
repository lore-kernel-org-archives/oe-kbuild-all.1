Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A431547C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773545; cv=none; b=ZSfoXQlVafadPWF/kmE7CVNaYX8sXgWm5Z6ny/rZTLlIc8KWSGN4e2PT+EKncWjyz01XS0LCAMCuNtPOfS/guAdsnJUqepkkp/Yzd9l0otWqw0VQXmTo90szvBMTIiS3XEpXtaXVz88cwxZ4wG7AgTDmJc0peFN10mgvK1M1iKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773545; c=relaxed/simple;
	bh=xL1JHQkPqaiocigNGopqWlS5jKlZD6zMkJQOE41xCWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hjxcARYB69TM4ui6h8N0Lu2/Mi3nP87PfioMyr+br4ZzanoJDNPqhGkI2rG8QjrkE08EZ56Yf5xRz15Ox+aSSb8PPftEFhtsJubOM9o5c+1hRJjf9LiCDSGAQpiJTUwMBgGfPqnfMXaaur94qMFW+fHOtvCsu0uFDYrgNwOchPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhgE0znu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhgE0znu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783773542; x=1815309542;
  h=date:from:to:cc:subject:message-id;
  bh=xL1JHQkPqaiocigNGopqWlS5jKlZD6zMkJQOE41xCWk=;
  b=AhgE0znuqvto1xQlUJS/CjIf7ZiHOB4TAZEFjeCnJPNS3nbjbilVUGpm
   m1qXgYFc17w4FOgmN/ri3FE8wTzHDtxSG7ve9XFyo8aAZMIeJqc2lvYQ4
   2REKxzsSU2pZLTJCkFKlJ4ATLsDSiCKz5ZB14qSbcZCTLWdkYRS3+8N7E
   JwpTY0HZOQcyQn8IHT+gXoMSfijn2BqZFxdwaHufVgZp3Rqok66PqgLCy
   exJnUL7bQtalDSUA6blBSnE+Seboj+GPN0lw8jhGAie3XOxk3kiSRkZnR
   1Mi9+W9IL3dqkLblbmy39PSzZDiTFUVgy9HzJYeq1nPU4m/YmZ47UDx5d
   Q==;
X-CSE-ConnectionGUID: ecnCgeI0SAysBUEqDcm1Vw==
X-CSE-MsgGUID: TCNKJLiBTky8CDfzfqSKkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86995998"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="86995998"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 05:39:01 -0700
X-CSE-ConnectionGUID: opXvnLQvTsqlFqLVv/i0cg==
X-CSE-MsgGUID: X0ee0D+ST/KLOj8iXSz0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255205746"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Jul 2026 05:39:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiWyv-00000000K33-2ati;
	Sat, 11 Jul 2026 12:38:57 +0000
Date: Sat, 11 Jul 2026 20:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1]
 drivers/media/i2c/lt6911gxd.c:119:9: sparse: sparse: incompatible types in
 comparison expression (different signedness):
Message-ID: <202607111926.Iae1B92f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Muhammad,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   5100e1c74efeba843945492f8d5840e6166c0392
commit: c8916bd5daa29aca311b6d811197dfeb9af3c368 [1/1] Add Lontium sensor support for ipu7
config: powerpc-randconfig-r132-20260711 (https://download.01.org/0day-ci/archive/20260711/202607111926.Iae1B92f-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111926.Iae1B92f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111926.Iae1B92f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/lt6911gxd.c:119:9: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/i2c/lt6911gxd.c:119:9: sparse:    signed long long *
   drivers/media/i2c/lt6911gxd.c:119:9: sparse:    unsigned long long [usertype] *

vim +119 drivers/media/i2c/lt6911gxd.c

dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  111  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  112  static s64 get_pixel_rate(struct lt6911gxd *lt6911gxd)
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  113  {
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  114  	s64 pixel_rate;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  115  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  116  	pixel_rate = (s64)lt6911gxd->cur_mode.width *
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  117  		     lt6911gxd->cur_mode.height *
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  118  		     lt6911gxd->cur_mode.fps * 16;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15 @119  	do_div(pixel_rate, lt6911gxd->cur_mode.lanes);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  120  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  121  	return pixel_rate;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  122  }
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  123  

:::::: The code at line 119 was first introduced by commit
:::::: dab4e1f04f20f6e3fd88b5952d40b7a20d4edd68 Add psys driver and i2c sensor

:::::: TO: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>
:::::: CC: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
