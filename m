Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED61D2B39
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804127; cv=none; b=GwvB/enaCFRmtc6kmgX48Ct+dVUAI5is4qlOJl1Qt5G/OC/znEgFDryhhSIp0gefhNvGZg0qdOcBwAIUs/VUDiBKlkkee5q0wcPuTQeMxi1PTyRsgpRhXt5b9bnWEXqRU0pfL3SQS2UbNy5F3LbSfy0LKvmuxVoky82GLHC3nss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804127; c=relaxed/simple;
	bh=i8tcQ8T2yhLPoabgoi4O0E6WqVnRoTpnYRdacpUO2Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5tIWqn4FC5f8pZpUBa7P3/k0dpxaP31wk+CXsNrJzo4NUQli9XhKNtFkUfErDCAeHAOqbckvUyKc4r3Y/P0QIFLc1HO7ZpOrjSE2ktZUkTojKnWloEdPW27KqlzPekp/JHTo6IuSoZHT1emEhwSBrYl7+misfQsLrY4BdiS/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKHtYA9N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKHtYA9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730804126; x=1762340126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8tcQ8T2yhLPoabgoi4O0E6WqVnRoTpnYRdacpUO2Nc=;
  b=hKHtYA9Nt3WLQz49/855ixPNc63qjU8679cPEUhjtwbzXu9DANotw9S7
   d7FTD9xWXQuYuIqeQPRs/v8IVR7YGrpMhgI8kzlb3yU6OGxfTjEORDrgk
   XG7O3VYjYLHEe3SUUQQxfbtxCqNOYhYlRgb1dS7Htp4tbv3fudBAx1kNp
   r3AbZpxPDoqy30kzSSIG505fsGXRWY6RlA+k08ZOHZkH41sADyTHKMti7
   J5E2ghLcxfSpqz/qfMndgT0VUZjh8uCfPQCEbASPgqCF2InVNoFN3h+Gx
   vJl93BrGOszWaecdgdJpgEESQ97XYAZPgPVOI6lPRJ4lpN8dTAEe3riO/
   w==;
X-CSE-ConnectionGUID: lOldzrANRLaRygufigdezQ==
X-CSE-MsgGUID: DFcyBKDzRaaQ1m89L34vpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34232862"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34232862"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:55:25 -0800
X-CSE-ConnectionGUID: kZ5ikDlcSX226ZcAntCMMg==
X-CSE-MsgGUID: EU5zWm23QZSzTVQ9nbklwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83493954"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 02:55:23 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8HDV-000lwF-09;
	Tue, 05 Nov 2024 10:55:21 +0000
Date: Tue, 5 Nov 2024 18:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-main 13/60]
 drivers/pinctrl/mediatek/pinctrl-mt7988.c:1435:56: warning: missing braces
 around initializer
Message-ID: <202411051839.sjeDrQG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-main
head:   7a99830e634e841ea97796c35bbe0cf8e038ad9f
commit: 945e8a290f17cfd45726b0f037ace33866d6fafd [13/60] pinctrl: mediatek: add MT7988 pinctrl driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241105/202411051839.sjeDrQG4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051839.sjeDrQG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051839.sjeDrQG4-lkp@intel.com/

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
