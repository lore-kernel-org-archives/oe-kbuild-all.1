Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA93368D5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784071825; cv=none; b=HNC4dZN+c9TZYSuTpst0oSX7Y4B4RMY9paqViB52bILKnD4yNFbsDor+LTS54xSU6C5IVHzS4UD+Z+dDSgFpq8R6UOlxjcNmfSJi2U0ZVuFR6MXIFiuvC9CiWNc2/Lj+NUQiP7N2hudEnNjsGXcjl9a6Lk8CnnJj+6J1D0v1yt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784071825; c=relaxed/simple;
	bh=4Bu4Tb7dt7tzVwOTUARy4v7x4j87vM5f7fdTVHLTOE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D5zz/Y4vvhspD3mgNO9TBp2NgU89XkKaupSEWdrnuwKuKiOA346pPdZFxAxlVy7f1tGXKjkDy1fwkUEJUASWyhqrxg0jqdmQRXM7LH3NJw47BKtGlnP1xULUn5JdvyiBPkZxqfZVP8x4Onn0uslTc/ZbyDq05c+cA9JZUiQzgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ST4BtIpB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ST4BtIpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784071823; x=1815607823;
  h=date:from:to:cc:subject:message-id;
  bh=4Bu4Tb7dt7tzVwOTUARy4v7x4j87vM5f7fdTVHLTOE4=;
  b=ST4BtIpBMHpr9HtD4ox0l3zPqEFaGHoIL3bwu40a1L8wG83TRhKyYQar
   Bef+nSxcvgDWDAL+0Ql5iBEj3ZxKxlyITDU9MGk5Xr4JRGScMvEV4wqXj
   StDdyoGK9/qQCgUdvcuTlHSIBIntacMSDt5Cwl9caoS7IdDnQpF7aAwlX
   hj/J9jzHLtdhc47JKVgjlBy3QMF801eVWh2UZGfSHLtC+F3PDVoCW46F/
   5OOkAx55At8OY9rSfXBoVjcoJ9KnJfHFhDg9JAYaym1V0eG7+P4Dje5/J
   7zpYsTBiqdbyG+CGHrima2T1VzsSRMNnLH6K6SdRhgwmHl4I8NRslHViy
   Q==;
X-CSE-ConnectionGUID: YRplryInSr2xQPYIG7nBLQ==
X-CSE-MsgGUID: Y/k+g+7lQMSKfuDJpTPaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84662551"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="84662551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 16:30:23 -0700
X-CSE-ConnectionGUID: oLiabGWdQ0yQmm+h8Ibt0A==
X-CSE-MsgGUID: CsWBzPblR0K/i7pv/eIBhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="256645056"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Jul 2026 16:30:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjmZr-00000000N7B-0sQr;
	Tue, 14 Jul 2026 23:30:16 +0000
Date: Wed, 15 Jul 2026 07:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6232/6263] drivers/scsi/gvp11.c:444:51:
 warning: missing braces around initializer
