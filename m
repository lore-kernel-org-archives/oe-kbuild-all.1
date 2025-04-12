Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE21207DFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744486918; cv=none; b=oOvhl+irKafrIqRUQ+nYZH1MY55pjzQ+tt6me/5OvWKFdZ1A8VnsXAoQq6/57/65w5EIs5XFlvL08mcYqaNh8nsgEySQbCNlEtSdC6WhPqPWd0jtSlOPP5d3/NGA53guRcMeUGDFSZpOcFEgUfi226c7MZsdKzsvEgakebk3Kvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744486918; c=relaxed/simple;
	bh=y1BUsqbzLLm+dH051pD0ECrfpRuTP60HFb7ZgLe9HWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouD4J+hQUcIlcPINdxa+abay9DzyYGLq0b8AKTvJU8jm48OCeTVXOVl32E+iCk2e+qDFja2IA19s7sk9ChemrYem1X4FRqjS59TPQZhEolPwBrNm3nivDQ2R1s0serptLzNQHwmf9xiV1HVAY5SElTfbZikigCICtNNl4GMcA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVy+beRG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVy+beRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744486915; x=1776022915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1BUsqbzLLm+dH051pD0ECrfpRuTP60HFb7ZgLe9HWI=;
  b=AVy+beRGfwHTXYiTu3Mu4gDubtJpxwGW0HoCDG/mp+FCPX1uSZSMkUB+
   4vlbrA3PMptYmRR2I0V8oCWYygLg+kxOAvcCNM7gRAGPriEDPjZyRTgUK
   a/YanflGMoJJMQ5JvEclPG9TR1lq0vbB4EKrF/E2RAhdjGBxkS4ly4ud8
   NKRG3qi38k9H0WJygGNd6qK6Ru9gC2UOpUops9qJ1hNpsieNDzlr1v0i6
   eLbDITZf9RmM1IwFQ8Z5fMYCvf/UY2a8dJD9SVRmNvE/9ZB0m/Z7JoWjK
   xYiqLULpJkH+3H/qii0HY9trNPiyqfGDF9fdTi9Cz0tM+rHLbtXtKygui
   w==;
X-CSE-ConnectionGUID: 6ztUS73jQt6f1oqOtMG5lA==
X-CSE-MsgGUID: rlziY5cXS9Sa79KTfikoeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46141569"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="46141569"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 12:41:54 -0700
X-CSE-ConnectionGUID: xhPrRcw/QIOetQAynpD7Ww==
X-CSE-MsgGUID: 5AmOAGGnQz6zMs910kLIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129412598"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2025 12:41:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3gjf-000C50-01;
	Sat, 12 Apr 2025 19:41:51 +0000
Date: Sun, 13 Apr 2025 03:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6633/6651]
 drivers/mtd/nand/spi/core.c:1193:5: warning: no previous prototype for
 'spinand_cal_read'
Message-ID: <202504130344.YKqQ7qnF-lkp@intel.com>
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
config: csky-randconfig-002-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130344.YKqQ7qnF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130344.YKqQ7qnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130344.YKqQ7qnF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:1193:5: warning: no previous prototype for 'spinand_cal_read' [-Wmissing-prototypes]
    1193 | int spinand_cal_read(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen) {
         |     ^~~~~~~~~~~~~~~~
   In file included from include/linux/mtd/spinand.h:17,
                    from drivers/mtd/nand/spi/core.c:16:
   drivers/mtd/nand/spi/core.c: In function 'spinand_cal_read':
>> drivers/mtd/nand/spi/core.c:1196:77: warning: initialization of 'unsigned int' from 'u8 *' {aka 'unsigned char *'} makes integer from pointer without a cast [-Wint-conversion]
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                                                             ^~~
   include/linux/spi/spi-mem.h:194:25: note: in definition of macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1196:32: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1196:77: note: (near initialization for 'op.data.nbytes')
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                                                             ^~~
   include/linux/spi/spi-mem.h:194:25: note: in definition of macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1196:32: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/spi/core.c:1196:74: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                                                          ^
   include/linux/spi/spi-mem.h:194:25: note: in definition of macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1196:32: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1196:74: note: (near initialization for 'op.data.buf.in')
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                                                          ^
   include/linux/spi/spi-mem.h:194:25: note: in definition of macro 'SPI_MEM_OP'
     194 |                 .data = __data,                                 \
         |                         ^~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1196:32: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
    1196 |         struct spi_mem_op op = SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, buf, readlen);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1234:37: warning: passing argument 2 of 'spinand_wait' makes integer from pointer without a cast [-Wint-conversion]
    1234 |         ret = spinand_wait(spinand, &status);
         |                                     ^~~~~~~
         |                                     |
         |                                     u8 * {aka unsigned char *}
   drivers/mtd/nand/spi/core.c:549:64: note: expected 'long unsigned int' but argument is of type 'u8 *' {aka 'unsigned char *'}
     549 | int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
         |                                                  ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1234:15: error: too few arguments to function 'spinand_wait'
    1234 |         ret = spinand_wait(spinand, &status);
         |               ^~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:549:5: note: declared here
     549 | int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
         |     ^~~~~~~~~~~~


vim +/spinand_cal_read +1193 drivers/mtd/nand/spi/core.c

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
