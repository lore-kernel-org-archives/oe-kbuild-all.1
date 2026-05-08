Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2600135F611
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252953; cv=none; b=rRSzzcxJOxwfLyqhx9BjxeaRNYEMF4KU0MDU8gacfK4RlMDuY36MBEpRhgmtWSIUAFf2Q1E5uPlfKEEkOWIo/UYCZoUnW86QkyREoTdMWVYI4O1MssSGnoloiP5SorcIUueBnCSL394FFqE/jCF+p2ZMXZ/WwY8niZWVqUISJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252953; c=relaxed/simple;
	bh=o2tYcN1/h+GeT1gWRtFi3iNK3LKBl/1qRKVanesLgCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CmfHYZIbz7d8tUO/+7buKPf3jjBiO8OHgx3jT5zA3DdDuADoekUnY+nlAdS/6j47q/TEwvk8t6kSZs/f7io33u6OCM0mLchBKsvMLUTdhNPgzAITBN96vxo7Hu0LyhP0/KQAvPmw/62FFuQ1RrLPHpjD4hXJXjCGxjfAi30MQ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjPkwRx4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjPkwRx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778252952; x=1809788952;
  h=date:from:to:cc:subject:message-id;
  bh=o2tYcN1/h+GeT1gWRtFi3iNK3LKBl/1qRKVanesLgCM=;
  b=mjPkwRx4CVCrvacTD4Xfgx6+1QviSf4MgHIBkCQnh6z+SLJ3pNCKtzw7
   pYxkZETx5Fbg5fzg222LV2zsj1pJlGZJM8U3zlYHcmxRcFzw7lUS9Vr8D
   TnP0cJ5yhpWGZiBMSc4Lr3NFZ3qrHQ85sbatpHw+Fms2PRIm98jV8/w7t
   AzdyQslzh9h9S2qAye9BWiwkYYN/1pbEx1m79yG+yHFx4inhRdSH86yBj
   sSgn00QhmdBJxjI09irc/y/uFTDG/WOCkaLesLmIzs1m3cXvat4D0gIG0
   b6zZg1DeRZloonCI6/cxrxF+lGTxb7B3PUzME1po5aTG4+Wc+tEe0dHkd
   w==;
X-CSE-ConnectionGUID: /U3wxZduTyGZxgLpg+IFQQ==
X-CSE-MsgGUID: luJ0RVLKSJyUI2K9SUkrhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90603364"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="90603364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 08:09:11 -0700
X-CSE-ConnectionGUID: 3wy0yr3bQfOH24njOK8aGw==
X-CSE-MsgGUID: gdG70GqNRPivWKeyzUQQRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241145147"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2026 08:09:10 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLMp9-000000000E8-2FuY;
	Fri, 08 May 2026 15:09:07 +0000
Date: Fri, 08 May 2026 23:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 157/157] ERROR: modpost:
 "mtk_xfi_tphy_valid_ctle" [drivers/net/pcs/pcs-mtk-usxgmii.ko] undefined!
Message-ID: <202605082334.fsNAs8Ef-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: ce3735b05f8971cb2a88ba66c5df025751f12b10 [157/157] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: mips-randconfig-r131-20260507 (https://download.01.org/0day-ci/archive/20260508/202605082334.fsNAs8Ef-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082334.fsNAs8Ef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605082334.fsNAs8Ef-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/octeon-rng.o
>> ERROR: modpost: "mtk_xfi_tphy_valid_ctle" [drivers/net/pcs/pcs-mtk-usxgmii.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
