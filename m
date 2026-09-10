Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A74A6CEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055019; cv=none; b=oOqqhqf/FRGIPuPrWKgpylWyhu086eCxPgMuvW4rYg1oqMt3GUUFWsFOQblWkjoLaLOTyi8TwjFKjD9LICwWBlOWf2HK6A0FqkjQ4R6GDMSWdFrjsv795m8JsidpNMIpi22+I6B0WoK2JZApsrfSyo63+8vse1It/g6QGXmrx2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055019; c=relaxed/simple;
	bh=5P2jzA5UZkBsomcq5bHV593HrYG61GtysrVHIr93b5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZLeqy+ahLOWLWS/kWCBzIV7Rq6nvToAuA+pIcpSR9HecmTVIfSqKiVck65DOjzTu/W7QVvDyVAGj/3AiGJTO5BSrHpEFPPAuA9W9XxnMltk2w8hp9I9hnq+bLc5Rumgvxl3D92kbRJDaBWo8NX5rIlHsH8eQGOsal2jsWRPFxGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyZPyP4Q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyZPyP4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055017; x=1820591017;
  h=date:from:to:cc:subject:message-id;
  bh=5P2jzA5UZkBsomcq5bHV593HrYG61GtysrVHIr93b5U=;
  b=HyZPyP4QDWmvDY9Q2gKBHh+D8dhyuht/LzgUnCVMWJpbek0TbiWDsPAg
   PUXhmqXb2J0o/52UkiRuuR40oi6LMmzRw89HhzRu6tv8DgNPuLXOTYVm0
   Xl3gy14N6zUUqon2Xuf9UvEClWOAD/JFctV0B2eBZW3ndH1ltE5nZZMBn
   tEGYuNmhsskpLgy+EscapV/2gfp4Bobw/EQulrzsMcnawb3wXY7Fzr2oJ
   L/RgHG1idhGIzrq9jQ62Y1q+VeUgSn/2lBmgL5ffrOEHEbkkj+vxOsTYs
   +qs4jCx4cBdwh6VVUjeQBLR2Hq1wB00SJTmwaCxYJjbYQkWBghuw43TP+
   Q==;
X-CSE-ConnectionGUID: g9I+/sW+T56B/3yUMMbJNQ==
X-CSE-MsgGUID: oBd5GHiYQ7S7la/bmoYXpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112280562"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112280562"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:33 -0700
X-CSE-ConnectionGUID: FExfs9QnR7i08oPefr3OtA==
X-CSE-MsgGUID: nSJnzOXAT72Nr14sKowNOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295152011"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvy-000000000RZ-0F9H;
	Thu, 10 Sep 2026 15:43:30 +0000
Date: Thu, 10 Sep 2026 17:42:35 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 226/294]
 drivers/mtd/spi-nor/core.c:1178:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202609101040.gBAHTWoN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 62e3b560c8fdcab6be5dce819f3b76df95cd95dc [226/294] mtd: spi-nor: remove controller_ops support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101040.gBAHTWoN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101040.gBAHTWoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101040.gBAHTWoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c:351:6: warning: unused variable 'ret' [-Wunused-variable]
     351 |         int ret;
         |             ^~~
>> drivers/mtd/spi-nor/core.c:1178:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1178 |         if (!spi_nor_use_parallel_locking(nor))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1184:9: note: uninitialized use occurs here
    1184 |         return ret;
         |                ^~~
   drivers/mtd/spi-nor/core.c:1178:2: note: remove the 'if' if its condition is always false
    1178 |         if (!spi_nor_use_parallel_locking(nor))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1179 |                 mutex_lock(&nor->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    1180 |         else
         |         ~~~~
    1181 |                 ret = wait_event_killable(nor->rww.wait,
   drivers/mtd/spi-nor/core.c:1176:9: note: initialize the variable 'ret' to silence this warning
    1176 |         int ret;
         |                ^
         |                 = 0
   drivers/mtd/spi-nor/core.c:1242:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1242 |         if (!spi_nor_use_parallel_locking(nor))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1248:9: note: uninitialized use occurs here
    1248 |         return ret;
         |                ^~~
   drivers/mtd/spi-nor/core.c:1242:2: note: remove the 'if' if its condition is always false
    1242 |         if (!spi_nor_use_parallel_locking(nor))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1243 |                 mutex_lock(&nor->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    1244 |         else
         |         ~~~~
    1245 |                 ret = wait_event_killable(nor->rww.wait,
   drivers/mtd/spi-nor/core.c:1240:9: note: initialize the variable 'ret' to silence this warning
    1240 |         int ret;
         |                ^
         |                 = 0
   drivers/mtd/spi-nor/core.c:1309:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1309 |         if (!spi_nor_use_parallel_locking(nor))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1315:9: note: uninitialized use occurs here
    1315 |         return ret;
         |                ^~~
   drivers/mtd/spi-nor/core.c:1309:2: note: remove the 'if' if its condition is always false
    1309 |         if (!spi_nor_use_parallel_locking(nor))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1310 |                 mutex_lock(&nor->lock);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    1311 |         else
         |         ~~~~
    1312 |                 ret = wait_event_killable(nor->rww.wait,
   drivers/mtd/spi-nor/core.c:1307:9: note: initialize the variable 'ret' to silence this warning
    1307 |         int ret;
         |                ^
         |                 = 0
   drivers/mtd/spi-nor/core.c:1333:6: warning: unused variable 'i' [-Wunused-variable]
    1333 |         int i;
         |             ^
   drivers/mtd/spi-nor/core.c:2579:6: warning: unused variable 'ignored_mask' [-Wunused-variable]
    2579 |         u32 ignored_mask, shared_mask;
         |             ^~~~~~~~~~~~
   6 warnings generated.


vim +1178 drivers/mtd/spi-nor/core.c

74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1173  
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1174  int spi_nor_prep_and_lock(struct spi_nor *nor)
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1175  {
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1176  	int ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1177  
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28 @1178  	if (!spi_nor_use_parallel_locking(nor))
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1179  		mutex_lock(&nor->lock);
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1180  	else
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1181  		ret = wait_event_killable(nor->rww.wait,
74df43b3f626a3 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1182  					  spi_nor_rww_start_exclusive(nor));
c154dbd28003d8 drivers/mtd/spi-nor/core.c    Miquel Raynal 2023-03-28  1183  
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1184  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1185  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie  2014-02-24  1186  

:::::: The code at line 1178 was first introduced by commit
:::::: 74df43b3f626a3594a4de50556048852bf2753f7 mtd: spi-nor: Enhance locking to support reads while writes

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
