Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81209168C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689058071; x=1720594071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BpAboosXanR7lirIsH6IhFdX9cwndaqS4cxAVSCulEI=;
  b=WtaeGPvkpKII01sw6DXR70d4gsDQ1LtudYH7fr9z7PmQLDsd76OWea0V
   PlXLD5N7aMOH0gYyPaOLZxn7TaQSrNiFKz+IiOnxo7kdVaX/TN1gvA2Pi
   LpJDvCCFJSGkfbhOEl296vxAM5MqqohpZMB8n9eM60wXvnS9mq+zF4FzV
   yVUu6W11Y0qsa9piIViQszzmNhtUOAJ7My2+FOuAeqHznsa31R1Z2nNUX
   SLpolsoAf86Vaca3mJ/qY7CJCN56eKKorp0wTnuA47ZGUs/AJwm0SBa8M
   T/h95QzX+ESkfpwcqw0uJLTflPOIPzYhdba2k9oHsuZddfCVsmeYF/HZe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428235129"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="428235129"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="756237833"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="756237833"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 23:47:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ7A1-0004Q1-1t;
	Tue, 11 Jul 2023 06:47:45 +0000
Date: Tue, 11 Jul 2023 14:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/27]
 drivers/net/wireless/espressif/esp_shmem.c:226: undefined reference to
 `esp_add_card'
Message-ID: <202307111435.lce5hMXT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   0e48757b20c9e813e7c330d76e0a6f895f0660d4
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/27] esp_wifi: add shmem transport
config: i386-randconfig-i015-20230711 (https://download.01.org/0day-ci/archive/20230711/202307111435.lce5hMXT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111435.lce5hMXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111435.lce5hMXT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_remove':
   drivers/net/wireless/espressif/esp_shmem.c:467: undefined reference to `esp_wifi_deinit'
   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `write_packet':
   drivers/net/wireless/espressif/esp_shmem.c:103: undefined reference to `esp_tx_pause'
   ld: drivers/net/wireless/espressif/esp_shmem.c:88: undefined reference to `esp_tx_pause'
   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_handle_rx':
   drivers/net/wireless/espressif/esp_shmem.c:290: undefined reference to `esp_alloc_skb'
   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_handle_tx':
   drivers/net/wireless/espressif/esp_shmem.c:316: undefined reference to `esp_tx_resume'
   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_thread_handler':
   drivers/net/wireless/espressif/esp_shmem.c:364: undefined reference to `esp_process_new_packet_intr'
   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_probe':
   drivers/net/wireless/espressif/esp_shmem.c:444: undefined reference to `esp_wifi_init'
   ld: drivers/net/wireless/espressif/esp_shmem.o: in function `process_event_esp_bootup':
>> drivers/net/wireless/espressif/esp_shmem.c:226: undefined reference to `esp_add_card'
   ld: drivers/net/wireless/espressif/esp_shmem.c:230: undefined reference to `process_capabilities'
   ld: drivers/net/wireless/espressif/esp_shmem.c:231: undefined reference to `print_capabilities'
   ld: drivers/net/wireless/espressif/esp_shmem.c:159: undefined reference to `process_test_capabilities'
