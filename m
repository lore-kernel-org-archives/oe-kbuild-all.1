Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704962A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693262205; x=1724798205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5zaS9ZWItnPLWJQVir412O/uIID7VwgZxLDVh1yo+U=;
  b=LSJlI0vvLKkWoVRjK5mE1l2bwi4DHaOoIdhsoN/tJBEvY364z6R92JhO
   UHoNl4DE3BhiFLq8o8SYyV4LCDnhGsj0iI6r3p9sjZofUXEyDf/wJIBJB
   liXsUqaLy+QNlVzH0c3I40vVONxQ89ZR10LvK6MR1DbxM5FiEnvpgtrf+
   O5CXEWfdFkClCYH8WD4IPjEKAjZcm+mFZk0Vh1IY9wp4qWHHSNVFehbEa
   mOOrmSrivrJbNCyEQPBKsVg6SwzpcynsU/VIKrsDOnUtr4VKXmuOk+U9B
   QV2KUN9JZlHiWWX5sMitTcSJ5TI9NMdcBJXyBfp/N24d4nWmwd8YYpexn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441566125"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441566125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 15:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803875759"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="803875759"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 15:36:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qakqc-0008Bx-07;
	Mon, 28 Aug 2023 22:36:39 +0000
Date: Tue, 29 Aug 2023 06:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 17/34]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:6: warning: no previous
 prototype for 'esp_hci_update_tx_counter'
