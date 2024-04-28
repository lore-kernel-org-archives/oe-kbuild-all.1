Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F874F888
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714287802; cv=none; b=afD4ifr2yUp0W9DeRqkktXfrW0d3YgzER4Sqo2KBhlrToKMxh47YqyFlDPta1cls/ohSnZCQU4Z2W/gvGfYzisFgd4FFf/JyLKhAtc6la0PYHCCN0AWb+vKSlFYFfoS6voI22BKZWcniv+TxMfptKosorj+uP2KEQRbEhHptbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714287802; c=relaxed/simple;
	bh=AiIAzyRpyYnlgukE6fh076raqmVh4jW8qyKdxnJgilk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSp2VILAVuIyOLxfRSMIgUlj5Y5eH7yKomfEt+93HfXM/Wm5+5qQBiUSd4IofPgbHbddlP01IpL+z4emk+IQ08KjJZYKHoI++lYUK+9RnFEmhVeF4mLY+8abVPlXsD4IuBfO4iV/phKPiyJrf1zhag15O4hHqsYn1EJWTTQWU74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGBTGcCe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGBTGcCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714287801; x=1745823801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AiIAzyRpyYnlgukE6fh076raqmVh4jW8qyKdxnJgilk=;
  b=OGBTGcCem1Yl53VkICvfbLDj1zcPJBYKQaoK3NKZCCd2RUsA6Rp0nqlj
   rkVtWpxEQOl5lPqXXwFZX0HejSm6kEuouxn+tlR1DS4VVp/8nFIVNzdNG
   W3ZCnDt9UiBHU2Ns+cgBHD5llj+OwaIFApLI4kyMs5rptF9SjuZDr8kRo
   XFlMIWdbwKO/ChBoRW8N4WbzuGzdcM6G03ggu0IVRc71TXlCfkzRuvMhr
   dwXj6hcrMtpR+A/0Us9eOlrUtAKrX17txBcB5GlWMT4c2cnIat+bQnejF
   yEpUpjGezeIGQFvbpTE0wBCDE5z6dZ+qKma3MW91gniWZu/ITBdWmHcBH
   Q==;
X-CSE-ConnectionGUID: 23HK56PqSnWplJNzz54sDw==
X-CSE-MsgGUID: xfFUuSVARAiGQFuTmjp5yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20528000"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20528000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 00:03:20 -0700
X-CSE-ConnectionGUID: bKGUgr7LRvSS0q/dsCv1mQ==
X-CSE-MsgGUID: Jdu9EhFdRTuTU61kS3fAnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25887356"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2024 00:03:19 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0yZA-0005wK-1w;
	Sun, 28 Apr 2024 07:03:16 +0000
Date: Sun, 28 Apr 2024 15:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5708/11728]
 drivers/media/platform/nxp/dwc-mipi-csi2.c:550:8: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404281552.CipN0zra-lkp@intel.com>
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
commit: 082dd12f8b589393f5227c2d64e358da78bd6f35 [5708/11728] LF-10587-05: media: nxp: add DesignWare MIPI CSI controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281552.CipN0zra-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281552.CipN0zra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281552.CipN0zra-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/nxp/dwc-mipi-csi2.c:10:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/media/platform/nxp/dwc-mipi-csi2.c:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/nxp/dwc-mipi-csi2.c:10:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/media/platform/nxp/dwc-mipi-csi2.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:550:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     550 |         val = CSI2RX_PPI_PG_PATTERN_HRES_HRES(format->width);
         |               ^
   drivers/media/platform/nxp/dwc-mipi-csi2.c:117:45: note: expanded from macro 'CSI2RX_PPI_PG_PATTERN_HRES_HRES'
     117 | #define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)              FIELD_PREP(GENMASK(15, 0), (x))
         |                                                         ^
   drivers/media/platform/nxp/dwc-mipi-csi2.c:610:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     610 |         val = CSI2RX_IPI_DATA_TYPE_DT(csi_fmt->data_type);
         |               ^
   drivers/media/platform/nxp/dwc-mipi-csi2.c:151:38: note: expanded from macro 'CSI2RX_IPI_DATA_TYPE_DT'
     151 | #define CSI2RX_IPI_DATA_TYPE_DT(x)                      FIELD_PREP(GENMASK(5, 0), (x))
         |                                                         ^
   7 warnings and 2 errors generated.


vim +/FIELD_PREP +550 drivers/media/platform/nxp/dwc-mipi-csi2.c

   524	
   525	/* -----------------------------------------------------------------------------
   526	 * DWC MIPI CSI-2 Host Controller Hardware operation
   527	 */
   528	
   529	static int dwc_csi_device_pg_enable(struct dwc_csi_device *csidev)
   530	{
   531		const struct dwc_csi_pix_format *csi_fmt = csidev->csi_fmt;
   532		struct v4l2_mbus_framefmt *format;
   533		u32 val;
   534	
   535		if (!csidev->pg_enable)
   536			return 0;
   537	
   538		if (!csi_fmt) {
   539			dev_err(csidev->dev, "CSI pixel format is NULL\n");
   540			return -EINVAL;
   541		}
   542	
   543		format = &csidev->format_mbus[DWC_CSI2RX_PAD_SINK];
   544	
   545		if (csi_fmt->data_type != MIPI_CSI2_DT_RGB888) {
   546			dev_err(csidev->dev, "Pattern generator only support RGB888\n");
   547			return -EINVAL;
   548		}
   549	
 > 550		val = CSI2RX_PPI_PG_PATTERN_HRES_HRES(format->width);
   551		dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_HRES, val);
   552	
   553		val = CSI2RX_PPI_PG_PATTERN_VRES_VRES(format->height);
   554		dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_VRES, val);
   555	
   556		val = CSI2RX_PPI_PG_CONFIG_DATA_TYPE(csi_fmt->data_type);
   557		val |= CSI2RX_PPI_PG_CONFIG_VIR_CHAN(0);
   558		val |= CSI2RX_PPI_PG_CONFIG_PG_MODE(csidev->pg_pattern);
   559		dwc_csi_write(csidev, CSI2RX_PPI_PG_CONFIG, val);
   560	
   561		/*
   562		 * Select line start packets to construct vertical
   563		 * timing information for IPI interface
   564		 **/
   565		val = CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE;
   566		val |= CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT;
   567		val |= CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL;
   568		dwc_csi_write(csidev, CSI2RX_IPI_ADV_FEATURES, val);
   569	
   570		val = CSI2RX_PPI_PG_ENABLE_EN;
   571		dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, val);
   572	
   573		return 0;
   574	}
   575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
