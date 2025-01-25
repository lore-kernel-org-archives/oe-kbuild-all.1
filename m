Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB9CA4E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737835182; cv=none; b=CTO7Y4p305aQjZtcXuQ0Dcl9+rV4l/pbBCHsX+Pt0xDbIqAYcP1DZ10eLyZYBdXR3jJZ26OGjdbF31TBhi3yySX3g5qdR9Pb3y6FyEjN3wk534hyyXbXsjtE0EjKClpY8j0Y6r+DwOksbz7k1DYhb+gFqUrehq4xTkH9zgWFPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737835182; c=relaxed/simple;
	bh=jobOvMVHk78ieOgfb3HiSIneKJz/AHY/eIdbwcauMv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LclfgTkAa456Lw0LPSwl6I4bKeJDZIS18xn1EBQt8p53BYG3SLiBLvNuMvhM8xdmtKs22XhfodK+NRgWAwHSvsuaz/7307Cf4BfEc2CAMtyRC4lsbjrQx+CNKe67hKB9VOLpjpRxHlMi0ZFQh0ybSlCriDh6cOFlksYE2p346wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvR2swAN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvR2swAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737835181; x=1769371181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jobOvMVHk78ieOgfb3HiSIneKJz/AHY/eIdbwcauMv0=;
  b=GvR2swANiqHk9q/T728AhWar4rL3l6em6HBXcmLlKoYA7Ya9chl8oBh+
   zWib4b23OTqZD/pp3RJhVoswKvBrbAHheGkKFH1NlzR/9sECUQwiGzlZq
   lCd9Q94h9E6j8jWcHwfaV0wUbBq3J54h8AYfYEek0/GXCoqXcCvPtXC7K
   duNbtwycpZL9tLJXXQdX1mf+uBucmB3iqhMxiGjuVmntg7AIMrow7D+2m
   zjzhoX77k/smAddG5iHKKdRiJlg19WqJujcA2YM7rOTYt1Xm980sz0VNE
   M5BbAWDa4Aet8JDKObDBoCTdiXXkOtHZVTQfy4B26JFaMIXzMx2OKwtUf
   A==;
X-CSE-ConnectionGUID: w0AU3NrYQ0OveaQ5MyN+Bg==
X-CSE-MsgGUID: xI9J8m7HS0St7PVbyUbwoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42278011"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42278011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 11:59:40 -0800
X-CSE-ConnectionGUID: nBVaHavVSV6g5PxXdwlIlQ==
X-CSE-MsgGUID: mJiT3PoZTRiNmklVaZ8org==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107863333"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2025 11:59:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbmJd-000eAh-0x;
	Sat, 25 Jan 2025 19:59:37 +0000
Date: Sun, 26 Jan 2025 03:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: linya14x <linx.yang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 6/6] drivers/media/i2c/lt6911uxc.c:688:36:
 warning: unused variable 'lt6911uxc_acpi_ids'
Message-ID: <202501260320.UNdzTOOF-lkp@intel.com>
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
commit: 72072f25fc41b9733ada1e6fac144bf5abbf3417 [6/6] media: i2c: add lt6911uxc driver and enable in ipu-bridge
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250126/202501260320.UNdzTOOF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260320.UNdzTOOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260320.UNdzTOOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/lt6911uxc.c:8:
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
   In file included from drivers/media/i2c/lt6911uxc.c:8:
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
   In file included from drivers/media/i2c/lt6911uxc.c:8:
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
   drivers/media/i2c/lt6911uxc.c:260:30: warning: variable 'fps' is uninitialized when used here [-Wuninitialized]
     260 |                 lt6911uxc->cur_mode->fps = fps;
         |                                            ^~~
   drivers/media/i2c/lt6911uxc.c:193:33: note: initialize the variable 'fps' to silence this warning
     193 |         u64 pixel_clk, is_hdmi_2_0, fps, lanes;
         |                                        ^
         |                                         = 0
   drivers/media/i2c/lt6911uxc.c:166:12: warning: unused function 'lt6911uxc_get_audio_sampling_rate' [-Wunused-function]
     166 | static int lt6911uxc_get_audio_sampling_rate(struct lt6911uxc *lt6911uxc)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911uxc.c:688:36: warning: unused variable 'lt6911uxc_acpi_ids' [-Wunused-const-variable]
     688 | static const struct acpi_device_id lt6911uxc_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
   9 warnings generated.


vim +/lt6911uxc_acpi_ids +688 drivers/media/i2c/lt6911uxc.c

   687	
 > 688	static const struct acpi_device_id lt6911uxc_acpi_ids[] = {
   689		{ "INTC10B1"},
   690		{}
   691	};
   692	MODULE_DEVICE_TABLE(acpi, lt6911uxc_acpi_ids);
   693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