Message-ID: <202607150709.CagVDeyK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
commit: 715be7838dd1e961032686bbc71e92fef8397537 [6232/6263] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260715/202607150709.CagVDeyK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607150709.CagVDeyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607150709.CagVDeyK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
     447 |         { ZORRO_PROD_GVP_GFORCE_030_SCSI,       ~0x01ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
     447 |         { ZORRO_PROD_GVP_GFORCE_030_SCSI,       ~0x01ffffff },
         |                                                 {           }
     448 |         { ZORRO_PROD_GVP_A530_SCSI,             ~0x01ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
     447 |         { ZORRO_PROD_GVP_GFORCE_030_SCSI,       ~0x01ffffff },
         |                                                 {           }
     448 |         { ZORRO_PROD_GVP_A530_SCSI,             ~0x01ffffff },
         |                                                 {           }
     449 |         { ZORRO_PROD_GVP_COMBO_030_R4_SCSI,     ~0x01ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
     447 |         { ZORRO_PROD_GVP_GFORCE_030_SCSI,       ~0x01ffffff },
         |                                                 {           }
     448 |         { ZORRO_PROD_GVP_A530_SCSI,             ~0x01ffffff },
         |                                                 {           }
     449 |         { ZORRO_PROD_GVP_COMBO_030_R4_SCSI,     ~0x01ffffff },
         |                                                 {           }
     450 |         { ZORRO_PROD_GVP_A1291,                 ~0x07ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
     447 |         { ZORRO_PROD_GVP_GFORCE_030_SCSI,       ~0x01ffffff },
         |                                                 {           }
     448 |         { ZORRO_PROD_GVP_A530_SCSI,             ~0x01ffffff },
         |                                                 {           }
     449 |         { ZORRO_PROD_GVP_COMBO_030_R4_SCSI,     ~0x01ffffff },
         |                                                 {           }
     450 |         { ZORRO_PROD_GVP_A1291,                 ~0x07ffffff },
         |                                                 {           }
     451 |         { ZORRO_PROD_GVP_GFORCE_040_SCSI_1,     ~0x07ffffff },
         |                                                 {           }
>> drivers/scsi/gvp11.c:444:51: warning: missing braces around initializer [-Wmissing-braces]
     444 | static struct zorro_device_id gvp11_zorro_tbl[] = {
         |                                                   ^
     445 |         { ZORRO_PROD_GVP_COMBO_030_R3_SCSI,     ~0x00ffffff },
         |                                                 {           }
     446 |         { ZORRO_PROD_GVP_SERIES_II,             ~0x00ffffff },
         |                                                 {           }
     447 |         { ZORRO_PROD_GVP_GFORCE_030_SCSI,       ~0x01ffffff },
         |                                                 {           }
     448 |         { ZORRO_PROD_GVP_A530_SCSI,             ~0x01ffffff },
         |                                                 {           }
     449 |         { ZORRO_PROD_GVP_COMBO_030_R4_SCSI,     ~0x01ffffff },
         |                                                 {           }
     450 |         { ZORRO_PROD_GVP_A1291,                 ~0x07ffffff },
         |                                                 {           }
     451 |         { ZORRO_PROD_GVP_GFORCE_040_SCSI_1,     ~0x07ffffff },
         |                                                 {           }


vim +444 drivers/scsi/gvp11.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  437  
c1d288a58936cd Geert Uytterhoeven 2009-08-16  438  	/*
c1d288a58936cd Geert Uytterhoeven 2009-08-16  439  	 * This should (hopefully) be the correct way to identify
c1d288a58936cd Geert Uytterhoeven 2009-08-16  440  	 * all the different GVP SCSI controllers (except for the
c1d288a58936cd Geert Uytterhoeven 2009-08-16  441  	 * SERIES I though).
c1d288a58936cd Geert Uytterhoeven 2009-08-16  442  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  443  
6f039790510fd6 Greg Kroah-Hartman 2012-12-21 @444  static struct zorro_device_id gvp11_zorro_tbl[] = {
c1d288a58936cd Geert Uytterhoeven 2009-08-16  445  	{ ZORRO_PROD_GVP_COMBO_030_R3_SCSI,	~0x00ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  446  	{ ZORRO_PROD_GVP_SERIES_II,		~0x00ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  447  	{ ZORRO_PROD_GVP_GFORCE_030_SCSI,	~0x01ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  448  	{ ZORRO_PROD_GVP_A530_SCSI,		~0x01ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  449  	{ ZORRO_PROD_GVP_COMBO_030_R4_SCSI,	~0x01ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  450  	{ ZORRO_PROD_GVP_A1291,			~0x07ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  451  	{ ZORRO_PROD_GVP_GFORCE_040_SCSI_1,	~0x07ffffff },
c1d288a58936cd Geert Uytterhoeven 2009-08-16  452  	{ 0 }
^1da177e4c3f41 Linus Torvalds     2005-04-16  453  };
c1d288a58936cd Geert Uytterhoeven 2009-08-16  454  MODULE_DEVICE_TABLE(zorro, gvp11_zorro_tbl);
^1da177e4c3f41 Linus Torvalds     2005-04-16  455  

:::::: The code at line 444 was first introduced by commit
:::::: 6f039790510fd630ff348efe8c4802dbaa041fba Drivers: scsi: remove __dev* attributes.

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
