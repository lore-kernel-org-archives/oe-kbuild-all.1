Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7E1D9A7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705975; cv=none; b=AK00Hemm9AMrUlxlknWzjix/bqzSqrqfVAqPiOHwZOh/YjB7hHAEcXl6NRiRmZXkManeFZ8TmiNgbPvaZrhEB3YiowOxytGrqalbz19GopMcG4ECt/wlcVau+AV58EtNMKNyGToW9ZW1aedAW5lG3nvHmwY8xKKclQYRwuDda7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705975; c=relaxed/simple;
	bh=l/+ucf7lHcXp96NICjBWROIjcoS05nC/gVOb/rW01Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYhz0gohU/ZCP96B4+lLhxcIK9sCPGS9lvNecttNTIPeqXS9d8HfgY+4mGZL/RBVO8YOdaUbDpx5PW4SsJagetwPkGlYgmUpTMxmLFTxawJXCFjqpeeKpcKGim+7G+5WCM7tFkTNzCUAT100MDXXZPp++IMgaVJFMkswq4jXSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mREH7FTb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mREH7FTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737705973; x=1769241973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/+ucf7lHcXp96NICjBWROIjcoS05nC/gVOb/rW01Yw=;
  b=mREH7FTbmu6K/8zx0im7HPysWJdrax25hnXyvVj8HSo9EeHvqHubZ1nw
   rbhJIwBXv1qTNwtPXd+cDbCco7F2+R3l84FNa8Bs2WQWNEuGbhUy/hMqQ
   8OfORpM8QKFm9OF0U8/lu59ynTgyr7R8NSwPRTy/h9y81zbZCOyW/zOQk
   rsFeWAhaXZpMeWZTfg/ONW7/sVXE8MJ/8v71Axqh+TVEhD/msdzlZLlXz
   DXgGvHmz6qzg3zPp8dxkyaeQll1+abQ+ZYzQgdLefynuF+TDDdBcJkP08
   lCipqDY5uwo33WIQTwR5PKhSaULUzvxjcFMXYpipiUN+OcllOgKT56S/1
   Q==;
X-CSE-ConnectionGUID: l+XRyh5oRLiV6hKbtjHD8A==
X-CSE-MsgGUID: 3UCm91PDT+C2y1oiKWdxdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48897487"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48897487"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:06:12 -0800
X-CSE-ConnectionGUID: 8FTYogaXTIOEh0u83K5gmw==
X-CSE-MsgGUID: XaOeUHMqR7S8uP4RUUyEfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107550023"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jan 2025 00:06:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbEhc-000cPn-2r;
	Fri, 24 Jan 2025 08:06:08 +0000
Date: Fri, 24 Jan 2025 16:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:10: error:
 incompatible integer to pointer conversion returning 'int' from a function
 with result type 'struct regmap *'
Message-ID: <202501241544.pJvvH7RS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f612ad76bc03d33dccc654778308af5496867eb5
commit: ae0429c5708a06415ad0022fc8a148202780b402 [13/13] CHROMIUM: soc: mediatek: apu: Add mt8196 apu power driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250124/202501241544.pJvvH7RS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241544.pJvvH7RS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241544.pJvvH7RS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:43:5: warning: no previous prototype for function 'mtk_apu_get_rpc_status' [-Wmissing-prototypes]
      43 | int mtk_apu_get_rpc_status(struct platform_device *pdev)
         |     ^
   drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | int mtk_apu_get_rpc_status(struct platform_device *pdev)
         | ^
         | static 
>> drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:63:5: warning: no previous prototype for function 'mtk_apu_get_rpc_pwr_status' [-Wmissing-prototypes]
      63 | int mtk_apu_get_rpc_pwr_status(struct platform_device *pdev)
         |     ^
   drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | int mtk_apu_get_rpc_pwr_status(struct platform_device *pdev)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct regmap *' [-Wint-conversion]
      77 |                 return dev_err_probe(dev, -EPROBE_DEFER,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      78 |                                      "failed to add device link between power and mailbox\n");
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +77 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c

    53	
    54	static struct regmap *get_mbox_regmap(struct device *dev)
    55	{
    56		struct device_node *mbox_node;
    57		struct platform_device *mbox_pdev;
    58		struct regmap *regmap = NULL;
    59		struct device_link *link;
    60	
    61		mbox_node = of_parse_phandle(dev->of_node, "mediatek,mbox-spare-reg", 0);
    62		if (!mbox_node)
    63			return ERR_PTR(-ENODEV);
    64	
    65		mbox_pdev = of_find_device_by_node(mbox_node);
    66		if (!mbox_pdev) {
    67			regmap = ERR_PTR(-EPROBE_DEFER);
    68			goto out_put_node;
    69		}
    70	
    71		regmap = dev_get_regmap(&mbox_pdev->dev, NULL);
    72		if (!regmap)
    73			regmap = ERR_PTR(-EINVAL);
    74	
    75		link = device_link_add(dev, &mbox_pdev->dev, DL_FLAG_PM_RUNTIME);
    76		if (!link)
  > 77			return dev_err_probe(dev, -EPROBE_DEFER,
    78					     "failed to add device link between power and mailbox\n");
    79	
    80		platform_device_put(mbox_pdev);
    81	
    82	out_put_node:
    83		of_node_put(mbox_node);
    84		return regmap;
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
