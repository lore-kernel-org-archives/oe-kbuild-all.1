Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E792EA168
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765223045; cv=none; b=mC7ZsppVcmebq68vmbmfF4Q/KglpWTVon1q0AW8EogiTRY9fa02wfQtvj55whDjfcEcdgaHJoWKCMci+VTSumW6p/KzgIcQn/PjIvm3XXC51JEe4jUMzAuF3mpVyPRQbgCkLMJyOLBcKw4cBBfK4upP5+p3cYC3PRO6IeMCO4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765223045; c=relaxed/simple;
	bh=wcMnMtK161kIDworbzGp6TgxmSb4xyAnFrgCUDSvOEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om8NnorOIRbJUFFws8k+0UBSVByG057S/pGXBAva7nYB+dfix0g2Dqa4GvNbAApW5XV8KKtw+8Smk04PlhB5ZPa8dvTqFDQRYdF43FARzrI7t1EpnbwpzN6mXwzAv2mbyCUnsDrkAfNEdYlKNvj6anQyQdKo/5u2s7zuagrmbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkjeCejD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkjeCejD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765223043; x=1796759043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wcMnMtK161kIDworbzGp6TgxmSb4xyAnFrgCUDSvOEQ=;
  b=XkjeCejD9rXt+/G/Ub8leD0ieyih3rIVv63VzUTEGNxQNEYKRHJpwEAi
   /g9Nz1nL4wzs/TRrkgY64LwJfTwoQ1zMMbOYkisXGKgGdGfIOiS1rTP04
   v9kMD5vP6kNem4fc3hB7tJRJSUaJK/3vDEJ7dSzvDaZp9WIoz6DqsvY1T
   GPPUDOd0+hwOh2q5P8jESVVS6Lox85xZXpdiIXqa3MO6fh7iRJS4qKEVr
   B3ynD1fTzsA5TIJdq5bADz89wO4vvZVMdTVJWVf2mz4QLndjT8/ZyJNCu
   nr+xovtnQDt8ruXYU+wnxUl5CPAFbgsvFBLlERn5PlByRF0GYdcABZQ6+
   w==;
X-CSE-ConnectionGUID: Q2BAn6SDTNeS40AFnKmZvg==
X-CSE-MsgGUID: zsAjCtoyR9GICbnjdeMdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54714106"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="54714106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:44:03 -0800
X-CSE-ConnectionGUID: YIF/7oclRyuxtqCQCitc+g==
X-CSE-MsgGUID: W+YiVbniQH2zNkOY6n5lmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195921749"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2025 11:44:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSh9K-000000000ml-0vvU;
	Mon, 08 Dec 2025 19:43:58 +0000
Date: Tue, 9 Dec 2025 03:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ahmed Naseef <naseefkm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Message-ID: <202512090327.X5PXotX9-lkp@intel.com>
References: <20251207150923.86328-1-naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207150923.86328-1-naseefkm@gmail.com>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master next-20251208]
[cannot apply to v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Naseef/mtd-spinand-add-support-for-Dosilicon-DS35Q1GA-DS35M1GA/20251207-232019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20251207150923.86328-1-naseefkm%40gmail.com
patch subject: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251209/202512090327.X5PXotX9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090327.X5PXotX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090327.X5PXotX9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/dosilicon.c:8:
   drivers/mtd/nand/spi/dosilicon.c:13:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X4_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:14:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X2_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP'? [-Werror=implicit-function-declaration]
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:15:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'read_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'read_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:17: error: implicit declaration of function 'SPINAND_PROG_LOAD_X4'; did you mean 'SPINAND_CMD_PROG_LOAD_X4'? [-Werror=implicit-function-declaration]
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:20:17: error: implicit declaration of function 'SPINAND_PROG_LOAD' [-Werror=implicit-function-declaration]
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'write_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'write_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'update_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'update_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from dosilicon.c:8:
   dosilicon.c:13:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X4_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   dosilicon.c:14:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X2_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP'? [-Werror=implicit-function-declaration]
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   dosilicon.c:15:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'read_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'read_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   dosilicon.c:19:17: error: implicit declaration of function 'SPINAND_PROG_LOAD_X4'; did you mean 'SPINAND_CMD_PROG_LOAD_X4'? [-Werror=implicit-function-declaration]
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   dosilicon.c:20:17: error: implicit declaration of function 'SPINAND_PROG_LOAD' [-Werror=implicit-function-declaration]
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'write_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'write_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'update_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'update_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +389 include/linux/mtd/spinand.h

7529df4652482c Peter Pan 2018-06-22  386  
7529df4652482c Peter Pan 2018-06-22  387  #define SPINAND_OP_VARIANTS(name, ...)					\
7529df4652482c Peter Pan 2018-06-22  388  	const struct spinand_op_variants name = {			\
7529df4652482c Peter Pan 2018-06-22 @389  		.ops = (struct spi_mem_op[]) { __VA_ARGS__ },		\
7529df4652482c Peter Pan 2018-06-22  390  		.nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /	\
7529df4652482c Peter Pan 2018-06-22  391  			sizeof(struct spi_mem_op),			\
7529df4652482c Peter Pan 2018-06-22  392  	}
7529df4652482c Peter Pan 2018-06-22  393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
