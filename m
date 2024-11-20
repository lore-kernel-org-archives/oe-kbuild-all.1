Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996C1865E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732109395; cv=none; b=sOGzc/mDenpg+jlCkTiB0W4CfalFauVUMkbd9aDVTctCzcBF5pen4+/jD8KB/sBxE1yyS0S7g/dRtUiz+cEGkJibUbp5J20qVOQbueEG+q0I/op+0JvlrJo1D5eXxX+cLFeLGelCTrKatDb82aqLZbBsupVg4B+c2RtCeD5mMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732109395; c=relaxed/simple;
	bh=pLelOPaL9Id3P3rcu6lg9W1o+tuBgvu26jHycmpMLJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lq6tepFOr9khCWckxKZeuq/bYJE4DpFwPX1MqB9nIauLj44jJKqnyoELABR/IbtjdRxOSW2cCFG+Cw+NOmSipzIYGsOBpCXMrD33LBk/s0LvwzZcxS4AwdPcXg/faIlOHOXtjWsxFMLSq1peu08QsniV9d5S9Y9LYeAWEdrKEpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ocf7SOho; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ocf7SOho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732109393; x=1763645393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLelOPaL9Id3P3rcu6lg9W1o+tuBgvu26jHycmpMLJ4=;
  b=Ocf7SOho2wVXjBoZoZNPY8vMSTG/s6zKNA01t283xfPagU1MIk7C63pp
   0bqIbK7x08e24axVH09HP8vpVVP+prSEkyQm2K5I7a66LPTlCiwm5FKrz
   K7ESxc7vLN78j00klyA0MEw8yne5g7ZFB95aFMfG9j/4khdoN6ZSQm6pI
   +n8vDP7RIY8Rc3is9zbuWnUJa7KTSZx2iqpok64xVD+0kSvCZyis99aZC
   xphC9Xx5vCBvU+rrLdeoVI8+CiS6jMp+fjMdepetT8UUML0ki9jwHaWvW
   oM0sq/5ePUL5idP3V8oeJ9tb2DNi++88t3gMr76QnhZq5dU04EhCiwYvp
   g==;
X-CSE-ConnectionGUID: OiImaGIoTOKjS42+V+5wbQ==
X-CSE-MsgGUID: WZZP/V7PSIGlUBjsDnSVaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35837360"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="35837360"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:29:52 -0800
X-CSE-ConnectionGUID: hhyUYy8qTNa/g3Geni2TYg==
X-CSE-MsgGUID: JnJsT9TJR/Sw7dgRybJimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94979962"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 05:29:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDkmC-0000tJ-2g;
	Wed, 20 Nov 2024 13:29:48 +0000
Date: Wed, 20 Nov 2024 21:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?unknown-8bit?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-9s-ontip 1849/1922]
 drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared
 identifier 'glb_iface'
Message-ID: <202411202134.xSRhfvUV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-9s-ontip
head:   8809c6711dd21b917f92fff60cd5bef894262533
commit: 498893bd596e6aedd9796a10e2828311f8135a02 [1849/1922] drm/panthor: Simplify FW fast reset path
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241120/202411202134.xSRhfvUV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411202134.xSRhfvUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411202134.xSRhfvUV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panthor/panthor_fw.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/panthor/panthor_fw.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from drivers/gpu/drm/panthor/panthor_fw.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/panthor/panthor_fw.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
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
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
    1136 |                 panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
         |                                        ^
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:26: error: use of undeclared identifier 'glb_iface'
   16 warnings and 16 errors generated.


vim +/glb_iface +1136 drivers/gpu/drm/panthor/panthor_fw.c

  1110	
  1111	/**
  1112	 * panthor_fw_post_reset() - Call after a reset.
  1113	 * @ptdev: Device.
  1114	 *
  1115	 * Start the FW. If this is not a fast reset, all FW sections are reloaded to
  1116	 * make sure we can recover from a memory corruption.
  1117	 */
  1118	int panthor_fw_post_reset(struct panthor_device *ptdev)
  1119	{
  1120		int ret;
  1121	
  1122		/* Make the MCU VM active. */
  1123		ret = panthor_vm_active(ptdev->fw->vm);
  1124		if (ret)
  1125			return ret;
  1126	
  1127		/* If this is a fast reset, try to start the MCU without reloading
  1128		 * the FW sections. If it fails, go for a full reset.
  1129		 */
  1130		if (ptdev->fw->fast_reset) {
  1131			/* The FW detects 0 -> 1 transitions. Make sure we reset
  1132			 * the HALT bit before the FW is rebooted.
  1133			 * This is not needed on a slow reset because FW sections are
  1134			 * re-initialized.
  1135			 */
> 1136			panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
  1137	
  1138			ret = panthor_fw_start(ptdev);
  1139			if (!ret)
  1140				goto out;
  1141	
  1142			/* Forcibly reset the MCU and force a slow reset, so we get a
  1143			 * fresh boot on the next panthor_fw_start() call.
  1144			 */
  1145			panthor_fw_stop(ptdev);
  1146			ptdev->fw->fast_reset = false;
  1147			drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
  1148	
  1149			ret = panthor_vm_flush_all(ptdev->fw->vm);
  1150			if (ret) {
  1151				drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS l2cache)");
  1152				return ret;
  1153			}
  1154		}
  1155	
  1156		/* Reload all sections, including RO ones. We're not supposed
  1157		 * to end up here anyway, let's just assume the overhead of
  1158		 * reloading everything is acceptable.
  1159		 */
  1160		panthor_reload_fw_sections(ptdev, true);
  1161	
  1162		ret = panthor_fw_start(ptdev);
  1163		if (ret) {
  1164			drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )");
  1165			return ret;
  1166		}
  1167	
  1168	out:
  1169		/* We must re-initialize the global interface even on fast-reset. */
  1170		panthor_fw_init_global_iface(ptdev);
  1171		return 0;
  1172	}
  1173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
