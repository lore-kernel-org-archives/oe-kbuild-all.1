Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862031DED79
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740866281; cv=none; b=RRW3DAxTgqmtpxsHrDUpuafwD4QuTS+WQ6VJO3mhPKQmRAJfh8ze96cuKgh25rNkQfpTKkp8lpZPToBeXYDm7Edsqjb8Y4WAQm1xuNbU3mIYiKvQkGkWWR0yZkHOuR28M6Y2mnD8RaXxPGbXozR3FeXZkc71EJKqwEunpRLeqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740866281; c=relaxed/simple;
	bh=ojFzulCXDEMly9qyeJY7C4BCPM7vNvCVev0pov5Clfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uV9dHXrunB4Bc4M7oJAOCTf/3ljJjBVaxSRQ/rptv2veWNztFv65d1PbiWi2HUXokNMt662nU5V91DDu4ixn7b6zGfOVhOdt5OqwHtma9JE1Q7LKz1kXXPrQiTbe/WA5v2UZcMVnoOLS+nwuXJ8bLGeesc2txy30wW/ga+nRkyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNdmf4Zc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNdmf4Zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740866280; x=1772402280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojFzulCXDEMly9qyeJY7C4BCPM7vNvCVev0pov5Clfo=;
  b=hNdmf4Zc8lxE+GFqXjyjSBpmIHxCQSunV7t/SWhSf0m+6rPgjEo+p2TV
   C1OvwUMT5DxiAgnB8i+vFP0PoW9RI0jT32TWA7l7EYTZldBR/Vi9Si/I4
   LMWft6khfv94jt+8Hu21JBC5NwWYb5mFOcTyKZHdU1Cf+aK6vvlse7Gf+
   EWCTUoKe8dhH7QKZ0f/s8qJrFdf4S13CB3lucseEpHFfTWqZKL1Rc1e+p
   eTq1gPS86SLWeolvhQdLLJpWklhxaYLgt2b40XC/0XQKmWhbHY0JMQLRe
   ZCoFhzmyOWQoiBr6UiEFXfj5+0MuocVGfCzX5Jtn3aMMjnKBOngMJsvop
   A==;
X-CSE-ConnectionGUID: edx2bN5iS62ZrknrxXGreg==
X-CSE-MsgGUID: dsHwpdqQTTe+aSqotZOjoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41799354"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41799354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:57:59 -0800
X-CSE-ConnectionGUID: 6vw+F3jjQqmaKPZdwK/CGQ==
X-CSE-MsgGUID: r7mjrjYOR2aeNdzhepfSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118543134"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 13:57:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUqC-000GkQ-2k;
	Sat, 01 Mar 2025 21:57:50 +0000
Date: Sun, 2 Mar 2025 05:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Tao Huang <huangtao@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [rockchip:v6.15-clk/next 10/10]
 drivers/clk/rockchip/clk-rk3562.c:1081:38: error: invalid use of undefined
 type 'struct platform_device'
Message-ID: <202503020525.AVLjosKr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-clk/next
head:   36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a
commit: 36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a [10/10] clk: rockchip: Add clock controller for the RK3562
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250302/202503020525.AVLjosKr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020525.AVLjosKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020525.AVLjosKr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rk3562.c:1079:36: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^~~~~~~~~~~~~~~
   drivers/clk/rockchip/clk-rk3562.c: In function 'clk_rk3562_probe':
>> drivers/clk/rockchip/clk-rk3562.c:1081:38: error: invalid use of undefined type 'struct platform_device'
    1081 |         struct device_node *np = pdev->dev.of_node;
         |                                      ^~
   drivers/clk/rockchip/clk-rk3562.c:1085:62: error: invalid use of undefined type 'struct platform_device'
    1085 |         match = of_match_device(clk_rk3562_match_table, &pdev->dev);
         |                                                              ^~
   drivers/clk/rockchip/clk-rk3562.c: At top level:
>> drivers/clk/rockchip/clk-rk3562.c:1096:15: error: variable 'clk_rk3562_driver' has initializer but incomplete type
    1096 | static struct platform_driver clk_rk3562_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1097:10: error: 'struct platform_driver' has no member named 'probe'
    1097 |         .probe          = clk_rk3562_probe,
         |          ^~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1097:27: warning: excess elements in struct initializer
    1097 |         .probe          = clk_rk3562_probe,
         |                           ^~~~~~~~~~~~~~~~
   drivers/clk/rockchip/clk-rk3562.c:1097:27: note: (near initialization for 'clk_rk3562_driver')
>> drivers/clk/rockchip/clk-rk3562.c:1098:10: error: 'struct platform_driver' has no member named 'driver'
    1098 |         .driver         = {
         |          ^~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1098:27: error: extra brace group at end of initializer
    1098 |         .driver         = {
         |                           ^
   drivers/clk/rockchip/clk-rk3562.c:1098:27: note: (near initialization for 'clk_rk3562_driver')
   drivers/clk/rockchip/clk-rk3562.c:1098:27: warning: excess elements in struct initializer
   drivers/clk/rockchip/clk-rk3562.c:1098:27: note: (near initialization for 'clk_rk3562_driver')
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: warning: data definition has no type or storage class
    1104 | module_platform_driver(clk_rk3562_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Wimplicit-int]
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/clk/rockchip/clk-rk3562.c:1096:31: error: storage size of 'clk_rk3562_driver' isn't known
    1096 | static struct platform_driver clk_rk3562_driver = {
         |                               ^~~~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1096:31: warning: 'clk_rk3562_driver' defined but not used [-Wunused-variable]


vim +1081 drivers/clk/rockchip/clk-rk3562.c

  1078	
> 1079	static int clk_rk3562_probe(struct platform_device *pdev)
  1080	{
> 1081		struct device_node *np = pdev->dev.of_node;
  1082		const struct of_device_id *match;
  1083		const struct clk_rk3562_inits *init_data;
  1084	
> 1085		match = of_match_device(clk_rk3562_match_table, &pdev->dev);
  1086		if (!match || !match->data)
  1087			return -EINVAL;
  1088	
  1089		init_data = match->data;
  1090		if (init_data->inits)
  1091			init_data->inits(np);
  1092	
  1093		return 0;
  1094	}
  1095	
> 1096	static struct platform_driver clk_rk3562_driver = {
> 1097		.probe		= clk_rk3562_probe,
> 1098		.driver		= {
  1099			.name	= "clk-rk3562",
  1100			.of_match_table = clk_rk3562_match_table,
  1101			.suppress_bind_attrs = true,
  1102		},
  1103	};
> 1104	module_platform_driver(clk_rk3562_driver);
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
