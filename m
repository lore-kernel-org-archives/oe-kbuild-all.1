Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CC98F49
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 00:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707094383; cv=none; b=Z11K8/0SyHygk7HsUTVmSsrUuWiI4AqXdAD7mCNJrcdctqyn3QyVnFijeL6RKU5blQS+EptQIQDfaOHrfrvD78zI/DshnTn/vWe3Eog6PzJaf3ugmD7WPYZbSeiD4pasdhWdFWu/5ZD6cuTzGlhZ1NEeEPEKfr5C2fuAL/UIJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707094383; c=relaxed/simple;
	bh=zWa5M3xoNs6DK9UgQEiMATRr109WI9e83MDXptVj2PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4PRZYgcqtEHrlsCtRDHuBoxIE0xsE2ffyzi2UTpk6tTNykNc6bPKYQf7lxAEQtxktNSI//LBfKGAxuSl/Cxd3PDy9gJ7jHRUtF0uhsAVH9avbGbeEXVgFRfprWCKuYgAWCe4XtWw4wS8gNXJNKEI8tEZaHaV+ulJgeVd+IXPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfyzJIFe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfyzJIFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707094381; x=1738630381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWa5M3xoNs6DK9UgQEiMATRr109WI9e83MDXptVj2PQ=;
  b=bfyzJIFepXNs6A1qOlBcLtSpQFSePt5ZfszDrlSABDSp5EsQksxNae5c
   N1MLRGv2yWSZEZ9wJtcqJX5HnRLlLSnLAR5QUpVtHxeCVNGM80zXQd2RH
   19MR5fPnznzEK8wnnHf/3o3eKoO27Ere/mGsbfbxPsEf/ItZ7byiL2/UV
   AdEF6DIdHYYx13CT96aXq24Opkjl+My1Y43Wg780rjQHksexAXTW1dBPE
   H2gj4OeuV+YdGbAYemsRJNcRTpdNjoRM/1HyobfktoGpkJbTZDXGwOYyp
   WuLDqx1yHWrhCWIVUAvXeXYUwfPwYXHO0ryPfOBGet5ldavwJafBNoL9c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11522731"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11522731"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 16:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="865488"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2024 16:52:55 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnEC-00003W-35;
	Mon, 05 Feb 2024 00:52:52 +0000
Date: Mon, 5 Feb 2024 08:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 27/52]
 drivers/net/wireless/espressif/esp32-ng/main.c:147:29: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202402050708.vz642pEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: 45f979e707835f557c2e8a0403e7338bf0f67472 [27/52] drivers/net/wireless/espressif/esp32-ng: update
config: x86_64-randconfig-123-20240205 (https://download.01.org/0day-ci/archive/20240205/202402050708.vz642pEi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050708.vz642pEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050708.vz642pEi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/espressif/esp32-ng/main.c:147:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] len @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/main.c:147:29: sparse:     expected unsigned short [usertype] len
   drivers/net/wireless/espressif/esp32-ng/main.c:147:29: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/main.c:148:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/main.c:148:32: sparse:     expected unsigned short [usertype] offset
   drivers/net/wireless/espressif/esp32-ng/main.c:148:32: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/main.c:152:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] checksum @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/main.c:152:42: sparse:     expected unsigned short [usertype] checksum
   drivers/net/wireless/espressif/esp32-ng/main.c:152:42: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/main.c:268:28: sparse: sparse: cast to restricted __le32
>> drivers/net/wireless/espressif/esp32-ng/main.c:273:5: sparse: sparse: symbol 'process_event_esp_bootup' was not declared. Should it be static?
>> drivers/net/wireless/espressif/esp32-ng/main.c:565:5: sparse: sparse: symbol 'esp_stop_network_ifaces' was not declared. Should it be static?
>> drivers/net/wireless/espressif/esp32-ng/main.c:683:15: sparse: sparse: cast to restricted __le16
   drivers/net/wireless/espressif/esp32-ng/main.c:684:18: sparse: sparse: cast to restricted __le16
   drivers/net/wireless/espressif/esp32-ng/main.c:691:31: sparse: sparse: cast to restricted __le16
