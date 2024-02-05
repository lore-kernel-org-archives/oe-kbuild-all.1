Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F61173A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707121821; cv=none; b=QRnGuAAjYcRsI3dbiP8E9GIhsGB0sWI7VTdW7QxjR+05UruYU9ZutVA196uYnpEFnMb7VHl/zR5g7vhUk6co3oU2iifB30hkB8hht1ydzwEsAhruL/XdQE1GfykXp2pg5vdvbpWTInQlnRODp4ubFHAfiyscKC9QLjjdieWZf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707121821; c=relaxed/simple;
	bh=8ERouzPESfY4i6PqZdnNfLUCciOei7+D3Ql0RtqcsfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AgkHRX8hL2i4c7GoAJ/4eel7WZ38OJtFZVDIniNhxTCeCT5AkbGo1u/k7X39+hsO1SzukBeM6rHNF6JoDanLyLDPkCyU436jrIpvnLU8qkmSpSH+WXUj2e75Kzt73bM9NaS+Gu/ua7FQHyU4xxTMxAil6g6dWngER1tsqCjcs0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGGe04zz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGGe04zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707121819; x=1738657819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ERouzPESfY4i6PqZdnNfLUCciOei7+D3Ql0RtqcsfQ=;
  b=LGGe04zzC4BnU2+yDkAWIMvBnr5mNisXZzznO+3admZ/rO4kB5CtQ+uk
   M/slk6mbwN2Y//539hzeYOfcb0PBommJ9qKNwfY2DmL7DEe8/3uq2dlRl
   EOdkmqyXrwIhlGeWMwQEdxMPcpV/H9PDYFNGi02Tq2RvjEla/SHBMAxHo
   sGptzxciAInvIBy7zghi6djPUBZ/7JubJabnpj265ZPsLcl1VV5uBQWZN
   I2Fi07OvfJI3IYzU2d7SxOTJu/TJXDhRgmReUzeeEteUQtBGunAdYmwzH
   5sQ0Ckb7xryDJaFdH8aduy3V2bmb7RMCj4AAHehcP0Leyc4xH64Gs+Tp3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="17891006"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="17891006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 00:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="948778"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2024 00:30:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWuMp-0000HE-1x;
	Mon, 05 Feb 2024 08:30:15 +0000
Date: Mon, 5 Feb 2024 16:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 27/52]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:131:18: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202402051634.nqKLWkZq-lkp@intel.com>
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
config: arc-randconfig-r111-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051634.nqKLWkZq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402051634.nqKLWkZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051634.nqKLWkZq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:131:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] len @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:131:18: sparse:     expected unsigned short [usertype] len
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:131:18: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:132:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:132:21: sparse:     expected unsigned short [usertype] offset
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:132:21: sparse:     got restricted __le16 [usertype]
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:139:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] checksum @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:139:31: sparse:     expected unsigned short [usertype] checksum
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:139:31: sparse:     got restricted __le16 [usertype]

vim +131 drivers/net/wireless/espressif/esp32-ng/esp_bt.c

