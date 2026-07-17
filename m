Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5343DF000
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331879; cv=none; b=sQMN6N+Oi/Njy6hc5BK6/+JknCjsIlcStL+CH57zqFxs/8//l7r6auk/a+07746YGDA9ksbdpn1onEQbOY20vQ/D/wAU2eiaJXD2idACpk1yWsEcW+WQa2tSI3Rp2P8X8wtkV8HPq1zVXEkqiMrwvaubMRflzqxTEOaa4czki9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331879; c=relaxed/simple;
	bh=zg9SXzyvnNziR9YklKY+fgGVRmiFYHv3H6J/JJb/hzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lke1YCrC1AuqpY8sYmhDjIDGRTT/eKKBlw7Sy4A8GV72iRja3GGhofW1zW+fKwnnxTMxvX03193YoZwuIfJoFvvQKjulWUoTOef1Imxv4XxWujwx4u0uz9Dvv8ruT2jOTgSEowjpwweDDT13kj/Sq0LmJkFEVeDWZoHqvRRVCRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ31+wan; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ31+wan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784331877; x=1815867877;
  h=date:from:to:cc:subject:message-id;
  bh=zg9SXzyvnNziR9YklKY+fgGVRmiFYHv3H6J/JJb/hzs=;
  b=BJ31+wand7dpVRjjVhdt4Qpzv1aDCXdqnKYlgDOd66iwHkRTlkVsMoOL
   gYmRSpo8EUS7+jNS4W3IeLaSI7HPHS1WdWIO7yjBy/gc1GmXyEgskoJHN
   YHIhxJ6y6xfidBknC2+hsq3JjEDe0x7tIoHYecaKUKsPMfqglwibx9WIw
   LcXIenYhWFFnYPIMesxVMKrJ/+WaGh8nYC65VzQ+5N8qIdMEVRIrQ5mVw
   cqPNdxPzltL4BpJJ2XNV1MOaqTOpTcy7YkvW2w+g7hbAvszHwyZvJf1xm
   cdbHMMaQZ7SuYaBtekVg5pKW3mkAfCh1DEHd3frJClTeJryUr60uWARxN
   w==;
X-CSE-ConnectionGUID: civaWPXdS3uT/qFktc7lqA==
X-CSE-MsgGUID: PBL8Wb7FTZWZnULj3WB8BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96141566"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="96141566"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:44:36 -0700
X-CSE-ConnectionGUID: +2yk8DtTSc+qh685x98umA==
X-CSE-MsgGUID: 0cqxvHglTual3pNWwYJ0Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="254281727"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2026 16:44:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksEA-00000000TFk-3MKI;
	Fri, 17 Jul 2026 23:44:25 +0000
Date: Sat, 18 Jul 2026 07:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: arch/m68k/coldfire/m528x.c:113:21: error: implicit
 declaration of function 'read16'; did you mean 'ioread16'?
Message-ID: <202607180731.U4tiwFcQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: e1f3a00670d13d1ed901125026c1f65394e670a5 m68k: coldfire: use ColdFire specifc IO access in SoC code
date:   6 weeks ago
config: m68k-randconfig-r073-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180731.U4tiwFcQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180731.U4tiwFcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in SoC code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180731.U4tiwFcQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/m528x.c:100:6: warning: no previous prototype for 'wildfire_halt' [-Wmissing-prototypes]
     100 | void wildfire_halt(void)
         |      ^~~~~~~~~~~~~
   arch/m68k/coldfire/m528x.c:108:6: warning: no previous prototype for 'wildfiremod_halt' [-Wmissing-prototypes]
     108 | void wildfiremod_halt(void)
         |      ^~~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/io.h:6,
                    from include/linux/io.h:12,
                    from arch/m68k/coldfire/m528x.c:21:
   arch/m68k/coldfire/m528x.c: In function 'wildfiremod_halt':
>> arch/m68k/coldfire/m528x.c:113:21: error: implicit declaration of function 'read16'; did you mean 'ioread16'? [-Werror=implicit-function-declaration]
     113 |         mcf_write16(read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
         |                     ^~~~~~
   arch/m68k/include/asm/io_no.h:24:76: note: in definition of macro '__raw_writew'
      24 | #define __raw_writew(b, addr) (void)((*(__force volatile u16 *) (addr)) = (b))
         |                                                                            ^
   arch/m68k/coldfire/m528x.c:113:9: note: in expansion of macro 'mcf_write16'
     113 |         mcf_write16(read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
         |         ^~~~~~~~~~~
   arch/m68k/coldfire/m528x.c:116:20: error: implicit declaration of function 'read8'; did you mean 'readb'? [-Werror=implicit-function-declaration]
     116 |         mcf_write8(read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
         |                    ^~~~~
   arch/m68k/include/asm/io_no.h:23:75: note: in definition of macro '__raw_writeb'
      23 | #define __raw_writeb(b, addr) (void)((*(__force volatile u8 *) (addr)) = (b))
         |                                                                           ^
   arch/m68k/coldfire/m528x.c:116:9: note: in expansion of macro 'mcf_write8'
     116 |         mcf_write8(read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
         |         ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +113 arch/m68k/coldfire/m528x.c

   106	
   107	#ifdef CONFIG_WILDFIREMOD
   108	void wildfiremod_halt(void)
   109	{
   110		printk(KERN_INFO "WildFireMod hibernating...\n");
   111	
   112		/* Set portE.5 to Digital IO */
 > 113		mcf_write16(read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
   114	
   115		/* Make portE.5 an output */
   116		mcf_write8(read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
   117	
   118		/* Now toggle portE.5 from low to high */
   119		mcf_write8(read8(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
   120		mcf_write8(read8(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
   121	
   122		printk(KERN_EMERG "Failed to hibernate. Halting!\n");
   123	}
   124	#endif
   125	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
