Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98311184
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716230936; cv=none; b=SEf+h6joOqp/es33gPeh+Isznn3w72Qg5+jL4I+1Jph/2nLigW0FUVhXnquEEF5tTjlSnQAhi5quIMvceo/eC+y15upgxce+Wxo38uyE3CqIVjLeH+72eDP/tWy4ORMOVVW9mur6oVUGSJc+ERv1X2Gjan8Oi0g5JC7CpsCjuCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716230936; c=relaxed/simple;
	bh=ZdpxHi/6p7Qubpbjog8JDkZZ0iYML4scbiA0nI4bt3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dO+t0nHrsrYPYgGI9yxyHBJOriKuEJ+Z2CQD3uUcuKS7PMgY2Kat0mbEAwHx8vfsd2Z4RZayxAVOH2jLb0Wr7jUyzBvG9hTL9Vp0sLqpLlQanq05rL6W7fvCcTRRirOJc2NpUsSGgCaW7VphIk8jpx+oUCce11JXl0OaL+WwehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXNIxOLu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXNIxOLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716230934; x=1747766934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdpxHi/6p7Qubpbjog8JDkZZ0iYML4scbiA0nI4bt3M=;
  b=QXNIxOLuUKTmSPuVrj5iNx4Mi2Mmf3h2ymJLts8wR0Ttx0h8yLMYyTiS
   zWgDOpFlX4avXpwUQl2Fr13QqvLfBocBExZLsvDJ33OXFGNak+LqNLg1+
   6U4tWpaqxTMcCh6Cbr6z4IC2z+67W22wGTf0goHKOONjW75TYmbp/dfDW
   jz73oDvoX9g1ZUVvvjOUTrtQ1EY1o1x9PljLeMKEsq63j7lKDE6FWostT
   bG0yMCuIquH15iq2GyT6+DznqIOrS0Iqq13UNAslkFt1O+oEzXXLjwOG0
   0IF/dWVy7q63UAl+1UhQnkrMvadwbsOt/QKdwWFvbG5BetQcVWeIf/Pgj
   A==;
X-CSE-ConnectionGUID: iRtBVOBmTC2YIt2BPHfUJg==
X-CSE-MsgGUID: F5SUAFtpQ4yOSzb2+Aa+jQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16169998"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="16169998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 11:48:54 -0700
X-CSE-ConnectionGUID: Xeh6K5LgRb2oLtHbUuJvMg==
X-CSE-MsgGUID: 6uuOQmqiQFy6FDSQNWCDVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="55862619"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2024 11:48:52 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9841-00054S-1p;
	Mon, 20 May 2024 18:48:49 +0000
Date: Tue, 21 May 2024 02:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 13/13]
 drivers/mtd/nand/spi/macronix.c:13:44: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202405210258.7rahQSvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git macronix/nand-next/spi-nand-cont-read
head:   f60b2d314a9c7534714521dfbeca9cff37134d56
commit: f60b2d314a9c7534714521dfbeca9cff37134d56 [13/13] mtd: spi-nand: macronix: Continuous read support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240521/202405210258.7rahQSvS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210258.7rahQSvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210258.7rahQSvS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/spi/macronix.c: In function 'macronix_get_eccsr':
>> drivers/mtd/nand/spi/macronix.c:13:44: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      13 | #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
         |                                            ^~~~~~~~~
   drivers/mtd/nand/spi/macronix.c:71:26: note: in expansion of macro 'MACRONIX_ECCSR_BF_LAST_PAGE'
      71 |                 *eccsr = MACRONIX_ECCSR_BF_LAST_PAGE(*eccsr);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +13 drivers/mtd/nand/spi/macronix.c

    11	
    12	#define SPINAND_MFR_MACRONIX		0xC2
  > 13	#define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
    14	#define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
    15	#define MACRONIX_CFG_CONT_READ		BIT(2)
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
