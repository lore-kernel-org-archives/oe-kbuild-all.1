Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE61862B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIlrDGBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697846622; x=1729382622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4K2jc/fhziifbidU6nUH/QhxSEHyqspg98w5pKZU/bU=;
  b=CIlrDGBxSm/chUb5tvmR3OFdL9uJnhJcqjrJcuzYMx01NU2L8Osa8VH5
   0w7njuFePb3gnUFP7q1mur3vzhFstUFq8PuIUDdlDPjz76NPL+/XukNSA
   KQN6kQwAVZJFLyR04FlrIfa0mMieOOSVrHJK6iKTZ5p3wNQ02uZl48qqJ
   aEETROFCBlYs4w02jKsXcizsy+cqD7oIIyn3c58Ah0kxWjdon66CKI/SF
   CEJU+yFw+dzpJA4dqrbBlCw+fQPtaa0wU5PRRNJlEYm+DXs0yW1+mAb/1
   XJmyea80Xwwy3TpPbx0DuVTSLdmwLI9kLZI5t+i2ENj4/HvHrLaxidVTM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8154859"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="8154859"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="931151816"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="931151816"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2023 17:03:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzSn-00048U-2y;
	Sat, 21 Oct 2023 00:03:33 +0000
Date: Sat, 21 Oct 2023 08:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 22/43] checkpatch: WARNING:
 Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310210709.tMDnxLdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: 8030688fff0e4ac4ef678732328e3040b6eb9492 [22/43] drivers/net/wireless/espressif/esp32-ng: initial import
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210709.tMDnxLdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210709.tMDnxLdE-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#163: FILE: drivers/net/wireless/espressif/esp32-ng/adapter.h:1:
+// Copyright 2015-2021 Espressif Systems (Shanghai) PTE LTD

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#195: FILE: drivers/net/wireless/espressif/esp32-ng/adapter.h:33:
+	 * this is required for hci_pkt_type */

