Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23721BEF74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737009929; cv=none; b=A8WCjtn76WLPJfkhXmG2J++6qUQ6d+b30XQayG18buPyLWJkewZ3lSt4LZG0Rg4AqJfc8eOcjDJYEHJYZ8IojfC+GyztjHsgptszLXprW/y/+qUXa8+UtmG8WdHGlGqGo5pjj8aJpCel6x2sMZFbwc77rxveGhOkHUWrymnIfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737009929; c=relaxed/simple;
	bh=bsRKFPowDsZHXDXq2VbkPSRWK11tW4IR02nBNxG22T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXP9tjizWsSOKPNANv8Ou3Cpa3r5EmeFSSjN8rTCwJBAxDh09bM0vzpxD7+au3atNWCgQLbWMZrrGpvafKZoTTsdyjEGGoUoW8OLy5PGzD0FjCtu0TVwAuwI8zn+WszGnE+NPwZf9Dc6lzWaqMRbUqP2Sp0ENsxHx9XAGiO0w+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnEQqOIF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnEQqOIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737009921; x=1768545921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bsRKFPowDsZHXDXq2VbkPSRWK11tW4IR02nBNxG22T8=;
  b=lnEQqOIF2gRUZmIDeu24hRkuUrhFCBvcSqq8dY/ZLH0Y0Q8wBgBYDBBf
   yoUgr3f6UJGFsLd+lI6myt8YzBx068ikkOnSOwahGHcTvKTySItihABWx
   77a6RpZSXgU3mDATSv5d2dMAjmMuqgQvoIZzh7lkq2l0fp4A562BXeldN
   ZR9xX6g9j56ntETmHUVWHactc1Mu2s28sALIHHZlpstH9cXHow5Lck6Ua
   Wu7JE+9bkYmga8agjRRhHBMckrOjRuKqg0K7nc+uoy2NlC8mYeMef49zi
   aNCKsUxykNLAHJtLOqy3lu6AOJPiquqFKoL4Q8CZP5VlVQADHWB5OLzHW
   A==;
X-CSE-ConnectionGUID: Y6gPfTQ6RVyP1eKnq5yJQg==
X-CSE-MsgGUID: kGRFXtAmQOe7Zl7RJg2WLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41142756"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="41142756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 22:45:20 -0800
X-CSE-ConnectionGUID: L7qpXg7ISlm2X6vkqn6xbw==
X-CSE-MsgGUID: pqLMBxK9S+G2VaH/Eftxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110020638"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2025 22:45:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYJcw-000RUb-2S;
	Thu, 16 Jan 2025 06:45:14 +0000
Date: Thu, 16 Jan 2025 14:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mtd:nand/next 4/9] include/linux/stddef.h:8:14: error:
 initialization of 'unsigned int' from 'void *' makes integer from pointer
 without a cast
Message-ID: <202501161425.HP2gFUF3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   be7a05db4252edbffb43484b14755048fb8db710
commit: 7ce0d16d5802bfde4209e52ee8ad644ca1eab423 [4/9] mtd: spinand: Add an optional frequency to read from cache macros
config: sparc-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250116/202501161425.HP2gFUF3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501161425.HP2gFUF3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501161425.HP2gFUF3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/skyhigh.c:11:
>> include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[4].data.nbytes')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                             ^~~~
>> drivers/mtd/nand/spi/skyhigh.c:24:58: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                          ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:58: note: (near initialization for '(anonymous)[4].data.buf.in')
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                          ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[5].data.nbytes')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                              ^~~~
   drivers/mtd/nand/spi/skyhigh.c:25:59: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                           ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:59: note: (near initialization for '(anonymous)[5].data.buf.in')
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                           ^
   include/linux/mtd/spinand.h:307:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     307 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[4].data.nbytes')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                             ^~~~
>> drivers/mtd/nand/spi/skyhigh.c:24:58: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                          ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:58: note: (near initialization for '(anonymous)[4].data.buf.in')
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                                                          ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[5].data.nbytes')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                              ^~~~
   drivers/mtd/nand/spi/skyhigh.c:25:59: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                           ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:59: note: (near initialization for '(anonymous)[5].data.buf.in')
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                                                           ^
   include/linux/mtd/spinand.h:308:55: note: in definition of macro 'SPINAND_OP_VARIANTS'
     308 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
      66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                             \
         |         ^~~~~~~~~~
   include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_DATA_IN'
      69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                     \
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_PAGE_READ_FROM_CACHE_OP'
      25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
