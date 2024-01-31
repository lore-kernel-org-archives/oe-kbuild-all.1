Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ABF12FF95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706723963; cv=none; b=hA7hOcx/MWn6ZiePCq2HZVPqlrxiqn0aoveGSjtFjD3EBcr9lwRrkPh7BUWLl29+eYdtRASuQ5fUyJRxp9fema+0hnDGtiezCG0Q24Q/CXvKPArM2Y/8oi5H9q4kLdq0SggeH/7Fa4QvDXn0u2w8gSq2jyl5f8sW/IhZXam47lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706723963; c=relaxed/simple;
	bh=o/drh028hxRseq/169YHNdTw1dXDsvhsL6+FdkBEM6E=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xh+xjAP3+LRm2c4vE9eGt0VieR9vWjctbya7ek1+V+iU5jcWAgNI00p7hpBAPijHQ2XvmqTL7Uy2jvtf67YjwKjtqI8DP9TrIjFbLzkorY495g05rHxr1LAAcYhz4kJWAGY++Obc14TdvX5I/FklfYXgQCQPY5c7qCiIu+zvSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=BBH47404; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="BBH47404"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYgKgDJnzHjlJRSaENEOht2saPzidvzB2sGFvo5VNtE=;
  b=BBH47404DA+u4US8EMr9jJHZBwt8qLFBkwoKVwjb9ZMUmO/FqwrXjySM
   JlUTdL4eCdRDo4ETW/ITm+d5+KwcBwOAg90JeZAdxDTevJk/fZjgxIu1U
   q8CxHnRhMM/RDZjum00ZuF6f6MizZPwqgiZ/Ymi+Lii31liVA8D+zzDSC
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.05,231,1701126000"; 
   d="scan'208";a="149651384"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 18:59:11 +0100
Date: Wed, 31 Jan 2024 18:59:11 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Martin Kaistra <martin.kaistra@linutronix.de>
cc: Kalle Valo <kvalo@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 432/3001] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:6699:30-31:
 WARNING opportunity for swap() (fwd)
Message-ID: <alpine.DEB.2.22.394.2401311858320.3245@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 1 Feb 2024 01:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 432/3001]
    drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:6699:30-31: WARNING
    opportunity for swap()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Martin Kaistra <martin.kaistra@linutronix.de>
CC: Kalle Valo <kvalo@kernel.org>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   06f658aadff0e483ee4f807b0b46c9e5cba62bfa
commit: 69abad618efd17e50bc6f880332ab36b660b0b34 [432/3001] wifi: rtl8xxxu: make supporting AP mode only on port 0 transparent
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-r054-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010039.1v5WRSXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402010039.1v5WRSXr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:6699:30-31: WARNING opportunity for swap()

vim +6699 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c

