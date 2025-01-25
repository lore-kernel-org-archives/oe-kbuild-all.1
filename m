Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C284A94A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737819679; cv=none; b=kM8DM5Qt6O8h49I2K4xuDIG/s/QbjH8UqzB9q1eTKLDUsI3fWN8Tyifq5QJLAHujGFszBoJOO0jXXguBUgDVGZvIDAOEj6BFGF/7Fjj8RrXCKchq6PkIx2zKlQLeT98rCCvHuWcS1jb7aYSbUV9KTGnDXgMy8JqJWv7VphlkDJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737819679; c=relaxed/simple;
	bh=z1BpfbLGIog6912UK9rU811qewzM9CwXtxZJy1GaOUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdbPc5bZQVUr2Ef7nZDeQOMT3xRZeRzMRF1PoNBijNHC8CfzsT18v6r3V5Cayj0HDNejQFaYOiA0NG0YmanFulne1w8RZNKSNvXyvrt3CdRWwUSf6LybFvk+Mv4q5rfpDKfk15fx3MfzNRzq+S+S95WKXibmWW3bhszle9ZI9Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9suWCL1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9suWCL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737819678; x=1769355678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1BpfbLGIog6912UK9rU811qewzM9CwXtxZJy1GaOUs=;
  b=j9suWCL13Wv5PFLJyeRMs82XtpDCdX9Sgfbi+52YdSDlJTF76x1kBsp/
   +JXi8gi/bBsr9/dUv49wvmckevrWKhsMTvh3W+Dd228EhLn/CgePj6wGr
   PfGP36WLGJ9OTGzYjuVM4MBiHTvLoUr8TxiIK67JpHxYWh6hRyASzyWM6
   Aryusl9IqXuCSmWz8hYBoEQn9YxpnZ8La8dI1f2x/eieBXT3EJBovycdh
   Nn9SGUBbWGQxCDrIdxW5i2png2uCttDAefD1n3JwW7ggOXT3RZbmt18mT
   BropOFTt8vTI/hRQTOOYgMXb14zCMZDfegAQZAUjY8KQlGLH7LhzSlRG9
   Q==;
X-CSE-ConnectionGUID: lyUSai1uR6GaguvNTd0KBA==
X-CSE-MsgGUID: fSeeg8ohSTS8esZIVz/Tvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42270225"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42270225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 07:41:16 -0800
X-CSE-ConnectionGUID: L5GCszIbToq0oXTPa0UGzQ==
X-CSE-MsgGUID: DHx0lVJoS42Sd5qUPyJ66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107832475"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2025 07:41:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbiHZ-000dy1-0r;
	Sat, 25 Jan 2025 15:41:13 +0000
Date: Sat, 25 Jan 2025 23:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 6/6] drivers/media/i2c/lt6911uxe.c:653:36:
 warning: unused variable 'lt6911uxe_acpi_ids'
Message-ID: <202501252313.tBa4XXxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zouxiaoh,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   f90d04942b56016c8b10b96b7ee22e548ecf24cf
commit: 60faa2ac3cc3bdb592073362d055de589b87e0ff [6/6] media: i2c: add support for ar0234 and lt6911uxe
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501252313.tBa4XXxn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252313.tBa4XXxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252313.tBa4XXxn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/lt6911uxe.c:8:
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
   In file included from drivers/media/i2c/lt6911uxe.c:8:
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
   In file included from drivers/media/i2c/lt6911uxe.c:8:
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
   drivers/media/i2c/lt6911uxe.c:213:30: warning: variable 'fps' is uninitialized when used here [-Wuninitialized]
     213 |                 lt6911uxe->cur_mode->fps = fps;
         |                                            ^~~
   drivers/media/i2c/lt6911uxe.c:177:32: note: initialize the variable 'fps' to silence this warning
     177 |         u64 byte_clock, pixel_clk, fps, lanes;
         |                                       ^
         |                                        = 0
>> drivers/media/i2c/lt6911uxe.c:653:36: warning: unused variable 'lt6911uxe_acpi_ids' [-Wunused-const-variable]
     653 | static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/lt6911uxe_acpi_ids +653 drivers/media/i2c/lt6911uxe.c

5f626592a87f58 Dongcheng Yan 2024-06-03  652  
5f626592a87f58 Dongcheng Yan 2024-06-03 @653  static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
5f626592a87f58 Dongcheng Yan 2024-06-03  654  	{"INTC10C5"},
5f626592a87f58 Dongcheng Yan 2024-06-03  655  	{}
5f626592a87f58 Dongcheng Yan 2024-06-03  656  };
5f626592a87f58 Dongcheng Yan 2024-06-03  657  MODULE_DEVICE_TABLE(acpi, lt6911uxe_acpi_ids);
5f626592a87f58 Dongcheng Yan 2024-06-03  658  

:::::: The code at line 653 was first introduced by commit
:::::: 5f626592a87f5800a993b17223d3c4b45103a9f8 media: i2c: add support for lt6911uxe

:::::: TO: Dongcheng Yan <dongcheng.yan@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