WARNING:NEW_TYPEDEFS: do not add new typedefs
#249: FILE: drivers/net/wireless/espressif/esp32-ng/adapter.h:87:
+typedef enum {

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#493: FILE: drivers/net/wireless/espressif/esp32-ng/esp.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#528: FILE: drivers/net/wireless/espressif/esp32-ng/esp.h:36:
+ * supported values of CONFIG_IDF_FIRMWARE_CHIP_ID are - */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#574: FILE: drivers/net/wireless/espressif/esp32-ng/esp.h:82:
+	 * struct esp_sdio_context */

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#666: FILE: drivers/net/wireless/espressif/esp32-ng/esp_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 20)
#681: FILE: drivers/net/wireless/espressif/esp32-ng/esp_api.h:16:
+		if (!!(ret)) {                                        \
+		    esp_err("esp32: %s failure, ret: %d\n", #x, ret); \

WARNING:TABSTOP: Statements should start on a tabstop
#683: FILE: drivers/net/wireless/espressif/esp32-ng/esp_api.h:18:
+		    return ret;                                       \

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#731: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:18:
+	if (pkt_type == HCI_COMMAND_PKT) {
[...]
+	} else if (pkt_type == HCI_ACLDATA_PKT) {
[...]
+	} else if (pkt_type == HCI_SCODATA_PKT) {
[...]

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#747: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:34:
+	if (pkt_type == HCI_EVENT_PKT) {
[...]
+	} else if (pkt_type == HCI_ACLDATA_PKT) {
[...]
+	} else if (pkt_type == HCI_SCODATA_PKT) {
[...]

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#778: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:65:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#859: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:146:
+		return ret;
+	} else {

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#866: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:153:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#873: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:160:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))

WARNING:BRACES: braces {} are not necessary for single statement blocks
#902: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:189:
+	if (!adapter) {
+		return -EINVAL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#906: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:193:
+	if (adapter->hcidev) {
+		return -EEXIST;
+	}

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#924: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:211:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 7, 0))

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#931: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:218:
+		if (adapter->if_type == ESP_IF_TYPE_SDIO) {
[...]
+		} else if (adapter->if_type == ESP_IF_TYPE_SPI) {
[...]
+		} else {
[...]

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#948: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:235:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#952: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:239:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#973: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#987: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:15:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#988: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:16:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#995: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:23:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#996: FILE: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:24:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1030: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:16:
+/**
+  * @brief WiFi PHY rate encodings

WARNING:NEW_TYPEDEFS: do not add new typedefs
#1033: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:19:
+typedef enum {

WARNING:BRACES: braces {} are not necessary for single statement blocks
#1139: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:125:
+	if (!strstr(netdev->name, "espsta")) {
+		return 0;
+	}

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1213: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:199:
+	 * esp_nw_if_num, esp_wdev->adapter->priv[esp_nw_if_num]);*/

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#1255: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:241:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#1295: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:281:
+#if 0

WARNING:BRACES: braces {} are not necessary for single statement blocks
#1375: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:361:
+	if (params->key_len == 0) {
+		return esp_cfg80211_del_key(wiphy, dev, ZERO_LINK_ID key_index, pairwise, mac_addr);
+	}

WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#1536: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:522:
+		esp_info("%u invalid input %p %p \n", __LINE__, wiphy, wdev);

ERROR:CODE_INDENT: code indent should use tabs where possible
#1548: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:534:
+        switch (type) {$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1549: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:535:
+        case NL80211_TX_POWER_AUTOMATIC:$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1550: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:536:
+                priv->tx_pwr_type = NL80211_TX_POWER_AUTOMATIC;$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1551: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:537:
+                priv->tx_pwr = mbm_to_esp_pwr(MAX_TX_POWER_MBM);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1552: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:538:
+                break;$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1553: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:539:
+        case NL80211_TX_POWER_LIMITED:$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1554: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:540:
+                if (!is_txpwr_valid(mbm)) {$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1555: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:541:
+                        esp_warn("mbm:%d not support\n", mbm);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1557: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:543:
+                }$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1558: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:544:
+                priv->tx_pwr_type = NL80211_TX_POWER_LIMITED;$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1559: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:545:
+                priv->tx_pwr = mbm_to_esp_pwr(mbm);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1560: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:546:
+                break;$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1561: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:547:
+        case NL80211_TX_POWER_FIXED:$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1563: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:549:
+                break;$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1564: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:550:
+        default:$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1565: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:551:
+                esp_warn("unknown type:%d\n", type);$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1566: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:552:
+        }$

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#1596: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:582:
+#if 0

WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#1633: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:619:
+		esp_info("%u esp_dev not initialized yet \n", __LINE__);

WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#1639: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:625:
+		esp_info("%u esp_wifi_device not initialized yet \n", __LINE__);

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1744: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#1796: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:22:
+int internal_scan_request(struct esp_wifi_device *priv, char *ssid,

WARNING:BRACES: braces {} are not necessary for single statement blocks
#1822: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:48:
+	if (!cmd_node->cmd_skb) {
+		esp_err("No free cmd node skb found\n");
+	}

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#2279: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:505:
+	/*if (!priv->scan_in_progress) {
+		return;

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#2280: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:506:
+	}*/

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2329: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:555:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2369: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:595:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2526: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:752:
+#if 0

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#2593: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:819:
+			break;
+		} else {

WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#2654: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:880:
+	if (priv->assoc_req_ie) {
+		kfree(priv->assoc_req_ie);

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2724: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:950:
+#if 0

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#2731: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:957:
+			break;
+		} else {

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2759: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:985:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2814: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1040:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2862: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1088:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2873: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1099:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2898: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1124:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2930: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1156:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#2937: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1163:
+#if 0

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3045: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1271:
+	if (ssid) {
+		memcpy(scan_req->ssid, ssid, MAX_SSID_LEN);
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3105: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1331:
+	if (request->ssids && request->ssids[0].ssid_len) {
+		memcpy(scan_req->ssid, request->ssids[0].ssid, MAX_SSID_LEN);
+	}

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#3109: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1335:
+#if 0

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3116: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1342:
+#if LINUX_VERSION_CODE > KERNEL_VERSION(4, 8, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3119: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1345:
+#if LINUX_VERSION_CODE > KERNEL_VERSION(4, 7, 0)

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3200: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1426:
+	if (!adapter) {
+		return -EINVAL;
+	}

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#3377: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#3437: FILE: drivers/net/wireless/espressif/esp32-ng/esp_if.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#3466: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3480: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:15:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3488: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:23:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3500: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:35:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3514: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:49:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3523: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:58:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3536: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:71:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3552: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:87:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3561: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:96:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3562: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:97:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

ERROR:CODE_INDENT: code indent should use tabs where possible
#3563: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:98:
+        #define hci_skb_pkt_type(skb) bt_cb((skb))->pkt_type$

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3569: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:104:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3570: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:105:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

ERROR:CODE_INDENT: code indent should use tabs where possible
#3571: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:106:
+        #define HCI_PRIMARY HCI_BREDR$

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3578: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:113:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0)

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#3582: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:117:
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, abort);                          \

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#3599: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:134:
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, &info);                          \

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3610: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:145:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3616: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0)

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3628: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:163:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 17, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3632: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:167:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3645: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:180:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 0, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3657: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:192:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 0, 21))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3666: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:201:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#3686: FILE: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:221:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 15, 0))

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#3700: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:1:
+/*

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 8)
#3727: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:28:
+	if (ret)						\
+	esp_err("CMD53 read/write error at %d\n", __LINE__);	\

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3755: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:56:
+	if (!context) {
+		return;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3759: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:60:
+	if (int_status & ESP_SLAVE_RX_NEW_PACKET_INT) {
+		esp_process_new_packet_intr(context->adapter);
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3770: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:71:
+	if (!func) {
+		return;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3779: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:80:
+	if (!context) {
+		return;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3785: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:86:
+	if (!int_status) {
+		return;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3814: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:115:
+	if (!val) {
+		return -ENOMEM;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3846: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:147:
+	if (!len) {
+		return -ENOMEM;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3874: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:175:
+	if (!len) {
+		return -ENOMEM;
+	}

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#3907: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:208:
+#if 0

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3918: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:219:
+		if (!skb) {
+			break;
+		}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3959: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:260:
+			if (context->adapter->hcidev) {
+				esp_deinit_bt(context->adapter);
+			}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#3985: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:286:
+	if (!val) {
+		return -ENOMEM;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4028: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:329:
+	if (!context) {
+		return -EINVAL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4085: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:386:
+	if (len_from_slave > size) {
+		esp_info("Rx large packet: %d\n", len_from_slave);
+	}

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#4105: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:406:
+#if 0

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4106: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:407:
+		if (!context->rx_byte_count) {
+			start_time = ktime_get_ns();
+		}

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#4206: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:507:
+	/*If buffer needed are less than buffer available
+	  then only read for available buffer number from slave*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#4206: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:507:
+	  then only read for available buffer number from slave*/

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4265: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:566:
+			if (!tx_skb) {
+				continue;
+			}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4271: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:572:
+			if (!tx_skb) {
+				continue;
+			}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4277: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:578:
+			if (!tx_skb) {
+				continue;
+			}

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#4282: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:583:
+#if 0

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#4308: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:609:
+		/*If SDIO slave buffer is available to write then only write data
+		else wait till buffer is available*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#4308: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:609:
+		else wait till buffer is available*/

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4371: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:672:
+	if (ret) {
+		return NULL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4453: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:754:
+	if (func->num != 1) {
+		return -EINVAL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#4461: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:762:
+	if (!context) {
+		return -ENOMEM;
+	}

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#4520: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:821:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#4541: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:842:
+#if 0

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#4668: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:1:
+/*

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#4780: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:113:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#4789: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:122:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#4801: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:134:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#4810: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:143:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#4823: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.h:1:
+/*

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#4846: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_decl.h:1:
+/*

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#4940: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:1:
+/*

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5018: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:79:
+	if (!data_path) {
+		return NULL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5195: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:256:
+		for (prio_q_idx = 0; prio_q_idx < MAX_PRIORITY_QUEUES; prio_q_idx++) {
+			skb_queue_purge(&spi_context.tx_q[prio_q_idx]);
+		}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5218: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:279:
+		for (prio_q_idx = 0; prio_q_idx < MAX_PRIORITY_QUEUES; prio_q_idx++) {
+			skb_queue_head_init(&spi_context.tx_q[prio_q_idx]);
+		}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5223: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:284:
+	if (esp_add_card(adapter)) {
+		esp_err("network iterface init failed\n");
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5246: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:307:
+	if (header->if_type >= ESP_MAX_IF) {
+		return -EINVAL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5253: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:314:
+	if (offset != sizeof(struct esp_payload_header)) {
+		return -EINVAL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5258: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:319:
+	if (!len) {
+		return -EINVAL;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5264: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:325:
+	if (len > SPI_BUF_SIZE) {
+		return -EINVAL;
+	}

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#5338: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:399:
+			 * */

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#5360: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:421:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 15, 0))

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5361: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:422:
+			if (hardware_type == ESP_FIRMWARE_CHIP_ESP32) {
+				trans.cs_change = 1;
+			}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5374: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:435:
+				if (process_rx_buf(rx_skb)) {
+					dev_kfree_skb(rx_skb);
+				}

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#5387: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:448:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0))

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5396: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:457:
+	if (!ctlr) {
+		return 0;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5423: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:484:
+	if (dev) {
+		ctlr = container_of(dev, struct spi_controller, dev);
+	}

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#5643: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:1:
+/*

WARNING:BRACES: braces {} are not necessary for single statement blocks
#5837: FILE: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:151:
+		if (!ret) {
+			log_raw_tp_stats_timer_running = 0;
+		}

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#5893: FILE: drivers/net/wireless/espressif/esp32-ng/esp_stats.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#5982: FILE: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.c:52:
+#if 0

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#6000: FILE: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#6073: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:27:
+extern u8 ap_bssid[MAC_ADDR_LEN];

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#6074: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:28:
+extern volatile u8 host_sleep;

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH' are not preferred. Consider using octal permissions '0644'.
#6076: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:30:
+module_param(resetpin, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6126: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:80:
+	if (host_sleep) {
+		return NETDEV_TX_BUSY;
+	}

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#6280: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:234:
+	switch (reason)
+	{

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6282: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:236:
+		case 1: esp_info("POWERON_RESET\n"); break;          /**<1, Vbat power on reset*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6283: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:237:
+		case 3: esp_info("SW_RESET\n"); break;               /**<3, Software reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6284: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:238:
+		case 4: esp_info("OWDT_RESET\n"); break;             /**<4, Legacy watch dog reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6285: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:239:
+		case 5: esp_info("DEEPSLEEP_RESET\n"); break;        /**<5, Deep Sleep reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6286: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:240:
+		case 6: esp_info("SDIO_RESET\n"); break;             /**<6, Reset by SLC module, reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6287: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:241:
+		case 7: esp_info("TG0WDT_SYS_RESET\n"); break;       /**<7, Timer Group0 Watch dog reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6288: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:242:
+		case 8: esp_info("TG1WDT_SYS_RESET\n"); break;       /**<8, Timer Group1 Watch dog reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6289: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:243:
+		case 9: esp_info("RTCWDT_SYS_RESET\n"); break;       /**<9, RTC Watch dog Reset digital core*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6290: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:244:
+		case 10: esp_info("INTRUSION_RESET\n"); break;       /**<10, Instrusion tested to reset CPU*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6291: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:245:
+		case 11: esp_info("TGWDT_CPU_RESET\n"); break;       /**<11, Time Group reset CPU*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6292: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:246:
+		case 12: esp_info("SW_CPU_RESET\n"); break;          /**<12, Software reset CPU*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6293: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:247:
+		case 13: esp_info("RTCWDT_CPU_RESET\n"); break;      /**<13, RTC Watch dog Reset CPU*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6294: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:248:
+		case 14: esp_info("EXT_CPU_RESET\n"); break;         /**<14, for APP CPU, reseted by PRO CPU*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6295: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:249:
+		case 15: esp_info("RTCWDT_BROWN_OUT_RESET\n"); break;/**<15, Reset when the vdd voltage is not stable*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6296: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:250:
+		case 16: esp_info("RTCWDT_RTC_RESET\n"); break;      /**<16, RTC Watch dog reset digital core and rtc module*/

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#6297: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:251:
+		default: esp_info("Unknown[%u]\n", reason); break;

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#6360: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:314:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#6379: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:333:
+#if 0

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6526: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:480:
+	if (!adapter) {
+		return 0;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6632: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:586:
+	if (payload_header->reserved2 == 0xFF) {
+		print_hex_dump(KERN_INFO, "Wake up packet: ", DUMP_PREFIX_ADDRESS, 16, 1, skb->data, len+offset, 1);
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6673: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:627:
+			if (!IS_ALIGNED((unsigned long) eap_skb->data, SKB_DATA_ADDR_ALIGNMENT)) {
+				esp_info("%u eap skb unaligned\n", __LINE__);
+			}

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#6711: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:665:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0))

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 24)
#6731: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:685:
+	} else if (payload_header->if_type == ESP_TEST_IF) {
[...]
+			update_test_raw_tp_rx_stats(len);

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6757: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:711:
+	if (!netif_queue_stopped((const struct net_device *)priv->ndev)) {
+		netif_stop_queue(priv->ndev);
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6767: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:721:
+	if (netif_queue_stopped((const struct net_device *)priv->ndev)) {
+		netif_wake_queue(priv->ndev);
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6935: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:889:
+	if (ret != 0) {
+		deinit_adapter();
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6948: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:902:
+	for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
+		cmd_deinit_interface(adapter.priv[iface_idx]);
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#6956: FILE: drivers/net/wireless/espressif/esp32-ng/main.c:910:
+	if (resetpin != HOST_GPIO_PIN_INVALID) {
+		gpio_free(resetpin);
+	}

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#6974: FILE: drivers/net/wireless/espressif/esp32-ng/utils.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#6983: FILE: drivers/net/wireless/espressif/esp32-ng/utils.h:10:
+#define MAC2STR(a) (a)[0], (a)[1], (a)[2], (a)[3], (a)[4], (a)[5]

ERROR:SPACING: space required before the open parenthesis '('
#6992: FILE: drivers/net/wireless/espressif/esp32-ng/utils.h:19:
+#define esp_info(...) do {} while(0)

ERROR:SPACING: space required before the open parenthesis '('
#6998: FILE: drivers/net/wireless/espressif/esp32-ng/utils.h:25:
+#define esp_dbg(...) do {} while(0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
