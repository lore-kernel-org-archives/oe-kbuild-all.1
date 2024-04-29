Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15012B73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714426443; cv=none; b=CDLXCKiBXlSVwYzSqkVOm7iGzLUKML3U3GAMJk5TFNmqV0c2DSFnFhvbDa9InHpB8evPJggg6Pw0btHFPBSeAN6oqvTQuTUeJrwcdLrvz7BkZAL5JldlTmB1IBNWT7xxZMqATuQPywkv138lzETeieisT/zDzdQdJ+dkL8jWfX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714426443; c=relaxed/simple;
	bh=aeDGgKeaz+ofZ/1I4fZGAQoST7kGxjkVJoUIp2B0J4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=puvsozqC5+GEKw3D6BQsjktbKQCl3EWmlW7LH1x6QYwcnjwldKlPO09yEELIbiDLGc/HHV+iPrf+vdVjIHdzXBlsVw0LFUYJzeeeRuBEgwIQCTln20UPXfdk3GBVY6/sIxQVsEYgl7aZwWvN8lk1z0e203aesyfD6lsf/hwmQTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzbZQrjm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzbZQrjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714426442; x=1745962442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aeDGgKeaz+ofZ/1I4fZGAQoST7kGxjkVJoUIp2B0J4c=;
  b=lzbZQrjmOcKP6NS0x03YjQZ6tfPBPKFElheCskHjoCgSxMhla7ZqlF+U
   kTVLrJ7Zqhvk/Rbf82tfUvC9RSf7T+vWrXdpSGSEWVTlbN+hY8dRco6OD
   minnWJQrpW+yXvdW9GpbYAclgNHINQywAXf4SihkToJC3k8R1Y13BUPGx
   qgBbINCSQMjR1gceYgGL/yviaEY0LZE/oL3auIethPRlUksLtsFhl2i63
   QX5S3dwHLqQxrV3iifRBdU6qGBEx2JwrEHNszczj3joeUMX3Lwdoe5kzh
   G2BLs1O4FZKKVN/7XYIA6/8OE7Y3xiQ1Bp5aNtAQERIcGlFmDbdHpRJPd
   A==;
X-CSE-ConnectionGUID: jQWsOMmuQj+zf6Mk3m210Q==
X-CSE-MsgGUID: neojYqmmTZOr+RtnnazdRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13933934"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="13933934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 14:34:01 -0700
X-CSE-ConnectionGUID: df09w2k5R1qJmIB/9lLG7A==
X-CSE-MsgGUID: XKR8BIg0TcmQS4p2dCLzoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26220133"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2024 14:34:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1YdJ-0007S4-1z;
	Mon, 29 Apr 2024 21:33:57 +0000
Date: Tue, 30 Apr 2024 05:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5709/11728]
 drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:463:25: error: use of
 undeclared identifier 'dw_dphy_rx_of_match'; did you mean
 'dw_dphy_of_match'?
Message-ID: <202404300539.bhzZcEvv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: b54285687522c3323609c2b26e083a6751abf3e6 [5709/11728] LF-10587-06: phy: freescale: add MIPI DPHY Rx driver for iMX9 family
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404300539.bhzZcEvv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300539.bhzZcEvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300539.bhzZcEvv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:13:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:13:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:13:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:13:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:463:25: error: use of undeclared identifier 'dw_dphy_rx_of_match'; did you mean 'dw_dphy_of_match'?
     463 | MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         dw_dphy_of_match
   include/linux/module.h:244:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^
   drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:458:34: note: 'dw_dphy_of_match' declared here
     458 | static const struct of_device_id dw_dphy_of_match[] = {
         |                                  ^
   7 warnings and 1 error generated.


vim +463 drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c

   457	
   458	static const struct of_device_id dw_dphy_of_match[] = {
   459		{ .compatible = "fsl,imx93-dphy-rx", .data = &imx93_dphy_drvdata},
   460		{ .compatible = "fsl,imx95-dphy-rx", .data = &imx95_dphy_drvdata},
   461		{ /* sentinel */ }
   462	};
 > 463	MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
