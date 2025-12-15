Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C4328244
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 23:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765840393; cv=none; b=SOGEOFrXhOOVeOrinh9jqnvHWDM6dZdKrtxgopZgJhgy2LKC2WEApPnVk4T95RkK4TbSjx4Ccy8QxUCt15A/3zQU3d94XWJJ+5iUtq/e+ijHk+pktAYD5KtktKBQE0uXhDxXiHzsH4pA10bbdAICsBSfO5++iu/5VEnEiUsNCQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765840393; c=relaxed/simple;
	bh=XRQemu+88h6s7b61qfSVM+tCAn7C/RwkuwflHV9yAlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVlVogt+WWTXfDXCDWmk/JelHEPUfdSKnuVVxZrmcP3zeW58OFoNB+A6ILntcXqHZgqtF0ZjF7JBj9eEcA5o95cktnWZivNmt47RBWQSeSvFw9wRoj0nwuZ+spRKjaLPIk2x+g4tqj/2GpSgLdsdEAXtAa4z2IaPTRgPp1QKjuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsO3sMBl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsO3sMBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765840392; x=1797376392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRQemu+88h6s7b61qfSVM+tCAn7C/RwkuwflHV9yAlM=;
  b=hsO3sMBlI+R/0X8yeHU26D/GS7hDR9ikTHbYLcnHxkPnYvggjc9ws0VS
   PmUE/J8zAx8X7GbKqaiATFGBWYbx0r4We3KZ88ftds9XBom2dX0j66rSL
   ehyWhMiM1MuNH9oSjwdrdwM/IlLVuPsrOFyG6VCzhgibaO3KL1QZ8CrM9
   Q9IUcHj5qoSvu3E0ek5R3uLWZw+4anuPemfUIcxusqtr15hoEai3AgJBf
   5lDSGGch/gJTYhWkKgf5OhhWoPMiGIwj3/+R6EvizWW/wJlGcIUX/u4rP
   puLlDRCQFBDVcBaPaxND8hYixerOiNxBVDxaU8d0kumcWYD05vmMpOsLt
   Q==;
X-CSE-ConnectionGUID: rfRS20GuTGe3fzXsxeCbzA==
X-CSE-MsgGUID: UjgmjADEQ6aHTvw88MQmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="90408980"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="90408980"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 15:13:12 -0800
X-CSE-ConnectionGUID: b+/b49xlQWCZHy2RbFDFTg==
X-CSE-MsgGUID: QuaZi8nJQSm2MjeTgf0LXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197475753"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2025 15:13:10 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVHkV-000000000uP-1cFw;
	Mon, 15 Dec 2025 23:13:04 +0000
Date: Tue, 16 Dec 2025 07:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/hid/hid-nintendo.c:91:17: warning: 'JC_USB_PRE_HANDSHAKE' defined
 but not used
Message-ID: <202512160748.VsU3vAiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: 0e93c0746ae205990bb9cfdc432484cad4a7d02c [0/1] FROMLIST: HID: nintendo: add nintendo switch controller driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512160748.VsU3vAiK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160748.VsU3vAiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160748.VsU3vAiK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-nintendo.c:92:17: warning: 'JC_USB_SEND_UART' defined but not used [-Wunused-const-variable=]
      92 | static const u8 JC_USB_SEND_UART                = 0x92;
         |                 ^~~~~~~~~~~~~~~~
