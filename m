Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921225;
	b=j7VNurTpwbFGZPBGRKZffXWak/3XEpDLTr1oYsn43DIPWOpXWTQJADdNQBn6Fas/xnuZ
	 cuw0v2XhqFau36CHCc0Pnp1lsn358RSll5BeW0gXfnD8zeIyQ8iqlxDICvwQqH6wZ8l5g
	 eBB/SERvyJMzKacaUMkRIP4SfQ1nequy4WXZWLf9WdkpxLhwv3NjxUR2bRHNkKMMDaCCa
	 9pEZVYFKxdfOCIi5CBk0MTLw5bfh1EnxnD6VlLhl3lXNysyUq7IuN3ucskIATcLAjj3SV
	 zu+Y8ENRE1wZ/tMlVthg6IoAqeJG8zJzqVForVdQLAUfnMzC2DfpvhNqiCdvvGnZI+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921225;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jSJWGcVnNMGByPlmzCOyAgYgk+YfDmAjzO7dDGTuRwg=;
	b=oq8HV+Ujvne8Xn/SKuTakHrwNLqq/nTAkC1Sw3D7VNn9TnqFvzDpQPD9yaDckcMUSJh6
	 jQodNxO3eSEitoLh04KmlKC3gng7Eq5zQpSrkrYL9rmD6vQO2xBHqJ7WFaFuPWmEHtn6c
	 HGjBx9YbMvyOqCEjMeBdUaNRO+/4E5LhlDJqiM6ZyBvMuT/O9au+wEEzVlgAXPdep6rc/
	 rEzPutJEhuYiOX+TNbHUpojPfYjorcfpce96bYEl8kV51dxLve8mHYSQoGBdKCQu8CM+z
	 NsvWyhyBXBYDVRSvvCLauJjaPsBrWIbozcUVvFt4EEstGnZ82vfB/nq/+YZXJct0F8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqTwQ7BU;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8FF606A330
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 13:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8FF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqTwQ7BU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921225; x=1826457225;
  h=date:from:to:cc:subject:message-id;
  bh=zPXirlT/HgBkiLCBv1wsmov1Zqg76bgR0pLqzF42djg=;
  b=jqTwQ7BUyrX7ZdtCxezlZqdZKhsgK50fszdblURZ0qeZ3mjIeWmSDHJ3
   5bI1tboChtlIheMGrrzDRI+cu6KpSPrGfDVQn8r51xItu5PdE+qCovAiL
   2Q7N6/AST2NdiRpVxDHT63I3mgR+idRx2fh3oMHLOOv/YlBXSd5rRLRMa
   Jqzyjj2Wt+Bkd9YSWQpHubKBnHV3GNDlQ53sTrGKVc6CIzVfUrro6oot2
   GRTrdOywMRFnHYlUsanU7PIH5N4/UBQNOibGcTd03KUjnKCEO5sBVhJyT
   NYKsJRguNQfoz2pSoy40gvCyFvUgP6nvzhVLDayYWfIKjAs+FE7HgPhm6
   Q==;
X-CSE-ConnectionGUID: SMDjxAj2Rje07HLuQR77+g==
X-CSE-MsgGUID: tONF4g9aTAuHxpUgYy/peg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3712634"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3712634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:11:52 -0800
X-CSE-ConnectionGUID: kCksjsTQTEShu8VyhfBQ/A==
X-CSE-MsgGUID: 8eEux4VPSOaNs/hjPtHP3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10193328"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 05:11:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTIyS-0000000037Q-1RKM;
	Tue, 17 Nov 2026 13:11:48 +0000
Date: Tue, 17 Nov 2026 14:11:00 +0100
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>
Subject: drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use
 ARRAY_SIZE
Message-ID: <20261117140555.KfUW4BDK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: ce26f588c8310e0fdd1bc7524a86fdf0ef6b1c85 misc: rp1: drop overlay support
date:   11 months ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/20261117140555.KfUW4BDK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce26f588c831 ("misc: rp1: drop overlay support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117140555.KfUW4BDK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use ARRAY_SIZE
   drivers/pinctrl/pinctrl-rp1.c:444:33-34: WARNING: Use ARRAY_SIZE

vim +343 drivers/pinctrl/pinctrl-rp1.c

e3ce7b89738833 Andrea della Porta 2025-06-24  339  
e3ce7b89738833 Andrea della Porta 2025-06-24  340  #define PIN_ARRAY(...) \
e3ce7b89738833 Andrea della Porta 2025-06-24  341  	(const unsigned int []) {__VA_ARGS__}
e3ce7b89738833 Andrea della Porta 2025-06-24  342  #define PIN_ARRAY_SIZE(...) \
e3ce7b89738833 Andrea della Porta 2025-06-24 @343  	(sizeof((unsigned int[]) {__VA_ARGS__}) / sizeof(unsigned int))
e3ce7b89738833 Andrea della Porta 2025-06-24  344  #define RP1_GROUP(name, ...) \
e3ce7b89738833 Andrea della Porta 2025-06-24  345  	PINCTRL_PINGROUP(#name, PIN_ARRAY(__VA_ARGS__), \
e3ce7b89738833 Andrea della Porta 2025-06-24  346  			 PIN_ARRAY_SIZE(__VA_ARGS__))
e3ce7b89738833 Andrea della Porta 2025-06-24  347  

:::::: The code at line 343 was first introduced by commit
:::::: e3ce7b897388339b407d57969acaa26063e38209 pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support

:::::: TO: Andrea della Porta <andrea.porta@suse.com>
:::::: CC: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
