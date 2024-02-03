Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CDF22067
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706951579; cv=none; b=Tfkzm71yXnPDfT3Y/s03xtn8i8ALZ7SUFePSvkmby/aw/IA8XCChFX7PCaMEANWTaQwT0sse/9oiRtsH2OyPQTy6zklgsJ+Nea5vavqp6mB6AcR5275w97cUJY/bttbxwdYnivF/7+VbpwAvQC5TfeJcbqolODa/nQTtH4qArr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706951579; c=relaxed/simple;
	bh=J+bQhfEkLeJO8/By0N3wrzuUp+rEWhhQV9/87vXotmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9BFX3cxT9Iub/+dXGhdoxcFJ8SiCykG7Oo2OOcVHkVJWxultT5ENTwbKW/z8XD+w0HjjbxoJ8XWoytBs7V3jkEHgSkgLs8+MSwO20Qc66of2FtcqxIJmNZo4A6wdLLUcAugbz/nW3CeCLUMUJRiYB3fKMMmGR7HxfszvaaHVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=il/6uCnL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="il/6uCnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706951577; x=1738487577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+bQhfEkLeJO8/By0N3wrzuUp+rEWhhQV9/87vXotmQ=;
  b=il/6uCnLdv5Zv0iZeBPEUTHAQ4VTr16WOY/ijRk4/CnETiAtWwY+2Xb3
   wONPO3j9qYrR9FpKJydSG/ZabMf+FR6hF2TmBHHabWI5xJHnwWb6kiUhh
   NgrgOW9cgqK8Qs3RUzHDMvnmauMdBgwsQx+TQY5HBSQEmt77WBadUSexC
   /HzhZxhb7SB1+frJdyYf3MPkNabZZck/h2X+rs/vyKoD4ETEfJTiMPYgT
   8t5TNMxHi4QvLDnwZKdv/mRwpD63uKCutf3PRTGrPbVuOjU0i3IucBpQe
   puZhWI3/mZgMoeIVTuliz+8y2zenw1y/5gc59pyJ5XElQ9yDeeOWA6wpV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="208716"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="208716"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 01:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="303111"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2024 01:12:56 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWC4y-0004pq-1b;
	Sat, 03 Feb 2024 09:12:52 +0000
Date: Sat, 3 Feb 2024 17:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 21/52]
 drivers/mtd/chips/map_esp32.c:294:34: warning: unused variable
 'esp32_ipc_flash_match'
Message-ID: <202402031732.RGcjH5t0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: c0f745156db68d8a7002f8ca21af4f92d5f988d2 [21/52] drivers/mtd: add esp32 MTD support
config: hexagon-randconfig-r081-20240203 (https://download.01.org/0day-ci/archive/20240203/202402031732.RGcjH5t0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031732.RGcjH5t0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031732.RGcjH5t0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/chips/map_esp32.c:9:
   In file included from include/linux/mtd/map.h:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mtd/chips/map_esp32.c:9:
   In file included from include/linux/mtd/map.h:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mtd/chips/map_esp32.c:9:
   In file included from include/linux/mtd/map.h:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mtd/chips/map_esp32.c:294:34: warning: unused variable 'esp32_ipc_flash_match' [-Wunused-const-variable]
     294 | static const struct of_device_id esp32_ipc_flash_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   7 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - MTD_ESP32 [=y] && MTD [=y]


vim +/esp32_ipc_flash_match +294 drivers/mtd/chips/map_esp32.c

   293	
 > 294	static const struct of_device_id esp32_ipc_flash_match[] = {
   295		{
   296			.compatible = "esp,esp32-ipc-flash",
   297		}, {},
   298	};
   299	MODULE_DEVICE_TABLE(of, esp32_ipc_flash_match);
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
