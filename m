Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83194171675
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 06:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718087493; cv=none; b=Eq2usagzw+c+K2P6+zOWTOX95084DChWqFqTNoCHf0eH7hRe64tV/0e3wE0AJCj67N30ju7IRCr/kpu7pLdTjqFhos9CnRpFsiStjX1AJ38WPDNeCCHZakaOlH6W/8ah1Vxjw4s9cw1llGwcIEluJJalbTDKgPnbyyXS7mRq8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718087493; c=relaxed/simple;
	bh=Im/NAbck18mHiH5J8gbGIhGWzGj9659Bz02g9FFhIfI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+aLpqCoeu4DSJpjuylq9npxisFDneMBDnyroqQrt3PAxbkkxy81t7gjtcP+wAft7qKnAaNym2uYvzqmvb/9djkEospsWRUoAoSoCdCSye4hFQrN/9svVkzb7PSNdmUQMDFhfM5K5FnpDMS488fUHTNKqOWJ3Tw37zEAxH+tPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mgAsXQnh; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mgAsXQnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718087491; x=1749623491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Im/NAbck18mHiH5J8gbGIhGWzGj9659Bz02g9FFhIfI=;
  b=mgAsXQnhgqYf6c2j4BqQUycN/ZLA8aF4haBEl49upBkft1U+GhB9Gzv1
   AQxzgMNaO6iyODbMEzKM6MgAEDbM0dZJJeP2AKia4ZPDTfGzViqcfnYEe
   7f72g1kO6TKC5odtnHENLlKOdQyBVBvVa8LZvoCPvHJPUogxTbS4YQZkJ
   7gfk+RJTqo1dMi+ESoLFMIhnLIbgxQXWFLsTv9s/8l2qR7BEGbo9OjXsc
   wAjc1YdzKEOvDE/9aGfbVDuuDmpn3b+r8Yv/iIRUNOOukrjztRkYA7MLC
   3KF9Uq5aEEinXdNQdM7eFGNiZ5OUQb6/8B0IfM0ICTvirwoHGIyoJW93Q
   A==;
X-CSE-ConnectionGUID: Q3N2X1fHS0SOCLsGG11+zg==
X-CSE-MsgGUID: +re8YdjQTW2FJkkq+KqphA==
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="27243363"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 23:31:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 23:30:51 -0700
Received: from HYD-DK-UNGSW21.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Jun 2024 23:30:45 -0700
From: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
To: <lkp@intel.com>
CC: <Raju.Lakkaraju@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew@lunn.ch>, <bryan.whitehead@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <hkallweit1@gmail.com>, <hmehrtens@maxlinear.com>,
	<kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <linux@armlinux.org.uk>,
	<lxu@maxlinear.com>, <netdev@vger.kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, <pabeni@redhat.com>, <sbauer@blackbox.su>,
	Wojciech Drewek <wojciech.drewek@intel.com>
Subject: [PATCH net V3 1/3] net: lan743x: disable WOL upon resume to restore full data path operation
Date: Tue, 11 Jun 2024 11:57:51 +0530
Message-ID: <20240611062753.12020-2-Raju.Lakkaraju@microchip.com>
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

When Wake-on-LAN (WoL) is active and the system is in suspend mode, triggering
a system event can wake the system from sleep, which may block the data path.
To restore normal data path functionality after waking, disable all wake-up
events. Furthermore, clear all Write 1 to Clear (W1C) status bits by writing
1's to them.

Fixes: 4d94282afd95 ("lan743x: Add power management support")
Signed-off-by: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406052200.w3zuc32H-lkp@intel.com/
---
Change List:                                                                    
------------                                                                    
V2 -> V3:
  - No change
V1 -> V2:
  - Repost - No change
V0 -> V1:
  - Variable "data" change from "int" to "unsigned int"
 drivers/net/ethernet/microchip/lan743x_main.c | 30 ++++++++++++++++---
 drivers/net/ethernet/microchip/lan743x_main.h | 24 +++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 6be8a43c908a..6a40b961fafb 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -3575,7 +3575,7 @@ static void lan743x_pm_set_wol(struct lan743x_adapter *adapter)
 
 	/* clear wake settings */
 	pmtctl = lan743x_csr_read(adapter, PMT_CTL);
-	pmtctl |= PMT_CTL_WUPS_MASK_;
+	pmtctl |= PMT_CTL_WUPS_MASK_ | PMT_CTL_RES_CLR_WKP_MASK_;
 	pmtctl &= ~(PMT_CTL_GPIO_WAKEUP_EN_ | PMT_CTL_EEE_WAKEUP_EN_ |
 		PMT_CTL_WOL_EN_ | PMT_CTL_MAC_D3_RX_CLK_OVR_ |
 		PMT_CTL_RX_FCT_RFE_D3_CLK_OVR_ | PMT_CTL_ETH_PHY_WAKE_EN_);
