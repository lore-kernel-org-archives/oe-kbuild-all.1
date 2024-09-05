Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403EC19DF75
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552739; cv=none; b=QQIk3+L/bxJbqC/0nuJZuveVbED1/2Fg7RGq0QY7cTjYj1LBmbopqxgFQMzFXpLB5Twp9jcV408/3KBMr0HPoTFZeeDDHK+0A3RBjMHQXTQjckcE00qZyyiQXmljlOfPYMwladJTOuF3sYs4U0YXYuu3eFn0HAutJQIVS3tVXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552739; c=relaxed/simple;
	bh=NPD3E6FB12ya1IUERR8NMwxa68Vy6CdbTeX/PB3FOMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJ1i6uE3tHI3SNuiIQdpMBbic3xLsQZg8yduBKowouhfY0+y3i3NG0mHV29IpeZHCNBiUcGaedzTk/XrvtuBESlu2h0qWrOVXQB6z0QI5VSrVInlUmcmXnKR9cc4syzl6zf8MnO0pgfZMbXr+iOcDQbOSVEKO5b1oPHM99IEHTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Go0RAMUN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go0RAMUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725552738; x=1757088738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPD3E6FB12ya1IUERR8NMwxa68Vy6CdbTeX/PB3FOMs=;
  b=Go0RAMUN4GWNkeHWF6cxPThph37jjhcqk6gLkRmUxAU5GRMlHCTuY/xu
   Z3uabHxdZr/U7E0B4mPkEGYPdBc8pnLZxA98vBHQT/b6WXlU+Fvgi9a4U
   RL6zwo53GPGReWZSaX+EAqXpdZObq6Tf3hLCLKIv6P3Cfh+Wr9kELjaun
   bB4qc7Y2Sp0PiAPWzyYkBMr3oj+x5lNBl4cabdHjvJ3ahv55rwIQsZ2fT
   IQoP1pQem2cdgoG/gCzt4JuJbOfuIBkQZByDXzvwGKCK+yPj7TKgJo5JM
   4F+db1Q5lugKfxqX3sPNKd66HJ+V6LT6AtgfW0I84vVf7PFnU5zJbojob
   g==;
X-CSE-ConnectionGUID: o9ILqNgSSMqcX348CxZbGQ==
X-CSE-MsgGUID: hEPC4lsHSLKK5MzEOwMNgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24440843"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24440843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 09:12:17 -0700
X-CSE-ConnectionGUID: rZikL6GOQdSWhchkrCww7A==
X-CSE-MsgGUID: zKZfE1shRdKaQgKORnh1+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="70591914"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2024 09:12:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smF5h-000A6G-2H;
	Thu, 05 Sep 2024 16:12:13 +0000
Date: Fri, 6 Sep 2024 00:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 25/53]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:13: error: 'struct
 hci_dev' has no member named 'dev_type'
Message-ID: <202409060010.7qaoG20K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 963c678969c7db8aa9be578713ebd9adf4500d0b [25/53] drivers/net/wireless/espressif/esp32-ng: initial import
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240906/202409060010.7qaoG20K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060010.7qaoG20K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060010.7qaoG20K-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c: In function 'esp_init_bt':
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:13: error: 'struct hci_dev' has no member named 'dev_type'
     243 |         hdev->dev_type = HCI_PRIMARY;
         |             ^~
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:26: error: 'HCI_PRIMARY' undeclared (first use in this function); did you mean 'HCI_PRIVACY'?
     243 |         hdev->dev_type = HCI_PRIMARY;
         |                          ^~~~~~~~~~~
         |                          HCI_PRIVACY
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:26: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:14:
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
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: At top level:
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:22: warning: no previous prototype for 'prepare_command_request' [-Wmissing-prototypes]
     414 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: In function 'cmd_assoc_request':
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:847:30: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
     847 |         struct cfg80211_bss *bss;
         |                              ^~~
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: In function 'cmd_set_reg_domain':
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1588:9: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Werror=implicit-function-declaration]
    1588 |         strlcpy(cmd->country_code, priv->country_code, MAX_COUNTRY_LEN);
         |         ^~~~~~~
         |         strncpy
   cc1: some warnings being treated as errors
--
>> drivers/net/wireless/espressif/esp32-ng/esp_stats.c:182:6: warning: no previous prototype for 'process_test_capabilities' [-Wmissing-prototypes]
     182 | void process_test_capabilities(u8 cap)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


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
