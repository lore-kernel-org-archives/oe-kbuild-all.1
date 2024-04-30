Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73686126
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714518782; cv=none; b=q+d1/zU/VetGXgo5pEa0J0Voszp3/hCpzzKRkSEJDll3bJ9gdgz0S/y3au242tAsfbgnOdkQOEhnO9VW1/7spuEn1Nkmq8sfyGGQWGQdu9oQ/J3Gkftsbk7T+G+1yubY3n+Cf+ZdG/hVE53TgwZi064UBW+idEbp6C+/ratuq7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714518782; c=relaxed/simple;
	bh=9aLMGWlJ3KH73jGrTb0xEXNt+MnIVirER/Y+9TvPXfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLLCJa3/vmnK4FhSq47wH0GBCg/13fCygj6BakEne0JrTjGjkgiM3pLDAoXys9FfOwG0ys+xTCT9DqlwXsMKMiCoJxE35vJS+LNVU7sja22cZlR0QmTc/QIBORXMNNs+HpYKk4uqjEQCc2pGicFGIQLFoS0W2jfxnAQfHDPPmx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYUVXr8b; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYUVXr8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714518780; x=1746054780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9aLMGWlJ3KH73jGrTb0xEXNt+MnIVirER/Y+9TvPXfc=;
  b=MYUVXr8bb9HlJ9B4wetLZl7C6ytri16gUXR6gKFR/8uuT/wKjQSE8dZl
   v90x5EGpJ/kd2acteWV9fQpq5eNeLQfFFSIeZ892saZ3AgCYdCpEL2BzX
   qrEdsY3k/SD3wr1N/C8hMFfdgpo1Ab36dl/UJv0+C/GQFKHAVM0SFN1Hn
   IrRaoNOswbxeV3di/5CAuW7v0BU8g2WLQJy2R5nfaHK+s80J8gvHCNFAO
   6Gzkx+zDf0Gr1s2W6wzqR4lfGI4et5DgT5JvlzXnLS4ySplAMqXGI294K
   tjXuLQT/k+dGGMo0rj9dwrEqFluwvktUChaeoXIAhIgEoiVIBDQTTfF+D
   w==;
X-CSE-ConnectionGUID: N8FPml1RQci0+7QoAc0Omw==
X-CSE-MsgGUID: prC+EDaFQLGenuT/86s3DA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10373923"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="10373923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 16:12:59 -0700
X-CSE-ConnectionGUID: FmHFoyAOQOSdDFvg4DjAog==
X-CSE-MsgGUID: +hjdNW6EQnK5Ep20jyw0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="27233252"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2024 16:12:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1wee-0008fp-1C;
	Tue, 30 Apr 2024 23:12:56 +0000
Date: Wed, 1 May 2024 07:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5950/11730]
 drivers/firmware/imx/sm-misc.c:17:5: warning: no previous prototype for
 function 'scmi_imx_misc_ctrl_set'
Message-ID: <202405010700.Zzw9Rpgb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   776652a165f5bbf30c68a5f6213d75b02e8df11c
commit: d482cb8ff9593b82d549bcebb1fa406494ab96f9 [5950/11730] LF-10712-2 firmware: imx: add i.MX SM MISC driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405010700.Zzw9Rpgb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010700.Zzw9Rpgb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010700.Zzw9Rpgb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/imx/sm-misc.c:11:
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
   In file included from drivers/firmware/imx/sm-misc.c:11:
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
   In file included from drivers/firmware/imx/sm-misc.c:11:
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
   In file included from drivers/firmware/imx/sm-misc.c:11:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/firmware/imx/sm-misc.c:17:5: warning: no previous prototype for function 'scmi_imx_misc_ctrl_set' [-Wmissing-prototypes]
      17 | int scmi_imx_misc_ctrl_set(u32 id, u32 val)
         |     ^
   drivers/firmware/imx/sm-misc.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | int scmi_imx_misc_ctrl_set(u32 id, u32 val)
         | ^
         | static 
>> drivers/firmware/imx/sm-misc.c:26:5: warning: no previous prototype for function 'scmi_imx_misc_ctrl_get' [-Wmissing-prototypes]
      26 | int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
         |     ^
   drivers/firmware/imx/sm-misc.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      26 | int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
         | ^
         | static 
   9 warnings generated.


vim +/scmi_imx_misc_ctrl_set +17 drivers/firmware/imx/sm-misc.c

  > 11	#include <linux/suspend.h>
    12	
    13	static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
    14	static struct scmi_protocol_handle *ph;
    15	struct notifier_block scmi_imx_misc_ctrl_nb;
    16	
  > 17	int scmi_imx_misc_ctrl_set(u32 id, u32 val)
    18	{
    19		if (!ph)
    20			return -EPROBE_DEFER;
    21	
    22		return imx_misc_ctrl_ops->misc_ctrl_set(ph, id, 1, &val);
    23	};
    24	EXPORT_SYMBOL(scmi_imx_misc_ctrl_set);
    25	
  > 26	int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
    27	{
    28		if (!ph)
    29			return -EPROBE_DEFER;
    30	
    31		return imx_misc_ctrl_ops->misc_ctrl_get(ph, id, num, val);
    32	}
    33	EXPORT_SYMBOL(scmi_imx_misc_ctrl_get);
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
