Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D063B8BC8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770663058; cv=none; b=OSNvS3sE7WF/OcFoO+RFZyGF/3hnJ+jqDO2r2w+3QUbxADmChvHI697NMKGdYYNH7mkUbbFmWwHvpENHKSzn6rM6hUBq9aFQaqacWN6D9ZmjMUkey1jUTKqckARJQPWcaayOVxeyTxz0Y4rvDwhJQdKKI25LtCZM4ZL5p0USpAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770663058; c=relaxed/simple;
	bh=ErU+VzBrQvLn97UztR3QOcbSpbk0AKWwDMqRoi3NAks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=myaSO/AA7PKNycEziyKUlGQA/YOxk3BMLFtJS1bVzGPLxQqbSxBZp2589UVqTJ4TBatczfp88ylD5rEHekzNnxzpzr4azHp6x+xcXsbO2tfdq9yKx+8ceCiQQpfbrAqaDp3F7T7TOxCLjypnOFahPHQQ15nkRk8xFTcpsNiiXiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQVFnkuQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQVFnkuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770663057; x=1802199057;
  h=date:from:to:cc:subject:message-id;
  bh=ErU+VzBrQvLn97UztR3QOcbSpbk0AKWwDMqRoi3NAks=;
  b=OQVFnkuQNZ7AntTtFCat3tJb92rCJG6WguHH+wfNe7cpFpfu0FF8tIB5
   ijN2ISPyAi/d/sCJywvYGKl6WbM69OCuaYHrODOrTHR3F4VQgJpVyqd70
   0OmVVdEyQwnQeBxwoRhQzhMRSaxRIRFjVWA/kfoKU/2cDc7WY2/czcXzY
   lC0sql9sMvMR9y+uNud7fAcscwCMHFFC7uuejSR33TAhdABxOOJH2JpDJ
   O0/lWn+hKHK6FwnbBIVrh1zRSDlOyePbGF/hUPtj9Ev8kAo8x+BdRnOsc
   0A3V3HWgiJWqnOWyHTfS4s1e8ynxV4ghqkmF1J8DGhcPENGQaVKJH8wBt
   g==;
X-CSE-ConnectionGUID: Sq+xvB65QeiOOLOCvTHf4A==
X-CSE-MsgGUID: mhJXSuNLS1qblK761PPrtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71767867"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71767867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 10:50:55 -0800
X-CSE-ConnectionGUID: H6ytsLy/RUCkU9w9eBofnQ==
X-CSE-MsgGUID: FZeo6Dz4RZmkn1ur8e7O9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215845150"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 10:50:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpWLU-00000000oFg-0Sii;
	Mon, 09 Feb 2026 18:50:52 +0000
Date: Tue, 10 Feb 2026 02:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-main 134/134]
 drivers/net/phy/as21xxx/as21xx_bbu_api/as21xx_debugfs.c:64:12: sparse:
 sparse: symbol 'IMP_TYPE_STR' was not declared. Should it be static?
Message-ID: <202602100209.T7bPGvXK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-main
head:   b36492c323100a08d7954f0204204ab5abd06d02
commit: b36492c323100a08d7954f0204204ab5abd06d02 [134/134] remove old as21xxx driver and update Makefile pointing to updated driver
config: x86_64-randconfig-123-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100209.T7bPGvXK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100209.T7bPGvXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100209.T7bPGvXK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/as21xxx/as21xx_bbu_api/as21xx_debugfs.c:64:12: sparse: sparse: symbol 'IMP_TYPE_STR' was not declared. Should it be static?

vim +/IMP_TYPE_STR +64 drivers/net/phy/as21xxx/as21xx_bbu_api/as21xx_debugfs.c

    59	
    60	/************************************************************************
    61	*                  D A T A   D E C L A R A T I O N S
    62	*************************************************************************
    63	*/
  > 64	const char *IMP_TYPE_STR[CHAN_NUM] = {
    65		"Null", "Open", "Short", "Load"
    66	};
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
