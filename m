Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B919F137
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315625; cv=none; b=n+D3827CfRSEtb5ifrOB9FiIPhbZ45BvrUVHULnlZwNLVNVBv8M4W6tWS9VwwQ4wRTqPPtR5PiSCBgKsdItb438/JSTejCzw613brfxe4OKe0Bfa6CmzqSe13f62ipYoaJhZf7mhKv9uACp9/xpR8m3vhsJz0R1F165EtaRck+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315625; c=relaxed/simple;
	bh=DgEm1o1YW5/3MGq0KX5SIpXsTqSwcat3Su5LSk5SIWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lb31y1r2hKwWTam101d927aBfcln0/e+K+Me9XJyR9ZtdJijSAxnJKJYlUU7lFambe+itji8eDJQJmSx5Z78TlPs3ATflWRimpAELH+B9gzNiKU9O9spfuvSxvMCiZulGBH5uD7F0Uqw7deXpsI3vDXfQDQRuFMBO0fzr8IBVzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjVphzur; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjVphzur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787315622; x=1818851622;
  h=date:from:to:cc:subject:message-id;
  bh=DgEm1o1YW5/3MGq0KX5SIpXsTqSwcat3Su5LSk5SIWU=;
  b=GjVphzurP2nJZRM2gewVBqIIdqoNXareDKHvdlAWYe0iSqZV8vs5uR7i
   +BU1dgua5c9/YxDmcm73DEC4jUPul9srtRxHeU9u8gu3llicAINk53sdQ
   TKW9OJda9tCi7Cyz1lfxIXNIuL/3okr37nbcEHUh+sN08poDjoWoZvzyw
   CibX4j/POldDHji1/5j62ZVZpEtpYWhkPgV/DZ9T3k3FVrUGFc9esPiqZ
   scNCTBLEY8s+tH8VXgLeZ5hvzRsl1d1Uq+QoccVJkN8/SEKnuiSYkntqv
   UFw31HObW8+pMD0AQbZnKyRNDEnQGz9A2P2tdNhHxEs4FhmfvmADxlylY
   Q==;
X-CSE-ConnectionGUID: W31U2+HLRSuQZRGg4oMHFg==
X-CSE-MsgGUID: wwxnsgWXQwiO/r/uqbHcPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105243756"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="105243756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 05:33:40 -0700
X-CSE-ConnectionGUID: F2Pckg65SeK5K+j0oay7Qg==
X-CSE-MsgGUID: Bp5E6RTzS8CwLj2zpKapJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270151270"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2026 05:33:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxORE-00000000puP-1uvN;
	Fri, 21 Aug 2026 12:33:36 +0000
Date: Fri, 21 Aug 2026 20:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [jirislaby:next_master 43/202] ERROR: modpost:
 drivers/soc/qcom/ubwc_config.ko: symbol 'qcom_smem_is_available' undefined!
Message-ID: <202608212029.iBnW3Yv7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git next_master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: b50c5ac42ef203a068eb92502aa7c1abcef244cc [43/202] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
config: arm64-randconfig-001 (https://download.01.org/0day-ci/archive/20260821/202608212029.iBnW3Yv7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212029.iBnW3Yv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608212029.iBnW3Yv7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/soc/qcom/ubwc_config.ko: symbol 'qcom_smem_is_available' undefined!
>> ERROR: modpost: drivers/soc/qcom/ubwc_config.ko: symbol 'qcom_smem_dram_get_hbb' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
