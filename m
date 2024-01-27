Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391820306
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 23:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706397010; cv=none; b=gO4e5Xw7YiWZ7bhIn+acFWbNLraRyByLZIuGVkrMTd0J/FJOKjVOEQfQur7hk4aVzUPT4zgHKM/ZADEQpDiM49xs+oqwDo9anUFhIl7QMnkpi2xSTgUnx+7JJQrFd4dm2gk32gmC74fcQ61mLnfDQAZAPeTV/TJHWDl7HMSq7VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706397010; c=relaxed/simple;
	bh=DiVGZc3ZOutw2IpvC5MEFF4a0Ynfk7QK29IKAN4/ufY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mcy4GELsiYnNhJaX/EsI7WoQotIMr3bboHkC5MUKTQejhm60s7gqhYZ5P6f80ZXh6gJTsWKkPEZXSw2ZmojGbBR1rQVJMl4iDNMOWecp2T9P8izPI0a3F0F+BZu9+zFKtklmXBCplTGcccXMCpFJOtNJp8Jsaps1ejX9RwW/NNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIYFCMSJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIYFCMSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706397008; x=1737933008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DiVGZc3ZOutw2IpvC5MEFF4a0Ynfk7QK29IKAN4/ufY=;
  b=ZIYFCMSJxmpV/xJTLN6BHjKdec2XDK5h2dUIfEjG0ZrZqlvSPsqIXp8Q
   2vTzGHcW93lWpAcuqUp0oSgcJ+ueck4LD2D4nNHP2cPcpAvzVEuEzKN+C
   qAaINFRjSCIYS3AEbzLD017UrKkUcGjgga9ZpQpGqhKoD35iMKlOBM2bX
   kZ/MgYvSSR2J/qFHbUpQfMBrdOYNgIVaPRLaisJz+n5uCZxkDRM/2aZB+
   Kqnq1jER6KEzO2M0WDiGOxUypbbmeT1cy+MUoljxz2wuIvFx/TlzUMCcK
   gYvs8Tvipu5PhFoajzTOLukG0Z+oq6kOyrKUFB2cd5g4XWXWhgyOXcwTO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="10102950"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="10102950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 15:10:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21711413"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 15:10:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTroI-0002py-1I;
	Sat, 27 Jan 2024 23:10:02 +0000
Date: Sun, 28 Jan 2024 07:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [rt-devel:linux-6.8.y-rt 63/96]
 drivers/gpu/drm/i915/display/intel_vblank.c:284:16: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202401280702.PNbQLDGH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.8.y-rt
head:   ff2361c71bd48a300cf147f5ffa6cd0f67135879
commit: 722e48bb3059ead4fcf48804b314d165a7609029 [63/96] drm/i915: Use preempt_disable/enable_rt() where recommended
config: riscv-randconfig-r121-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280702.PNbQLDGH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240128/202401280702.PNbQLDGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280702.PNbQLDGH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_vblank.c:284:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got void * @@
   drivers/gpu/drm/i915/display/intel_vblank.c:284:16: sparse:     expected unsigned long
   drivers/gpu/drm/i915/display/intel_vblank.c:284:16: sparse:     got void *
   drivers/gpu/drm/i915/display/intel_vblank.c:278:13: sparse: sparse: context imbalance in 'intel_vblank_section_enter_irqsave' - wrong count at exit
   drivers/gpu/drm/i915/display/intel_vblank.c:288:13: sparse: sparse: context imbalance in 'intel_vblank_section_exit_irqrestore' - wrong count at exit
   drivers/gpu/drm/i915/display/intel_vblank.c:298:13: sparse: sparse: context imbalance in 'intel_vblank_section_enter' - wrong count at exit
   drivers/gpu/drm/i915/display/intel_vblank.c:306:13: sparse: sparse: context imbalance in 'intel_vblank_section_exit' - wrong count at exit

vim +284 drivers/gpu/drm/i915/display/intel_vblank.c

   267	
   268	/*
   269	 * The uncore version of the spin lock functions is used to decide
   270	 * whether we need to lock the uncore lock or not.  This is only
   271	 * needed in i915, not in Xe.
   272	 *
   273	 * This lock in i915 is needed because some old platforms (at least
   274	 * IVB and possibly HSW as well), which are not supported in Xe, need
   275	 * all register accesses to the same cacheline to be serialized,
   276	 * otherwise they may hang.
   277	 */
   278	static void intel_vblank_section_enter_irqsave(struct drm_i915_private *i915, unsigned long *flags)
   279		__acquires(i915->uncore.lock)
   280	{
   281	#ifdef I915
   282		spin_lock_irqsave(&i915->uncore.lock, *flags);
   283	#else
 > 284		*flags = NULL;
   285	#endif
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
