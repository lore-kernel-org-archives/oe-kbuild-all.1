Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B16FC1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 01:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722649311; cv=none; b=kR9Klj7A456hoZKS/cwM7jVPuhR637rMIL5z9y/T1x4ZLMy4RLjQuzbzYCap5ouIYnGxw+9qoWoH2+885dpIJS5BWuPkm8+e+KD6/I78EIADKFww2wT6zIOGNkZLBlsRFnNrl0PMQ+QCQO6szvf6Nmvx4rU1BYGXH5+MboZKagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722649311; c=relaxed/simple;
	bh=kipWyksaFf+0v/BkOANlPsMXVyvuCsmPnChnK3CJTdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvFy7x2N4izJTKKOwpEOUcvOE7bIkJmhR9udSWaMu9C64VvbmP2tNlp+dIpaxWPhiQticPAruwYJ9ErecOkt+hyz4tgMB6diyIXaKZv5U+5Q27kgmnNVPGL+XBKa0/C9iW/P7Wc15k1wuNbOILgKXnLLQiZ4Ot2sh0H5TkoF23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTl0oeTn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTl0oeTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722649310; x=1754185310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kipWyksaFf+0v/BkOANlPsMXVyvuCsmPnChnK3CJTdE=;
  b=GTl0oeTn+/m221Q+Cq4aMFwo2AzTYclOVfNopF531rrwvG5RocyCcQPJ
   Y9T121HzAjLh+/gVCVIHTMF9PcZNVhl1Zxa7dRPUezFbhB5xb1X9n2FbA
   4VhsAHpopYKkhbbN9Hw4I56k+UNnmjyT5MDSzIQEj4VOF0TEZQGHwYXwx
   nbXAM0sZAr1Nz8zZGbL03vPyGd8xcx6OIu2pFFPVoxGv2mP5HEu8yVHog
   a7J/xrtEpY3lPYDewT7knsRRrZY4shjTwbwLN2U5ObKHyqBfMszowHGhb
   21LB3oiVyzpET5a1xpnTxAQs1fbDNyK0hDJq6MtcliJC4f/0rldNaiZJS
   w==;
X-CSE-ConnectionGUID: /+l6v2kyQSyYfKYpk1EAKQ==
X-CSE-MsgGUID: 8vf2tJTGSjSWBouYs0HbLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="12856602"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="12856602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 18:41:49 -0700
X-CSE-ConnectionGUID: Wi6nV1G+QNSjnEqw2EiRRQ==
X-CSE-MsgGUID: P7RnlGUERaWqFdrVJodGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55465983"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2024 18:41:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa3mD-000xiW-36;
	Sat, 03 Aug 2024 01:41:45 +0000
Date: Sat, 3 Aug 2024 09:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-rc 13/40]
 drivers/pinctrl/mediatek/pinctrl-mt7988.c:1436:4: warning: suggest braces
 around initialization of subobject
Message-ID: <202408030941.amHAN9hJ-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408030941.amHAN9hJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030941.amHAN9hJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030941.amHAN9hJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-mt7988.c:1436:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1436 |         { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                            }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1437:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1437 |         { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                         }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1438:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1438 |         { "int_usxgmii", mt7988_int_usxgmii_groups,
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {
    1439 |           ARRAY_SIZE(mt7988_int_usxgmii_groups) },
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1440:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1440 |         { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1441:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1441 |         { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1442:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1442 |         { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1443:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1443 |         { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                                }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1444:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1444 |         { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                         }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1445:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1445 |         { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                         }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1446:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1446 |         { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                           }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1447:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1447 |         { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1448:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1448 |         { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                            }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1449:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1449 |         { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                         }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1450:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1450 |         { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1451:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1451 |         { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   drivers/pinctrl/mediatek/pinctrl-mt7988.c:1452:4: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1452 |         { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |           {                                                      }
   16 warnings generated.


vim +1436 drivers/pinctrl/mediatek/pinctrl-mt7988.c

  1434	
  1435	static const struct function_desc mt7988_functions[] = {
> 1436		{ "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
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
