Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF396F9EC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213907; cv=none; b=o/tyAWtp2AwfzxSUu7A0VbIL9XSFOZBk8Na3O5ijnMSNoiLf+2D4qfsChVyLkt4SO5RGIso1yb4ntKzKbAdbmNTSn6HywabbgubCF2z9bCw1d+XGMYGbV2ubMaIeAnuTnIzPuIchlbu/RUPKOLZ0ZM5phB0egOWyLHZStMXng4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213907; c=relaxed/simple;
	bh=5SAxP1RAYX8EtdS1e71NVEhW+zfR440t5Q86YJzzxDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4cHFksL0sbDgPVH3uK6BALYrO+cnhTMFZ+QdZvtV+fmRiaLLRSJ9LqSG9hlQHx7M1eWAxUX8JEE9k+vh+fON7Oy8BQMbJv53zCMcrc85vOI6Kzd9MrF1o14aKDDCDx4KHFh7DXdzj/4d7nT54JFUTs6wFyyo3xduhP2CWpZsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+2bsoZr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+2bsoZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749213906; x=1780749906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5SAxP1RAYX8EtdS1e71NVEhW+zfR440t5Q86YJzzxDM=;
  b=i+2bsoZrk5ldTKQL2BLax69bvID8thXYq5n+zvRMrYvXe79sVNnRYR5W
   Yl/Zrez6b417wJ33QjUvUW6n6zc6WYGDRIzQDXY8sfQbBlZD5imX0+2Jq
   J8STjG8bNpz9NE55plcD9BDJIZJFZtBOHxooRCdWBs0528mNSrrF1dtB2
   yOzidpIz+5wJl/WaKbtr86c78HLxX58J+BoRQnuJxiPfmDo+xsE7tuVJi
   yR3FIymfxu382JukgH76nIuuskOKTVqrIU3CgVQ/GMxIY+oI5Nw+iqp37
   wacljSkaYh6TmNsHcP1iNM21Vw42oQ97T5enCNJkfdoLo6LF0W1XzGS5M
   w==;
X-CSE-ConnectionGUID: gdHlENlWRcyry7m4HzrUbA==
X-CSE-MsgGUID: s8UW4CMrQPan8kPBzZnAAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51065522"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51065522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 05:43:47 -0700
X-CSE-ConnectionGUID: I07NYtm7QcOD96nBzR3esw==
X-CSE-MsgGUID: be2PqtAWTSuWOlj7LUiS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="149658598"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2025 05:43:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNWQB-0004yw-1A;
	Fri, 06 Jun 2025 12:43:43 +0000
Date: Fri, 6 Jun 2025 20:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/g3s/i3c 5/9] drivers/i3c/master/renesas-i3c.c:1426:25:
 error: use of undeclared identifier 'renesas_i3c_of_match'; did you mean
 'renesas_i3c_of_ids'?
Message-ID: <202506062024.5NPKNHI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
head:   1c4b3673c4a68187f90bebfed23c332d4ce0dcd9
commit: d4b87fdf2d83f439a5f9a3b4b880419069c11988 [5/9] i3c: renesas: add driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250606/202506062024.5NPKNHI2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062024.5NPKNHI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506062024.5NPKNHI2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i3c/master/renesas-i3c.c:1417:16: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1417 |         .has_pclkrw = true,
         |                       ^~~~
>> drivers/i3c/master/renesas-i3c.c:1426:25: error: use of undeclared identifier 'renesas_i3c_of_match'; did you mean 'renesas_i3c_of_ids'?
    1426 | MODULE_DEVICE_TABLE(of, renesas_i3c_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         renesas_i3c_of_ids
   include/linux/module.h:252:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     252 | extern typeof(name) __mod_device_table__##type##__##name                \
         |               ^
   drivers/i3c/master/renesas-i3c.c:1420:34: note: 'renesas_i3c_of_ids' declared here
    1420 | static const struct of_device_id renesas_i3c_of_ids[] = {
         |                                  ^
   1 warning and 1 error generated.


vim +1426 drivers/i3c/master/renesas-i3c.c

  1415	
  1416	static const struct renesas_i3c_config r9a09g047_i3c_config = {
> 1417		.has_pclkrw = true,
  1418	};
  1419	
  1420	static const struct of_device_id renesas_i3c_of_ids[] = {
  1421		{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
  1422		{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
  1423		{ .compatible = "renesas,i3c", .data = &empty_i3c_config },
  1424		{ /* sentinel */ },
  1425	};
> 1426	MODULE_DEVICE_TABLE(of, renesas_i3c_of_match);
  1427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
