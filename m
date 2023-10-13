Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08882111B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9veQKak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697192693; x=1728728693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVTI+KtH248Y6N2mDkGmVGWxc0Mtj1GwtiXmRY/C2Xo=;
  b=D9veQKakx+Jh6+ED/uKt7Gfsat+XCjls64TZ7TrFNkhsmy15wac2RJas
   AnN4MXt4Vlltt1YK2YNZtKcVdBt3eAY7Ea77s7CkD2TWM8hCLqYAKMFXS
   dTyFkDPebtRObjsxv5VQRIBEeb1rOIj12REVNyRt+FJKT3MKmpg2AkOBS
   9XG9lSp3v0oK4jEzPrUsNh8sww3t+kv7QWghQx1W+TppoP3FDwQ6yPl3x
   Da/FQA03i5bpe8YHK22njILLC9GSR315RTcd4i2Z87AEGChX0d5Pe9Xe8
   apCbdmVsXStiBDvT4ydh/AyUE+B89+ROAOA2Q+Hx90z/uiBZBCr/0eddr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375499624"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375499624"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731318523"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="731318523"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 03:24:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFLa-0004cw-29;
	Fri, 13 Oct 2023 10:24:46 +0000
Date: Fri, 13 Oct 2023 18:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Zhengping Jiang <jiangzp@google.com>, linux-bluetooth@vger.kernel.org,
	marcel@holtmann.org, luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
	chromeos-bluetooth-upstreaming@chromium.org,
	Zhengping Jiang <jiangzp@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [kernel PATCH v2] Bluetooth: btmtksdio: enable bluetooth wakeup
 in system suspend
Message-ID: <202310131817.oEUPvya8-lkp@intel.com>
References: <20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>

Hi Zhengping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhengping-Jiang/Bluetooth-btmtksdio-enable-bluetooth-wakeup-in-system-suspend/20231012-064116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20231011153928.kernel.v2.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc%40changeid
patch subject: [kernel PATCH v2] Bluetooth: btmtksdio: enable bluetooth wakeup in system suspend
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131817.oEUPvya8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131817.oEUPvya8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131817.oEUPvya8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btmtksdio.c:1501:12: warning: 'btmtksdio_system_resume' defined but not used [-Wunused-function]
    1501 | static int btmtksdio_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btmtksdio.c:1464:12: warning: 'btmtksdio_system_suspend' defined but not used [-Wunused-function]
    1464 | static int btmtksdio_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/btmtksdio_system_resume +1501 drivers/bluetooth/btmtksdio.c

  1463	
> 1464	static int btmtksdio_system_suspend(struct device *dev)
  1465	{
  1466		struct sdio_func *func = dev_to_sdio_func(dev);
  1467		struct btmtksdio_dev *bdev;
  1468	
  1469		bdev = sdio_get_drvdata(func);
  1470		if (!bdev)
  1471			return 0;
  1472	
  1473		if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
  1474			return 0;
  1475	
  1476		set_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
  1477	
  1478		return btmtksdio_runtime_suspend(dev);
  1479	}
  1480	
  1481	static int btmtksdio_runtime_resume(struct device *dev)
  1482	{
  1483		struct sdio_func *func = dev_to_sdio_func(dev);
  1484		struct btmtksdio_dev *bdev;
  1485		int err;
  1486	
  1487		bdev = sdio_get_drvdata(func);
  1488		if (!bdev)
  1489			return 0;
  1490	
  1491		if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
  1492			return 0;
  1493	
  1494		err = btmtksdio_drv_pmctrl(bdev);
  1495	
  1496		bt_dev_dbg(bdev->hdev, "status (%d) get ownership from device", err);
  1497	
  1498		return err;
  1499	}
  1500	
> 1501	static int btmtksdio_system_resume(struct device *dev)
  1502	{
  1503		return btmtksdio_runtime_resume(dev);
  1504	}
  1505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
