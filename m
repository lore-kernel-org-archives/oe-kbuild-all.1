Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C6614D2B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739769708; cv=none; b=PhnCQg+Z7biwvhDrnmeUtbq0k2Cp1EEClJv0yZbGjJ4zUTYYbhm6kB4otwqkcsc2bHIyg0hPJ2tPnizE2MyPPe/iLcCSScy2XORsb4SFBFj72NG5/Bg7P6LCyX/wu9+ccZ/QCFqhpaLvXz1qfvIA04nC3gWtfKf+1E2m50ploTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739769708; c=relaxed/simple;
	bh=BGDVHFcOkaWjQy5mcCuWNZaaVskL5zil4yFJ05o9W8E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZ2bW1K52tm+4PzHhhnoBKgkZi6hvRmcqtdONrYofXNg6lskXVYv8+7aOiOhttJeCqHpSUbGCAWPyp6/UoG976qAXFdjSrI8JLRjC0J+XtNr/N3g4JVerK1mdEyhzoKLYAbULlYe8VrPeSKM49kYoHLMvKfRs+8O4/T2XOx/328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKvL05YA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKvL05YA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739769706; x=1771305706;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BGDVHFcOkaWjQy5mcCuWNZaaVskL5zil4yFJ05o9W8E=;
  b=VKvL05YAwjET5jjiWe/g6c+eD/XhgLcpn64GKIFxbqWS150prK2J4W3A
   EAJfXEkZhz2GhRkRXQyFA4CD9D+q/RN83KE7xAY5N/1pR4HUBTs6yBhfc
   PieqGpiGDGyJoNnfkbsQFV2HMaFaR17HE/8YyE1gHW0ApEc3JZ2FFu91u
   HHB+ofyJEWEJs8cFXd5yFTJ4WJH8Tq5B+mMQJX3jYBC1ZHr21g/p36AYj
   rpwcLegoGU0enxC+23Qi06wwc62X0VCtUvgmSqgdkOuuMbr7XwzJwD9tf
   y4BaWo5INGmg3G/23jklNvtcC8kjYBGK4w3YvEzlTHAg5aGAkUadqDwIN
   g==;
X-CSE-ConnectionGUID: 1Hgc0ZZHQXqH3/VYOzhy+w==
X-CSE-MsgGUID: OwaGsK40TnaGrQngkdzo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40470740"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="40470740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 21:21:45 -0800
X-CSE-ConnectionGUID: ARqp8wlDSoGXznwJTiumlg==
X-CSE-MsgGUID: 1FQrAPN/RGi/LUozTRlBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144936208"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2025 21:21:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjtZd-001Ccl-2r;
	Mon, 17 Feb 2025 05:21:41 +0000
Date: Mon, 17 Feb 2025 13:21:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:pr/56 1/1]
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:209:1: warning: no previous
 prototype for function 'tu102_gr_load'
Message-ID: <202502171359.So8C9T7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: bdaf834ae86c822c52c0c9bfc95fe6ed7771981f [1/1] drm/nouveau/gr/tu102-: use sw_veid_bundle_init from firmware
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250217/202502171359.So8C9T7G-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171359.So8C9T7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171359.So8C9T7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h:27:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h:27:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h:27:
   In file included from drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:209:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
     209 | tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
         | ^
   drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:208:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     208 | int
         | ^
         | static 
   18 warnings generated.


vim +/tu102_gr_load +209 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c

   207	
   208	int
 > 209	tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
   210	{
   211		int ret;
   212	
   213		ret = gm200_gr_load(gr, ver, fwif);
   214		if (ret)
   215			return ret;
   216	
   217		return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, tu102_gr_av_to_init_veid,
   218					 &gr->bundle_veid);
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
