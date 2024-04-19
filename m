Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3910F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 01:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713491708; cv=none; b=WfKPKVVUXiDU/boN+1YY+VtmBWXIprUL4caYW0b5RugmcTxUfams9y8vy34E+coXcCAFjapx2bXzW+VIJKjYs6O6ITqiH1w4Y18jBrRX9AcKnaRG1aWonnF1WoVJaDFb1O8BdOMPpXk2hFLjz4T6ohytazEIOeBG/XO3JBXtRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713491708; c=relaxed/simple;
	bh=Cn5uQuk2BzGvhpfdYctCOFkg8Q5tgG4jVmeFak+K65w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqYFb/kpcUtDKBPjpXKbjZ0caFrDlNxLRzMbKLup14pf6PUKYlNN1XbvRm4ZXimbMJZqcPtWRQUfdnidL/EHeY/RjMKGxDkpxWpsqsHWEYDcNW4E10ARsowN9T9fEzkUm2Prtpo7FM6G7MZEFKpCbhlc+OgbrI6i+P4RW7WXqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExzbYTdl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExzbYTdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713491707; x=1745027707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cn5uQuk2BzGvhpfdYctCOFkg8Q5tgG4jVmeFak+K65w=;
  b=ExzbYTdltHvzu4WGIMpwENMkpDAAbQYe9mEs0qaeYFkywkiYsJ0S8rU9
   J23mW4hZ5ro9UW/7b66D4/19vqjU93lEEC0dWhX9AcELuD/MrRrNuvA5d
   06e656Ky+R+ihvChKiGAdJAPu3XUMgoUeCc33iCHGpFIG1oZqNowsQe55
   MY0ubfib7JFPQKDwVCfpazLzZnMcJkIavreWiaoiEHlMv46Kudu0Sh0u9
   z6V7IRJPYZrdWnYWm9kd+cEWhXnlnFHnkzxvlXup/NigOiYAUPrQ9wRTm
   qcqBIf88GOAVtYwFreh0qUM4BJqmHScwG98AREaSHqtx+oEXI+vAAl9jS
   w==;
X-CSE-ConnectionGUID: 4S92yZePRzi9fV4t2KBHWQ==
X-CSE-MsgGUID: jx7cayyqSV+B+Va9Yk7YJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8950014"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8950014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:55:06 -0700
X-CSE-ConnectionGUID: Yaqh/MarT9ixL+HlVNE/ew==
X-CSE-MsgGUID: wtVFTE+qR/S10kP/n3dHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23226069"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2024 18:55:04 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxdSv-0009U0-2Y;
	Fri, 19 Apr 2024 01:55:02 +0000
Date: Fri, 19 Apr 2024 09:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4299/18115]
 drivers/net/ethernet/freescale/fman/fman_port.c:2015:36: warning: unused
 variable 'fman_port_acpi_match'
Message-ID: <202404190941.9NuokjTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 248945994cd320da38758f1428d6eac0ef0ae0c4 [4299/18115] fsl/fman: add FMan Port ACPI support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190941.9NuokjTP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190941.9NuokjTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190941.9NuokjTP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/fman/fman_port.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/freescale/fman/fman_port.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/freescale/fman/fman_port.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/ethernet/freescale/fman/fman_port.c:2015:36: warning: unused variable 'fman_port_acpi_match' [-Wunused-const-variable]
    2015 | static const struct acpi_device_id fman_port_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +/fman_port_acpi_match +2015 drivers/net/ethernet/freescale/fman/fman_port.c

  2014	
> 2015	static const struct acpi_device_id fman_port_acpi_match[] = {
  2016		{"NXP0026", 0}
  2017	};
  2018	MODULE_DEVICE_TABLE(acpi, fman_port_acpi_match);
  2019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
