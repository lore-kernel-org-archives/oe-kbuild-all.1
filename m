Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1534C81
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749267725; cv=none; b=WmVH1KYc6oI5QIVomQvRlwh/vXBvwkVXm32Mrjmk2GbhNhzBpPLaCogJkZ0lxZzqKQhUYucqhzDTnTgHzlsAj3sJM82auY+te2Cq78G9bLvhfp0ovDzf68TwTIw1MdMZfr3J/8pDOOHi29+4U7wLEkSRlYAtHkiT3XSNbnmPpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749267725; c=relaxed/simple;
	bh=jmRCMH3ftvtdMArre/kqRz5Zw2oM2bVIO9WZuLHfcCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPDGeP/dt7JW/95NUCDlNvOhpv6Kre1osj9UJGRlibM6WIULaHE9GRjfiVowvO9Kzpwkz8JCYHJkWbUPZ5tkuWBp93Vxqv0bB2l2aEfY+AD13YiGN6h4ofbKPg44VUROAesDwxYW1XwHJBA1DzSAsJqGakZnr0DN+vN9jlReVV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiI4w9DS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiI4w9DS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749267724; x=1780803724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmRCMH3ftvtdMArre/kqRz5Zw2oM2bVIO9WZuLHfcCQ=;
  b=kiI4w9DSLGTVp2b+dFZ/0eDMEk3RtA9S2U/WmSXmbZoHV93j1pQLm56W
   lwTXaKTeyTsm4h4RRbVXaczjDvZ73R6YRQcUxw0JniVZ9FLvTRnjoPm6H
   UmJyEM0asCX1WflBEcMDFt3tX7qtsX9EXd5JdifOUWINxOAYaiA+4d4kc
   txl7t85ZT32OXRmr8iwgIJL6QujeVmAqYRM4bRCH3CaOMQfMctaAb/kyw
   OybRflXOkKsW2M1/hajagtSlBCDMFQHggvJVXI3FNpEUneOWnU48bPAYc
   dHEGUMh+2EXFb3yxIgK1h+/glg4AoEGH1goPqP0zDbssu5AUMTvjKAltU
   A==;
X-CSE-ConnectionGUID: DB8qR1GtTlyMFZjgs8+cHw==
X-CSE-MsgGUID: 3CRYWkzDTkO7MKYddbahCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68867779"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="68867779"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 20:42:04 -0700
X-CSE-ConnectionGUID: nq6bUa/6RtC7iJtRYllVtw==
X-CSE-MsgGUID: TLLHm5Q4SL2hBPOsmHDdhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="149826276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2025 20:42:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNkRU-0005S3-0N;
	Sat, 07 Jun 2025 03:42:00 +0000
Date: Sat, 7 Jun 2025 11:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/g3s/i3c 5/9] drivers/i3c/master/renesas-i3c.c:280:25:
 sparse: sparse: dubious one-bit signed bitfield
Message-ID: <202506071151.G5EwQ1vm-lkp@intel.com>
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
config: riscv-randconfig-r133-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071151.G5EwQ1vm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506071151.G5EwQ1vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071151.G5EwQ1vm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i3c/master/renesas-i3c.c:280:25: sparse: sparse: dubious one-bit signed bitfield

vim +280 drivers/i3c/master/renesas-i3c.c

   278	
   279	struct renesas_i3c_config {
 > 280		int has_pclkrw:1;
   281	};
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
