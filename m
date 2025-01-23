Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECAB1487ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654292; cv=none; b=NxtJH/5GV+dp2pNW9gMBpPXUE9LqyP/HczqsUcJolG6XUHY7Ao/xThEE+QmCRNQ2Q2jr6GxvEFYCICy1UwqJkSvmKC1/QxWi5XOYVo443hch4xsyfrnRCfBfaBtHkmRFqD5gXaw854fkDj0FLZ/nLWKVIH9/PWYAWxQ+HS6Q9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654292; c=relaxed/simple;
	bh=JiDUXu4UFHl2CAwpijH4v2VWeiwWLTPrGHLiw5RiGKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrIrkSEO6SOiNkrpjOT1KgCUtTNB3SvLJEz5Jcejo1AO1afHubiGhym/dx0YyoEAOPvEnbDWD8pPNgWwB2gc0J6zugSLtsFeWJqQ9gbxhOFv+JYzvdz3SP+ZETv/2WW2pRFd0lswHBNBCuNwPZev3R2G/Jqw5kzeLLD1xVfWJk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1F0AcNM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1F0AcNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737654291; x=1769190291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JiDUXu4UFHl2CAwpijH4v2VWeiwWLTPrGHLiw5RiGKU=;
  b=G1F0AcNMIi3P4IGgbt5aNnH36psTDXw+EcX7hwHR47NVfpP/oWuKIAIg
   4YnBfLrVwMHaWifg5UG/47pjts/CHhn9FtBUM3R7wV18yETBT8GSxJ4+x
   7RKBGldPwy3KSQPBOrsoIfgYa9CsmwAOJpn4zE/s/Kjxsm9KhrXJwRQrh
   Pa0Ymji33gsMzlwwlvrIeFoCUs98eOz5cPKho07kD3ByGoQmzYI0lRdZ3
   +AW0yKp3JnLitY0PtZKj0TrNhADvhlk6lwVuCaCMkPt0DWUCxERks/wvx
   ghICWjL4zw1bhqOuBqQy8944UBkRJF6wneM84WL/vWQRohlQ9FH0vP24Y
   g==;
X-CSE-ConnectionGUID: XCJY5Z+vTbeYuMHI/rJ4eg==
X-CSE-MsgGUID: meMr4wh8RaW2bFiGTRMFaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25772613"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="25772613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:44:50 -0800
X-CSE-ConnectionGUID: NOmXhsGSQlSuzktfXs7j9g==
X-CSE-MsgGUID: QyEYJD18TLSHBktLl3dWtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112488146"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2025 09:44:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb1G2-000bST-28;
	Thu, 23 Jan 2025 17:44:46 +0000
Date: Fri, 24 Jan 2025 01:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:24: error:
 returning 'int' from a function with return type 'struct regmap *' makes
 pointer from integer without a cast
Message-ID: <202501240133.l9ZhAbmW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b33e322e1a35554932b5cfc4cd9f32bfa7d534a9
commit: ae0429c5708a06415ad0022fc8a148202780b402 [13/13] CHROMIUM: soc: mediatek: apu: Add mt8196 apu power driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250124/202501240133.l9ZhAbmW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240133.l9ZhAbmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240133.l9ZhAbmW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:43:5: warning: no previous prototype for 'mtk_apu_get_rpc_status' [-Wmissing-prototypes]
      43 | int mtk_apu_get_rpc_status(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/apusys/power/mtk_aputop_drv.c:63:5: warning: no previous prototype for 'mtk_apu_get_rpc_pwr_status' [-Wmissing-prototypes]
      63 | int mtk_apu_get_rpc_pwr_status(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c: In function 'get_mbox_regmap':
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:24: error: returning 'int' from a function with return type 'struct regmap *' makes pointer from integer without a cast [-Wint-conversion]
      77 |                 return dev_err_probe(dev, -EPROBE_DEFER,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      78 |                                      "failed to add device link between power and mailbox\n");
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
