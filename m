Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725F418C34D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725968611; cv=none; b=S9rl9gNaX48puJ55C49WUh+TRKlPMQRc7RwH/ceC/dsMPtLxyF+OabO1yd3PSoRwiSQXQqQVqeDHIdA4EA7QPtKM13IrNBA5zJqQiDy6EEdTWbknK/OUHEqztf7SngvE7udddRr9ET+SCm1o0tjTs2zL+2ugdXe597DBfFunDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725968611; c=relaxed/simple;
	bh=FxmHdU3hdyZGXA7BuSh+QWVdIWdbQsNS6O77NMoBd/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aK7z9LtaweWSr1X14iv7xEwNMFl+sxfhqco/3MYpefh64kFTDixn8RVpFWaXNPhnrxd8q7MC3qsXJ/0Kxpu3V2fK3mp3oxnFj7guw3ka+WMrEa67ggtpkjAwQclVqmstyuec+ufEd+4jPBtt7jktIDpQoIbzQx1j6n3O9+I3B4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnOLE/2v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnOLE/2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725968609; x=1757504609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxmHdU3hdyZGXA7BuSh+QWVdIWdbQsNS6O77NMoBd/M=;
  b=SnOLE/2vfSXKTipK3Ns20jKS3BrgzpYC4bL4NmyYDViORerYhu+mLpc9
   jPNe3UPaPN/q7CTd8dOmsYT6Amu5Wx+LzlYHXBZJI3QYHZz3Ip0TjMN57
   wntYII3xhJWgsX59s5d9N+18aPhgFu1URJ8ecLeTCx2E3fgXvCl2elH4X
   eudENENR1lHwxpdEEPygEcEUJCnU11Skkx3w5itz9AYIdc3zgn8xDCPe9
   hbiOkV6+nh+J6zJcdzkJd4wtH4SEChf1Wkp8E7jKBmKa2pEfsfmaGKUq9
   adgG3KZUKbXGa7tKAIS+Tgc0G6dcbwhdKDQjc3AIS1zlOZb1YN+rDyqNd
   A==;
X-CSE-ConnectionGUID: z1bYUbokSsiG+3x5jmi0ZA==
X-CSE-MsgGUID: o5fgpZ9VQ9qU8pVWTWJfHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24574155"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24574155"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:43:29 -0700
X-CSE-ConnectionGUID: YmcnDvrcT7GfgrjQkh8raQ==
X-CSE-MsgGUID: PQ8id6rTSW+iwOMFT9BCqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="66803230"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2024 04:43:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snzHJ-00020k-2I;
	Tue, 10 Sep 2024 11:43:25 +0000
Date: Tue, 10 Sep 2024 19:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 18/31] kismet: WARNING: unmet direct
 dependencies detected for ERRATA_ANDES when selected by ARCH_R9A07G043
Message-ID: <202409101911.saWaEzsg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   d5cc54849a0b793a2413dcd5f31b45d9907066ab
commit: c868ba37129f941bf55e6e20fd666f1bc3a27ad7 [18/31] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
config: riscv-kismet-CONFIG_ERRATA_ANDES-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20240910/202409101911.saWaEzsg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409101911.saWaEzsg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101911.saWaEzsg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ERRATA_ANDES when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for ERRATA_ANDES
     Depends on [n]: RISCV_ALTERNATIVE [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
