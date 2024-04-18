Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE4190695
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 21:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474021; cv=none; b=CAU4vS6QHx7XeKQyFfTVgBbLGKQQDknKD1sh7nAnhchkOBR3KjmI2ErSamSJGyVUDG5TsSDxh0nHAUOuSSjdo5ise47k3Wo9yD915aAGSUVQ1e2VTHnpGNA80+jXS/Pyd6mhWDsmyWX0Bu03fgAOWS9lhgHzNJZVwMBmChyKAas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474021; c=relaxed/simple;
	bh=HpsLpMx4xaH/Uz1LIo5fNPjmqca4JSHgaYSyaY4ovuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1malGfTYFuImiE7lBdl+jkeki3dcpGSWLuwUD/wVRpwm06qNcnlDs8tXfUGGFa7bLxRvDsU0+FKLuteu/3Apd1dI1wzMtXaO/1g8LCf4FAEkNSJUKWCt+Y7W9Ccdp4CZ6iEXVUCtZ11xg7Zgur5A/SKPvI2Kzh6RjxT2qRuUzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAkowPfb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAkowPfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713474020; x=1745010020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HpsLpMx4xaH/Uz1LIo5fNPjmqca4JSHgaYSyaY4ovuE=;
  b=HAkowPfbMpd9kGfE5aHm2bXq02IBQUL71bw82m47kF/wpP03s8r8U/D9
   QpbRnSA2J6CYrTzcR1GvlmVjozRZ+xaAvT86CRIDu4QZgtEIi0tlBTzRM
   8wjq3Wz5RfeY735Znan8EmmJvfq+FFrMeEt334ZqV07tx31IDH2nN0z+Y
   TvFT464semOZ0hzeQibz1JejuVlnTHPTnA2B5J2E+X4YjmtIZ4yXE7CGu
   bYapXKHs5t9avvZ0r8w3yINHli3hsyPxRa2xU0i9Lki9Aig2a9ao+7vJO
   5RtBiKT0jms9OPY7YvUjsoo8nuvcMIXOgt3SMzFN13VUAIxz2jwjhUrli
   A==;
X-CSE-ConnectionGUID: o+m/UNEwTVCOWrTSTJkUWg==
X-CSE-MsgGUID: caxkA9HHQd2nhzHPs/doVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20476081"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20476081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:00:18 -0700
X-CSE-ConnectionGUID: 8VNDF5VkSx+F4gFRIKcrWw==
X-CSE-MsgGUID: csHux92uQXmSmFIotgcFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23175674"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2024 14:00:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxYre-0009EE-0P;
	Thu, 18 Apr 2024 21:00:14 +0000
Date: Fri, 19 Apr 2024 05:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-rtmr 4/6] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_HASH_INFO when selected by TSM_REPORTS
Message-ID: <202404190406.1qzcv1Vp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-rtmr
head:   034dfd2cbc72b990426dce9f89170c9bb8a18592
commit: 95edbe65d16061170ac5c9fb9e71162fe91fc627 [4/6] tsm: Allow for extending and reading configured RTMRs
config: x86_64-kismet-CONFIG_CRYPTO_HASH_INFO-CONFIG_TSM_REPORTS-0-0 (https://download.01.org/0day-ci/archive/20240419/202404190406.1qzcv1Vp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240419/202404190406.1qzcv1Vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190406.1qzcv1Vp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO when selected by TSM_REPORTS
   WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - TSM_REPORTS [=y] && VIRT_DRIVERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
