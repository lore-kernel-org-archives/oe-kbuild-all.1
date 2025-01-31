Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD511F1512
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350235; cv=none; b=ad9SHrrw0f/NhfbttRx1lC/QtLJyXMPe/Ypw90J1FJmjaAmdjoa+81v6Air1k5S37GR+B6NXqWY+PnSe+ciZL973zs7Dih4bQh/L5yssraM1mQgRILOOOqflAUXkGXPhpxSTom/iXSDaqtRLF8sZDlgqLHOccSYt1WpHJpmPkEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350235; c=relaxed/simple;
	bh=Y7SvQ9ZhqsWQdqHqb4GLO4vDQodA0zmIt5o/Y79rhdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a2j6HIV4nJJ/mQ/2NUg36ZEHBXurfYgXG+76aiYuxNc0iFAavg08N0BtBJbD/1Yh0JI86btl65wRv/8wSqU9OW62s10v32HBIQi1NOPMKd8b2cjPc3q/RFqee+lcPqhF63Epi63qaqZiNYlR33RfoHfM7ybKv91HnQHZJcJnPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAYBfR6Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAYBfR6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738350234; x=1769886234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7SvQ9ZhqsWQdqHqb4GLO4vDQodA0zmIt5o/Y79rhdE=;
  b=BAYBfR6Z6l2ziMCbS5MrZZoz+YFrlpTG116D3CTz8tOQ/mqOa1rACR38
   Z7TVLVRmoy2mYb4a0+TD4fAuu0HsIeAtVcu/uL7hQIKNY6Sjyqy3CdpV7
   1rT+AXSa9dLwiW4btqZ6DudhhgbsTITe/aMfS4+Fy9z+ceZVg4jstBtdo
   fohFww/fU/N1OJFEJn0GcUTJorXMZTIAt4wO1qJhrhFiv8mToQw3fsr+A
   WP2EiTW3v5rZWA168S6mR2CLYECWhgzTGmQN6VML1IH93uD+uMcFH+Ipj
   KBx7kF40sv61I7oeRIvpDBc7OmBkCinMwRd5cs5W8xrLfKDgSA1OZiwEy
   g==;
X-CSE-ConnectionGUID: TH0mXxiNTV+LONQTi5swLA==
X-CSE-MsgGUID: m55Hi4m7QRGJUeG8f/bHRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39030080"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39030080"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:03:52 -0800
X-CSE-ConnectionGUID: p9zPORKsRieb1vAsyIVk/g==
X-CSE-MsgGUID: qCxtrj6cRAi8X9aS2qKz9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="114703488"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jan 2025 11:03:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdwIu-000mlZ-1x;
	Fri, 31 Jan 2025 19:03:48 +0000
Date: Sat, 1 Feb 2025 03:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Craviee <dcraviee@internships.antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 10/15]
 drivers/mtd/spi-nor/litex-spiflash.c:305:22: error: initialization of 'int
 (*)(struct spi_nor *, u8,  const u8 *, size_t)' {aka 'int (*)(struct spi_nor
 *, unsigned char,  const unsigned char *, long unsigned int)'} from
 incompatible pointer type 'ssize_t ...
Message-ID: <202502010231.oCcZi29N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   d063b9bfd84d4ae32eaa664cd7b8906d1e5a4265
commit: 3d002d5d735d84642819be0fbf1ae715f4b1aac4 [10/15] LiteX: driver for SPI Flash (mtd) device
config: arm64-randconfig-003-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010231.oCcZi29N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010231.oCcZi29N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010231.oCcZi29N-lkp@intel.com/

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
