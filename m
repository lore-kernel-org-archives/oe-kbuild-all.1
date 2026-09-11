Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B536E466
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114944; cv=none; b=VCji9I6oi7VQLth/zUJhwPZJ0sWlTPIxER4PsTEkxWIQtItajrrxdMvZrDNrZPAotEkquy00QLrbla/osEu/ZjSDtsFhk4rbBUJOlazsfmn9bJNfUbFEmytSOp/MgqTmCeuXV+wcfRo4iewk3na3Ht2icSOwKjhJj9iPt0UKO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114944; c=relaxed/simple;
	bh=xjkrJ7Lwky/xqtsbWxDMavRok7pjROixcgIPJyaqUvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tYTjFItA9VWhPXpcUufshGJGZslrAx67zo6wKD1wBdGwNlp5gmgwnZwDHVQSjdDD/HPbvHUa6ZnFe4myLQ8w+MVlkQSEKozCeDlTEeOq8iO1y4ktO/K3RePbJbhcBQ0BB1vSI4yFjb22GxdsWBY/Ses046P1nHsw23ZuyDFC+2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQGFF43w; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQGFF43w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789114942; x=1820650942;
  h=date:from:to:cc:subject:message-id;
  bh=xjkrJ7Lwky/xqtsbWxDMavRok7pjROixcgIPJyaqUvY=;
  b=RQGFF43wsnoizB5znHq5m1gANIBUMIC/FgkBmUv3K3KF3kC2nAaTmNlz
   Kk5vIB8rVbBC1dvBpgB5iu8LonNyVYhEwXAsV6wKSoFEdQALmndj5fUMa
   daQAe3zwhLxs6FnFBrCpry6GWHLO7/7b7bGKGu6QHvoIxVKGwwv6AnQsc
   iQaaWuq+ZDp9jwZ0OKdDk4vbJLX93nJaCyVlV2wWDr6jB1oHtPv5LgyEe
   S3yhjN+F95VGm2JGIzQfpo13+wRZ5pU+uRH3WDB6jSgzttnqiTdaX/q1W
   MVREIJt3zGtYz9PLaQFbf4fghReoQEWCOvJ4kbXEzqm4w6u42YhROULdE
   w==;
X-CSE-ConnectionGUID: NQ5Rk52ESjy2WCF3VddEpA==
X-CSE-MsgGUID: 0nbAhozsTpaY7DCIu56Glw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89704797"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89704797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:22:13 -0700
X-CSE-ConnectionGUID: HcN+llh/QTCNPSeOjaCskQ==
X-CSE-MsgGUID: y3ZYdl0DS1uNFcWAn8bZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="265662992"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2026 01:22:10 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4wWN-000000000kV-2Vaq;
	Fri, 11 Sep 2026 08:22:07 +0000
Date: Fri, 11 Sep 2026 10:22:04 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 223/295]
 include/linux/spi/spi-mem.h:218:9: error: expected expression before '{'
 token
Message-ID: <202609111051.jJL6JLa1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 775a75095f86749e6b3f0b57e7fe40d03110453d [223/295] mtd: spi-nor: remove controller_ops support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111051.jJL6JLa1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111051.jJL6JLa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111051.jJL6JLa1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mtd/spi-nor.h:11,
                    from drivers/mtd/spi-nor/winbond.c:7:
   drivers/mtd/spi-nor/winbond.c: In function 'winbond_nor_select_die':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   drivers/mtd/spi-nor/winbond.c:22:9: note: in expansion of macro 'SPI_MEM_OP'
      22 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),            \
         |         ^~~~~~~~~~
   drivers/mtd/spi-nor/winbond.c:115:14: note: in expansion of macro 'WINBOND_NOR_SELDIE_OP'
     115 |         op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/winbond.c: In function 'winbond_nor_write_ear':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   drivers/mtd/spi-nor/winbond.c:16:9: note: in expansion of macro 'SPI_MEM_OP'
      16 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),             \
         |         ^~~~~~~~~~
   drivers/mtd/spi-nor/winbond.c:409:14: note: in expansion of macro 'WINBOND_NOR_WREAR_OP'
     409 |         op = WINBOND_NOR_WREAR_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mtd/spi-nor.h:11,
                    from winbond.c:7:
   winbond.c: In function 'winbond_nor_select_die':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   winbond.c:22:9: note: in expansion of macro 'SPI_MEM_OP'
      22 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),            \
         |         ^~~~~~~~~~
   winbond.c:115:14: note: in expansion of macro 'WINBOND_NOR_SELDIE_OP'
     115 |         op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~~
   winbond.c: In function 'winbond_nor_write_ear':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   winbond.c:16:9: note: in expansion of macro 'SPI_MEM_OP'
      16 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),             \
         |         ^~~~~~~~~~
   winbond.c:409:14: note: in expansion of macro 'WINBOND_NOR_WREAR_OP'
     409 |         op = WINBOND_NOR_WREAR_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +218 include/linux/spi/spi-mem.h

c36ff266dc82f4a Boris Brezillon 2018-04-26  216  
0fefeade90e74bc Miquel Raynal   2024-12-24  217  #define SPI_MEM_OP(__cmd, __addr, __dummy, __data, ...)		\
c36ff266dc82f4a Boris Brezillon 2018-04-26 @218  	{							\
c36ff266dc82f4a Boris Brezillon 2018-04-26  219  		.cmd = __cmd,					\
c36ff266dc82f4a Boris Brezillon 2018-04-26  220  		.addr = __addr,					\
c36ff266dc82f4a Boris Brezillon 2018-04-26  221  		.dummy = __dummy,				\
c36ff266dc82f4a Boris Brezillon 2018-04-26  222  		.data = __data,					\
0fefeade90e74bc Miquel Raynal   2024-12-24  223  		__VA_ARGS__					\
c36ff266dc82f4a Boris Brezillon 2018-04-26  224  	}
c36ff266dc82f4a Boris Brezillon 2018-04-26  225  

:::::: The code at line 218 was first introduced by commit
:::::: c36ff266dc82f4ae797a6f3513c6ffa344f7f1c7 spi: Extend the core to ease integration of SPI memory controllers

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