>> drivers/hid/hid-nintendo.c:91:17: warning: 'JC_USB_PRE_HANDSHAKE' defined but not used [-Wunused-const-variable=]
      91 | static const u8 JC_USB_PRE_HANDSHAKE            = 0x91;
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:90:17: warning: 'JC_USB_RESET' defined but not used [-Wunused-const-variable=]
      90 | static const u8 JC_USB_RESET                    = 0x06;
         |                 ^~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:89:17: warning: 'JC_USB_CMD_EN_TIMEOUT' defined but not used [-Wunused-const-variable=]
      89 | static const u8 JC_USB_CMD_EN_TIMEOUT           = 0x05;
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:85:17: warning: 'JC_USB_CMD_CONN_STATUS' defined but not used [-Wunused-const-variable=]
      85 | static const u8 JC_USB_CMD_CONN_STATUS          = 0x01;
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:82:17: warning: 'JC_FEATURE_LAUNCH' defined but not used [-Wunused-const-variable=]
      82 | static const u8 JC_FEATURE_LAUNCH               = 0x75;
         |                 ^~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:81:17: warning: 'JC_FEATURE_MEM_WRITE' defined but not used [-Wunused-const-variable=]
      81 | static const u8 JC_FEATURE_MEM_WRITE            = 0x74;
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:80:17: warning: 'JC_FEATURE_ERASE_MEM_SECTOR' defined but not used [-Wunused-const-variable=]
      80 | static const u8 JC_FEATURE_ERASE_MEM_SECTOR     = 0x73;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:79:17: warning: 'JC_FEATURE_MEM_READ' defined but not used [-Wunused-const-variable=]
      79 | static const u8 JC_FEATURE_MEM_READ             = 0x72;
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:78:17: warning: 'JC_FEATURE_SETUP_MEM_READ' defined but not used [-Wunused-const-variable=]
      78 | static const u8 JC_FEATURE_SETUP_MEM_READ       = 0x71;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:77:17: warning: 'JC_FEATURE_OTA_FW_UPGRADE' defined but not used [-Wunused-const-variable=]
      77 | static const u8 JC_FEATURE_OTA_FW_UPGRADE       = 0x70;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:76:17: warning: 'JC_FEATURE_LAST_SUBCMD' defined but not used [-Wunused-const-variable=]
      76 | static const u8 JC_FEATURE_LAST_SUBCMD          = 0x02;
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:69:17: warning: 'JC_INPUT_BUTTON_EVENT' defined but not used [-Wunused-const-variable=]
      69 | static const u8 JC_INPUT_BUTTON_EVENT           = 0x3F;
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:66:17: warning: 'JC_SUBCMD_GET_REGULATED_VOLTAGE' defined but not used [-Wunused-const-variable=]
      66 | static const u8 JC_SUBCMD_GET_REGULATED_VOLTAGE = 0x50;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:65:17: warning: 'JC_SUBCMD_ENABLE_VIBRATION' defined but not used [-Wunused-const-variable=]
      65 | static const u8 JC_SUBCMD_ENABLE_VIBRATION      = 0x48;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:64:17: warning: 'JC_SUBCMD_READ_IMU_REG' defined but not used [-Wunused-const-variable=]
      64 | static const u8 JC_SUBCMD_READ_IMU_REG          = 0x43;
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:63:17: warning: 'JC_SUBCMD_WRITE_IMU_REG' defined but not used [-Wunused-const-variable=]
      63 | static const u8 JC_SUBCMD_WRITE_IMU_REG         = 0x42;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:62:17: warning: 'JC_SUBCMD_SET_IMU_SENSITIVITY' defined but not used [-Wunused-const-variable=]
      62 | static const u8 JC_SUBCMD_SET_IMU_SENSITIVITY   = 0x41;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:61:17: warning: 'JC_SUBCMD_ENABLE_IMU' defined but not used [-Wunused-const-variable=]
      61 | static const u8 JC_SUBCMD_ENABLE_IMU            = 0x40;
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:60:17: warning: 'JC_SUBCMD_SET_HOME_LIGHT' defined but not used [-Wunused-const-variable=]
      60 | static const u8 JC_SUBCMD_SET_HOME_LIGHT        = 0x38;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:59:17: warning: 'JC_SUBCMD_GET_PLAYER_LIGHTS' defined but not used [-Wunused-const-variable=]
      59 | static const u8 JC_SUBCMD_GET_PLAYER_LIGHTS     = 0x31;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:57:17: warning: 'JC_SUBCMD_SET_MCU_STATE' defined but not used [-Wunused-const-variable=]
      57 | static const u8 JC_SUBCMD_SET_MCU_STATE         = 0x22;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:56:17: warning: 'JC_SUBCMD_SET_MCU_CONFIG' defined but not used [-Wunused-const-variable=]
      56 | static const u8 JC_SUBCMD_SET_MCU_CONFIG        = 0x21;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:55:17: warning: 'JC_SUBCMD_RESET_MCU' defined but not used [-Wunused-const-variable=]
      55 | static const u8 JC_SUBCMD_RESET_MCU             = 0x20;
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:54:17: warning: 'JC_SUBCMD_SPI_FLASH_WRITE' defined but not used [-Wunused-const-variable=]
      54 | static const u8 JC_SUBCMD_SPI_FLASH_WRITE       = 0x11;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-nintendo.c:52:17: warning: 'JC_SUBCMD_LOW_POWER_MODE' defined but not used [-Wunused-const-variable=]
      52 | static const u8 JC_SUBCMD_LOW_POWER_MODE        = 0x08;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:51:17: warning: 'JC_SUBCMD_RESET_PAIRING_INFO' defined but not used [-Wunused-const-variable=]
      51 | static const u8 JC_SUBCMD_RESET_PAIRING_INFO    = 0x07;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:50:17: warning: 'JC_SUBCMD_SET_HCI_STATE' defined but not used [-Wunused-const-variable=]
      50 | static const u8 JC_SUBCMD_SET_HCI_STATE         = 0x06;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:49:17: warning: 'JC_SUBCMD_GET_PAGE_LIST_STATE' defined but not used [-Wunused-const-variable=]
      49 | static const u8 JC_SUBCMD_GET_PAGE_LIST_STATE   = 0x05;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:48:17: warning: 'JC_SUBCMD_TRIGGERS_ELAPSED' defined but not used [-Wunused-const-variable=]
      48 | static const u8 JC_SUBCMD_TRIGGERS_ELAPSED      = 0x04;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:46:17: warning: 'JC_SUBCMD_REQ_DEV_INFO' defined but not used [-Wunused-const-variable=]
      46 | static const u8 JC_SUBCMD_REQ_DEV_INFO          = 0x02;
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:45:17: warning: 'JC_SUBCMD_MANUAL_BT_PAIRING' defined but not used [-Wunused-const-variable=]
      45 | static const u8 JC_SUBCMD_MANUAL_BT_PAIRING     = 0x01;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:44:17: warning: 'JC_SUBCMD_STATE' defined but not used [-Wunused-const-variable=]
      44 | static const u8 JC_SUBCMD_STATE                 /*= 0x00*/;
         |                 ^~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:40:17: warning: 'JC_OUTPUT_MCU_DATA' defined but not used [-Wunused-const-variable=]
      40 | static const u8 JC_OUTPUT_MCU_DATA              = 0x11;
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:39:17: warning: 'JC_OUTPUT_RUMBLE_ONLY' defined but not used [-Wunused-const-variable=]
      39 | static const u8 JC_OUTPUT_RUMBLE_ONLY           = 0x10;
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-nintendo.c:38:17: warning: 'JC_OUTPUT_FW_UPDATE_PKT' defined but not used [-Wunused-const-variable=]
      38 | static const u8 JC_OUTPUT_FW_UPDATE_PKT         = 0x03;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +/JC_USB_PRE_HANDSHAKE +91 drivers/hid/hid-nintendo.c

    30	
    31	/*
    32	 * Reference the url below for the following HID report defines:
    33	 * https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
    34	 */
    35	
    36	/* Output Reports */
    37	static const u8 JC_OUTPUT_RUMBLE_AND_SUBCMD	= 0x01;
  > 38	static const u8 JC_OUTPUT_FW_UPDATE_PKT		= 0x03;
    39	static const u8 JC_OUTPUT_RUMBLE_ONLY		= 0x10;
    40	static const u8 JC_OUTPUT_MCU_DATA		= 0x11;
    41	static const u8 JC_OUTPUT_USB_CMD		= 0x80;
    42	
    43	/* Subcommand IDs */
    44	static const u8 JC_SUBCMD_STATE			/*= 0x00*/;
    45	static const u8 JC_SUBCMD_MANUAL_BT_PAIRING	= 0x01;
    46	static const u8 JC_SUBCMD_REQ_DEV_INFO		= 0x02;
    47	static const u8 JC_SUBCMD_SET_REPORT_MODE	= 0x03;
    48	static const u8 JC_SUBCMD_TRIGGERS_ELAPSED	= 0x04;
    49	static const u8 JC_SUBCMD_GET_PAGE_LIST_STATE	= 0x05;
    50	static const u8 JC_SUBCMD_SET_HCI_STATE		= 0x06;
    51	static const u8 JC_SUBCMD_RESET_PAIRING_INFO	= 0x07;
  > 52	static const u8 JC_SUBCMD_LOW_POWER_MODE	= 0x08;
    53	static const u8 JC_SUBCMD_SPI_FLASH_READ	= 0x10;
    54	static const u8 JC_SUBCMD_SPI_FLASH_WRITE	= 0x11;
    55	static const u8 JC_SUBCMD_RESET_MCU		= 0x20;
    56	static const u8 JC_SUBCMD_SET_MCU_CONFIG	= 0x21;
    57	static const u8 JC_SUBCMD_SET_MCU_STATE		= 0x22;
    58	static const u8 JC_SUBCMD_SET_PLAYER_LIGHTS	= 0x30;
    59	static const u8 JC_SUBCMD_GET_PLAYER_LIGHTS	= 0x31;
    60	static const u8 JC_SUBCMD_SET_HOME_LIGHT	= 0x38;
    61	static const u8 JC_SUBCMD_ENABLE_IMU		= 0x40;
    62	static const u8 JC_SUBCMD_SET_IMU_SENSITIVITY	= 0x41;
    63	static const u8 JC_SUBCMD_WRITE_IMU_REG		= 0x42;
    64	static const u8 JC_SUBCMD_READ_IMU_REG		= 0x43;
    65	static const u8 JC_SUBCMD_ENABLE_VIBRATION	= 0x48;
    66	static const u8 JC_SUBCMD_GET_REGULATED_VOLTAGE	= 0x50;
    67	
    68	/* Input Reports */
    69	static const u8 JC_INPUT_BUTTON_EVENT		= 0x3F;
    70	static const u8 JC_INPUT_SUBCMD_REPLY		= 0x21;
    71	static const u8 JC_INPUT_IMU_DATA		= 0x30;
    72	static const u8 JC_INPUT_MCU_DATA		= 0x31;
    73	static const u8 JC_INPUT_USB_RESPONSE		= 0x81;
    74	
    75	/* Feature Reports */
    76	static const u8 JC_FEATURE_LAST_SUBCMD		= 0x02;
    77	static const u8 JC_FEATURE_OTA_FW_UPGRADE	= 0x70;
    78	static const u8 JC_FEATURE_SETUP_MEM_READ	= 0x71;
    79	static const u8 JC_FEATURE_MEM_READ		= 0x72;
    80	static const u8 JC_FEATURE_ERASE_MEM_SECTOR	= 0x73;
    81	static const u8 JC_FEATURE_MEM_WRITE		= 0x74;
    82	static const u8 JC_FEATURE_LAUNCH		= 0x75;
    83	
    84	/* USB Commands */
    85	static const u8 JC_USB_CMD_CONN_STATUS		= 0x01;
    86	static const u8 JC_USB_CMD_HANDSHAKE		= 0x02;
    87	static const u8 JC_USB_CMD_BAUDRATE_3M		= 0x03;
    88	static const u8 JC_USB_CMD_NO_TIMEOUT		= 0x04;
    89	static const u8 JC_USB_CMD_EN_TIMEOUT		= 0x05;
    90	static const u8 JC_USB_RESET			= 0x06;
  > 91	static const u8 JC_USB_PRE_HANDSHAKE		= 0x91;
    92	static const u8 JC_USB_SEND_UART		= 0x92;
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
