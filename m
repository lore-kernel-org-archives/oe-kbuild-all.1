Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C42AF15
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727515631; cv=none; b=ZtLeVlxmc5PxMHjneVSM5VfEdx5O5075PJ32OHnn7Wpe04b3HZ/kHaXOTa8S2q8LVF7AcVArOGexvkNKfgZUojodIjnmXZKU/gPWn1pXBrAbJjF4A5bSfzHpEX1lRIl8+r2jZtM6dx+ta/8zTIKiNj95zxE5a/psQRGGbM9dT5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727515631; c=relaxed/simple;
	bh=TiikYS52ZJ5Y9lQzXDZIhm9QxozcqIwrZNCPXu0vLiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsOSyvFVhLfRwG4pUeIr6Rsznqgqbhvu4yGAYqg2TfM7mQRzi7vO1kXrmxf0Hnr+1V7DoGCSV0VhvQYUu/NpkFwkdhGHSelWZWHGxI44yc1NMKFD56oNx+an+5/jNveXKdkvF4iSSCocgBT+lVHxBJmc8CL4okiYZkywsYBS+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbKQw/fW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbKQw/fW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727515629; x=1759051629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TiikYS52ZJ5Y9lQzXDZIhm9QxozcqIwrZNCPXu0vLiQ=;
  b=lbKQw/fWIbtuN5XQSaA6N7vPe3g+ngR5S6jIYTLSFvN1TG6wGptKmU6s
   9umXbkf0z72hz/ynVTn8QydU2tXOp8+fSll/IzcL2naaqmldY17BkIl9a
   5f3JFH1ayrd3Q0IK7Jaj35tEOIsgC5FZzVOO55IKFJKRjSq6EFVUutxO+
   PlHeF8F+s4CSFXUkTKYstf0Qh3CVODRvZ1yEh4uPL4aVtwS4RB1uZxPBz
   6pBs68pTyyujBAFdtji1UkiV7M9DZIvY6afLjnfmWjfXrijErKr0GzTYv
   y0kcM4B9Xao82QKmwD2nN+/bgQi7LgRgB2/0koRVpppRYu51ucOOlHi2D
   Q==;
X-CSE-ConnectionGUID: HyiEnat+RQ6K/4a3fvCbJA==
X-CSE-MsgGUID: aPWkWdoUS3KX2UbGXnWJCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37334363"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37334363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:27:08 -0700
X-CSE-ConnectionGUID: nRJenQqqTFOS3vrIGkUtzQ==
X-CSE-MsgGUID: 8Eoy1YENTQOKD3oezadefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73075972"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 02:27:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suTjF-000N67-0G;
	Sat, 28 Sep 2024 09:27:05 +0000
Date: Sat, 28 Sep 2024 17:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 537/16788]
 drivers/clk/imx/clk-lpcg-scu.c:51:21: warning: variable 'reg1' set but not
 used
Message-ID: <202409281741.4rhDN0AP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 3440db800daa934166a7135e4b671763ec5d3e41 [537/16788] LF-446 clk: imx: lpcg-scu: SW workaround for errata (e10858)
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281741.4rhDN0AP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281741.4rhDN0AP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281741.4rhDN0AP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-lpcg-scu.c: In function 'do_lpcg_workaround':
>> drivers/clk/imx/clk-lpcg-scu.c:51:21: warning: variable 'reg1' set but not used [-Wunused-but-set-variable]
      51 |                 u32 reg1;
         |                     ^~~~


vim +/reg1 +51 drivers/clk/imx/clk-lpcg-scu.c

    44	
    45	/* e10858 -LPCG clock gating register synchronization errata */
    46	static void do_lpcg_workaround(u32 rate, void __iomem *reg, u32 val)
    47	{
    48		writel(val, reg);
    49	
    50		if (rate >= 24000000 || rate == 0) {
  > 51			u32 reg1;
    52	
    53			/*
    54			 * The time taken to access the LPCG registers from the AP core
    55			 * through the interconnect is longer than the minimum delay
    56			 * of 4 clock cycles required by the errata.
    57			 * Adding a readl will provide sufficient delay to prevent
    58			 * back-to-back writes.
    59			 */
    60			reg1 = readl(reg);
    61		} else {
    62			/*
    63			 * For clocks running below 24MHz, wait a minimum of
    64			 * 4 clock cycles.
    65			 */
    66			ndelay(4 * (DIV_ROUND_UP(1000000000, rate)));
    67		}
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
