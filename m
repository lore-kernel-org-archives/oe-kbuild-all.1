Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979B1D04B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725450615; cv=none; b=Zt/qq159ONxUp92wVMqvm+KWh3DgYcf2ElHadjQ7oi/SDPQwUEUIaAv4YFhesniID10SGqJiHxoKTwTSMuzXozwDX/5SjSWfIpEOvK5RPWXSzy8ep4PMhSf+8ExUYQV5nvgclPQlybmoi0p8aY4qNbbjSPS8V/yQrXH1K1xDH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725450615; c=relaxed/simple;
	bh=pFaqY7VER4GP6OZomOOXvm5AJmKRVkDRWHVWPBMZy90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q9hCBhcJhFSk4Eov1VFou4DqMgpGPJuByPTV/5g1uR5lPbSQkTyDABCK033QlCPdEYPspPA4sTcCakiO80W3tz/9T1iadRnn+CI+XsQ0Wxasmp5ll7SxXEUhpeu9yzea07Rd2SRUpg0n0O7oItS0/Qr2vshw5zr8MzSJ936XVIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsPbHwIO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsPbHwIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725450613; x=1756986613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFaqY7VER4GP6OZomOOXvm5AJmKRVkDRWHVWPBMZy90=;
  b=SsPbHwIOQMxYrDFMZT8qZmvkLRgIfGJPtFSN7lZhFWQXk1auQyW/vurc
   CdrdDUzyYO1GKLwD0KFNd/hwAtHzUiwuGsILtNHbUCBJthv10wnfuCn0D
   KRH38ZXxHROEwzCqk4LrkZysG6YuucC9vxc2dpq/+n+dtokIk9PHATQvm
   WWL1T0SEmJRB1EuvgkQBLqpC2P+mCltj2EemKBV0G4DSnu7Gl4Jg/9KBX
   eS9GsPBvpUVsU78sn9NG0qx35qGKOFwgzBUTWqFuA+1XNh3nljcmKzIg4
   usAa3SGD3guQtPjzWhXAdLq+Lf+wPpkVYo7GALOYEU2Be5CBE82QvOREE
   Q==;
X-CSE-ConnectionGUID: 3T7egDaLS/K7Nyr/BgipIw==
X-CSE-MsgGUID: N0Rz4w0iQPGX5alNb5paSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24267150"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24267150"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:50:12 -0700
X-CSE-ConnectionGUID: fKkSp5LFSZyjqfyHy8FWyg==
X-CSE-MsgGUID: RRj9w9OzS9CGa52xTzPifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65767005"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2024 04:50:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sloWW-0007vf-2M;
	Wed, 04 Sep 2024 11:50:08 +0000
Date: Wed, 4 Sep 2024 19:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-rc 13/60]
 drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces
 around initializer
Message-ID: <202409041918.J1DGxkPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   6c68493a30b5b4623f673c840442184f72ead1dc
commit: 51e6877be8417837881b1181a885a580909f3390 [13/60] pinctrl: mediatek: add MT7988 pinctrl driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240904/202409041918.J1DGxkPW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041918.J1DGxkPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041918.J1DGxkPW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           {                                                             }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           {                                                             }
    1449 |         { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
         |           {                                                          }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           {                                                             }
    1449 |         { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
         |           {                                                          }
    1450 |         { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           {                                                             }
    1449 |         { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
         |           {                                                          }
    1450 |         { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) },
         |           {                                                       }
    1451 |         { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           {                                                             }
    1449 |         { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
         |           {                                                          }
    1450 |         { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) },
         |           {                                                       }
    1451 |         { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) },
         |           {                                                       }
    1452 |         { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) },
         |           {                                                       }
>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces around initializer [-Wmissing-braces]
    1435 | static const struct function_desc mt7988_functions[] = {
         |                                                        ^
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           {                                                             }
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           {                                                          }
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |                                                 }
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           {                                                       }
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           {                                                       }
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           {                                                       }
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           {                                                                 }
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           {                                                          }
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           {                                                          }
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           {                                                            }
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           {                                                       }
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           {                                                             }
    1449 |         { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
         |           {                                                          }
    1450 |         { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) },
         |           {                                                       }
    1451 |         { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) },
         |           {                                                       }
    1452 |         { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) },
         |           {                                                       }


vim +1435 drivers/pinctrl/mediatek/pinctrl-mt7988.c

  1434	
> 1435	static const struct function_desc mt7988_functions[] = {
  1436		{ "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
  1437		{ "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
  1438		{ "int_usxgmii", mt7988_int_usxgmii_groups,
  1439		  ARRAY_SIZE(mt7988_int_usxgmii_groups) },
  1440		{ "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
  1441		{ "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
  1442		{ "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
  1443		{ "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
  1444		{ "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
  1445		{ "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
  1446		{ "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
  1447		{ "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
  1448		{ "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
  1449		{ "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
  1450		{ "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) },
  1451		{ "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) },
  1452		{ "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) },
  1453	};
  1454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
