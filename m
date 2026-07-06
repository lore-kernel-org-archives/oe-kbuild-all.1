Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F03C060F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318511; cv=none; b=C0pRNT2EZP6Gl+qMVGXYpnK8raWyydf3zxkpRl4+uiPbZs2CN4hOwcYAagYJnnmK7lzd/Fgz62d4sRhGJX5Dj+KZxEsdAJfnZj4RyxorAoLBpRKOzngYd1O1eE7yJf7vuAqXPzLAP0B/uZXksEjhIRmjAr6rhPfSG1mVsRshkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318511; c=relaxed/simple;
	bh=RQH7u/JcM7OIffnobqjIVPymVn5Z5oDzsikLAp8ytOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RMnvG8xDKMzRsVqkVNCZ0u6Olfpukr5nXZqvSIfDpx67T1Hp3TSD2HxWAsalHOFK46/Z+NKvndsGmS4LfU/VyvhWCfpX0whIjQoBc4hFSVGWQij6Ms3AkZls/EzDR2REDEWO5WWRimEg2U30CgaYq28NZf4jCvcHm1B5zYrVCy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6Lq1mny; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6Lq1mny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783318510; x=1814854510;
  h=date:from:to:cc:subject:message-id;
  bh=RQH7u/JcM7OIffnobqjIVPymVn5Z5oDzsikLAp8ytOQ=;
  b=a6Lq1mnyimXUIvwXHVZXzcsDRXLzZflb16KZkk10jkGN7ZR3TUb+ahk+
   Y8pGf9l04TwHfik/VxISMIIbUwggsNo4vE0ZFH3Bk0Bl3c0CY2mbCCrfr
   cT0WTL/OJN2BM54AIRPmkYt3uqyKUNXgZVLMw0oGl0sxPXF2IwcMi9GyU
   laQYxNY4H/4nWgBlWqpI+2alTucFFykkh6bloJ8pSF1Dju0rtVsryN8TX
   eFI49K2UXaB6z5JjTwQRI/iM1Px0oOWSkfpYkECokg8PsUZP1rpPIgApU
   xobi3smvbbs58ydNLSz75yR9q/67p12KC0b5U6ISsKRHsrteKwp6kC9vY
   w==;
X-CSE-ConnectionGUID: prTQ4s/yT1uz0NMVjYj7Fg==
X-CSE-MsgGUID: G/J6pFyYQGyEToB6Lu8BRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="82925326"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="82925326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 23:15:09 -0700
X-CSE-ConnectionGUID: psTMP0neSfyp0nJ9+0oM+A==
X-CSE-MsgGUID: pxwrePTaTGm5inpiKlRMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="247227788"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jul 2026 23:15:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgcbh-00000000E8d-2QB2;
	Mon, 06 Jul 2026 06:15:05 +0000
Date: Mon, 06 Jul 2026 14:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 151/215] Warning:
 drivers/spi/spi-mt65xx.c:178 struct member 'sample_sel' not described in
 'mtk_spi'
Message-ID: <202607061448.go4zSJwh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: dd2df8805e9cef3697923dea93ac2a7eeaf773bc [151/215] drivers: spi-mt65xx: Move chip_config to driver's private data
config: sparc64-randconfig-r071-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061448.go4zSJwh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061448.go4zSJwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061448.go4zSJwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'sample_sel' not described in 'mtk_spi'
>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'get_tick_dly' not described in 'mtk_spi'
>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'sample_sel' not described in 'mtk_spi'
>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'get_tick_dly' not described in 'mtk_spi'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
