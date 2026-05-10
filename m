Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483F56472
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376612; cv=none; b=gLJhstCXidKE8C9eHOFKWHB/DZT7xIKrA29DOXHpzflzI3aDZHBQgyjfzYjfUGHLxKRSN5XGdprawuXykA+4lhUH0aetzkeJiZXR3zqJSxyhH836UAqtyMWhmyz0taENByuIeWoOdEw4tOnNZVNoT0QDAoTQVAi8wx66JhmTlc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376612; c=relaxed/simple;
	bh=xsMwm2gMdZ7NRg73obOVapmGPzmi2XOcLvLTQ7iJXC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tZq0RxXWbTq/UD48yG7oNrlfIo9RIJxsSm8AJxRxPHEdMq0Hefukdgnh7TiEcSbO0YKzyL1AcsTwG5lQcwL24izrkwWuqHAEg1EAzVPtE68JanKAkRYWpr86eEt6nUZv4uIefz5p2Y6WqJ4RL5n3Fnjej+abin5XI3R+IEl1Do0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvkwo9Fi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvkwo9Fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778376610; x=1809912610;
  h=date:from:to:cc:subject:message-id;
  bh=xsMwm2gMdZ7NRg73obOVapmGPzmi2XOcLvLTQ7iJXC8=;
  b=bvkwo9FiJy/ggjDcF72wajlwqs1k9GTaQD9GXkp/XOG1WAZKtcRn/tIp
   fhWdNJTxYcTPyxImFM/pd3Kd/Vude+/zirBAPgDm4eN++fj1SRudjDrVo
   ZZctLOKFvjfHkbcjzl6B6le4KfaQLy5XAvt2OULEqwOg8dM6NVRaDI6mF
   imtSList/yuz9ooCxOUChgo+NJEMZkbzKI9rcQ4RxvX6BFsO1no3p+DBX
   conGhZF3rr8Tf4kwbokEKOJHu1Gq3FS3eHic8snI25GDf1CsVTgaI3L9Y
   lpi9wKzypOVYP4B/GsfcE0m/TBp3nJTumZHnYBHEl3QKQahdm+PT9Dw7R
   w==;
X-CSE-ConnectionGUID: UpbNiK1BTLKJHq/xQmOHfg==
X-CSE-MsgGUID: iCWXJk2MQbyjhehH48qbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89896239"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89896239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 18:30:07 -0700
X-CSE-ConnectionGUID: HS+BNbhZSzmdyUUobd9EhQ==
X-CSE-MsgGUID: xsiMyYViTXOwyqUQfLfEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234050436"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 May 2026 18:30:05 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLszb-000000001cp-1Zt2;
	Sun, 10 May 2026 01:30:03 +0000
Date: Sun, 10 May 2026 09:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 152/162]
 drivers/net/phy/as21xx_1.9.1/as21xxx.c:787 aeon_ipc_send_cmd() warn: unsigned
 'val' is never less than zero.
Message-ID: <202605100909.IY1cHlPO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 3b3c9c1c9610d3d9dc993bcdd5e1228369cdb213 [152/162] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: microblaze-randconfig-r071-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100909.IY1cHlPO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100909.IY1cHlPO-lkp@intel.com/

smatch warnings:
drivers/net/phy/as21xx_1.9.1/as21xxx.c:787 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.

vim +/val +787 drivers/net/phy/as21xx_1.9.1/as21xxx.c

ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  745  
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  746  static int aeon_ipc_send_cmd(struct phy_device *phydev,
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  747  			     struct as21xxx_priv *priv,
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  748  			     u16 cmd, u16 *ret_sts)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  749  {
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  750  	bool curr_parity;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  751  	int ret;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  752  	unsigned int val;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  753  
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  754  	/* The IPC sync by using a single parity bit.
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  755  	 * Each CMD have alternately this bit set or clear
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  756  	 * to understand correct flow and packet order.
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  757  	 */
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  758  	curr_parity = priv->parity_status;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  759  	if (priv->parity_status)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  760  		cmd |= AEON_IPC_CMD_PARITY;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  761  	/* Always update parity for next packet */
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  762  	priv->parity_status = !priv->parity_status;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  763  
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  764  	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_IPC_CMD, cmd);
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  765  	if (ret)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  766  		return ret;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  767  
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  768  	/* Wait for packet to be processed */
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  769  	usleep_range(AEON_IPC_DELAY, AEON_IPC_DELAY + 5000);
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  770  	/* With no ret_sts, ignore waiting for packet completion
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  771  	 * (ipc parity bit sync)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  772  	 */
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  773  	if (!ret_sts)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  774  		return 0;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  775  	/* Exit condition logic:
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  776  	 * - Wait for parity bit equal
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  777  	 * - Wait for status success, error OR ready
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  778  	 */
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  779  	ret = read_poll_timeout(phy_read_mmd, val,
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  780  				(FIELD_GET(AEON_IPC_STS_PARITY, val) == curr_parity &&
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  781  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_RCVD &&
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  782  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_PROCESS &&
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  783  				(val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_BUSY) ||
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  784  				(val < 0),
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  785  				10000, 2000000, false,
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  786  				phydev, MDIO_MMD_VEND1, VEND1_IPC_STS);
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07 @787  	if (val < 0)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  788  		ret = val;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  789  	if (ret)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  790  		phydev_err(phydev, "%s fail to polling status failed: %d\n", __func__, ret);
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  791  	*ret_sts = val;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  792  	if ((val & AEON_IPC_STS_STATUS) != AEON_IPC_STS_STATUS_SUCCESS)
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  793  		return -EINVAL;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  794  
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  795  	return 0;
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  796  }
ef9b1544f8f1e1 drivers/net/phy/as21xxx/as21xxx.c Frank Wunderlich 2026-03-07  797  

:::::: The code at line 787 was first introduced by commit
:::::: ef9b1544f8f1e1ac322564fb4931af5e5dd9aa70 net: phy: add as21xx downstream driver from 6.19 (1.9.1)

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
