Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CF15D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737824667; cv=none; b=m3ZeEFV8aihFtOm1acPefWs4LhOz8MsRhSR8xG8CSB/UIq/yMChJPhJcwFs13tP+AG5cGJQhpOdDFf8+zjFXFJx6bke5L5kC9lHNkKZeFZEY1KZXkuVcJOj96wZT1O/+EK+8tYqblHs4byc5jXzbmjW+XsIeq9KHtHqJlWEIM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737824667; c=relaxed/simple;
	bh=GDocA1wQ6aP/1HAwf/B8LwnOxrbXKXOodusbNq+Zga8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYRCr3a1JwCTuSPaw8/vjKLddIDgQQ3uU50Onl3iShYEUSx0VVbsS2diqPhLtsUYnu8aK9qlCvDyo5xyJvp7dKo7dA19nenAhUstKwvetsy3HaBGnvTPFxT/qZ2z0bn26JMWpu+o4GeMgoWHjvqHnImgZDH6ccYTeUtUp/LO2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3xKbl4r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3xKbl4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737824666; x=1769360666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDocA1wQ6aP/1HAwf/B8LwnOxrbXKXOodusbNq+Zga8=;
  b=W3xKbl4rT2H4OvfH9RT1V8Ae/Kh4jS55m8SOF5GWPqsGHM+l1ZkT1uym
   fMPRmJTDFROp5YWuUz2ZIWvnth/pKLVlZtlEaeuuoP9uJjPAB6+4fKSeo
   WC9zDG25nUCs/rSxIpk+lKYdIdD5oCwkrj7M3QjZEF/U4iTxtXGDs95BS
   cO9DE0i5UTkTVr7bca2UJVae8YtiHy+u+sE3VztLiz2G+LTEhbSlLBZCt
   oJOrduLl5d2ipsJ+G/YzohYqFx/745VSc3MEzI/sRy4k6sONMCkik1a4A
   ohBEwOpQNtKNAWAbYBSxYLR6pgUvWOjTIJ+g16o8B//9U7Pmbxh30TreJ
   w==;
X-CSE-ConnectionGUID: HrmlGN39Sl6t05onkK7S+Q==
X-CSE-MsgGUID: J9RXM/LQQPKPV2B75zZmtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38230685"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38230685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 09:04:25 -0800
X-CSE-ConnectionGUID: tVV3Yj+sSPeK2tUEohyw1w==
X-CSE-MsgGUID: zF4ifqXlSW6W77Wzy4xmyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112664583"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2025 09:04:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbja1-000e2p-2L;
	Sat, 25 Jan 2025 17:04:21 +0000
Date: Sun, 26 Jan 2025 01:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 6/6] drivers/media/i2c/ar0234.c:1056:36:
 warning: unused variable 'ar0234_acpi_ids'
Message-ID: <202501260017.HJL4Te4h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   f90d04942b56016c8b10b96b7ee22e548ecf24cf
commit: e45b26aff9ad81fcab4d449cc192f6735d2f71ec [6/6] driver: media: i2c: remove useless header file
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250126/202501260017.HJL4Te4h-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260017.HJL4Te4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260017.HJL4Te4h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/ar0234.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/media/i2c/ar0234.c:507:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     507 |                 u64 reg;
         |                 ^
>> drivers/media/i2c/ar0234.c:1056:36: warning: unused variable 'ar0234_acpi_ids' [-Wunused-const-variable]
    1056 | static const struct acpi_device_id ar0234_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~
   8 warnings generated.


vim +/ar0234_acpi_ids +1056 drivers/media/i2c/ar0234.c

f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  1055  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06 @1056  static const struct acpi_device_id ar0234_acpi_ids[] = {
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  1057  	{ "INTC10C0" },
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  1058  	{}
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  1059  };
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  1060  MODULE_DEVICE_TABLE(acpi, ar0234_acpi_ids);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  1061  

:::::: The code at line 1056 was first introduced by commit
:::::: f1d1d3f60e98a58638add566fc500d7ffd9265e8 media: i2c: Add ar0234 camera sensor driver

:::::: TO: Dongcheng Yan <dongcheng.yan@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
