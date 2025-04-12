Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CA2907
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 19:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744484994; cv=none; b=tz0paGjb/8eDAoUam2l5IVBQyQcOcOBQDA2HHsQRkSZuKecuiBWJ35VpRNrUJfKEeWTzBRTGMjzRBJ/cRcfEWAT5It/9gXf9i6lHvYXqUbRUeYsgy3+3u3kV8lylQuFchPsH0SmixmChIBaFSwdZ3pX7JRI+Y13m2ors9o0bvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744484994; c=relaxed/simple;
	bh=10uDpa9uNk7LZeMy8ifajJ9DUwnYYp2P0r3RFMc2rnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4emrxD2We0Je+s+my8tw0XOX7Y8+TfJN1UtIoFh7WkBDlpOfi0sMCopS5Oo88sLa3FUY0uo/YBVGKakEcdF5mbeaAV7snsXeVF0VD1tebGk+O2mBYgnnp5JqybtjeXt/dkrTl0yrBmdZI71C/KjUb6vmAv2+GhEZGflpChJigE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4aa/TCd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4aa/TCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744484992; x=1776020992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10uDpa9uNk7LZeMy8ifajJ9DUwnYYp2P0r3RFMc2rnM=;
  b=G4aa/TCdkQIm1aocV7TxjuFO1GSqdXDqm+O/bM/0H34FPg8TopTUSFy3
   pX6RgYE40QY5LW3p243AKRHmEKJg0qxSvU6cd/CL2GErRf6Ni8FuVCbm5
   VLgYz9CV4Sut7msvuNOx9lh4bZUTCDZ5YuGHzJpdtHpA9PShk8fp28Jyk
   qcof95lTObvIZPeTnq3pHT/fbvqvyUBY3YPUYu82tD1ni5BXwrHB4NwMI
   UmMb8p3aOv3WB2fZWlFrhZGzyVsoBf9/YZSuBYSwQ1QX03wYiDwhmFivS
   UIUvx+8eS5RJma6fIgTTcmbeuLN/hmhwljBEXCjmLjBjYsKrPpAkhS9dJ
   Q==;
X-CSE-ConnectionGUID: FHAzAPw2QfeEhelF54bkMw==
X-CSE-MsgGUID: ZbUu1zmmRiainDNePaXJjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56189096"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="56189096"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 12:09:52 -0700
X-CSE-ConnectionGUID: IjCchNgERuSmApciOq5SnA==
X-CSE-MsgGUID: w8pvBQ10Sja4VrhRfcBFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="133568826"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Apr 2025 12:09:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3gEe-000C3a-1G;
	Sat, 12 Apr 2025 19:09:48 +0000
Date: Sun, 13 Apr 2025 03:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6633/6651]
 drivers/mtd/nand/spi/core.c:1196:70: error: incompatible pointer to integer
 conversion initializing 'unsigned int' with an expression of type 'u8 *'
 (aka 'unsigned char *')
Message-ID: <202504130234.Bwan7lcm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: 279cd5e7cd74df15b64c4e92c19a2d5dc88cdd26 [6633/6651] drivers: mtd: spinand: Add calibration support for spinand
config: i386-buildonly-randconfig-002-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130234.Bwan7lcm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130234.Bwan7lcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130234.Bwan7lcm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:1196:70: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'u8 *' (aka 'unsigned char *') [-Wint-conversion]
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                                                             ^~~
   include/linux/mtd/spinand.h:69:25: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                       ^~~
   include/linux/spi/spi-mem.h:67:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      67 |                 .nbytes = __nbytes,                             \
         |                           ^~~~~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
>> drivers/mtd/nand/spi/core.c:1196:67: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                                                          ^
   include/linux/mtd/spinand.h:69:30: note: expanded from macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                                            ^~~
   include/linux/spi/spi-mem.h:68:13: note: expanded from macro 'SPI_MEM_OP_DATA_IN'
      68 |                 .buf.in = __buf,                                \
         |                           ^~~~~
   include/linux/spi/spi-mem.h:194:11: note: expanded from macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   drivers/mtd/nand/spi/core.c:1234:37: error: too few arguments to function call, expected 4, have 2
    1234 |         ret = spinand_wait(spinand, &status);
         |               ~~~~~~~~~~~~                 ^
   drivers/mtd/nand/spi/core.c:549:5: note: 'spinand_wait' declared here
     549 | int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
         |     ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     550 |                  unsigned long poll_delay_us, u8 *s)
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/spi/core.c:1193:5: warning: no previous prototype for function 'spinand_cal_read' [-Wmissing-prototypes]
    1193 | int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
         |     ^
   drivers/mtd/nand/spi/core.c:1193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1193 | int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
         | ^
         | static 
   1 warning and 3 errors generated.


vim +1196 drivers/mtd/nand/spi/core.c

  1192	
> 1193	int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
  1194		struct spinand_device *spinand = (struct spinand_device *)priv;
  1195		struct device *dev = &spinand->spimem->spi->dev;
> 1196		struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
  1197		struct nand_pos pos;
  1198		struct nand_page_io_req req;
  1199		u8 status;
  1200		int ret;
  1201	
  1202		if(addrlen != sizeof(struct nand_addr)/sizeof(unsigned int)) {
  1203			dev_err(dev, "Must provide correct addr(length) for spinand calibration\n");
  1204			return -EINVAL;
  1205		}
  1206	
  1207		ret = spinand_reset_op(spinand);
  1208		if (ret)
  1209			return ret;
  1210	
  1211		/* We should store our golden data in first target because
  1212		 * we can't switch target at this moment.
  1213		 */
  1214		pos = (struct nand_pos){
  1215			.target = 0,
  1216			.lun = *addr,
  1217			.plane = *(addr+1),
  1218			.eraseblock = *(addr+2),
  1219			.page = *(addr+3),
  1220		};
  1221	
  1222		req = (struct nand_page_io_req){
  1223			.pos = pos,
  1224			.dataoffs = *(addr+4),
  1225			.datalen = readlen,
  1226			.databuf.in = buf,
  1227			.mode = MTD_OPS_AUTO_OOB,
  1228		};
  1229	
  1230		ret = spinand_load_page_op(spinand, &req);
  1231		if (ret)
  1232			return ret;
  1233	
  1234		ret = spinand_wait(spinand, &status);
  1235		if (ret < 0)
  1236			return ret;
  1237	
  1238		ret = spi_mem_exec_op(spinand->spimem, &op);
  1239	
  1240		return 0;
  1241	}
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