f41685cce7c34e Max Filippov 2023-06-27   59  
f41685cce7c34e Max Filippov 2023-06-27   60  static ESP_BT_SEND_FRAME_PROTOTYPE()
f41685cce7c34e Max Filippov 2023-06-27   61  {
f41685cce7c34e Max Filippov 2023-06-27   62  	struct esp_payload_header *hdr;
f41685cce7c34e Max Filippov 2023-06-27   63  	size_t total_len, len = skb->len;
f41685cce7c34e Max Filippov 2023-06-27   64  	int ret = 0;
f41685cce7c34e Max Filippov 2023-06-27   65  #if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
f41685cce7c34e Max Filippov 2023-06-27   66  	struct hci_dev *hdev = (struct hci_dev *)(skb->dev);
f41685cce7c34e Max Filippov 2023-06-27   67  #endif
f41685cce7c34e Max Filippov 2023-06-27   68  	struct esp_adapter *adapter = hci_get_drvdata(hdev);
f41685cce7c34e Max Filippov 2023-06-27   69  	struct sk_buff *new_skb;
f41685cce7c34e Max Filippov 2023-06-27   70  	u8 pad_len = 0, realloc_skb = 0;
f41685cce7c34e Max Filippov 2023-06-27   71  	u8 *pos = NULL;
f41685cce7c34e Max Filippov 2023-06-27   72  	u8 pkt_type;
f41685cce7c34e Max Filippov 2023-06-27   73  
f41685cce7c34e Max Filippov 2023-06-27   74  	if (!adapter) {
f41685cce7c34e Max Filippov 2023-06-27   75  		esp_err("Invalid args");
f41685cce7c34e Max Filippov 2023-06-27   76  		return -EINVAL;
f41685cce7c34e Max Filippov 2023-06-27   77  	}
f41685cce7c34e Max Filippov 2023-06-27   78  	//print_hex_dump(KERN_INFO, "bt_tx: ", DUMP_PREFIX_ADDRESS, 16, 1, skb->data, len, 1  );
f41685cce7c34e Max Filippov 2023-06-27   79  
f41685cce7c34e Max Filippov 2023-06-27   80  	/* Create space for payload header */
f41685cce7c34e Max Filippov 2023-06-27   81  	pad_len = sizeof(struct esp_payload_header);
f41685cce7c34e Max Filippov 2023-06-27   82  	total_len = len + sizeof(struct esp_payload_header);
f41685cce7c34e Max Filippov 2023-06-27   83  
f41685cce7c34e Max Filippov 2023-06-27   84  	/* Align buffer len */
f41685cce7c34e Max Filippov 2023-06-27   85  	pad_len += SKB_DATA_ADDR_ALIGNMENT - (total_len % SKB_DATA_ADDR_ALIGNMENT);
f41685cce7c34e Max Filippov 2023-06-27   86  
f41685cce7c34e Max Filippov 2023-06-27   87  	pkt_type = hci_skb_pkt_type(skb);
f41685cce7c34e Max Filippov 2023-06-27   88  
f41685cce7c34e Max Filippov 2023-06-27   89  	if (skb_headroom(skb) < pad_len) {
f41685cce7c34e Max Filippov 2023-06-27   90  		/* Headroom is not sufficient */
f41685cce7c34e Max Filippov 2023-06-27   91  		realloc_skb = 1;
f41685cce7c34e Max Filippov 2023-06-27   92  	}
f41685cce7c34e Max Filippov 2023-06-27   93  
f41685cce7c34e Max Filippov 2023-06-27   94  	if (realloc_skb || !IS_ALIGNED((unsigned long) skb->data, SKB_DATA_ADDR_ALIGNMENT)) {
f41685cce7c34e Max Filippov 2023-06-27   95  		/* Realloc SKB */
f41685cce7c34e Max Filippov 2023-06-27   96  		if (skb_linearize(skb)) {
f41685cce7c34e Max Filippov 2023-06-27   97  			hdev->stat.err_tx++;
f41685cce7c34e Max Filippov 2023-06-27   98  			return -EINVAL;
f41685cce7c34e Max Filippov 2023-06-27   99  		}
f41685cce7c34e Max Filippov 2023-06-27  100  
f41685cce7c34e Max Filippov 2023-06-27  101  		new_skb = esp_alloc_skb(skb->len + pad_len);
f41685cce7c34e Max Filippov 2023-06-27  102  
f41685cce7c34e Max Filippov 2023-06-27  103  		if (!new_skb) {
f41685cce7c34e Max Filippov 2023-06-27  104  			esp_err("Failed to allocate SKB");
f41685cce7c34e Max Filippov 2023-06-27  105  			hdev->stat.err_tx++;
f41685cce7c34e Max Filippov 2023-06-27  106  			return -ENOMEM;
f41685cce7c34e Max Filippov 2023-06-27  107  		}
f41685cce7c34e Max Filippov 2023-06-27  108  
f41685cce7c34e Max Filippov 2023-06-27  109  		pos = new_skb->data;
f41685cce7c34e Max Filippov 2023-06-27  110  
f41685cce7c34e Max Filippov 2023-06-27  111  		pos += pad_len;
f41685cce7c34e Max Filippov 2023-06-27  112  
f41685cce7c34e Max Filippov 2023-06-27  113  		/* Populate new SKB */
f41685cce7c34e Max Filippov 2023-06-27  114  		skb_copy_from_linear_data(skb, pos, skb->len);
f41685cce7c34e Max Filippov 2023-06-27  115  		skb_put(new_skb, skb->len);
f41685cce7c34e Max Filippov 2023-06-27  116  
f41685cce7c34e Max Filippov 2023-06-27  117  		/* Replace old SKB */
f41685cce7c34e Max Filippov 2023-06-27  118  		dev_kfree_skb_any(skb);
f41685cce7c34e Max Filippov 2023-06-27  119  		skb = new_skb;
f41685cce7c34e Max Filippov 2023-06-27  120  	} else {
f41685cce7c34e Max Filippov 2023-06-27  121  		/* Realloc is not needed, Make space for interface header */
f41685cce7c34e Max Filippov 2023-06-27  122  		skb_push(skb, pad_len);
f41685cce7c34e Max Filippov 2023-06-27  123  	}
f41685cce7c34e Max Filippov 2023-06-27  124  
f41685cce7c34e Max Filippov 2023-06-27  125  	hdr = (struct esp_payload_header *) skb->data;
f41685cce7c34e Max Filippov 2023-06-27  126  
f41685cce7c34e Max Filippov 2023-06-27  127  	memset(hdr, 0, sizeof(struct esp_payload_header));
f41685cce7c34e Max Filippov 2023-06-27  128  
f41685cce7c34e Max Filippov 2023-06-27  129  	hdr->if_type = ESP_HCI_IF;
f41685cce7c34e Max Filippov 2023-06-27  130  	hdr->if_num = 0;
f41685cce7c34e Max Filippov 2023-06-27 @131  	hdr->len = cpu_to_le16(len);
f41685cce7c34e Max Filippov 2023-06-27 @132  	hdr->offset = cpu_to_le16(pad_len);
f41685cce7c34e Max Filippov 2023-06-27  133  	pos = skb->data;
f41685cce7c34e Max Filippov 2023-06-27  134  
f41685cce7c34e Max Filippov 2023-06-27  135  	/* set HCI packet type */
f41685cce7c34e Max Filippov 2023-06-27  136  	*(pos + pad_len - 1) = pkt_type;
f41685cce7c34e Max Filippov 2023-06-27  137  
f41685cce7c34e Max Filippov 2023-06-27  138  	if (adapter->capabilities & ESP_CHECKSUM_ENABLED)
f41685cce7c34e Max Filippov 2023-06-27 @139  		hdr->checksum = cpu_to_le16(compute_checksum(skb->data, (len + pad_len)));
f41685cce7c34e Max Filippov 2023-06-27  140  
f41685cce7c34e Max Filippov 2023-06-27  141  	ret = esp_send_packet(adapter, skb);
f41685cce7c34e Max Filippov 2023-06-27  142  
f41685cce7c34e Max Filippov 2023-06-27  143  	if (ret) {
f41685cce7c34e Max Filippov 2023-06-27  144  		hdev->stat.err_tx++;
f41685cce7c34e Max Filippov 2023-06-27  145  		return ret;
f41685cce7c34e Max Filippov 2023-06-27  146  	} else {
f41685cce7c34e Max Filippov 2023-06-27  147  		esp_hci_update_tx_counter(hdev, hdr->hci_pkt_type, skb->len);
f41685cce7c34e Max Filippov 2023-06-27  148  	}
f41685cce7c34e Max Filippov 2023-06-27  149  
f41685cce7c34e Max Filippov 2023-06-27  150  	return 0;
f41685cce7c34e Max Filippov 2023-06-27  151  }
f41685cce7c34e Max Filippov 2023-06-27  152  

:::::: The code at line 131 was first introduced by commit
:::::: f41685cce7c34eaab7d26ae4399cd7059a2e7e42 drivers/net/wireless/espressif/esp32-ng: initial import

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
