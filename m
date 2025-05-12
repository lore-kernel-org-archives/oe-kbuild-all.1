Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D79D3D6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045108; cv=none; b=Ssc4luSRdfHpjsvD1b8GAKk4ny6Thi0krPduvsGt6qlqj8v9NEq42NxTFWJWyJpL+GpkaZt+mpSi5s1P4kUYVt1J4XSca5HVZjuf2ew9ZrbZlDAx9rTIWduj+V8RzZk1BFb6iXVO0Fs/klArIfyU3iPPdEF/qoqG5OvAzgtUvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045108; c=relaxed/simple;
	bh=FbzUUOLxbbTZP0iI87QDcxGvKX0P3PzE/e3yedOObS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ewoW8RMoWXVHmFh4iXYHKjfXUUswCV5TgJhQsJ486Jd46WN3Bp3o2hvxCT58j+7Fa/NnwlrRqMBvi4DOgAJ5eePa8muWB4xvEZC/wpg7xnUzBC0Jy4NxzrTBCqWkh4xihaTM2CzGYQcQGa8aZLkttN1rBOZYz40fJlFKLWeBoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR7jQQCO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR7jQQCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747045105; x=1778581105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbzUUOLxbbTZP0iI87QDcxGvKX0P3PzE/e3yedOObS4=;
  b=hR7jQQCOsK/mRZ21lxlaK7PeQG3BbrA9CNPQjKAdGAA0lRjTN+T18Xtd
   Nar0YFrdPOdjRRj69amrwUAA+qgVB6Ql0e6TFVPmaAebkqswhIS63XQ6/
   KxBExTnAeexVG19KOgEY1VOV9g4Ny50fTEdmTCccFVWhfg1UAGua+gjxo
   KMTkaAg7GugRXn0eOKyWNDfSIVK/VKe3fKMhFyNHp3ojmiwly/yZKNj7S
   mDjcmAlD3PuPbkCYyq/KGlszeOmZF61cpdS00S8jfVVWVZI35SNEByR7H
   zEJYkbeP/Mzc0YvtV2dSNiVfakm5AxR06PauJGPeKuHqUULC9OuFg435A
   Q==;
X-CSE-ConnectionGUID: HZxbWA9LTgS05Ewwt24UwA==
X-CSE-MsgGUID: a0j80P5HR/OLlcPGC0BD2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48830536"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="48830536"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:18:25 -0700
X-CSE-ConnectionGUID: QidQEkNGTYWON7+Z9SUKcw==
X-CSE-MsgGUID: lQ0tusFSRdivDbwxebtxPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137177094"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2025 03:18:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEQEn-000EMd-0M;
	Mon, 12 May 2025 10:18:21 +0000
Date: Mon, 12 May 2025 18:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 14/14]
 drivers/pwm/pwm-sophgo-sg2042.c:56: warning: Function parameter or member
 'chip' not described in 'sg2042_pwm_ddata'
Message-ID: <202505122008.1FsRRSKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   fdfe8d27fba094e217bc547604c7a9ea01804c7a
commit: 35015ff166d0aa003a0a52d35767243ff97e82cf [14/14] anolis:bugfix: pwm: SG2042: Adapt for Linux 6.6
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250512/202505122008.1FsRRSKe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122008.1FsRRSKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505122008.1FsRRSKe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-sophgo-sg2042.c:56: warning: Function parameter or member 'chip' not described in 'sg2042_pwm_ddata'
>> drivers/pwm/pwm-sophgo-sg2042.c:56: warning: Function parameter or member 'clk' not described in 'sg2042_pwm_ddata'


vim +56 drivers/pwm/pwm-sophgo-sg2042.c

a0a418f98be4ac Chen Wang 2025-02-05  45  
a0a418f98be4ac Chen Wang 2025-02-05  46  /**
a0a418f98be4ac Chen Wang 2025-02-05  47   * struct sg2042_pwm_ddata - private driver data
a0a418f98be4ac Chen Wang 2025-02-05  48   * @base:		base address of mapped PWM registers
a0a418f98be4ac Chen Wang 2025-02-05  49   * @clk_rate_hz:	rate of base clock in HZ
a0a418f98be4ac Chen Wang 2025-02-05  50   */
a0a418f98be4ac Chen Wang 2025-02-05  51  struct sg2042_pwm_ddata {
35015ff166d0aa Yao Zi    2025-05-01  52  	struct pwm_chip chip;
a0a418f98be4ac Chen Wang 2025-02-05  53  	void __iomem *base;
a0a418f98be4ac Chen Wang 2025-02-05  54  	unsigned long clk_rate_hz;
35015ff166d0aa Yao Zi    2025-05-01  55  	struct clk *clk;
a0a418f98be4ac Chen Wang 2025-02-05 @56  };
a0a418f98be4ac Chen Wang 2025-02-05  57  

:::::: The code at line 56 was first introduced by commit
:::::: a0a418f98be4ac65319f910eb022312c7c44d340 pwm: sophgo: add driver for Sophgo SG2042 PWM

:::::: TO: Chen Wang <unicorn_wang@outlook.com>
:::::: CC: yanan.he <yanan.he@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