>> ld: drivers/net/wireless/espressif/esp_shmem.c:152: undefined reference to `process_fw_data'
   ld: drivers/net/wireless/espressif/esp_shmem.c:153: undefined reference to `esp_remove_card'
   ld: drivers/net/wireless/espressif/esp_shmem.c:212: undefined reference to `cfg80211_scan_done'
   ld: drivers/net/wireless/espressif/esp_shmem.c:216: undefined reference to `cfg80211_disconnected'
   ld: drivers/net/wireless/espressif/esp_shmem.c:221: undefined reference to `esp_remove_card'


vim +226 drivers/net/wireless/espressif/esp_shmem.c

   114	
   115	void process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
   116	{
   117		struct esp_wifi_shmem *hw = container_of(adapter, struct esp_wifi_shmem, adapter);
   118		/* Bootup event will be received whenever ESP is booted.
   119		 * It is termed 'First bootup' when this event is received
   120		 * the first time module loaded. It is termed 'Second & onward bootup' when
   121		 * there is ESP reset (reason may be manual reset of ESP or any crash at ESP)
   122		 */
   123		u8 len_left = len, tag_len;
   124		u8 *pos;
   125		uint8_t iface_idx = 0;
   126		enum chipset_type_e hardware_type = ESP_FIRMWARE_CHIP_UNRECOGNIZED;
   127	
   128		if (!adapter)
   129			return;
   130	
   131		if (!evt_buf)
   132			return;
   133	
   134		/* Second & onward bootup, cleanup and re-init the driver */
   135		if (hw->esp_reset_after_module_load)
   136			set_bit(ESP_CLEANUP_IN_PROGRESS, &adapter->state_flags);
   137	
   138		pos = evt_buf;
   139	
   140		while (len_left) {
   141	
   142			tag_len = *(pos + 1);
   143	
   144			pr_debug("EVENT: %d\n", *pos);
   145	
   146			if (*pos == ESP_BOOTUP_CAPABILITY) {
   147				adapter->capabilities = *(pos + 2);
   148			} else if (*pos == ESP_BOOTUP_FW_DATA) {
   149				if (tag_len != sizeof(struct fw_data))
   150					pr_info("Length not matching to firmware data size\n");
   151				else
 > 152					if (process_fw_data((struct fw_data *)(pos + 2))) {
   153						esp_remove_card(adapter);
   154						return;
   155					}
   156			} else if (*pos == ESP_BOOTUP_FIRMWARE_CHIP_ID) {
   157				hardware_type = *(pos+2);
   158			} else if (*pos == ESP_BOOTUP_TEST_RAW_TP) {
   159				process_test_capabilities(*(pos + 2));
   160			} else {
   161				pr_warn("Unsupported tag in event\n");
   162			}
   163	
   164			pos += (tag_len+2);
   165			len_left -= (tag_len+2);
   166		}
   167	
   168		if ((hardware_type != ESP_FIRMWARE_CHIP_ESP32) &&
   169		    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S2) &&
   170		    (hardware_type != ESP_FIRMWARE_CHIP_ESP32C3) &&
   171		    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S3)) {
   172			pr_info("ESP chipset not recognized, ignoring [%d]\n", hardware_type);
   173			hardware_type = ESP_FIRMWARE_CHIP_UNRECOGNIZED;
   174		} else {
   175			pr_info("ESP chipset detected [%s]\n",
   176				hardware_type == ESP_FIRMWARE_CHIP_ESP32 ? "esp32" :
   177				hardware_type == ESP_FIRMWARE_CHIP_ESP32S2 ? "esp32-s2" :
   178				hardware_type == ESP_FIRMWARE_CHIP_ESP32C3 ? "esp32-c3" :
   179				hardware_type == ESP_FIRMWARE_CHIP_ESP32S3 ? "esp32-s3" :
   180				"unknown");
   181		}
   182	
   183		if (hw->esp_reset_after_module_load) {
   184	
   185			/* Second & onward bootup:
   186			 *
   187			 * SPI is software and not a hardware based module.
   188			 * When bootup event is received, we should discard all prior commands,
   189			 * old messages pending at network and re-initialize everything.
   190			 *
   191			 * Such handling is not required
   192			 * 1. for SDIO
   193			 *   as Removal of SDIO triggers complete Deinit and on SDIO insertion/
   194			 *   detection, i.e., after probing, initialization is triggered
   195			 *
   196			 * 2. On first bootup (if counterpart of this else)
   197			 *   First bootup event is received immediately after module insertion.
   198			 *   As all network or cmds are init and clean for the first time,
   199			 *   there is no need to re-init them
   200			 */
   201	
   202			skb_queue_purge(&hw->tx_q);
   203	
   204			for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
   205	
   206				struct esp_wifi_device *priv = adapter->priv[iface_idx];
   207	
   208				if (!priv)
   209					continue;
   210	
   211				if (priv->scan_in_progress)
   212					ESP_MARK_SCAN_DONE(priv, true);
   213	
   214				if (priv->ndev &&
   215				    wireless_dev_current_bss_exists(&priv->wdev)) {
   216					CFG80211_DISCONNECTED(priv->ndev,
   217							      0, NULL, 0, false, GFP_KERNEL);
   218				}
   219			}
   220	
   221			esp_remove_card(adapter);
   222	
   223			skb_queue_head_init(&hw->tx_q);
   224		}
   225	
 > 226		if (esp_add_card(adapter)) {
   227			pr_err("network iterface init failed\n");
   228		}
   229	
   230		process_capabilities(adapter);
   231		print_capabilities(adapter->capabilities);
   232	
   233	
   234		hw->esp_reset_after_module_load = true;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
