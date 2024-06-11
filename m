Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AC171E49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 06:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718087494; cv=none; b=mrgMNSffKLbeGPH5BytHH2k9IB4R7b8UDDCzSd9+nluCdXHQhufIAfVaBJQQ88TovhRshHh8LM+LHHbDm0n3s7rT/fdNzBEYdF0NeqwpNCrNU57x5zuAoOMWMPjKkLtiaqzLB/rhIYXm8B9sLssP7NMXUPLTZ5mfU0acFTr/ClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718087494; c=relaxed/simple;
	bh=JCrCO6n2LwzUup92sO/dIW4I9KnZ2LnBJdgZ9OVY/QY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aquJix4izFgrtApLSbbu8UkPnn2GVlsLY9MSvT8yzmjZGqW8tX7CNYlbWnx+6eid+LFtImcyAWdpLeV4FXxM1VzKJFDi75wDNGiL4aSGuAOIhUeldbQOQz2ajUhOSiJeiZavvpNN0PORjoDPcmf/fp6J+7aqQw9BDzroUdczvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=O5hhwgQY; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="O5hhwgQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718087493; x=1749623493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JCrCO6n2LwzUup92sO/dIW4I9KnZ2LnBJdgZ9OVY/QY=;
  b=O5hhwgQYr4HJF2KV3guzZjR55DcrnihNyUbxoqOcjzkYvd94IvP4txy3
   UDWxNrF0K0+0525JAaikbrKDsRT+nUkSDwnmSGT8TCx2COdm0+HdpYpA0
   MnfyVXQSVDSKr0yBX0dbcn8YBjkGmzyAlIV6cWgeVe9pXy61nLOPsskOv
   ga9OrKEttW+3QfMwWTcyoqj59iucJbSRFMmMsPB2JGwHQQ6XxkMhJ0SX2
   NXpTENg5JTD401uxtfTNPJLmCIjLH6vzOTQ+3EF4Zv8f9o+5VtWzIGthm
   U0uauOi5KaFaTZhESvNO8vWlAl8koYIZ/OJG2KUBX2t+fNIVx2D/nn/em
   A==;
X-CSE-ConnectionGUID: Q3N2X1fHS0SOCLsGG11+zg==
X-CSE-MsgGUID: evrT7dM0S+ie+CwwIFSeLg==
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="27243365"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 23:31:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 23:31:03 -0700
Received: from HYD-DK-UNGSW21.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Jun 2024 23:30:57 -0700
From: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
To: <lkp@intel.com>
CC: <Raju.Lakkaraju@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew@lunn.ch>, <bryan.whitehead@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <hkallweit1@gmail.com>, <hmehrtens@maxlinear.com>,
	<kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <linux@armlinux.org.uk>,
	<lxu@maxlinear.com>, <netdev@vger.kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, <pabeni@redhat.com>, <sbauer@blackbox.su>,
	Wojciech Drewek <wojciech.drewek@intel.com>
Subject: [PATCH net V3 3/3] net: phy: mxl-gpy: Remove interrupt mask clearing from config_init
Date: Tue, 11 Jun 2024 11:57:53 +0530
Message-ID: <20240611062753.12020-4-Raju.Lakkaraju@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611062753.12020-1-Raju.Lakkaraju@microchip.com>
References: <202406052200.w3zuc32H-lkp@intel.com>
 <20240611062753.12020-1-Raju.Lakkaraju@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the system resumes from sleep, the phy_init_hw() function invokes
config_init(), which clears all interrupt masks and causes wake events to be
lost in subsequent wake sequences. Remove interrupt mask clearing from
config_init() and preserve relevant masks in config_intr().