--
>> drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:133:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] ip @@     got restricted __be32 [usertype] ifa_local @@
   drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:133:53: sparse:     expected unsigned int [usertype] ip
   drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:133:53: sparse:     got restricted __be32 [usertype] ifa_local
--
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:375:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] checksum @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:375:42: sparse:     expected unsigned short [usertype] checksum
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:375:42: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:453:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] len @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:453:29: sparse:     expected unsigned short [usertype] len
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:453:29: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:454:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:454:32: sparse:     expected unsigned short [usertype] offset
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:454:32: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:418:21: sparse: sparse: symbol 'prepare_command_request' was not declared. Should it be static?
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:528:18: sparse: sparse: cast to restricted __le16
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:549:23: sparse: sparse: cast to restricted __le32
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:746:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ip @@     got restricted __le32 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:746:24: sparse:     expected unsigned int [usertype] ip
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:746:24: sparse:     got restricted __le32 [usertype]

vim +147 drivers/net/wireless/espressif/esp32-ng/main.c

f41685cce7c34e Max Filippov 2023-06-27   59  
f41685cce7c34e Max Filippov 2023-06-27   60  static int process_tx_packet(struct sk_buff *skb)
f41685cce7c34e Max Filippov 2023-06-27   61  {
f41685cce7c34e Max Filippov 2023-06-27   62  	struct esp_wifi_device *priv = NULL;
f41685cce7c34e Max Filippov 2023-06-27   63  	struct esp_skb_cb *cb = NULL;
f41685cce7c34e Max Filippov 2023-06-27   64  	struct esp_payload_header *payload_header = NULL;
f41685cce7c34e Max Filippov 2023-06-27   65  	struct sk_buff *new_skb = NULL;
f41685cce7c34e Max Filippov 2023-06-27   66  	int ret = 0;
f41685cce7c34e Max Filippov 2023-06-27   67  	u8 pad_len = 0, realloc_skb = 0;
f41685cce7c34e Max Filippov 2023-06-27   68  	u16 len = 0;
f41685cce7c34e Max Filippov 2023-06-27   69  	u16 total_len = 0;
f41685cce7c34e Max Filippov 2023-06-27   70  	static u8 c;
f41685cce7c34e Max Filippov 2023-06-27   71  	u8 *pos = NULL;
f41685cce7c34e Max Filippov 2023-06-27   72  
f41685cce7c34e Max Filippov 2023-06-27   73  	c++;
f41685cce7c34e Max Filippov 2023-06-27   74  	/* Get the priv */
f41685cce7c34e Max Filippov 2023-06-27   75  	cb = (struct esp_skb_cb *) skb->cb;
f41685cce7c34e Max Filippov 2023-06-27   76  	priv = cb->priv;
f41685cce7c34e Max Filippov 2023-06-27   77  
f41685cce7c34e Max Filippov 2023-06-27   78  	if (!priv) {
f41685cce7c34e Max Filippov 2023-06-27   79  		dev_kfree_skb(skb);
f41685cce7c34e Max Filippov 2023-06-27   80  		esp_info("No priv\n");
f41685cce7c34e Max Filippov 2023-06-27   81  		return NETDEV_TX_OK;
f41685cce7c34e Max Filippov 2023-06-27   82  	}
f41685cce7c34e Max Filippov 2023-06-27   83  
f41685cce7c34e Max Filippov 2023-06-27   84  	if (netif_queue_stopped((const struct net_device *) priv->ndev)) {
f41685cce7c34e Max Filippov 2023-06-27   85  		esp_info("Netif queue stopped\n");
f41685cce7c34e Max Filippov 2023-06-27   86  		return NETDEV_TX_BUSY;
f41685cce7c34e Max Filippov 2023-06-27   87  	}
f41685cce7c34e Max Filippov 2023-06-27   88  
f41685cce7c34e Max Filippov 2023-06-27   89  	if (host_sleep) {
f41685cce7c34e Max Filippov 2023-06-27   90  		return NETDEV_TX_BUSY;
f41685cce7c34e Max Filippov 2023-06-27   91  	}
f41685cce7c34e Max Filippov 2023-06-27   92  
f41685cce7c34e Max Filippov 2023-06-27   93  	len = skb->len;
f41685cce7c34e Max Filippov 2023-06-27   94  
f41685cce7c34e Max Filippov 2023-06-27   95  	/* Create space for payload header */
f41685cce7c34e Max Filippov 2023-06-27   96  	pad_len = sizeof(struct esp_payload_header);
f41685cce7c34e Max Filippov 2023-06-27   97  
f41685cce7c34e Max Filippov 2023-06-27   98  	total_len = len + pad_len;
f41685cce7c34e Max Filippov 2023-06-27   99  
f41685cce7c34e Max Filippov 2023-06-27  100  	/* Align buffer length */
f41685cce7c34e Max Filippov 2023-06-27  101  	pad_len += SKB_DATA_ADDR_ALIGNMENT - (total_len % SKB_DATA_ADDR_ALIGNMENT);
f41685cce7c34e Max Filippov 2023-06-27  102  
f41685cce7c34e Max Filippov 2023-06-27  103  	if (skb_headroom(skb) < pad_len) {
f41685cce7c34e Max Filippov 2023-06-27  104  		/* Headroom is not sufficient */
f41685cce7c34e Max Filippov 2023-06-27  105  		realloc_skb = 1;
f41685cce7c34e Max Filippov 2023-06-27  106  	}
f41685cce7c34e Max Filippov 2023-06-27  107  
f41685cce7c34e Max Filippov 2023-06-27  108  	if (realloc_skb || !IS_ALIGNED((unsigned long) skb->data, SKB_DATA_ADDR_ALIGNMENT)) {
f41685cce7c34e Max Filippov 2023-06-27  109  		/* Realloc SKB */
f41685cce7c34e Max Filippov 2023-06-27  110  		if (skb_linearize(skb)) {
f41685cce7c34e Max Filippov 2023-06-27  111  			priv->stats.tx_errors++;
f41685cce7c34e Max Filippov 2023-06-27  112  			dev_kfree_skb(skb);
f41685cce7c34e Max Filippov 2023-06-27  113  			esp_err("Failed to linearize SKB");
f41685cce7c34e Max Filippov 2023-06-27  114  			return NETDEV_TX_OK;
f41685cce7c34e Max Filippov 2023-06-27  115  		}
f41685cce7c34e Max Filippov 2023-06-27  116  
f41685cce7c34e Max Filippov 2023-06-27  117  		new_skb = esp_alloc_skb(skb->len + pad_len);
f41685cce7c34e Max Filippov 2023-06-27  118  
f41685cce7c34e Max Filippov 2023-06-27  119  		if (!new_skb) {
f41685cce7c34e Max Filippov 2023-06-27  120  			esp_err("Failed to allocate SKB");
f41685cce7c34e Max Filippov 2023-06-27  121  			priv->stats.tx_errors++;
f41685cce7c34e Max Filippov 2023-06-27  122  			dev_kfree_skb(skb);
f41685cce7c34e Max Filippov 2023-06-27  123  			return NETDEV_TX_OK;
f41685cce7c34e Max Filippov 2023-06-27  124  		}
f41685cce7c34e Max Filippov 2023-06-27  125  
f41685cce7c34e Max Filippov 2023-06-27  126  		pos = new_skb->data;
f41685cce7c34e Max Filippov 2023-06-27  127  		pos += pad_len;
f41685cce7c34e Max Filippov 2023-06-27  128  
f41685cce7c34e Max Filippov 2023-06-27  129  		/* Populate new SKB */
f41685cce7c34e Max Filippov 2023-06-27  130  		skb_copy_from_linear_data(skb, pos, skb->len);
f41685cce7c34e Max Filippov 2023-06-27  131  		skb_put(new_skb, skb->len + pad_len);
f41685cce7c34e Max Filippov 2023-06-27  132  
f41685cce7c34e Max Filippov 2023-06-27  133  		/* Replace old SKB */
f41685cce7c34e Max Filippov 2023-06-27  134  		dev_kfree_skb_any(skb);
f41685cce7c34e Max Filippov 2023-06-27  135  		skb = new_skb;
f41685cce7c34e Max Filippov 2023-06-27  136  	} else {
f41685cce7c34e Max Filippov 2023-06-27  137  		/* Realloc is not needed, Make space for interface header */
f41685cce7c34e Max Filippov 2023-06-27  138  		skb_push(skb, pad_len);
f41685cce7c34e Max Filippov 2023-06-27  139  	}
f41685cce7c34e Max Filippov 2023-06-27  140  
f41685cce7c34e Max Filippov 2023-06-27  141  	/* Set payload header */
f41685cce7c34e Max Filippov 2023-06-27  142  	payload_header = (struct esp_payload_header *) skb->data;
f41685cce7c34e Max Filippov 2023-06-27  143  	memset(payload_header, 0, pad_len);
f41685cce7c34e Max Filippov 2023-06-27  144  
f41685cce7c34e Max Filippov 2023-06-27  145  	payload_header->if_type = priv->if_type;
f41685cce7c34e Max Filippov 2023-06-27  146  	payload_header->if_num = priv->if_num;
f41685cce7c34e Max Filippov 2023-06-27 @147  	payload_header->len = cpu_to_le16(len);
f41685cce7c34e Max Filippov 2023-06-27 @148  	payload_header->offset = cpu_to_le16(pad_len);
f41685cce7c34e Max Filippov 2023-06-27  149  	payload_header->packet_type = PACKET_TYPE_DATA;
f41685cce7c34e Max Filippov 2023-06-27  150  
f41685cce7c34e Max Filippov 2023-06-27  151  	if (adapter.capabilities & ESP_CHECKSUM_ENABLED)
f41685cce7c34e Max Filippov 2023-06-27 @152  		payload_header->checksum = cpu_to_le16(compute_checksum(skb->data, (len + pad_len)));
f41685cce7c34e Max Filippov 2023-06-27  153  
f41685cce7c34e Max Filippov 2023-06-27  154  	if (!priv->stop_data) {
f41685cce7c34e Max Filippov 2023-06-27  155  		ret = esp_send_packet(priv->adapter, skb);
f41685cce7c34e Max Filippov 2023-06-27  156  
f41685cce7c34e Max Filippov 2023-06-27  157  		if (ret) {
f41685cce7c34e Max Filippov 2023-06-27  158  /*			esp_err("Failed to send SKB");*/
f41685cce7c34e Max Filippov 2023-06-27  159  			priv->stats.tx_errors++;
f41685cce7c34e Max Filippov 2023-06-27  160  		} else {
f41685cce7c34e Max Filippov 2023-06-27  161  			priv->stats.tx_packets++;
f41685cce7c34e Max Filippov 2023-06-27  162  			priv->stats.tx_bytes += skb->len;
f41685cce7c34e Max Filippov 2023-06-27  163  		}
f41685cce7c34e Max Filippov 2023-06-27  164  	} else {
f41685cce7c34e Max Filippov 2023-06-27  165  		dev_kfree_skb_any(skb);
f41685cce7c34e Max Filippov 2023-06-27  166  		priv->stats.tx_dropped++;
f41685cce7c34e Max Filippov 2023-06-27  167  	}
f41685cce7c34e Max Filippov 2023-06-27  168  
f41685cce7c34e Max Filippov 2023-06-27  169  	return 0;
f41685cce7c34e Max Filippov 2023-06-27  170  }
f41685cce7c34e Max Filippov 2023-06-27  171  
f41685cce7c34e Max Filippov 2023-06-27  172  void esp_port_open(struct esp_wifi_device *priv)
f41685cce7c34e Max Filippov 2023-06-27  173  {
f41685cce7c34e Max Filippov 2023-06-27  174  	priv->port_open = 1;
f41685cce7c34e Max Filippov 2023-06-27  175  	priv->stop_data = 0;
f41685cce7c34e Max Filippov 2023-06-27  176  }
f41685cce7c34e Max Filippov 2023-06-27  177  
f41685cce7c34e Max Filippov 2023-06-27  178  void esp_port_close(struct esp_wifi_device *priv)
f41685cce7c34e Max Filippov 2023-06-27  179  {
f41685cce7c34e Max Filippov 2023-06-27  180  	if (!priv)
f41685cce7c34e Max Filippov 2023-06-27  181  		return;
f41685cce7c34e Max Filippov 2023-06-27  182  
f41685cce7c34e Max Filippov 2023-06-27  183  	priv->port_open = 0;
f41685cce7c34e Max Filippov 2023-06-27  184  	priv->stop_data = 1;
f41685cce7c34e Max Filippov 2023-06-27  185  }
f41685cce7c34e Max Filippov 2023-06-27  186  
f41685cce7c34e Max Filippov 2023-06-27  187  void print_capabilities(u32 cap)
f41685cce7c34e Max Filippov 2023-06-27  188  {
f41685cce7c34e Max Filippov 2023-06-27  189  	esp_info("Capabilities: 0x%x. Features supported are:\n", cap);
f41685cce7c34e Max Filippov 2023-06-27  190  	if (cap & ESP_WLAN_SDIO_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  191  		esp_info("\t * WLAN on SDIO\n");
f41685cce7c34e Max Filippov 2023-06-27  192  	else if (cap & ESP_WLAN_SPI_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  193  		esp_info("\t * WLAN on SPI\n");
f41685cce7c34e Max Filippov 2023-06-27  194  
f41685cce7c34e Max Filippov 2023-06-27  195  	if ((cap & ESP_BT_UART_SUPPORT) ||
f41685cce7c34e Max Filippov 2023-06-27  196  		    (cap & ESP_BT_SDIO_SUPPORT) ||
f41685cce7c34e Max Filippov 2023-06-27  197  		    (cap & ESP_BT_SPI_SUPPORT)) {
f41685cce7c34e Max Filippov 2023-06-27  198  		esp_info("\t * BT/BLE\n");
f41685cce7c34e Max Filippov 2023-06-27  199  		if (cap & ESP_BT_UART_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  200  			esp_info("\t   - HCI over UART\n");
f41685cce7c34e Max Filippov 2023-06-27  201  		if (cap & ESP_BT_SDIO_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  202  			esp_info("\t   - HCI over SDIO\n");
f41685cce7c34e Max Filippov 2023-06-27  203  		if (cap & ESP_BT_SPI_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  204  			esp_info("\t   - HCI over SPI\n");
f41685cce7c34e Max Filippov 2023-06-27  205  
f41685cce7c34e Max Filippov 2023-06-27  206  		if ((cap & ESP_BLE_ONLY_SUPPORT) && (cap & ESP_BR_EDR_ONLY_SUPPORT))
f41685cce7c34e Max Filippov 2023-06-27  207  			esp_info("\t   - BT/BLE dual mode\n");
f41685cce7c34e Max Filippov 2023-06-27  208  		else if (cap & ESP_BLE_ONLY_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  209  			esp_info("\t   - BLE only\n");
f41685cce7c34e Max Filippov 2023-06-27  210  		else if (cap & ESP_BR_EDR_ONLY_SUPPORT)
f41685cce7c34e Max Filippov 2023-06-27  211  			esp_info("\t   - BR EDR only\n");
f41685cce7c34e Max Filippov 2023-06-27  212  	}
f41685cce7c34e Max Filippov 2023-06-27  213  }
f41685cce7c34e Max Filippov 2023-06-27  214  
45f979e707835f Max Filippov 2023-10-10 @215  void init_bt(struct esp_adapter *adapter)
f41685cce7c34e Max Filippov 2023-06-27  216  {
f41685cce7c34e Max Filippov 2023-06-27  217  
f41685cce7c34e Max Filippov 2023-06-27  218  	if ((adapter->capabilities & ESP_BT_SPI_SUPPORT) ||
f41685cce7c34e Max Filippov 2023-06-27  219  		(adapter->capabilities & ESP_BT_SDIO_SUPPORT)) {
f41685cce7c34e Max Filippov 2023-06-27  220  		msleep(200);
f41685cce7c34e Max Filippov 2023-06-27  221  		esp_info("ESP Bluetooth init\n");
f41685cce7c34e Max Filippov 2023-06-27  222  		esp_init_bt(adapter);
f41685cce7c34e Max Filippov 2023-06-27  223  	}
f41685cce7c34e Max Filippov 2023-06-27  224  }
f41685cce7c34e Max Filippov 2023-06-27  225  
f41685cce7c34e Max Filippov 2023-06-27  226  static int check_esp_version(struct fw_version *ver)
f41685cce7c34e Max Filippov 2023-06-27  227  {
45f979e707835f Max Filippov 2023-10-10  228  	esp_info("ESP Firmware version: %u.%u.%u\n",
f41685cce7c34e Max Filippov 2023-06-27  229  			ver->major1, ver->major2, ver->minor);
f41685cce7c34e Max Filippov 2023-06-27  230  	if (!ver->major1) {
f41685cce7c34e Max Filippov 2023-06-27  231  		esp_err("Incompatible ESP firmware release detected, Please use correct ESP-Hosted branch/compatible release\n");
f41685cce7c34e Max Filippov 2023-06-27  232  		return -1;
f41685cce7c34e Max Filippov 2023-06-27  233  	}
f41685cce7c34e Max Filippov 2023-06-27  234  	return 0;
f41685cce7c34e Max Filippov 2023-06-27  235  }
f41685cce7c34e Max Filippov 2023-06-27  236  
f41685cce7c34e Max Filippov 2023-06-27  237  static void print_reset_reason(uint32_t reason)
f41685cce7c34e Max Filippov 2023-06-27  238  {
f41685cce7c34e Max Filippov 2023-06-27  239  	switch (reason)
f41685cce7c34e Max Filippov 2023-06-27  240  	{
f41685cce7c34e Max Filippov 2023-06-27  241  		case 1: esp_info("POWERON_RESET\n"); break;          /**<1, Vbat power on reset*/
f41685cce7c34e Max Filippov 2023-06-27  242  		case 3: esp_info("SW_RESET\n"); break;               /**<3, Software reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  243  		case 4: esp_info("OWDT_RESET\n"); break;             /**<4, Legacy watch dog reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  244  		case 5: esp_info("DEEPSLEEP_RESET\n"); break;        /**<5, Deep Sleep reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  245  		case 6: esp_info("SDIO_RESET\n"); break;             /**<6, Reset by SLC module, reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  246  		case 7: esp_info("TG0WDT_SYS_RESET\n"); break;       /**<7, Timer Group0 Watch dog reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  247  		case 8: esp_info("TG1WDT_SYS_RESET\n"); break;       /**<8, Timer Group1 Watch dog reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  248  		case 9: esp_info("RTCWDT_SYS_RESET\n"); break;       /**<9, RTC Watch dog Reset digital core*/
f41685cce7c34e Max Filippov 2023-06-27  249  		case 10: esp_info("INTRUSION_RESET\n"); break;       /**<10, Instrusion tested to reset CPU*/
f41685cce7c34e Max Filippov 2023-06-27  250  		case 11: esp_info("TGWDT_CPU_RESET\n"); break;       /**<11, Time Group reset CPU*/
f41685cce7c34e Max Filippov 2023-06-27  251  		case 12: esp_info("SW_CPU_RESET\n"); break;          /**<12, Software reset CPU*/
f41685cce7c34e Max Filippov 2023-06-27  252  		case 13: esp_info("RTCWDT_CPU_RESET\n"); break;      /**<13, RTC Watch dog Reset CPU*/
f41685cce7c34e Max Filippov 2023-06-27  253  		case 14: esp_info("EXT_CPU_RESET\n"); break;         /**<14, for APP CPU, reseted by PRO CPU*/
f41685cce7c34e Max Filippov 2023-06-27  254  		case 15: esp_info("RTCWDT_BROWN_OUT_RESET\n"); break;/**<15, Reset when the vdd voltage is not stable*/
f41685cce7c34e Max Filippov 2023-06-27  255  		case 16: esp_info("RTCWDT_RTC_RESET\n"); break;      /**<16, RTC Watch dog reset digital core and rtc module*/
f41685cce7c34e Max Filippov 2023-06-27  256  		default: esp_info("Unknown[%u]\n", reason); break;
f41685cce7c34e Max Filippov 2023-06-27  257  	}
f41685cce7c34e Max Filippov 2023-06-27  258  }
f41685cce7c34e Max Filippov 2023-06-27  259  
45f979e707835f Max Filippov 2023-10-10  260  static int process_fw_data(struct fw_data *fw_p, int tag_len)
f41685cce7c34e Max Filippov 2023-06-27  261  {
45f979e707835f Max Filippov 2023-10-10  262  	if (tag_len != sizeof(struct fw_data)) {
45f979e707835f Max Filippov 2023-10-10  263  		esp_err("Length not matching to firmware data size\n");
f41685cce7c34e Max Filippov 2023-06-27  264  		return -1;
f41685cce7c34e Max Filippov 2023-06-27  265  	}
f41685cce7c34e Max Filippov 2023-06-27  266  
f41685cce7c34e Max Filippov 2023-06-27  267  	esp_info("ESP chipset's last reset cause:\n");
f41685cce7c34e Max Filippov 2023-06-27 @268  	print_reset_reason(le32_to_cpu(fw_p->last_reset_reason));
45f979e707835f Max Filippov 2023-10-10  269  
f41685cce7c34e Max Filippov 2023-06-27  270  	return check_esp_version(&fw_p->version);
f41685cce7c34e Max Filippov 2023-06-27  271  }
f41685cce7c34e Max Filippov 2023-06-27  272  
45f979e707835f Max Filippov 2023-10-10 @273  int process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
45f979e707835f Max Filippov 2023-10-10  274  {
45f979e707835f Max Filippov 2023-10-10  275  	int len_left = len, tag_len, ret = 0;
45f979e707835f Max Filippov 2023-10-10  276  	u8 *pos;
45f979e707835f Max Filippov 2023-10-10  277  
45f979e707835f Max Filippov 2023-10-10  278  	if (!adapter || !evt_buf)
45f979e707835f Max Filippov 2023-10-10  279  		return -1;
45f979e707835f Max Filippov 2023-10-10  280  
45f979e707835f Max Filippov 2023-10-10  281  	if (len_left >= 64) {
45f979e707835f Max Filippov 2023-10-10  282  		esp_info("ESP init event len looks unexpected: %u (>=64)\n", len_left);
45f979e707835f Max Filippov 2023-10-10  283  		esp_info("You probably facing timing mismatch at transport layer\n");
45f979e707835f Max Filippov 2023-10-10  284  	}
45f979e707835f Max Filippov 2023-10-10  285  
45f979e707835f Max Filippov 2023-10-10  286  	clear_bit(ESP_INIT_DONE, &adapter->state_flags);
45f979e707835f Max Filippov 2023-10-10  287  	/* Deinit module if already initialized */
45f979e707835f Max Filippov 2023-10-10  288  	esp_deinit_module(adapter);
45f979e707835f Max Filippov 2023-10-10  289  
45f979e707835f Max Filippov 2023-10-10  290  	pos = evt_buf;
45f979e707835f Max Filippov 2023-10-10  291  
45f979e707835f Max Filippov 2023-10-10  292  	while (len_left > 0) {
45f979e707835f Max Filippov 2023-10-10  293  		tag_len = *(pos + 1);
45f979e707835f Max Filippov 2023-10-10  294  
45f979e707835f Max Filippov 2023-10-10  295  		esp_info("Bootup Event tag: %d\n", *pos);
45f979e707835f Max Filippov 2023-10-10  296  
45f979e707835f Max Filippov 2023-10-10  297  		switch (*pos) {
45f979e707835f Max Filippov 2023-10-10  298  		case ESP_BOOTUP_CAPABILITY:
45f979e707835f Max Filippov 2023-10-10  299  			adapter->capabilities = *(pos + 2);
45f979e707835f Max Filippov 2023-10-10  300  			break;
45f979e707835f Max Filippov 2023-10-10  301  		case ESP_BOOTUP_FIRMWARE_CHIP_ID:
45f979e707835f Max Filippov 2023-10-10  302  			ret = esp_validate_chipset(adapter, *(pos + 2));
45f979e707835f Max Filippov 2023-10-10  303  			break;
45f979e707835f Max Filippov 2023-10-10  304  		case ESP_BOOTUP_FW_DATA:
45f979e707835f Max Filippov 2023-10-10  305  			ret = process_fw_data((struct fw_data *)(pos + 2), tag_len);
45f979e707835f Max Filippov 2023-10-10  306  			break;
45f979e707835f Max Filippov 2023-10-10  307  		case ESP_BOOTUP_SPI_CLK_MHZ:
45f979e707835f Max Filippov 2023-10-10  308  			ret = esp_adjust_spi_clock(adapter, *(pos + 2));
45f979e707835f Max Filippov 2023-10-10  309  			break;
45f979e707835f Max Filippov 2023-10-10  310  		default:
45f979e707835f Max Filippov 2023-10-10  311  			esp_warn("Unsupported tag=%x in bootup event\n", *pos);
45f979e707835f Max Filippov 2023-10-10  312  		}
45f979e707835f Max Filippov 2023-10-10  313  
45f979e707835f Max Filippov 2023-10-10  314  		if (ret < 0) {
45f979e707835f Max Filippov 2023-10-10  315  			esp_err("failed to process tag=%x in bootup event\n", *pos);
45f979e707835f Max Filippov 2023-10-10  316  			return -1;
45f979e707835f Max Filippov 2023-10-10  317  		}
45f979e707835f Max Filippov 2023-10-10  318  		pos += (tag_len + 2);
45f979e707835f Max Filippov 2023-10-10  319  		len_left -= (tag_len + 2);
45f979e707835f Max Filippov 2023-10-10  320  	}
45f979e707835f Max Filippov 2023-10-10  321  
45f979e707835f Max Filippov 2023-10-10  322  	if (esp_add_card(adapter)) {
45f979e707835f Max Filippov 2023-10-10  323  		esp_err("network iterface init failed\n");
45f979e707835f Max Filippov 2023-10-10  324  		return -1;
45f979e707835f Max Filippov 2023-10-10  325  	}
45f979e707835f Max Filippov 2023-10-10  326  	init_bt(adapter);
45f979e707835f Max Filippov 2023-10-10  327  
45f979e707835f Max Filippov 2023-10-10  328  	if (raw_tp_mode !=0) {
45f979e707835f Max Filippov 2023-10-10  329  #if TEST_RAW_TP
45f979e707835f Max Filippov 2023-10-10  330  		process_test_capabilities(raw_tp_mode);
45f979e707835f Max Filippov 2023-10-10  331  		esp_init_raw_tp(adapter);
45f979e707835f Max Filippov 2023-10-10  332  #else
45f979e707835f Max Filippov 2023-10-10  333  		esp_err("RAW TP mode selected but not enabled\n");
45f979e707835f Max Filippov 2023-10-10  334  		return -1;
45f979e707835f Max Filippov 2023-10-10  335  #endif
45f979e707835f Max Filippov 2023-10-10  336  	}
45f979e707835f Max Filippov 2023-10-10  337  	set_bit(ESP_INIT_DONE, &adapter->state_flags);
45f979e707835f Max Filippov 2023-10-10  338  	print_capabilities(adapter->capabilities);
45f979e707835f Max Filippov 2023-10-10  339  
45f979e707835f Max Filippov 2023-10-10  340  	return 0;
45f979e707835f Max Filippov 2023-10-10  341  }
45f979e707835f Max Filippov 2023-10-10  342  

:::::: The code at line 147 was first introduced by commit
:::::: f41685cce7c34eaab7d26ae4399cd7059a2e7e42 drivers/net/wireless/espressif/esp32-ng: initial import

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
