Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A07946C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726398586; cv=none; b=M3lfG9SuBPHTDtoM0nIV3Xm9/wRk3C+NUwr/4ozRdSvPE12cuMeOKJ8/RiJInJEd0VC5Q3aTf5rMtoSkPM/N90gCGm0vxTsTdIidDk3ydsgjRohJaQV4uyYuaVkkSy5g4Tz5MnjNWA98Jgz2rykk5WXaplKUUHSUnboBrPE2YsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726398586; c=relaxed/simple;
	bh=VIacf0MemFT6BYFrEFUuBtlpFK5kZTuwHhkfh+te0gY=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=d9VAF7wRRyYb3xIDQISC+Nd1Vf7YChy9gyxp14sJwJ6z/icoh9vfdkqRc3gR2zdPgNtzpLaXuqf3SaxIvQnLlmDJXFL7XgMyjCKlwkk6LPu/yeiyJHHD6xVRjOJf+3ddpNwJ68jBQynIFr3yEQ5cNrd1UlMyVWo8PfJHJOhf/bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=DZlNWA4X; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="DZlNWA4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Va8xLHtRbeGCFi67Y5RLd/mjZDbRGynocebZDHBGzAA=;
  b=DZlNWA4XggYPzDP3idIJ0i/ah4yFzfDqJV2lpBNi0VhUnYY+IpDraQTX
   Qn6vpNCQnLeMxIvOStNdunoP7WQWEg94nK5YEnsmRcK0KpifAxSuy4cBA
   BERE+1pxzTzczJhhF6I7F7wwbv8ZDPcE0rojFl2lRqJi9wzXK2IUZ0QHD
   Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.10,231,1719871200"; 
   d="scan'208";a="183190941"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:09:34 +0200
Date: Sun, 15 Sep 2024 13:09:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jiakun Shuai <shuaijiakun1288@phytium.com.cn>, kernel@openeuler.org
cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21252/23714] drivers/i2c/busses/i2c-phytium-master.c:39:5-17:
 duplicated argument to && or || (fwd)
Message-ID: <alpine.DEB.2.22.394.2409151308470.3437@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check line 39.

julia

---------- Forwarded message ----------
Date: Sun, 15 Sep 2024 18:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21252/23714]
    drivers/i2c/busses/i2c-phytium-master.c:39:5-17: duplicated argument to &&
    or ||

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Jiakun Shuai <shuaijiakun1288@phytium.com.cn>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 777b12afb6187fc712f365df57982275e9ef244f [21252/23714] i2c: add Phytium i2c driver
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-r051-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151803.TxkWDq73-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409151803.TxkWDq73-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-phytium-master.c:39:5-17: duplicated argument to && or ||

vim +39 drivers/i2c/busses/i2c-phytium-master.c

777b12afb6187f Jiakun Shuai 2023-10-26  24
777b12afb6187f Jiakun Shuai 2023-10-26  25  static int i2c_phytium_init_master(struct phytium_i2c_dev *dev)
777b12afb6187f Jiakun Shuai 2023-10-26  26  {
777b12afb6187f Jiakun Shuai 2023-10-26  27  	/* Disable the adapter */
777b12afb6187f Jiakun Shuai 2023-10-26  28  	__i2c_phytium_disable(dev);
777b12afb6187f Jiakun Shuai 2023-10-26  29
777b12afb6187f Jiakun Shuai 2023-10-26  30  	/* Write standard speed timing parameters */
777b12afb6187f Jiakun Shuai 2023-10-26  31  	phytium_writel(dev, dev->ss_hcnt, IC_SS_SCL_HCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  32  	phytium_writel(dev, dev->ss_lcnt, IC_SS_SCL_LCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  33
777b12afb6187f Jiakun Shuai 2023-10-26  34  	/* Write fast mode/fast mode plus timing parameters */
777b12afb6187f Jiakun Shuai 2023-10-26  35  	phytium_writel(dev, dev->fs_hcnt, IC_FS_SCL_HCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  36  	phytium_writel(dev, dev->fs_lcnt, IC_FS_SCL_LCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  37
777b12afb6187f Jiakun Shuai 2023-10-26  38  	/* Write high speed timing parameters if supported */
777b12afb6187f Jiakun Shuai 2023-10-26 @39  	if (dev->hs_hcnt && dev->hs_hcnt) {
777b12afb6187f Jiakun Shuai 2023-10-26  40  		phytium_writel(dev, dev->hs_hcnt, IC_HS_SCL_HCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  41  		phytium_writel(dev, dev->hs_lcnt, IC_HS_SCL_LCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  42  	}
777b12afb6187f Jiakun Shuai 2023-10-26  43
777b12afb6187f Jiakun Shuai 2023-10-26  44  	/* Write SDA hold time if supported */
777b12afb6187f Jiakun Shuai 2023-10-26  45  	if (dev->sda_hold_time)
777b12afb6187f Jiakun Shuai 2023-10-26  46  		phytium_writel(dev, dev->sda_hold_time, IC_SDA_HOLD);
777b12afb6187f Jiakun Shuai 2023-10-26  47
777b12afb6187f Jiakun Shuai 2023-10-26  48  	/* Configure Tx/Rx FIFO threshold levels */
777b12afb6187f Jiakun Shuai 2023-10-26  49  	phytium_writel(dev, dev->tx_fifo_depth >> 1, IC_TX_TL);
777b12afb6187f Jiakun Shuai 2023-10-26  50  	phytium_writel(dev, 0, IC_RX_TL);
777b12afb6187f Jiakun Shuai 2023-10-26  51
777b12afb6187f Jiakun Shuai 2023-10-26  52  	/* Configure the I2C master */
777b12afb6187f Jiakun Shuai 2023-10-26  53  	phytium_writel(dev, dev->master_cfg, IC_CON);
777b12afb6187f Jiakun Shuai 2023-10-26  54
777b12afb6187f Jiakun Shuai 2023-10-26  55  	return 0;
777b12afb6187f Jiakun Shuai 2023-10-26  56  }
777b12afb6187f Jiakun Shuai 2023-10-26  57

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
