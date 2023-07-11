Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171194421
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 05:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689054347; x=1720590347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gz3KPNHfAdH5FXZQu/5XEeD1qBJH1wiMM/zOCbpTGsw=;
  b=ROloBR4Hw1xMjIBeCGypEWMJeRwLjnkb2UyKsMckZ3kCamgw+qQGnKJA
   sX61M604i/m8wloqF4kM6fg6yCa/6i24aRMfYgBS9Zsx61Emjk1NBM2lo
   iua2y22hM2L6J1cUzvewrS1bsbYt9LK2PlpQDV/OIdGJAEd9DE+uGf+A+
   PEcyVjredOJhTNQD6KjhzaqfcMNo1UdrD1iSDEvfflD2Eiv248YTjCoWs
   GxJZqUV0o1as5t7x0fkOox0UEFuFKeJNrg5ANS08efkCT7S7zlehYtid7
   yC/+V8YeCU2PzSbPWo+hLXNKauWt/6YFDgSM6LK78H8JeYgmRCGb9xsMd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430617587"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="430617587"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750597420"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="750597420"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 22:45:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6By-0004MZ-1P;
	Tue, 11 Jul 2023 05:45:42 +0000
Date: Tue, 11 Jul 2023 13:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 18/27]
 drivers/net/wireless/espressif/esp_bt.c:14:6: warning: no previous prototype
 for 'esp_hci_update_tx_counter'
Message-ID: <202307111318.F0q9x0sm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   2eab76fb89d797558f2825d8813565c35c8ef134
commit: 815e8f7022417a427120ea90318dc77108a02e21 [18/27] WIP: drivers/net/wireless/espressif: initial import
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230711/202307111318.F0q9x0sm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111318.F0q9x0sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111318.F0q9x0sm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from drivers/net/wireless/espressif/esp.h:11,
                    from drivers/net/wireless/espressif/esp_api.h:11,
                    from drivers/net/wireless/espressif/esp_bt.c:9:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
>> drivers/net/wireless/espressif/esp_bt.c:14:6: warning: no previous prototype for 'esp_hci_update_tx_counter' [-Wmissing-prototypes]
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp_bt.c:29:6: warning: no previous prototype for 'esp_hci_update_rx_counter' [-Wmissing-prototypes]
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp_bt.c:167:5: warning: no previous prototype for 'esp_deinit_bt' [-Wmissing-prototypes]
     167 | int esp_deinit_bt(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp_bt.c:184:5: warning: no previous prototype for 'esp_init_bt' [-Wmissing-prototypes]
     184 | int esp_init_bt(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~
--
   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from drivers/net/wireless/espressif/esp.h:11,
                    from drivers/net/wireless/espressif/esp_cmd.h:11,
                    from drivers/net/wireless/espressif/esp_cmd.c:9:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
>> drivers/net/wireless/espressif/esp_cmd.c:412:22: warning: no previous prototype for 'prepare_command_request' [-Wmissing-prototypes]
     412 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp_cmd.c: In function 'cmd_assoc_request':
>> drivers/net/wireless/espressif/esp_cmd.c:845:30: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
     845 |         struct cfg80211_bss *bss;
         |                              ^~~
--
   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from drivers/net/wireless/espressif/esp.h:11,
                    from drivers/net/wireless/espressif/esp_wpa_utils.h:11,
                    from drivers/net/wireless/espressif/esp_wpa_utils.c:9:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
>> drivers/net/wireless/espressif/esp_wpa_utils.c:34:5: warning: no previous prototype for 'wpa_cipher_key_len' [-Wmissing-prototypes]
      34 | int wpa_cipher_key_len(int cipher)
         |     ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from drivers/net/wireless/espressif/esp.h:11,
                    from drivers/net/wireless/espressif/esp_stats.h:11,
                    from drivers/net/wireless/espressif/esp_stats.c:10:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
>> drivers/net/wireless/espressif/esp_stats.c:182:6: warning: no previous prototype for 'process_test_capabilities' [-Wmissing-prototypes]
     182 | void process_test_capabilities(u8 cap)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/esp_hci_update_tx_counter +14 drivers/net/wireless/espressif/esp_bt.c

   > 9	#include "esp_api.h"
    10	#include "esp_kernel_port.h"
    11	
    12	#define INVALID_HDEV_BUS (0xff)
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
