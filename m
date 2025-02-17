Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C29514D444
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 23:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739834746; cv=none; b=IaS/5yatUUpTP/to07p0UJLN+mk8BRaV3OQErYej9EOxO5+l/Fo9GkQ+05IUzBzsrp8z4xDeWjTExEArgVDNnpwW2GFnz7t+wrcg9MBC8uSnD+heotgiaknL9ta4E2CdpILbPxbgQANyQN+BdHi5foiBGj8st6XuelhYC2E2yYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739834746; c=relaxed/simple;
	bh=ngPAPfzAds4+NIgl+0OventQyq70+25D1Q806xnvxCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STIOHx7uGFRxBe/oVuCgnPox7k0on8KTX7ZRIsC4PzQv/qK+gGjHLWcZmUBSTyl8L3GSampqAM+z5Occ7eyeG0hrBQgNFkqTBs/DtFs5hIR88ZDqNBhL2+//evNJiwJOeWt6vTC/d2FZ22LcdPDfNVP/G7zh45BumuRELJiK7ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUQ+o4sc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUQ+o4sc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739834744; x=1771370744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ngPAPfzAds4+NIgl+0OventQyq70+25D1Q806xnvxCo=;
  b=XUQ+o4scxa5ZIiuTpMcnWw2JDlYaUgi6wAu33CZR5/ok24fDcVILUl37
   RCtKBX/opsvCtc+IfVcVPCrI0SE1w93g5DUHBiL40dOPlB9XF8SOiLKpV
   0IxkGFrDgrlbJ6GxmVxHsLajhgXM2c7h+Vf/oda5lRl4MgUCEkHD6dvZ3
   29Ujafa/1uz7WezSdQpL1RBpR+aHxfds/wlssIDHzzuinEGglkqI0/5SD
   W8XJgy+2qtN7YxK/sGsCdZuvoA0/wslCUyZsJFnOtRYS8rHHG8624ZDvr
   i6ddFAicsH/RPhmgdcvB5SgbZLKh+eSnsL/egdQ2k0kDfcIxlUKX4AxuS
   A==;
X-CSE-ConnectionGUID: AecjvNDkRj61MZyZ/8tyJw==
X-CSE-MsgGUID: 6+a9modBSLi+7/Ld9ElXWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40378716"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40378716"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 15:25:44 -0800
X-CSE-ConnectionGUID: /65fhZ/WToGgqLtuWEdWpw==
X-CSE-MsgGUID: 7LAIJaN0SxyNHMAzZ1r21A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114741467"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2025 15:25:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkAUe-001DgN-1A;
	Mon, 17 Feb 2025 23:25:40 +0000
Date: Tue, 18 Feb 2025 07:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Craviee <dcraviee@internships.antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 10/16]
 drivers/mtd/spi-nor/litex-spiflash.c:305:22: error: initialization of 'int
 (*)(struct spi_nor *, u8,  const u8 *, size_t)' {aka 'int (*)(struct spi_nor
 *, unsigned char,  const unsigned char *, long unsigned int)'} from
 incompatible pointer type 'ssize_t ...
Message-ID: <202502180710.TAUTXL6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   002d8af8626c3eefcd7ad77d3f9b59facdec7e2b
commit: 7cbcc8cd508400e5b564e23a122126a13096c2f7 [10/16] LiteX: driver for SPI Flash (mtd) device
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250218/202502180710.TAUTXL6Q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180710.TAUTXL6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180710.TAUTXL6Q-lkp@intel.com/

Note: the litex-hub/litex-rebase HEAD 002d8af8626c3eefcd7ad77d3f9b59facdec7e2b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/litex-spiflash.c:305:22: error: initialization of 'int (*)(struct spi_nor *, u8,  const u8 *, size_t)' {aka 'int (*)(struct spi_nor *, unsigned char,  const unsigned char *, long unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct spi_nor *, u8,  const u8 *, size_t)' {aka 'long int (*)(struct spi_nor *, unsigned char,  const unsigned char *, long unsigned int)'} [-Wincompatible-pointer-types]
     305 |         .write_reg = spi_flash_nor_write_reg,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/litex-spiflash.c:305:22: note: (near initialization for 'litex_spi_controller_ops.write_reg')


vim +305 drivers/mtd/spi-nor/litex-spiflash.c

   300	
   301	static const struct spi_nor_controller_ops litex_spi_controller_ops = {
   302		.read = spi_flash_nor_read,
   303		.write = spi_flash_nor_write,
   304		.read_reg = spi_flash_nor_read_reg,
 > 305		.write_reg = spi_flash_nor_write_reg,
   306		.erase = spi_flash_nor_erase,
   307	};
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
