Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AAE49B1FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054899; cv=none; b=qaUVCKrhaJm2VsFWX0jf9h4acDJTzQtJ1SwKQaJ4E711dJCBQend11Wy74LpzBw0jPb/D4jgGH0sxAkl7AgHMrCHYV0XfCtpKQ8M5UHpfDSfwIEKkYBUDPgo4rk7LAbzv53NhFyEEf3NwdpVMRPXwF6X4Gu7dedtNIET+qASAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054899; c=relaxed/simple;
	bh=2H0BaQZW3/2fCxOelZ1flWFV1S4q9DoZ90tBtqKdjec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p/GLWnQp0M3Iy/2UthYIqLcDBa1kAfVmWFxgxDxNn7vcbh8rwNQZGAWsNMXj9D5dUmomnPYwm5nR1YP7ygWas/5ATcA8QwIjQxitiWOv89xDavS1ICCNqwv42vREroMqd4JLMRy/7Ti7bFOvLcEmH6osPoaM2P8JNL5SaloVToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+sb8qhS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+sb8qhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054898; x=1820590898;
  h=date:from:to:cc:subject:message-id;
  bh=2H0BaQZW3/2fCxOelZ1flWFV1S4q9DoZ90tBtqKdjec=;
  b=X+sb8qhSBCDQCyzNBqqAa3ZdU/20/8Ib4ZbTEpFp7uccL8i0S2nQ2A47
   WOVjl1PzgHFbWaZoS6TaxMqTGF2dGNHuk+4rVEU0v3Ah0nPGSs8vMTmBO
   QlYzfUn0/nwJl1K5Mfpy1tHJU0EgU+gm9KWLMUMRiZ4Xf9+kPAK9U2z69
   YJ2zd3CD+zMX+UGNb6GoV/o9EfXQyXYXxUcSBvCsbjalRay6g89pSW1CS
   SuV5YK/LMPILVvi3MGZ4Xun6mECw+aZ+Fg+zkzY50F8RXRtLq73dzh0uA
   dm9/CNLT6WOKS9bn/gpjjUo7agvn83w7Zp4cwJT41t1sQrVYE/ZVQFMmz
   A==;
X-CSE-ConnectionGUID: 5zkDLIlzSG6reUMoL7Jp/A==
X-CSE-MsgGUID: liQr/g0STrm+lgQkwKMfkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066965"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: mSwTgU3qQdSJxn5ehk+KXA==
X-CSE-MsgGUID: TOkkE6nERvK0VE4xuxUv4A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qi-1bTu;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 170/294]
 drivers/rtc/rtc-stm32.c:795:13: warning: 'stm32_rtc_clear_events' defined but
 not used
Message-ID: <202609100500.VDsB697w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 99ab6d2408a83752e16a39683a743c131f3d5cb3 [170/294] rtc: stm32: remove mcu support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609100500.VDsB697w-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100500.VDsB697w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100500.VDsB697w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-stm32.c:795:13: warning: 'stm32_rtc_clear_events' defined but not used [-Wunused-function]
     795 | static void stm32_rtc_clear_events(struct stm32_rtc *rtc,
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/stm32_rtc_clear_events +795 drivers/rtc/rtc-stm32.c

4e64350f42e2ce Amelie Delaunay 2017-01-11  794  
02b0cc345c2a1b Amelie Delaunay 2018-05-17 @795  static void stm32_rtc_clear_events(struct stm32_rtc *rtc,
02b0cc345c2a1b Amelie Delaunay 2018-05-17  796  				   unsigned int flags)
02b0cc345c2a1b Amelie Delaunay 2018-05-17  797  {
02b0cc345c2a1b Amelie Delaunay 2018-05-17  798  	const struct stm32_rtc_registers *regs = &rtc->data->regs;
02b0cc345c2a1b Amelie Delaunay 2018-05-17  799  
02b0cc345c2a1b Amelie Delaunay 2018-05-17  800  	/* Flags are cleared by writing 0 in RTC_ISR */
02b0cc345c2a1b Amelie Delaunay 2018-05-17  801  	writel_relaxed(readl_relaxed(rtc->base + regs->isr) & ~flags,
02b0cc345c2a1b Amelie Delaunay 2018-05-17  802  		       rtc->base + regs->isr);
02b0cc345c2a1b Amelie Delaunay 2018-05-17  803  }
02b0cc345c2a1b Amelie Delaunay 2018-05-17  804  

:::::: The code at line 795 was first introduced by commit
:::::: 02b0cc345c2a1b7f1c590796a02d84e49e51ded0 rtc: stm32: rework register management to prepare other version of RTC

:::::: TO: Amelie Delaunay <amelie.delaunay@st.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
