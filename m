Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7563DC3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BF5VV5Ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701792350; x=1733328350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khblMDpRCF4GAwiqzwhXExjQ+FUDJ9WY2wZqEacFjMM=;
  b=BF5VV5AgbaaouXT+JxkO5WpDbkr/Y174/B5iqmm4+GCvQcMEbRcJtnWK
   6CoMuwJsKah/bzhfV+QbYHijsOPV9ZxG9OFp4erHO1UE77a2qrRouESp0
   4vneHI88F1UcbYP4BsNZzOC/+W+JsNay6TP2t2neQQv3ESQPoG5W//8rc
   dX615cVZjX3Iujo8gcGqJToZ5I8udIjWNTBaOleXYyN6s/A8bhbpoZ3n+
   tarmmp+JvIaYLHoEKA01e5YEjNljUkcSRV9qWIE2AYYIJZtFung5Lsn7C
   ueCGwG22SHpmlXoTQKpO/gJGcoGhsgTKlMO2KIc0o8hsLMUr/1QUFrGAg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="425071410"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="425071410"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720754062"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="720754062"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 08:05:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAXvb-0009J5-2m;
	Tue, 05 Dec 2023 16:05:43 +0000
Date: Wed, 6 Dec 2023 00:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango 3867/3912]
 drivers/mtd/ubi/nvmem.c:34:9: warning: comparison of distinct pointer types
 ('typeof ((lnum)) *' (aka 'int *') and 'uint64_t *' (aka 'unsigned long long
 *'))
Message-ID: <202312052326.xDul9666-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango
head:   e4b93ab389f818fbe74616c468898e72b2ec8315
commit: 5eb8c881c3d5f2a13a6dea1b5dd5474b66bdf2a6 [3867/3912] mtd: ubi: provide NVMEM layer over UBI volumes
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312052326.xDul9666-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052326.xDul9666-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052326.xDul9666-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/mtd/ubi/nvmem.c:34:9: warning: comparison of distinct pointer types ('typeof ((lnum)) *' (aka 'int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   drivers/mtd/ubi/nvmem.c:34:9: error: incompatible pointer types passing 'int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/mtd/ubi/nvmem.c:34:9: warning: shift count >= width of type [-Wshift-count-overflow]
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   8 warnings and 1 error generated.


vim +34 drivers/mtd/ubi/nvmem.c

    22	
    23	static int ubi_nvmem_reg_read(void *priv, unsigned int from,
    24				      void *val, size_t bytes)
    25	{
    26		int err = 0, lnum = from, offs, bytes_left = bytes, to_read;
    27		struct ubi_nvmem *unv = priv;
    28		struct ubi_volume_desc *desc;
    29	
    30		desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
    31		if (IS_ERR(desc))
    32			return PTR_ERR(desc);
    33	
  > 34		offs = do_div(lnum, unv->usable_leb_size);
    35		while (bytes_left) {
    36			to_read = unv->usable_leb_size - offs;
    37	
    38			if (to_read > bytes_left)
    39				to_read = bytes_left;
    40	
    41			err = ubi_read(desc, lnum, val, offs, to_read);
    42			if (err)
    43				break;
    44	
    45			lnum += 1;
    46			offs = 0;
    47			bytes_left -= to_read;
    48			val += to_read;
    49		}
    50		ubi_close_volume(desc);
    51	
    52		if (err)
    53			return err;
    54	
    55		return bytes_left == 0 ? 0 : -EIO;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
