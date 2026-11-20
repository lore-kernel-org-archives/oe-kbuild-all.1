Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158198;
	b=mesZEqKry7DlfgcwEACKH3xgdXBcctMFH0rcwfhjuhnQfyYQ6NzUNS0nZ+mt6jtJZkWD
	 vzZ00nVbvB9ZxwVq6gD9Tvp72AcBdk9XOW/uSPW2ZlC5JrEsYe60+u7/auLrVMqxpCTt9
	 Ze2zgy09VWyeenEjQ54oL9NU5nKBA9AIbsBv06coGd33g1I2emDsDjfHPyWGlIkCfRkGh
	 TtgGJczAglJPv8IIg464pagLXrwWUC8eO3luj+Wd4atsoJmByDSSStfZ25FkVXFPAxuJQ
	 5U6Tvz+N5RKsNUf8ezz1E+mjv0N4oQtWJnMh4aVJyfnoHoTfGcj0aIDzpqMXd75t5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158198;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RevaFM2Lke43ks2Um36en/EscyCI3kNIb00nmK8rmto=;
	b=o7LN/SqKe5cxiB9wgzoolzxkjoA0JttrtUF74ZR4ZCfUFwg71svNOtzYSvd2SxWzzVeo
	 t0pQ9pxDFb+rodjLrhbuF/KQaxyCNbPa7G2E3lHTKEFKEyaw6k02ZAPwpqb7LqvhpwsiG
	 rbMqfuoBLGVyDiTjxzcIJ0lt4Xxf8kaLax8TW/ij4yOWOsbwsOha6PBnqr/aOpAs/P/0s
	 IMDv8ZqaBez0P3uZZQtUM413kpBNFIUQM2hW8XypGh7UuDkNHLdfsRVZkmndEz+pUv48+
	 xMmJ8x+Qs+yIl7eQ6TrbY3otm7mEhl8swpI5LLET4wnRATPTmYp72nxJuuLzVUtLrzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Iej0/qhC";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97834606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 07:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97834606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iej0/qhC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795158198; x=1826694198;
  h=date:from:to:cc:subject:message-id;
  bh=EUy2xet1qOnXi1xJygsuriTptotV6N+IvQaQmvV1z2w=;
  b=Iej0/qhCJ+xaj/Xk0tCVdWEnlDn8cV1u/5Q1vXRg73DyiUN53S5xlrNb
   56d6UlBqk+gDCd7siBgU15XKBXOGwNc7YH0yVAKQn1+B9DieYpNe9RBsE
   GJ2ayB5DmVu38Sgt8VIEwqKdK3lYHCn8RIU/3L7SyAvlrT04j8JzEZVAI
   ZX2KiqTKPnqhT2U+1HuBTfj9uLNkbWLKYDasSa0z0QJ8k4zS4wgdCGW0/
   Bs802iCHrssMCRH5qe9ybAvqOdO5rIpwDLl3b1aWgrrFcGd4962i0ChGB
   bCpB11hHg+a5NnPfif3ZSZcEXST0LXbOZFwb1cDwFfsmek4Pxbt3iruEv
   Q==;
X-CSE-ConnectionGUID: T6OdDxoCRMCRNpFdnLFuxQ==
X-CSE-MsgGUID: VuOAcvL+SGOyjQgqK2W/sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3915768"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3915768"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP; 19 Nov 2026 23:03:17 -0800
X-CSE-ConnectionGUID: nJQecfsxTaGe7gsDH+ZjEA==
X-CSE-MsgGUID: NpP37OBBQbOcfuJZ9ZuOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10535138"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 23:03:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUIeP-000000003yf-1Cx9;
	Fri, 20 Nov 2026 07:03:13 +0000
Date: Fri, 20 Nov 2026 08:02:39 +0100
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 6175/9862]
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c:495:5-8: Unneeded variable:
 "ret". Return "0" on line 534
Message-ID: <20261120075259.lBe4Stwa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   adcad7f4e6332cff3d6d7165f41584899f598534
commit: d5162b71dc6ebf997a9f64dab89ffd3bf9ebcb9b [6175/9862] phy: rockchip: inno-usb2: ignore regmap_write return codes
config: arm-randconfig-r2109-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120075259.lBe4Stwa-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120075259.lBe4Stwa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/rockchip/phy-rockchip-inno-usb2.c:495:5-8: Unneeded variable: "ret". Return "0" on line 534

