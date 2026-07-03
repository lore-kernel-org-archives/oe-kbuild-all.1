Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF7273D77
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113292; cv=none; b=R8m6jVuMe7IuK1ydckby23qks3ujA7jWeqLtPWUl+iXqXuzCGhpXGUU1LFIinzf+NeHgtGZ7G/xhp9ekkDb6vlyoXNeyY+/uG8+w5JId4MK2vM08A2fMdIaiMmTSMUVwAOrgO6NYdrpHm074Fan5v4qjJVZmygb/JDnm3ZKSxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113292; c=relaxed/simple;
	bh=di74GbLBMQzp94YNIB8R45m6VosHvJxWxwPOUzbK1Vc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fLZVDyv/V3TuMk+jj0xOfP5kXHMbyqprZ4OUD+zMXt6WaglBD2zweazYke6UDIKYcFjNlPEI5cRAIUuzMhuZ2fgmSS7dBwnMn4AD6oyVGn+s+WQLHwea9+m1Dilfc693D6pTQa1Jk1578bUXY8bgraRqoy34pPnZJSCkH2/XF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNKLG2XV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNKLG2XV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783113289; x=1814649289;
  h=date:from:to:cc:subject:message-id;
  bh=di74GbLBMQzp94YNIB8R45m6VosHvJxWxwPOUzbK1Vc=;
  b=gNKLG2XV3jM7NsKilNuxpBIdruiPXqNHsPciVZ27CU08AQhDcVesp1DK
   bGxYD3OQE2LNxdJ8uOtQwb5Gsj5JhRNK+IWuIPPH1zdufCQJ+C5Bng4dk
   uK6LxR5pTDb0XNxJ3qYvQ8Bkr87FUW892Vc/j85tQXPc0tLKKzUZ5TkbX
   zU4/Jc5eOw+R5Zbm8//22/B7lbv04CUpvsudopFErBGwmhF31nUqtfjXm
   P5OuBAp/L1AzBruP1DgQbUMb+x4DoArabCewotrwIaA6G3UR/gy6vMaBB
   hud8yktM1EiPRVmrLY1rBH/SrFUeRjQGnP23LhiMLfd5RFMMjGEb5fkny
   Q==;
X-CSE-ConnectionGUID: R7ajD2m3TT2Wgo3gUYuC7w==
X-CSE-MsgGUID: rh0oy6AZSc+i5+xf7s+kBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="84051694"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="84051694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 14:14:48 -0700
X-CSE-ConnectionGUID: 4fH4yzPGRPGAzBDcDE8SSA==
X-CSE-MsgGUID: QySIjZnbRoiizgW2eP35/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283272015"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2026 14:14:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wflDg-00000000CWZ-2MN4;
	Fri, 03 Jul 2026 21:14:44 +0000
Date: Sat, 04 Jul 2026 05:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: arch/m68k/coldfire/m523x.c:82:20: error: implicit
 declaration of function 'read8'; did you mean 'readb'?
Message-ID: <202607040536.BiSGmESw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: e1f3a00670d13d1ed901125026c1f65394e670a5 m68k: coldfire: use ColdFire specifc IO access in SoC code
date:   4 weeks ago
config: m68k-randconfig-r122-20260704 (https://download.01.org/0day-ci/archive/20260704/202607040536.BiSGmESw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040536.BiSGmESw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in SoC code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040536.BiSGmESw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io.h:6,
                    from include/linux/io.h:12,
                    from arch/m68k/coldfire/m523x.c:20:
   arch/m68k/coldfire/m523x.c: In function 'm523x_fec_init':
>> arch/m68k/coldfire/m523x.c:82:20: error: implicit declaration of function 'read8'; did you mean 'readb'? [-Wimplicit-function-declaration]
      82 |         mcf_write8(read8(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
         |                    ^~~~~
   arch/m68k/include/asm/io_no.h:23:75: note: in definition of macro '__raw_writeb'
      23 | #define __raw_writeb(b, addr) (void)((*(__force volatile u8 *) (addr)) = (b))
         |                                                                           ^
   arch/m68k/coldfire/m523x.c:82:9: note: in expansion of macro 'mcf_write8'
      82 |         mcf_write8(read8(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
         |         ^~~~~~~~~~


vim +82 arch/m68k/coldfire/m523x.c

    78	
    79	static void __init m523x_fec_init(void)
    80	{
    81		/* Set multi-function pins to ethernet use */
  > 82		mcf_write8(read8(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
    83	}
    84	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