Fixes: 7d901a1e878a ("net: phy: add Maxlinear GPY115/21x/24x driver")
Signed-off-by: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406052200.w3zuc32H-lkp@intel.com/
---
Change List:
------------
V0 -> V3:
  - Address the https://lore.kernel.org/lkml/4a565d54-f468-4e32-8a2c-102c1203f72c@lunn.ch/T/
    review comments

 drivers/net/phy/mxl-gpy.c | 58 +++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index b2d36a3a96f1..e5f8ac4b4604 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -107,6 +107,7 @@ struct gpy_priv {
 
 	u8 fw_major;
 	u8 fw_minor;
+	u32 wolopts;
 
 	/* It takes 3 seconds to fully switch out of loopback mode before
 	 * it can safely re-enter loopback mode. Record the time when
@@ -221,6 +222,15 @@ static int gpy_hwmon_register(struct phy_device *phydev)
 }
 #endif
 
+static int gpy_ack_interrupt(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Clear all pending interrupts */
+	ret = phy_read(phydev, PHY_ISTAT);
+	return ret < 0 ? ret : 0;
+}
+
 static int gpy_mbox_read(struct phy_device *phydev, u32 addr)
 {
 	struct gpy_priv *priv = phydev->priv;
@@ -262,16 +272,8 @@ static int gpy_mbox_read(struct phy_device *phydev, u32 addr)
 
 static int gpy_config_init(struct phy_device *phydev)
 {
-	int ret;
-
-	/* Mask all interrupts */
-	ret = phy_write(phydev, PHY_IMASK, 0);
-	if (ret)
-		return ret;
-
-	/* Clear all pending interrupts */
-	ret = phy_read(phydev, PHY_ISTAT);
-	return ret < 0 ? ret : 0;
+	/* Nothing to configure. Configuration Requirement Placeholder */
+	return 0;
 }
 
 static int gpy21x_config_init(struct phy_device *phydev)
@@ -627,11 +629,23 @@ static int gpy_read_status(struct phy_device *phydev)
 
 static int gpy_config_intr(struct phy_device *phydev)
 {
+	struct gpy_priv *priv = phydev->priv;
 	u16 mask = 0;
+	int ret;
+
+	ret = gpy_ack_interrupt(phydev);
+	if (ret)
+		return ret;
 
 	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
 		mask = PHY_IMASK_MASK;
 
+	if (priv->wolopts & WAKE_MAGIC)
+		mask |= PHY_IMASK_WOL;
+
+	if (priv->wolopts & WAKE_PHY)
+		mask |= PHY_IMASK_LSTC;
+
 	return phy_write(phydev, PHY_IMASK, mask);
 }
 
@@ -678,6 +692,7 @@ static int gpy_set_wol(struct phy_device *phydev,
 		       struct ethtool_wolinfo *wol)
 {
 	struct net_device *attach_dev = phydev->attached_dev;
+	struct gpy_priv *priv = phydev->priv;
 	int ret;
 
 	if (wol->wolopts & WAKE_MAGIC) {
@@ -725,6 +740,8 @@ static int gpy_set_wol(struct phy_device *phydev,
 		ret = phy_read(phydev, PHY_ISTAT);
 		if (ret < 0)
 			return ret;
+
+		priv->wolopts |= WAKE_MAGIC;
 	} else {
 		/* Disable magic packet matching */
 		ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2,
@@ -732,6 +749,13 @@ static int gpy_set_wol(struct phy_device *phydev,
 					 WOL_EN);
 		if (ret < 0)
 			return ret;
+
+		/* Disable the WOL interrupt */
+		ret = phy_clear_bits(phydev, PHY_IMASK, PHY_IMASK_WOL);
+		if (ret < 0)
+			return ret;
+
+		priv->wolopts &= ~WAKE_MAGIC;
 	}
 
 	if (wol->wolopts & WAKE_PHY) {
@@ -748,9 +772,11 @@ static int gpy_set_wol(struct phy_device *phydev,
 		if (ret & (PHY_IMASK_MASK & ~PHY_IMASK_LSTC))
 			phy_trigger_machine(phydev);
 
+		priv->wolopts |= WAKE_PHY;
 		return 0;
 	}
 
+	priv->wolopts &= ~WAKE_PHY;
 	/* Disable the link state change interrupt */
 	return phy_clear_bits(phydev, PHY_IMASK, PHY_IMASK_LSTC);
 }
@@ -758,18 +784,10 @@ static int gpy_set_wol(struct phy_device *phydev,
 static void gpy_get_wol(struct phy_device *phydev,
 			struct ethtool_wolinfo *wol)
 {
-	int ret;
+	struct gpy_priv *priv = phydev->priv;
 
 	wol->supported = WAKE_MAGIC | WAKE_PHY;
-	wol->wolopts = 0;
-
-	ret = phy_read_mmd(phydev, MDIO_MMD_VEND2, VPSPEC2_WOL_CTL);
-	if (ret & WOL_EN)
-		wol->wolopts |= WAKE_MAGIC;
-
-	ret = phy_read(phydev, PHY_IMASK);
-	if (ret & PHY_IMASK_LSTC)
-		wol->wolopts |= WAKE_PHY;
+	wol->wolopts = priv->wolopts;
 }
 
 static int gpy_loopback(struct phy_device *phydev, bool enable)
-- 
2.34.1

