Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D4B199E89
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980063; cv=none; b=fOgJxKhj4sYjLl7afOJwWMu+BRDyQuR/5aHRF7+lRtAAjG3iLNay1zlwf5ZMj473Nx/Nhk9n5J140HM9bTPqPbwmveq4JXmnzzIOXZZh7DXKSIVUskENqzj53c+AtaKVDjtEXoTxUO9ZsARfNHcnSlJYSNi/AYd0nUPAN9jxPFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980063; c=relaxed/simple;
	bh=tkpwkhuJhEc84lESTx6UybnhZUcYb7OK8/a1UShnA24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f4DIvi9+kUT6BC4tE/OggOlIITCaFMf9mxNmljjTe7o+LSlg6yZ5F3MyLZzqrL7gKVpdsxgyELfzmWW3c4pOlrl5qq2SdUaucsrrrVn+UkDOfYIi81iExFEX9U/C+HEowvtiMgm465TuvGHLb/XVW9NxDIqjTuBImbRQPJ0nvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTppXT05; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTppXT05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783980061; x=1815516061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkpwkhuJhEc84lESTx6UybnhZUcYb7OK8/a1UShnA24=;
  b=GTppXT05jgDx5sCb/WQ3cjZoibiFfblm8RRy5gmo0fYk36P7nYqaj/RV
   yDiPm4xVGDXUMS4sCtx41voi8wQAUBuV7Ba7nnNFcPFqnGdp9Znl+n7rD
   XR7ZM1VB+uVMwgRiOsCTpL7tHWxo/pcTzpdvcCUBGfqBzPsqCrmbIJXny
   hQ6LGVnMh7mqqxk9wtmN/YYVKPseKNCRy0Zz6veCPl2mzB2qUEETyKTjX
   TRHTlSKjiHvLgEDUxXhU3OrzlJUpgV2+47AK/1i54QFRkpduWk+tWhPPn
   WJeXglYHjzGs9z9/u/aDRmUXmR0mS2apUOTsYtfMXIDQNCe08T26gOAJW
   A==;
X-CSE-ConnectionGUID: DDOtSrWQS52xCYkmztJuKA==
X-CSE-MsgGUID: kb2qmIkHTCOwdr77bbskFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84790404"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84790404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 15:01:00 -0700
X-CSE-ConnectionGUID: BiPVebMmTlKlP6a2Ep/eEg==
X-CSE-MsgGUID: 0YblA5iLQcyAOdjpssvuzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278935627"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 15:00:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjOhj-00000000M6L-3NH1;
	Mon, 13 Jul 2026 22:00:50 +0000
Date: Tue, 14 Jul 2026 06:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Max Staudt <max@enpas.org>
Subject: [mkp-scsi:for-next 15/20] drivers/ata/pata_buddha.c:255:63:
 warning: missing braces around initializer
Message-ID: <202607140557.mhC5z0xE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   4afcc9ed6a57b1b87e55366f9ff10c1c43b6d6e8
commit: e73ba3d6ed03bf2afeecdfffc045b1ac98aeb1fc [15/20] scsi: zorro: Simplify storing pointers in device id struct
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607140557.mhC5z0xE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140557.mhC5z0xE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140557.mhC5z0xE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/ata/pata_buddha.c:15:
   include/linux/highmem.h: In function 'clear_user_pages':
   include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not used [-Wunused-but-set-parameter=]
     234 | static inline void clear_user_pages(void *addr, unsigned long vaddr,
         |                                                 ~~~~~~~~~~~~~~^~~~~
   drivers/ata/pata_buddha.c: At top level:
>> drivers/ata/pata_buddha.c:255:63: warning: missing braces around initializer [-Wmissing-braces]
     255 | static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
         |                                                               ^
     256 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA},
         |                                                   {           }
>> drivers/ata/pata_buddha.c:255:63: warning: missing braces around initializer [-Wmissing-braces]
     255 | static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
         |                                                               ^
     256 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA},
         |                                                   {           }
     257 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, BOARD_CATWEASEL},
         |                                                      {              }
>> drivers/ata/pata_buddha.c:255:63: warning: missing braces around initializer [-Wmissing-braces]
     255 | static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
         |                                                               ^
     256 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA},
         |                                                   {           }
     257 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, BOARD_CATWEASEL},
         |                                                      {              }
   drivers/ata/pata_buddha.c: In function 'pata_buddha_late_init':
   drivers/ata/pata_buddha.c:284:59: warning: missing braces around initializer [-Wmissing-braces]
     284 |                 static struct zorro_device_id xsurf_ent = {
         |                                                           ^
     285 |                         ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, BOARD_XSURF
         |                                                                 {
     286 |                 };
         |                 }


vim +255 drivers/ata/pata_buddha.c

740c68a0cd42aab Bartlomiej Zolnierkiewicz 2019-02-07  254  
12ce6b0d21c2038 Max Staudt                2019-08-23 @255  static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
12ce6b0d21c2038 Max Staudt                2019-08-23  256  	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA},
12ce6b0d21c2038 Max Staudt                2019-08-23  257  	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, BOARD_CATWEASEL},
12ce6b0d21c2038 Max Staudt                2019-08-23  258  	{ 0 }
12ce6b0d21c2038 Max Staudt                2019-08-23  259  };
12ce6b0d21c2038 Max Staudt                2019-08-23  260  MODULE_DEVICE_TABLE(zorro, pata_buddha_zorro_tbl);
12ce6b0d21c2038 Max Staudt                2019-08-23  261  

:::::: The code at line 255 was first introduced by commit
:::::: 12ce6b0d21c2038ddae9da418aab198e284ad922 ata/pata_buddha: Probe via modalias instead of initcall

:::::: TO: Max Staudt <max@enpas.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
