Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF556FA8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 01:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722649312; cv=none; b=pCbBBEnjMfjy/9ru063nPCo/Z8wdYaaBGYDjiPCwLDtZek6Qylv7RXGrmx9/RdR2pwHO/6NxKS3clhCZf+toA3slL2uf7ElSekV5JJUzehlKeZ1krwmG9VvnrnPHk3Rk3zU2pSYMAmXm0+CGe3+6fuQzQk2gdrpzAIzR5oT5lEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722649312; c=relaxed/simple;
	bh=rlR5iwa4UAAIudZ8/hT7b+kJ6sN+wFHGMIExoqa5mvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q9jQ4s0AYA8aulhGDpTsKaMgcL6GekO3a0BRQjvwBIDpG6Ja/LgO23sP3MWg6ZmQFcoYUmXQvOkUo8+ZOWvmmjfIrbBoU3xdGMzcvy67QTrIqly1666navCKQ2ZM2YK3OrJ6enFdIoxI5MgyGVS+KwmFUgY3TrztCKcyc3sS6kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvAggn6n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvAggn6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722649310; x=1754185310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlR5iwa4UAAIudZ8/hT7b+kJ6sN+wFHGMIExoqa5mvs=;
  b=ZvAggn6ngisb1V9Zrmv6HpbM6PK1hfAVNnTPiAgz45TlNPwpsNKxAfpF
   HDY+BYvU4REipxI/u2paHY+WWr9vJxhPeBd0MSBzZk7ktrNyZ2SKLxURw
   uOxvFKGc9FWDxzgdUXPOPUmwD3EsCQH2jc0F8jfIFgCu8rIXwtexn7kTD
   u5PQJ+eQ1D4jsqwkolQ8sehfaQX4Mhs0MPV6+32l7znZUPHhiSx4ZsuPb
   i7urPbUjqovIZ2JxhRPdaXgNPIudMVL8dby9hJbbgcnTSsAoF45LvLXjM
   KGePjdznpajSIXqFDSaYQeOSusIYyuFNHI4fKsPFAjs9u+69mqE2UNkBX
   A==;
X-CSE-ConnectionGUID: 1uvhRWMwTYS5pE22Ct027Q==
X-CSE-MsgGUID: h+XTdtslSl6hcxwNWXrY7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="32086467"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="32086467"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 18:41:49 -0700
X-CSE-ConnectionGUID: 8/7/5YvvSAe8RnMv/jYmIw==
X-CSE-MsgGUID: 9FH1s826Rbui7aO/6yDG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="86539221"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2024 18:41:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa3mE-000xiZ-0A;
	Sat, 03 Aug 2024 01:41:46 +0000
Date: Sat, 3 Aug 2024 09:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-rc 13/40]
 drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces
 around initializer
Message-ID: <202408030910.r2pmC5gu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   d8e30074e1ec80f1c21851b2afe96a14cd4fd151
commit: 07a03dd1bbcf0d7790c041112ffe3771d3db0e7b [13/40] pinctrl: mediatek: add MT7988 pinctrl driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408030910.r2pmC5gu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030910.r2pmC5gu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030910.r2pmC5gu-lkp@intel.com/

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
