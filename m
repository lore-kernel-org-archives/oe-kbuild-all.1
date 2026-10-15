Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF383B9DA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075183; cv=none; b=nZ1g1Vbae1/3L3FY59vlNI0qQRu1HQjPoAZdf5hvah357c9buB6EB13xFC38eAsQ2cTnsWCqmfS6qxK9qZsPWdCMCBJ77UzXZSB339w2kxe2aA5GdQLLPl/20n/3hCnYLHAfJtw+n6mXdHcQ4uBGtav9fV6BT+VWsVssRbTg5qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075183; c=relaxed/simple;
	bh=Ge3iHKFTBTNv4x3dCo8GEveEBBhj4Ut1U2+bBMF5ekQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l2q9Pl/7fxPSF10JXFQ2lQ5IZDZ7Mtr/IS4bJeT+dupphfDCMmYhvcguj/FS/V0m3byODbegRi3aUiWIZE+aLurgMPGZRrP/LL+bVE0tA+vJ20Zv8OlnYfL4g2YMzDHmnzET3bAwm75x7q/1YDU0huuJb9GplJAPx18yF22Vcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hu4HAc17; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu4HAc17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792075183; x=1823611183;
  h=date:from:to:cc:subject:message-id;
  bh=Ge3iHKFTBTNv4x3dCo8GEveEBBhj4Ut1U2+bBMF5ekQ=;
  b=hu4HAc17yxFDG7oWSpkTHN7fSaIVSuKgJI8WOCZU1+n5f5ycw913Uc+d
   PSIRvVLeyw/VQxTR0FSOHx61Pa73WWIzkEbOP+tQjCsq1Rh4gm/V/HOBQ
   m+4PDWUN+krrbElgvA74VuAJZfo07enc3XovPwscrOHrPgrmA9Rtf/Udw
   QmP2fWyBllerdLI+Td3O+/YTdTQjAv3NbDjl5qrFqsv0PMZZM5s/OVT+K
   16RnxrdWfuKyWE0+pY9JcKi5hpYbNHfLVA1ybbCI3dijRIl/GXUMklN5M
   1BBpUBhH4hQGQswzXavOqGUk4Poxf4fVY2FSmdDJepPN2SECRfMpxYhj+
   w==;
X-CSE-ConnectionGUID: 5OryWOXHRausvDQBdJ4zfg==
X-CSE-MsgGUID: +HHkO3sRQzuhtKXUGhkYBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="847537"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="847537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:39:42 -0700
X-CSE-ConnectionGUID: 0dIyhoVbR9u0tJChwouvQQ==
X-CSE-MsgGUID: Na52f5PCRXKyNFfA+eR3oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1664173"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2026 07:39:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHMcL-00000000Gf8-3ZLr;
	Thu, 15 Oct 2026 14:39:37 +0000
Date: Thu, 15 Oct 2026 22:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sunyun Yang <syyang@lontium.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [krzk-github:wip/eliza-integration-display-on-early-hwe
 9/29] drivers/gpu/drm/bridge/lontium-lt9611c.c:1296:12: warning:
 'lt9611c_bridge_resume' defined but not used
Message-ID: <202610152248.OJBcyThs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux wip/eliza-integration-display-on-early-hwe
head:   bc8619ef46818e58ca3d967ab1c52ad66162306a
commit: 8ba7bfc43e9529afe137a37928f4144a6613ad2a [9/29] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261015/202610152248.OJBcyThs-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610152248.OJBcyThs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610152248.OJBcyThs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/lontium-lt9611c.c:1296:12: warning: 'lt9611c_bridge_resume' defined but not used [-Wunused-function]
    1296 | static int lt9611c_bridge_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/lontium-lt9611c.c:1274:12: warning: 'lt9611c_bridge_suspend' defined but not used [-Wunused-function]
    1274 | static int lt9611c_bridge_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/lt9611c_bridge_resume +1296 drivers/gpu/drm/bridge/lontium-lt9611c.c

  1273	
> 1274	static int lt9611c_bridge_suspend(struct device *dev)
  1275	{
  1276		struct lt9611c *lt9611c = dev_get_drvdata(dev);
  1277		int ret;
  1278	
  1279		disable_irq(lt9611c->client->irq);
  1280		cancel_work_sync(&lt9611c->work);
  1281	
  1282		gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
  1283	
  1284		ret = regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
  1285		if (ret) {
  1286			dev_err(lt9611c->dev, "regulator bulk disable failed.\n");
  1287			gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
  1288			msleep(400);
  1289			enable_irq(lt9611c->client->irq);
  1290			return ret;
  1291		}
  1292	
  1293		return 0;
  1294	}
  1295	
> 1296	static int lt9611c_bridge_resume(struct device *dev)
  1297	{
  1298		struct lt9611c *lt9611c = dev_get_drvdata(dev);
  1299		int ret;
  1300	
  1301		ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
  1302		if (ret) {
  1303			dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
  1304			return ret;
  1305		}
  1306		lt9611c_reset(lt9611c);
  1307		enable_irq(lt9611c->client->irq);
  1308	
  1309		return ret;
  1310	}
  1311	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
