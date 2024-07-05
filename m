Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B387F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720138407; cv=none; b=RgvY07if/3lxN3uEC39fgQ1wXEDvxqy8R+SYgK/1/32khCKCEfMNtw9TTHqtwCz31C4p8zlh4kCyy1WaCZbHRR9k5S6+FsfEFM7lqdJZ6VFSl2dbrh9G8VcTL6fMnG8karUXVmnKJY6Xy40B94ok4g6+S/zcYuMyx5sIl/50/DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720138407; c=relaxed/simple;
	bh=sc5NJgBW5EjQBg5XYpka2PJnrxJ3qfjBEDQWtGXzQMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUY6CL3FTaOblA9d2W1WN6SoM+wUBqC65seCld/bzfjvlReasaPHgitdolOii0A1F/CvuJfIpzzLRgz867nkHywaMmM1h0Nf5TybEO3o0cUvtrxiu+ayf4vNaFLSWxhgi1mpFzea3ZEGw9vElhfuKgu4pFXA90SAjCi4w2FO58I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhWPYEDe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhWPYEDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720138404; x=1751674404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sc5NJgBW5EjQBg5XYpka2PJnrxJ3qfjBEDQWtGXzQMg=;
  b=LhWPYEDePeV3HIm8y8Y0nEHjWFvNw3iTo9APYOJMnzJMUWRKQLkvzA2R
   bOAdi7ashVZzlHtmXI4bskM5XphfbLOyMJiwxsG6q1J9FD+vcsNeVuQ3g
   F1XWqOhSaw6UhGfq6ivgocXf9zq3LH29D71NKHeCjzyKi39ytjqDM6w5n
   bdNSPSHUOOP1pLG98Bu7GaMNMOUaAtEAlb4PaVnm0yp4qnXsMSdn9PxjR
   qlmSD1RDqBwPHXippmO1CCYH8K5ydwKqJfSgIKTDnyBT61AM5xsf/Tw5R
   5zaphzpq1s3S34rdmjHDIEOwRiGsbnrjFUpl0o7VO8KGYw5o8vgtCb3VP
   g==;
X-CSE-ConnectionGUID: AFjawBHGQ6ubO9tVXBDdjQ==
X-CSE-MsgGUID: go9Ln8BuScu2mRlUNtj52w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17375763"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17375763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 17:13:24 -0700
X-CSE-ConnectionGUID: 3Y/omSRQQUqlpisp6lsdDQ==
X-CSE-MsgGUID: jQ5Q38obSumuIoBIWtNa5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51903407"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 17:13:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPWZk-000Rfr-1D;
	Fri, 05 Jul 2024 00:13:20 +0000
Date: Fri, 5 Jul 2024 08:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:v6.10/sensors/vcmipi 25/26]
 drivers/media/i2c/vc-mipi.c:249:34: warning: unused variable
 'vc_mipi_dt_ids'
Message-ID: <202407050820.yN0umohu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git v6.10/sensors/vcmipi
head:   640ca9ab4c7f9a40ca0dd31f35da79aa556934b1
commit: 23cad4d844a6e921c1a545cd164c81b6f3f720d7 [25/26] media: i2c: vc-mipi: Move from .probe_new() to .probe()
config: hexagon-randconfig-r131-20240705 (https://download.01.org/0day-ci/archive/20240705/202407050820.yN0umohu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407050820.yN0umohu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050820.yN0umohu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/vc-mipi.c:11:
   In file included from include/linux/i2c.h:19:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/i2c/vc-mipi.c:11:
   In file included from include/linux/i2c.h:19:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/i2c/vc-mipi.c:11:
   In file included from include/linux/i2c.h:19:
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/i2c/vc-mipi.c:249:34: warning: unused variable 'vc_mipi_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id vc_mipi_dt_ids[] = {
                                    ^
   7 warnings generated.


vim +/vc_mipi_dt_ids +249 drivers/media/i2c/vc-mipi.c

b957292a9dc621 Laurent Pinchart 2021-04-05  248  
b957292a9dc621 Laurent Pinchart 2021-04-05 @249  static const struct of_device_id vc_mipi_dt_ids[] = {
b957292a9dc621 Laurent Pinchart 2021-04-05  250  	{ .compatible = "vision-components,mipi-module" },
b957292a9dc621 Laurent Pinchart 2021-04-05  251  	{},
b957292a9dc621 Laurent Pinchart 2021-04-05  252  };
b957292a9dc621 Laurent Pinchart 2021-04-05  253  MODULE_DEVICE_TABLE(of, vc_mipi_dt_ids);
b957292a9dc621 Laurent Pinchart 2021-04-05  254  

:::::: The code at line 249 was first introduced by commit
:::::: b957292a9dc621b0c79cff201030e4bf0c77cd1c media: i2c: Add driver for Vision Components MIPI modules

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