@@ -3710,6 +3710,7 @@ static int lan743x_pm_resume(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct net_device *netdev = pci_get_drvdata(pdev);
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
+	u32 data;
 	int ret;
 
 	pci_set_power_state(pdev, PCI_D0);
@@ -3728,6 +3729,30 @@ static int lan743x_pm_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = lan743x_csr_read(adapter, MAC_WK_SRC);
+	netif_info(adapter, drv, adapter->netdev,
+		   "Wakeup source : 0x%08X\n", ret);
+
+	/* Clear the wol configuration and status bits. Note that
+	 * the status bits are "Write One to Clear (W1C)"
+	 */
+	data = MAC_WUCSR_EEE_TX_WAKE_ | MAC_WUCSR_EEE_RX_WAKE_ |
+	       MAC_WUCSR_RFE_WAKE_FR_ | MAC_WUCSR_PFDA_FR_ | MAC_WUCSR_WUFR_ |
+	       MAC_WUCSR_MPR_ | MAC_WUCSR_BCAST_FR_;
+	lan743x_csr_write(adapter, MAC_WUCSR, data);
+
+	data = MAC_WUCSR2_NS_RCD_ | MAC_WUCSR2_ARP_RCD_ |
+	       MAC_WUCSR2_IPV6_TCPSYN_RCD_ | MAC_WUCSR2_IPV4_TCPSYN_RCD_;
+	lan743x_csr_write(adapter, MAC_WUCSR2, data);
+
+	data = MAC_WK_SRC_ETH_PHY_WK_ | MAC_WK_SRC_IPV6_TCPSYN_RCD_WK_ |
+	       MAC_WK_SRC_IPV4_TCPSYN_RCD_WK_ | MAC_WK_SRC_EEE_TX_WK_ |
+	       MAC_WK_SRC_EEE_RX_WK_ | MAC_WK_SRC_RFE_FR_WK_ |
+	       MAC_WK_SRC_PFDA_FR_WK_ | MAC_WK_SRC_MP_FR_WK_ |
+	       MAC_WK_SRC_BCAST_FR_WK_ | MAC_WK_SRC_WU_FR_WK_ |
+	       MAC_WK_SRC_WK_FR_SAVED_;
+	lan743x_csr_write(adapter, MAC_WK_SRC, data);
+
 	/* open netdev when netdev is at running state while resume.
 	 * For instance, it is true when system wakesup after pm-suspend
 	 * However, it is false when system wakes up after suspend GUI menu
@@ -3736,9 +3761,6 @@ static int lan743x_pm_resume(struct device *dev)
 		lan743x_netdev_open(netdev);
 
 	netif_device_attach(netdev);
-	ret = lan743x_csr_read(adapter, MAC_WK_SRC);
-	netif_info(adapter, drv, adapter->netdev,
-		   "Wakeup source : 0x%08X\n", ret);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/lan743x_main.h b/drivers/net/ethernet/microchip/lan743x_main.h
index 645bc048e52e..fac0f33d10b2 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.h
+++ b/drivers/net/ethernet/microchip/lan743x_main.h
@@ -61,6 +61,7 @@
 #define PMT_CTL_RX_FCT_RFE_D3_CLK_OVR_		BIT(18)
 #define PMT_CTL_GPIO_WAKEUP_EN_			BIT(15)
 #define PMT_CTL_EEE_WAKEUP_EN_			BIT(13)
+#define PMT_CTL_RES_CLR_WKP_MASK_		GENMASK(9, 8)
 #define PMT_CTL_READY_				BIT(7)
 #define PMT_CTL_ETH_PHY_RST_			BIT(4)
 #define PMT_CTL_WOL_EN_				BIT(3)
@@ -227,12 +228,31 @@
 #define MAC_WUCSR				(0x140)
 #define MAC_MP_SO_EN_				BIT(21)
 #define MAC_WUCSR_RFE_WAKE_EN_			BIT(14)
+#define MAC_WUCSR_EEE_TX_WAKE_			BIT(13)
+#define MAC_WUCSR_EEE_RX_WAKE_			BIT(11)
+#define MAC_WUCSR_RFE_WAKE_FR_			BIT(9)
+#define MAC_WUCSR_PFDA_FR_			BIT(7)
+#define MAC_WUCSR_WUFR_				BIT(6)
+#define MAC_WUCSR_MPR_				BIT(5)
+#define MAC_WUCSR_BCAST_FR_			BIT(4)
 #define MAC_WUCSR_PFDA_EN_			BIT(3)
 #define MAC_WUCSR_WAKE_EN_			BIT(2)
 #define MAC_WUCSR_MPEN_				BIT(1)
 #define MAC_WUCSR_BCST_EN_			BIT(0)
 
 #define MAC_WK_SRC				(0x144)
+#define MAC_WK_SRC_ETH_PHY_WK_			BIT(17)
+#define MAC_WK_SRC_IPV6_TCPSYN_RCD_WK_		BIT(16)
+#define MAC_WK_SRC_IPV4_TCPSYN_RCD_WK_		BIT(15)
+#define MAC_WK_SRC_EEE_TX_WK_			BIT(14)
+#define MAC_WK_SRC_EEE_RX_WK_			BIT(13)
+#define MAC_WK_SRC_RFE_FR_WK_			BIT(12)
+#define MAC_WK_SRC_PFDA_FR_WK_			BIT(11)
+#define MAC_WK_SRC_MP_FR_WK_			BIT(10)
+#define MAC_WK_SRC_BCAST_FR_WK_			BIT(9)
+#define MAC_WK_SRC_WU_FR_WK_			BIT(8)
+#define MAC_WK_SRC_WK_FR_SAVED_			BIT(7)
+
 #define MAC_MP_SO_HI				(0x148)
 #define MAC_MP_SO_LO				(0x14C)
 
@@ -295,6 +315,10 @@
 #define RFE_INDX(index)			(0x580 + (index << 2))
 
 #define MAC_WUCSR2			(0x600)
+#define MAC_WUCSR2_NS_RCD_		BIT(7)
+#define MAC_WUCSR2_ARP_RCD_		BIT(6)
+#define MAC_WUCSR2_IPV6_TCPSYN_RCD_	BIT(5)
+#define MAC_WUCSR2_IPV4_TCPSYN_RCD_	BIT(4)
 
 #define SGMII_ACC			(0x720)
 #define SGMII_ACC_SGMII_BZY_		BIT(31)
-- 
2.34.1

