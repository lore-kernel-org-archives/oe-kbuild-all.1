Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C454907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 23:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713483514; cv=none; b=JevXCt9KukZAaDBmfepzRQ6wbRmrPLxx4wKS6LW326AJH3xDoDa+vLsNK60zH8zV8twtFyPY0PTRwavJEf9nusFLWLb1E2MJeV29S4NNe8LOPbUAkoTv55WVQli72fM/PKn6M6QjOmILQ/GXfj5KnOynUGJHNWfHeyBpa6x/NfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713483514; c=relaxed/simple;
	bh=zgBm5kp1vQtbPacTHfvmpBuAnzeinyaAb2qrIUs9JXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4J2sCnm/lTT/nuJSwCslgizWdSol/daLX6wMoKEjUPhjoFa/ts53SzWh5tqFEolJQXj06D2uZkvbVkX0udfSTmJH8Am2U3d7mwwzZ+xuA9bU+CecWWIc3BM62r4VMWArLQOKFXRpI7WOQkXZKc1D/YT4lC2AWbI6mrKLe2UeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjfD3fIP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjfD3fIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713483513; x=1745019513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgBm5kp1vQtbPacTHfvmpBuAnzeinyaAb2qrIUs9JXQ=;
  b=PjfD3fIP1cJmyc1T11H/EQEm9X8dwEXSy94BB3nzi9+eB+Jspx2aU66X
   r/H5QUp5Jbn13mWorwOXuUTv6Yz4GuyVak8AAtlh3qNfKZs42ZJuJ0S9y
   AFWUvcEnuLG5ul7b/sh6iF9VDEBNpj21YA3JKAEAbUri11PNhLo/KEjG5
   xIgzWJX6Hq5RRbOxKFjphN/sh2R1x1UtJ4/QbB6wmt6IJ5G4i2klbf88S
   /R0kuIRL5QnI9JQP+E9gCue8533dablYY1LD3nbMjCx2KVHd41b0kbTZs
   nT1xNU8And/gx4sWlbQ4/MZfNVdxcqg2jLKqEG15satCMO/o8x5qA/+22
   w==;
X-CSE-ConnectionGUID: 8QFlILNzTdu7iZJCaCrUMQ==
X-CSE-MsgGUID: IaH/u/fgSWaCkeJ2OKIaHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8904434"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8904434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 16:38:32 -0700
X-CSE-ConnectionGUID: WuDFwLtuSQ62BG24gCIykw==
X-CSE-MsgGUID: guavbFquTamKe2dIKz2ydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23655293"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Apr 2024 16:38:31 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxbKm-0009Lq-1W;
	Thu, 18 Apr 2024 23:38:28 +0000
Date: Fri, 19 Apr 2024 07:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4298/18115]
 drivers/net/ethernet/freescale/fman/fman.c:3066:36: warning: unused variable
 'acpi_fman_match'
Message-ID: <202404190732.rkA8Vwn8-lkp@intel.com>
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
commit: 706c8187d42bb7c8706d1d02bf7b811f4cca0819 [4298/18115] fsl/fman: add FMan ACPI support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190732.rkA8Vwn8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190732.rkA8Vwn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190732.rkA8Vwn8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/fman/fman.c:10:
   In file included from include/linux/fsl/guts.h:15:
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
   In file included from drivers/net/ethernet/freescale/fman/fman.c:10:
   In file included from include/linux/fsl/guts.h:15:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/freescale/fman/fman.c:10:
   In file included from include/linux/fsl/guts.h:15:
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
   drivers/net/ethernet/freescale/fman/fman.c:2694:39: warning: variable 'fw_fmnode' set but not used [-Wunused-but-set-variable]
    2694 |         struct fwnode_handle *fwnode_muram, *fw_fmnode;
         |                                              ^
>> drivers/net/ethernet/freescale/fman/fman.c:3066:36: warning: unused variable 'acpi_fman_match' [-Wunused-const-variable]
    3066 | static const struct acpi_device_id acpi_fman_match[] = {
         |                                    ^~~~~~~~~~~~~~~
   8 warnings generated.


vim +/acpi_fman_match +3066 drivers/net/ethernet/freescale/fman/fman.c

  3065	
> 3066	static const struct acpi_device_id acpi_fman_match[] = {
  3067		{"NXP0024", 0}
  3068	};
  3069	MODULE_DEVICE_TABLE(acpi, acpi_fman_match);
  3070	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