Message-ID: <202308290610.2RYHjh31-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   edbe560c2ce9974f4b2e47ca13050e6a62d604b3
commit: d586e36f903e8850fab9955cb3b39cc72da8f733 [17/34] drivers/net/wireless/espressif/esp32-ng: initial import
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308290610.2RYHjh31-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290610.2RYHjh31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290610.2RYHjh31-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:6: warning: no previous prototype for 'esp_hci_update_tx_counter' [-Wmissing-prototypes]
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:6: warning: no previous prototype for 'esp_hci_update_rx_counter' [-Wmissing-prototypes]
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:5: warning: no previous prototype for 'esp_deinit_bt' [-Wmissing-prototypes]
     167 | int esp_deinit_bt(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:5: warning: no previous prototype for 'esp_init_bt' [-Wmissing-prototypes]
     184 | int esp_init_bt(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~
--
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:22: warning: no previous prototype for 'prepare_command_request' [-Wmissing-prototypes]
     414 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: In function 'cmd_assoc_request':
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:847:30: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
     847 |         struct cfg80211_bss *bss;
         |                              ^~~
--
>> drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.c:34:5: warning: no previous prototype for 'wpa_cipher_key_len' [-Wmissing-prototypes]
      34 | int wpa_cipher_key_len(int cipher)
         |     ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/wireless/espressif/esp32-ng/esp_stats.c:182:6: warning: no previous prototype for 'process_test_capabilities' [-Wmissing-prototypes]
     182 | void process_test_capabilities(u8 cap)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:16: warning: Cannot understand   * @brief WiFi PHY rate encodings
    on line 16 - I thought it was a doc line


vim +/esp_hci_update_tx_counter +14 drivers/net/wireless/espressif/esp32-ng/esp_bt.c

    13	
  > 14	void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
    15	{
    16		if (!hdev)
    17			return;
    18		if (pkt_type == HCI_COMMAND_PKT) {
    19			hdev->stat.cmd_tx++;
    20		} else if (pkt_type == HCI_ACLDATA_PKT) {
    21			hdev->stat.acl_tx++;
    22		} else if (pkt_type == HCI_SCODATA_PKT) {
    23			hdev->stat.sco_tx++;
    24		}
    25	
    26		hdev->stat.byte_tx += len;
    27	}
    28	
  > 29	void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
    30	{
    31		if (!hdev)
    32			return;
    33	
    34		if (pkt_type == HCI_EVENT_PKT) {
    35			hdev->stat.evt_rx++;
    36		} else if (pkt_type == HCI_ACLDATA_PKT) {
    37			hdev->stat.acl_rx++;
    38		} else if (pkt_type == HCI_SCODATA_PKT) {
    39			hdev->stat.sco_rx++;
    40		}
    41	
    42		hdev->stat.byte_rx += len;
    43	}
    44	
    45	static int esp_bt_open(struct hci_dev *hdev)
    46	{
    47		return 0;
    48	}
    49	
    50	static int esp_bt_close(struct hci_dev *hdev)
    51	{
    52		return 0;
    53	}
    54	
    55	static int esp_bt_flush(struct hci_dev *hdev)
    56	{
    57		return 0;
    58	}
    59	
    60	static ESP_BT_SEND_FRAME_PROTOTYPE()
    61	{
    62		struct esp_payload_header *hdr;
    63		size_t total_len, len = skb->len;
    64		int ret = 0;
    65	#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
    66		struct hci_dev *hdev = (struct hci_dev *)(skb->dev);
    67	#endif
    68		struct esp_adapter *adapter = hci_get_drvdata(hdev);
    69		struct sk_buff *new_skb;
    70		u8 pad_len = 0, realloc_skb = 0;
    71		u8 *pos = NULL;
    72		u8 pkt_type;
    73	
    74		if (!adapter) {
    75			esp_err("Invalid args");
    76			return -EINVAL;
    77		}
    78		//print_hex_dump(KERN_INFO, "bt_tx: ", DUMP_PREFIX_ADDRESS, 16, 1, skb->data, len, 1  );
    79	
    80		/* Create space for payload header */
    81		pad_len = sizeof(struct esp_payload_header);
    82		total_len = len + sizeof(struct esp_payload_header);
    83	
    84		/* Align buffer len */
    85		pad_len += SKB_DATA_ADDR_ALIGNMENT - (total_len % SKB_DATA_ADDR_ALIGNMENT);
    86	
    87		pkt_type = hci_skb_pkt_type(skb);
    88	
    89		if (skb_headroom(skb) < pad_len) {
    90			/* Headroom is not sufficient */
    91			realloc_skb = 1;
    92		}
    93	
    94		if (realloc_skb || !IS_ALIGNED((unsigned long) skb->data, SKB_DATA_ADDR_ALIGNMENT)) {
    95			/* Realloc SKB */
    96			if (skb_linearize(skb)) {
    97				hdev->stat.err_tx++;
    98				return -EINVAL;
    99			}
   100	
   101			new_skb = esp_alloc_skb(skb->len + pad_len);
   102	
   103			if (!new_skb) {
   104				esp_err("Failed to allocate SKB");
   105				hdev->stat.err_tx++;
   106				return -ENOMEM;
   107			}
   108	
   109			pos = new_skb->data;
   110	
   111			pos += pad_len;
   112	
   113			/* Populate new SKB */
   114			skb_copy_from_linear_data(skb, pos, skb->len);
   115			skb_put(new_skb, skb->len);
   116	
   117			/* Replace old SKB */
   118			dev_kfree_skb_any(skb);
   119			skb = new_skb;
   120		} else {
   121			/* Realloc is not needed, Make space for interface header */
   122			skb_push(skb, pad_len);
   123		}
   124	
   125		hdr = (struct esp_payload_header *) skb->data;
   126	
   127		memset(hdr, 0, sizeof(struct esp_payload_header));
   128	
   129		hdr->if_type = ESP_HCI_IF;
   130		hdr->if_num = 0;
   131		hdr->len = cpu_to_le16(len);
   132		hdr->offset = cpu_to_le16(pad_len);
   133		pos = skb->data;
   134	
   135		/* set HCI packet type */
   136		*(pos + pad_len - 1) = pkt_type;
   137	
   138		if (adapter->capabilities & ESP_CHECKSUM_ENABLED)
   139			hdr->checksum = cpu_to_le16(compute_checksum(skb->data, (len + pad_len)));
   140	
   141		ret = esp_send_packet(adapter, skb);
   142	
   143		if (ret) {
   144			hdev->stat.err_tx++;
   145			return ret;
   146		} else {
   147			esp_hci_update_tx_counter(hdev, hdr->hci_pkt_type, skb->len);
   148		}
   149	
   150		return 0;
   151	}
   152	
   153	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))
   154	static int esp_bt_setup(struct hci_dev *hdev)
   155	{
   156		return 0;
   157	}
   158	#endif
   159	
   160	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))
   161	static int esp_bt_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
   162	{
   163		return 0;
   164	}
   165	#endif
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
