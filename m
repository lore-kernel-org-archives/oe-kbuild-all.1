Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323BB17E9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717939513; cv=none; b=BLIxL3P29aA1QYPerX1HXHADAqGp2OpuZX5XHMMxn+Bp9upyfrYKrKi082zOoNHisjmfK86HdsX9Gkbz64I4IAT3RdhcN8+sdP6L24OjYgJgJ4FP9uWxJNBWXPEJWmXQZNXiGsHIur0GX79fuhV8SEDc00XXuBiZ9tHG4GoGVVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717939513; c=relaxed/simple;
	bh=RXAsk2wj0WXcyGKpqQdRLzhkQySm3DZZ67CWGXuMDY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIXthUEk3gGV2sndvuIx4CYCR9T5UcBft1NxNuednkHmHBpa9Hpr6Si6+l+xlnrRI0n7NddiVZ+dr9mKkQYxQSVh7+Ce+MSSot4rZigFNvEJ5nZ+47R4LCYXUD41jf2uHhA9HCpyjwCpxRwhmQoVgOZEzhqlSxcJeOYk9xdsw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qy3vn8u7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy3vn8u7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717939511; x=1749475511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXAsk2wj0WXcyGKpqQdRLzhkQySm3DZZ67CWGXuMDY4=;
  b=Qy3vn8u7vBQqCA+5mDuHX+0crA+z+X2C2JYRYLi1n3xJTrQhTVamtZNq
   rp8REAvGEiN7sHBPsH7azuKwMtwNHJIer9tZtCZ4i4Mst0JhoevEROy4p
   8Mub8RECeqwenIuUHL2BgfmYtdRpsE410VlJSOx5w4AlxSIQxH2VpnFJH
   NoTUiw6gHKrHncx2eq+UQ2KEJuzIJREmRmQ7wgeIGCn3G2Zn/8Mx0PiLh
   oNaHENJygrF1KWtL2wVnJxegk6S5YXct5avp0QA2Edc0jG+PObC6In0/b
   VshA8eDGF4bTSXuXP67jVKpDJSSwGWn5yXs40C25fHR0hM4uBWl3k50p8
   Q==;
X-CSE-ConnectionGUID: mCWNPBIKQqySuRt6Q66o3w==
X-CSE-MsgGUID: 93yipCSJS5CAcWnViqLsQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14764258"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14764258"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 06:25:10 -0700
X-CSE-ConnectionGUID: HoWVC03SQDSQw/CmLzCNJw==
X-CSE-MsgGUID: 4LuAfwjXSp2ysFfwDf8JsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="39360512"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2024 06:25:10 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGIXj-0001FB-2V;
	Sun, 09 Jun 2024 13:25:07 +0000
Date: Sun, 9 Jun 2024 21:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.10-rc2-esp32 24/46]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:13: error: 'struct
 hci_dev' has no member named 'dev_type'
Message-ID: <202406092113.aVbEomnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-rc2-esp32
head:   abd44c5784518efb46e1601d9b04cb5a63506944
commit: 95c1c9a2c0485380d57c4d0e645098add2a37e93 [24/46] drivers/net/wireless/espressif/esp32-ng: initial import
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240609/202406092113.aVbEomnp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092113.aVbEomnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092113.aVbEomnp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp32-ng/esp_bt.c:10:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h: In function 'CFG80211_RX_ASSOC_RESP':
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:16: error: variable 'resp' has initializer but incomplete type
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:47: warning: excess elements in struct initializer
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                                               ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:47: note: (near initialization for 'resp')
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:39: error: storage size of 'resp' isn't known
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                                       ^~~~
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:39: warning: unused variable 'resp' [-Wunused-variable]
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c: At top level:
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:6: warning: no previous prototype for 'esp_hci_update_tx_counter' [-Wmissing-prototypes]
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:6: warning: no previous prototype for 'esp_hci_update_rx_counter' [-Wmissing-prototypes]
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:5: warning: no previous prototype for 'esp_deinit_bt' [-Wmissing-prototypes]
     167 | int esp_deinit_bt(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:5: warning: no previous prototype for 'esp_init_bt' [-Wmissing-prototypes]
     184 | int esp_init_bt(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c: In function 'esp_init_bt':
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:13: error: 'struct hci_dev' has no member named 'dev_type'
     243 |         hdev->dev_type = HCI_PRIMARY;
         |             ^~
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:26: error: 'HCI_PRIMARY' undeclared (first use in this function); did you mean 'HCI_PRIVACY'?
     243 |         hdev->dev_type = HCI_PRIMARY;
         |                          ^~~~~~~~~~~
         |                          HCI_PRIVACY
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:26: note: each undeclared identifier is reported only once for each function it appears in


vim +243 drivers/net/wireless/espressif/esp32-ng/esp_bt.c

   166	
 > 167	int esp_deinit_bt(struct esp_adapter *adapter)
   168	{
   169		struct hci_dev *hdev = NULL;
   170	
   171		if (!adapter || !adapter->hcidev)
   172			return 0;
   173	
   174		hdev = adapter->hcidev;
   175	
   176		hci_unregister_dev(hdev);
   177		hci_free_dev(hdev);
   178	
   179		adapter->hcidev = NULL;
   180	
   181		return 0;
   182	}
   183	
 > 184	int esp_init_bt(struct esp_adapter *adapter)
   185	{
   186		int ret = 0;
   187		struct hci_dev *hdev = NULL;
   188	
   189		if (!adapter) {
   190			return -EINVAL;
   191		}
   192	
   193		if (adapter->hcidev) {
   194			return -EEXIST;
   195		}
   196	
   197		hdev = hci_alloc_dev();
   198	
   199		if (!hdev) {
   200			BT_ERR("Can not allocate HCI device");
   201			return -ENOMEM;
   202		}
   203	
   204		adapter->hcidev = hdev;
   205		hci_set_drvdata(hdev, adapter);
   206	
   207		hdev->bus = INVALID_HDEV_BUS;
   208	
   209		if (adapter->if_type == ESP_IF_TYPE_SDIO)
   210			hdev->bus   = HCI_SDIO;
   211	    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 7, 0))
   212		else if (adapter->if_type == ESP_IF_TYPE_SPI)
   213			hdev->bus   = HCI_SPI;
   214	    #endif
   215	
   216		if (hdev->bus == INVALID_HDEV_BUS) {
   217	
   218			if (adapter->if_type == ESP_IF_TYPE_SDIO) {
   219				esp_err("Kernel version does not support HCI over SDIO BUS\n");
   220			} else if (adapter->if_type == ESP_IF_TYPE_SPI) {
   221				esp_err("Kernel version does not support HCI over SPI BUS\n");
   222			} else {
   223				esp_err("HCI over expected BUS[%u] is not supported\n", adapter->if_type);
   224			}
   225			hci_free_dev(hdev);
   226			adapter->hcidev = NULL;
   227			return -EINVAL;
   228		}
   229	
   230		hdev->open  = esp_bt_open;
   231		hdev->close = esp_bt_close;
   232		hdev->flush = esp_bt_flush;
   233		hdev->send  = esp_bt_send_frame;
   234	
   235	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))
   236		hdev->setup = esp_bt_setup;
   237	#endif
   238	
   239	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))
   240		hdev->set_bdaddr = esp_bt_set_bdaddr;
   241	#endif
   242	
 > 243		hdev->dev_type = HCI_PRIMARY;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