26f1fad29ad973 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.c      Jes Sorensen   2015-10-14  6626
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6627  static void rtl8xxxu_switch_ports(struct rtl8xxxu_priv *priv)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6628  {
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6629  	u8 macid[ETH_ALEN], bssid[ETH_ALEN], macid_1[ETH_ALEN], bssid_1[ETH_ALEN];
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6630  	u8 msr, bcn_ctrl, bcn_ctrl_1, atimwnd[2], atimwnd_1[2];
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6631  	struct rtl8xxxu_vif *rtlvif;
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6632  	struct ieee80211_vif *vif;
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6633  	u8 tsftr[8], tsftr_1[8];
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6634  	int i;
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6635
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6636  	msr = rtl8xxxu_read8(priv, REG_MSR);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6637  	bcn_ctrl = rtl8xxxu_read8(priv, REG_BEACON_CTRL);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6638  	bcn_ctrl_1 = rtl8xxxu_read8(priv, REG_BEACON_CTRL_1);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6639
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6640  	for (i = 0; i < ARRAY_SIZE(atimwnd); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6641  		atimwnd[i] = rtl8xxxu_read8(priv, REG_ATIMWND + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6642  	for (i = 0; i < ARRAY_SIZE(atimwnd_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6643  		atimwnd_1[i] = rtl8xxxu_read8(priv, REG_ATIMWND_1 + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6644
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6645  	for (i = 0; i < ARRAY_SIZE(tsftr); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6646  		tsftr[i] = rtl8xxxu_read8(priv, REG_TSFTR + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6647  	for (i = 0; i < ARRAY_SIZE(tsftr); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6648  		tsftr_1[i] = rtl8xxxu_read8(priv, REG_TSFTR1 + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6649
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6650  	for (i = 0; i < ARRAY_SIZE(macid); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6651  		macid[i] = rtl8xxxu_read8(priv, REG_MACID + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6652
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6653  	for (i = 0; i < ARRAY_SIZE(bssid); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6654  		bssid[i] = rtl8xxxu_read8(priv, REG_BSSID + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6655
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6656  	for (i = 0; i < ARRAY_SIZE(macid_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6657  		macid_1[i] = rtl8xxxu_read8(priv, REG_MACID1 + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6658
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6659  	for (i = 0; i < ARRAY_SIZE(bssid_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6660  		bssid_1[i] = rtl8xxxu_read8(priv, REG_BSSID1 + i);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6661
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6662  	/* disable bcn function, disable update TSF */
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6663  	rtl8xxxu_write8(priv, REG_BEACON_CTRL, (bcn_ctrl &
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6664  			(~BEACON_FUNCTION_ENABLE)) | BEACON_DISABLE_TSF_UPDATE);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6665  	rtl8xxxu_write8(priv, REG_BEACON_CTRL_1, (bcn_ctrl_1 &
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6666  			(~BEACON_FUNCTION_ENABLE)) | BEACON_DISABLE_TSF_UPDATE);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6667
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6668  	/* switch msr */
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6669  	msr = (msr & 0xf0) | ((msr & 0x03) << 2) | ((msr & 0x0c) >> 2);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6670  	rtl8xxxu_write8(priv, REG_MSR, msr);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6671
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6672  	/* write port0 */
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6673  	rtl8xxxu_write8(priv, REG_BEACON_CTRL, bcn_ctrl_1 & ~BEACON_FUNCTION_ENABLE);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6674  	for (i = 0; i < ARRAY_SIZE(atimwnd_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6675  		rtl8xxxu_write8(priv, REG_ATIMWND + i, atimwnd_1[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6676  	for (i = 0; i < ARRAY_SIZE(tsftr_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6677  		rtl8xxxu_write8(priv, REG_TSFTR + i, tsftr_1[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6678  	for (i = 0; i < ARRAY_SIZE(macid_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6679  		rtl8xxxu_write8(priv, REG_MACID + i, macid_1[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6680  	for (i = 0; i < ARRAY_SIZE(bssid_1); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6681  		rtl8xxxu_write8(priv, REG_BSSID + i, bssid_1[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6682
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6683  	/* write port1 */
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6684  	rtl8xxxu_write8(priv, REG_BEACON_CTRL_1, bcn_ctrl & ~BEACON_FUNCTION_ENABLE);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6685  	for (i = 0; i < ARRAY_SIZE(atimwnd); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6686  		rtl8xxxu_write8(priv, REG_ATIMWND_1 + i, atimwnd[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6687  	for (i = 0; i < ARRAY_SIZE(tsftr); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6688  		rtl8xxxu_write8(priv, REG_TSFTR1 + i, tsftr[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6689  	for (i = 0; i < ARRAY_SIZE(macid); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6690  		rtl8xxxu_write8(priv, REG_MACID1 + i, macid[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6691  	for (i = 0; i < ARRAY_SIZE(bssid); i++)
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6692  		rtl8xxxu_write8(priv, REG_BSSID1 + i, bssid[i]);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6693
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6694  	/* write bcn ctl */
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6695  	rtl8xxxu_write8(priv, REG_BEACON_CTRL, bcn_ctrl_1);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6696  	rtl8xxxu_write8(priv, REG_BEACON_CTRL_1, bcn_ctrl);
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6697
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6698  	vif = priv->vifs[0];
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22 @6699  	priv->vifs[0] = priv->vifs[1];
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6700  	priv->vifs[1] = vif;
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6701
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6702  	/* priv->vifs[0] is NULL here, based on how this function is currently
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6703  	 * called from rtl8xxxu_add_interface().
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6704  	 * When this function will be used in the future for a different
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6705  	 * scenario, please check whether vifs[0] or vifs[1] can be NULL and if
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6706  	 * necessary add code to set port_num = 1.
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6707  	 */
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6708  	rtlvif = (struct rtl8xxxu_vif *)priv->vifs[1]->drv_priv;
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6709  	rtlvif->port_num = 1;
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6710  }
69abad618efd17 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c Martin Kaistra 2023-12-22  6711

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
