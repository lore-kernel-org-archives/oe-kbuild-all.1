Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE51FE479
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 00:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716205; cv=none; b=WWO/oR0bJfcgVTZ0V0fsAQOHdsgREUfNWswyj1uYlk10I2P1PXHnD1rbF2uMDFEc9DNNoGorTohRZB27t9AKS9ygGmAM3J0zY642w0xPiFnpL0SmQUEKnvECPv0Oien8glm9q4t3hKgHT6ZFpF4izaG/LKuisjyxcsGWMrUMru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716205; c=relaxed/simple;
	bh=1GDYRBJV4mEco/FNqpdoClU92fFw5UkSFmUw1F29d5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvNenxn3vGPsC9BrICgSgUR4ke+bzbjBSOpGFeedpIbuTh5bl7jku7gAL1btpfd8TrsYzdBSfPYwxCKbguhSaAjoYE19nG3fWtnNfGQ7V6mrezQCzwE8ooegMha5OJtymue2WqGW1gCT/90ofcgJBr8orVxZoEh11Bmgp95w3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSzIjxYH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSzIjxYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738716202; x=1770252202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GDYRBJV4mEco/FNqpdoClU92fFw5UkSFmUw1F29d5A=;
  b=WSzIjxYHnT/lL4RSkkzKnp4ZrxB+FnHEXIUrW5ppIAA8wxDyOeoB5Wle
   kAYdELH0H1Ck3O5FbTlIRtjOA2qthfXd/lmCJ+se1ltsC4FmjYg2uUeku
   E8aA4zbSmRJcI0Wc1XlubOAi8sdxiC5ovYe228dhex1oPGHKZpm0P/MAb
   aL6er3LjnUxY2DZ6A3Nrt3SDrwSLV8MJvpVN599rVKkyQqOOMZfPdLLfF
   1QbZI9qrCPLkBoQXUrEMb5oowr48+2ZY1ommaSNTH9p2mQFvAwhtHEEfS
   tEXXq5UGT3UaEexubFT9lgFnOa7UKqe3D1XeLjYRHJltQWwKPZL8z9/X/
   A==;
X-CSE-ConnectionGUID: y+i1Vn04QkyryiYslpj6Mw==
X-CSE-MsgGUID: LatsYJtQSvGJ16/vrLi59g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43188125"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="43188125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 16:43:21 -0800
X-CSE-ConnectionGUID: Mik36Ez2Tyq1wKTx/ZJZtg==
X-CSE-MsgGUID: 04TBf6tnSOqedhYVKLSiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="141613684"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 16:43:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfTVd-000tF9-2G;
	Wed, 05 Feb 2025 00:43:17 +0000
Date: Wed, 5 Feb 2025 08:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 25/53]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:13: error: 'struct
 hci_dev' has no member named 'dev_type'
Message-ID: <202502050803.WQ19C5Xn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 6c0af79e75e54aeb74a525f9c6e958db674bf816 [25/53] drivers/net/wireless/espressif/esp32-ng: initial import
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250205/202502050803.WQ19C5Xn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050803.WQ19C5Xn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050803.WQ19C5Xn-lkp@intel.com/

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

   242	
 > 243		hdev->dev_type = HCI_PRIMARY;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
