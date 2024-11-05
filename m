Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DC31D47C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808570; cv=none; b=E/8sCPmeKhbMeD/5GkmHY79bd4dcVJzrAe2Olb9hb7EWZky5fv6Q9/5IPcwISnyPb5xEiP8DZ93F3J6rv+dbLDdjpaDVaj2ndb8db240aWKoSK9khMs3SmCPZDLTLQFoeHMO0BguTlndfGJRorFlXahIzaiTabHqf6zqaH3kvGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808570; c=relaxed/simple;
	bh=O+y+wI628c3b4T4uAEPgXNppkn5tcRZsWkCBzfZp8u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vpf0yXpHHmWH/sW82a88pP6SRiZuQtKUeK8nDjgcO+YN5XaCDkir407gqO88CzrcnrU+4Av3jiBcqbJ6AdEfKYpPdJsSCqUNb+hrBd1FNCCTtPvQbRQHCor7vugvyrigs0ZzCA6adrwsuEZbk14rdhmv7u+1qLOjPH3F31rtCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl1m7nGt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl1m7nGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730808568; x=1762344568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+y+wI628c3b4T4uAEPgXNppkn5tcRZsWkCBzfZp8u0=;
  b=Yl1m7nGtfGmAGVdb03F41LtSUrqCG/YjWYQ7VKbIATgO4Sl0oWCvT1qg
   rpw8xfdHOEJZHB3d97vv8iYc32szwAUag9TrAb98fVszriEK5QnkWP6Me
   EAcYTEpbbcpeXsksatQa8KPEfbj69R/RC/9Cn+374U7x/+Gz6pjsXyBTc
   L4VqbTPUL7i7dj6nh/Rf11d7WwkpnUmNX0h5c4GwlNq2dCGBr2e0SjO57
   DRFAUa7x73A7NuxfyBj1kUbbGlneYkELVyPdPXmlak6yPBsb5x1u9NH5M
   BdmAKtdWzvDNAcTJv25LBIY44x0EyLZ9bWVA93oPtnF7yp9eHT+HJFDFI
   g==;
X-CSE-ConnectionGUID: QLfKijKARgGfxjBwBy1bmA==
X-CSE-MsgGUID: 1BCbOyQFQQqCfGM1vpVzIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33389689"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="33389689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 04:09:28 -0800
X-CSE-ConnectionGUID: 6xglf+6DSKiReQcjBmktyw==
X-CSE-MsgGUID: S/prhBezTOWKurYoQ+VBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="83649239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 04:09:26 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8INA-000m1g-0r;
	Tue, 05 Nov 2024 12:09:24 +0000
Date: Tue, 5 Nov 2024 20:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-main 13/60]
 drivers/pinctrl/mediatek/pinctrl-mt7988.c:1436:4: warning: suggest braces
 around initialization of subobject
Message-ID: <202411052034.IdTlAjIm-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241105/202411052034.IdTlAjIm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052034.IdTlAjIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052034.IdTlAjIm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/mediatek/pinctrl-mt7988.c:9:
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:11:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/pinctrl/mediatek/pinctrl-mt7988.c:9:
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:11:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/pinctrl/mediatek/pinctrl-mt7988.c:9:
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:11:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/pinctrl/mediatek/pinctrl-mt7988.c:9:
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:15:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   32 warnings generated.


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
