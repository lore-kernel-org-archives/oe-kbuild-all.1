Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38932110A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUiS3yRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700449120; x=1731985120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qOre5cV98TboUIA331GNPbtiZ33V94bGXAwMzlrWkKM=;
  b=HUiS3yRytKpqRRQ1KCwJvlct99zI+F0khAzMqqotqxHl57J8kZlsQmLU
   1zl+L/ZqwXwcENJ+hWESAhB3U4EHfmIuiUkcgLSeT9X+5e/15GgQQpknN
   ln026WgMMLWDvRlTHuHSEJGDtgJocuGU/d4FlngCTuvryjZLo0k+G7EUs
   n5C5EmTy4OOEPfysGfZvRLN/j9mHrwkmf5ZLk+KvV/4iUGrv9zXtJOn2V
   6yM0BbzMFsox9gy/sv9L+DStEbOkJOPDRvSa7Im1aTeEiUsrFFvBEZjqI
   gSg8xR7FrSLvItwpsUYzg2AJE18vdna6nffGsyYXEwZd72F7qQqqNG/Y4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="10206881"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="10206881"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 18:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="769758795"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="769758795"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Nov 2023 18:58:37 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4uUc-0005sO-2h;
	Mon, 20 Nov 2023 02:58:34 +0000
Date: Mon, 20 Nov 2023 10:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [hverkuil-media-tree:for-v6.8d 5/7]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:34: warning: unused
 variable 'wave5_dt_ids'
Message-ID: <202311201055.UI7i5O3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.8d
head:   b17289d8fcd5c5fe59118586256682ffc5d2fbaf
commit: 545a11290786ec1774be878ffc8c2362b1fcccd2 [5/7] media: chips-media: wave5: Add the v4l2 layer
config: hexagon-randconfig-r133-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201055.UI7i5O3C-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201055.UI7i5O3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201055.UI7i5O3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/chips-media/wave5/wave5-vpu.c:12:
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
   In file included from drivers/media/platform/chips-media/wave5/wave5-vpu.c:12:
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
   In file included from drivers/media/platform/chips-media/wave5/wave5-vpu.c:12:
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
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:34: warning: unused variable 'wave5_dt_ids' [-Wunused-const-variable]
     274 | static const struct of_device_id wave5_dt_ids[] = {
         |                                  ^
   7 warnings generated.


vim +/wave5_dt_ids +274 drivers/media/platform/chips-media/wave5/wave5-vpu.c

   273	
 > 274	static const struct of_device_id wave5_dt_ids[] = {
   275		{ .compatible = "ti,k3-j721s2-wave521c", .data = &ti_wave521c_data },
   276		{ /* sentinel */ }
   277	};
   278	MODULE_DEVICE_TABLE(of, wave5_dt_ids);
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