vim +495 drivers/phy/rockchip/phy-rockchip-inno-usb2.c

3a7db8e9edefd9e drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2023-05-22  490  
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  491  static int rockchip_usb2phy_init(struct phy *phy)
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  492  {
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  493  	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  494  	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07 @495  	int ret = 0;
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  496  
dd341fe270a274f drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  497  	dev_dbg(&phy->dev, "phy port init\n");
dd341fe270a274f drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  498  
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  499  	mutex_lock(&rport->mutex);
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  500  
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  501  	if (rport->port_id == USB2PHY_PORT_OTG) {
9632781122e5f7a drivers/phy/rockchip/phy-rockchip-inno-usb2.c William Wu        2017-06-02  502  		if (rport->mode != USB_DR_MODE_HOST &&
9632781122e5f7a drivers/phy/rockchip/phy-rockchip-inno-usb2.c William Wu        2017-06-02  503  		    rport->mode != USB_DR_MODE_UNKNOWN) {
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  504  			/* clear bvalid status and enable bvalid detect irq */
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  505  			property_enable(rphy->grf, &rport->port_cfg->bvalid_det_clr, true);
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  506  			property_enable(rphy->grf, &rport->port_cfg->bvalid_det_en, true);
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  507  
2fda59099462ee7 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Alex Bee          2023-11-19  508  			/* clear id status and enable id detect irqs */
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  509  			property_enable(rphy->grf, &rport->port_cfg->idfall_det_clr, true);
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  510  			property_enable(rphy->grf, &rport->port_cfg->idrise_det_clr, true);
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  511  			property_enable(rphy->grf, &rport->port_cfg->idfall_det_en, true);
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  512  			property_enable(rphy->grf, &rport->port_cfg->idrise_det_en, true);
51a9b2c03dd3fdd drivers/phy/rockchip/phy-rockchip-inno-usb2.c Samuel Holland    2022-04-13  513  
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  514  			schedule_delayed_work(&rport->otg_sm_work,
5a74a8b74233f0e drivers/phy/rockchip/phy-rockchip-inno-usb2.c William Wu        2017-06-02  515  					      OTG_SCHEDULE_DELAY * 3);
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  516  		} else {
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  517  			/* If OTG works in host only mode, do nothing. */
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  518  			dev_dbg(&rport->phy->dev, "mode %d\n", rport->mode);
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  519  		}
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  520  	} else if (rport->port_id == USB2PHY_PORT_HOST) {
3a7db8e9edefd9e drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2023-05-22  521  		if (rport->port_cfg->disfall_en.offset) {
3a7db8e9edefd9e drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2023-05-22  522  			rport->host_disconnect = true;
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  523  			rockchip_usb2phy_enable_host_disc_irq(rphy, rport, true);
3a7db8e9edefd9e drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2023-05-22  524  		}
3a7db8e9edefd9e drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2023-05-22  525  
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  526  		/* clear linestate and enable linestate detect irq */
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  527  		property_enable(rphy->grf, &rport->port_cfg->ls_det_clr, true);
d5162b71dc6ebf9 drivers/phy/rockchip/phy-rockchip-inno-usb2.c Sebastian Reichel 2026-11-10  528  		property_enable(rphy->grf, &rport->port_cfg->ls_det_en, true);
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  529  
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  530  		schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY);
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  531  	}
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  532  
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07  533  	mutex_unlock(&rport->mutex);
98898f3bc83c8a7 drivers/phy/phy-rockchip-inno-usb2.c          William Wu        2016-11-07 @534  	return ret;
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  535  }
0e08d2a727e68bb drivers/phy/phy-rockchip-inno-usb2.c          Frank Wang        2016-07-22  536  

:::::: The code at line 495 was first introduced by commit
:::::: 98898f3bc83c8a74e562869332cb1b349976a116 phy: rockchip-inno-usb2: support otg-port for rk3399

:::::: TO: William Wu <wulf@rock-chips.com>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
