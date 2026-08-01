Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BFE372B5A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 22:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785624723; cv=none; b=lHS1D5qyKh8Wp58ezl3Tch0cVFukLYdiZ+gWD/FNs4kNLVs/H225SEsz1PB/Xv+ywwnHrCBJGXMU6XFEy5rpq6UJz7WbDk++VqA3Ku4+ZblQlsEgsjK1X8M9EyLU+Yq7m3njhlbymOeTb8NPDDpv5Muvg/vT5sMD9b6ifQmuHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785624723; c=relaxed/simple;
	bh=Ejrh+Uu9UyHavNrFk6zU26uLE5ujQpLRpddZepKt3JI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pjhlh4pcI7NtvPbO0EKleGSLMSeREXrEAaty/Qn8x7pNk/IwOpki9owobawP8tMyINVMUODUns00/EeC0DdI4FvhUa9QCV9WY85SvVNL33y9Ab146Jfdk670/YlAAX+vnGwo0/NunBeKi72XqjDMRwyW296xRfCXuVGSdcg0RcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOJ1EjDs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOJ1EjDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785624722; x=1817160722;
  h=date:from:to:cc:subject:message-id;
  bh=Ejrh+Uu9UyHavNrFk6zU26uLE5ujQpLRpddZepKt3JI=;
  b=gOJ1EjDsqF4JwvaPQnhLKWgNEGgjOA6UTAl047DjuFE/JMm3YzBkWTg0
   p5LzoPIQWevBMVJqwHyFDVoxMOZlwljvVYuWy4d1d2wJAw8ROAu1kiG7w
   nzd6MCWBgnbYPA+e1/Lh3NoJqQNgWtBLvO5J2fNPxKrXa4BJGjOp22ak+
   dHXkOrfd8aQ/5FcoiUKZh6rN+Nbf/rmtr4uVRqtwzTYpSHeYyMMbvwjgB
   SyijDSYPKqjkna7PQZzGicXNXG/BQL//12al28EVjWfpnKoRxhBXo9ePD
   OpkcdcGl1CoXEyOuNnA/I06pcMRmior0bII6YoYQwbAVvkU1wRgeU1r3A
   A==;
X-CSE-ConnectionGUID: jp2wfKa3Qnqb1ZbAuWAzQw==
X-CSE-MsgGUID: O1ojt7P8TOCflIM86XFdbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="103616777"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="103616777"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 15:52:01 -0700
X-CSE-ConnectionGUID: bCL+5kCDQtepPWVl0OGqFw==
X-CSE-MsgGUID: PWIAYJOmQkyKh801zgZf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="259079558"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2026 15:52:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqIYf-00000000405-0eB7;
	Sat, 01 Aug 2026 22:51:57 +0000
Date: Sun, 02 Aug 2026 06:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 357/700]
 drivers/net/ethernet/cadence/macb_main.c:4077:12: warning: 'msc313_clk_init'
 defined but not used
Message-ID: <202608020628.7gz0fmZf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: f4632a2fb4430616482f93927167a2b61385552c [357/700] macb: add hack for tx_ref and rx_ref needed for rmii
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020628.7gz0fmZf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020628.7gz0fmZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020628.7gz0fmZf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/cadence/macb_main.c:4730:12: warning: 'msc313_init' defined but not used [-Wunused-function]
    4730 | static int msc313_init(struct platform_device *pdev)
         |            ^~~~~~~~~~~
>> drivers/net/ethernet/cadence/macb_main.c:4077:12: warning: 'msc313_clk_init' defined but not used [-Wunused-function]
    4077 | static int msc313_clk_init(struct platform_device *pdev, struct clk **pclk,
         |            ^~~~~~~~~~~~~~~


vim +/msc313_clk_init +4077 drivers/net/ethernet/cadence/macb_main.c

  4076	
> 4077	static int msc313_clk_init(struct platform_device *pdev, struct clk **pclk,
  4078				 struct clk **hclk, struct clk **tx_clk,
  4079				 struct clk **rx_clk, struct clk **tsu_clk)
  4080	{
  4081		struct clk *rx_ref = devm_clk_get_optional(&pdev->dev, "rx_ref");
  4082		struct clk *tx_ref = devm_clk_get_optional(&pdev->dev, "tx_ref");
  4083	
  4084		if (IS_ERR(rx_ref))
  4085			return PTR_ERR(rx_ref);
  4086	
  4087		if (IS_ERR(tx_ref))
  4088			return PTR_ERR(tx_ref);
  4089	
  4090		if (rx_ref)
  4091			clk_prepare_enable(rx_ref);
  4092	
  4093		if (tx_ref)
  4094			clk_prepare_enable(tx_ref);
  4095	
  4096		return macb_clk_init(pdev, pclk, hclk, tx_clk, rx_clk, tsu_clk);
  4097	}
  4098	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
