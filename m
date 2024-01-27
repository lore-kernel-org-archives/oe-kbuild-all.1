Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B375F25754
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706364602; cv=none; b=GfJ4NOuEOl8ubPgoZat74su1XJ7aueHCyHMcVyPM4S/gOWK7JxY1+JwAc7DgMtV3B3sykst0yurRLu9HounEpDgJYmWF4XPu0m1uxkLf3B9KIr6mkE7r/LjwDJrReDjT2lF1zG/mh5K1s3Sf8eOsTYa0UWNWO2jsrjR7cS+RmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706364602; c=relaxed/simple;
	bh=Ml2uFPpfNdPQ8PaEnZzrjZwGgWneQlpf/ufJZiGqq00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ueeRhhjQzNmVPz34eqUYgXhruvsFB78brXuMA29GPUNVp7kqwaR6z7CmY1N1/SpZ771yxblE4iQ0Q0mS4trmk7MeK2pa07gIbZe2wf8foTMnSFcrlnzShH4rLCdD6WVC4eAMiT2iec25UmiqgSDahW08pQkBAqwtw3vtdsSyoLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqnxRBFU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqnxRBFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706364600; x=1737900600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ml2uFPpfNdPQ8PaEnZzrjZwGgWneQlpf/ufJZiGqq00=;
  b=hqnxRBFUBEAChMler0i4iRzhIIU6ICNeG6RNt6cRmgNJbyR23KLe9Cq8
   fBkwSn8w3QNGVEqsGoZKK1cBxAkesk8EkUlC9cb92JoCyhdO4Nz7gclPb
   lWm/d9iwywcr/PcBMUJxjl7Ecffpfz47dmiUHzVPX45KtW7mvNWeALYa8
   x+0PfidZcF/zgrHWuXsG+Fxv++9zmgsqvtEqG/7W6oV2vecXx/QU7LxOh
   sqUoxIrxMvILr/XV0X2CZvU7i12zLuHf/QpVSH/ujPfcriOVwafZUEUoG
   H9/B0VskzdpnjLkiMBoAAPTmbbLS2YmEthTia7gNan+m086+G9nt9wVg0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24148068"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="24148068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 06:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2957592"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2024 06:09:58 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTjNc-0002OM-1p;
	Sat, 27 Jan 2024 14:09:56 +0000
Date: Sat, 27 Jan 2024 22:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [rt-devel:linux-6.8.y-rt 63/96]
 drivers/gpu/drm/i915/display/intel_vblank.c:284:16: warning: assignment to
 'long unsigned int' from 'void *' makes integer from pointer without a cast
Message-ID: <202401272258.allUAzSx-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240127/202401272258.allUAzSx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272258.allUAzSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272258.allUAzSx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_vblank.c: In function 'intel_vblank_section_enter_irqsave':
>> drivers/gpu/drm/i915/display/intel_vblank.c:284:16: warning: assignment to 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     284 |         *flags = NULL;
         |                ^
   drivers/gpu/drm/i915/display/intel_vblank.c: In function 'intel_vblank_section_exit_irqrestore':
>> drivers/gpu/drm/i915/display/intel_vblank.c:295:17: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     295 |                 ;
         |                 ^


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
   288	static void intel_vblank_section_exit_irqrestore(struct drm_i915_private *i915, unsigned long flags)
   289		__releases(i915->uncore.lock)
   290	{
   291	#ifdef I915
   292		spin_unlock_irqrestore(&i915->uncore.lock, flags);
   293	#else
   294		if (flags)
 > 295			;
   296	#endif
   297	}
   298	static void intel_vblank_section_enter(struct drm_i915_private *i915)
   299		__acquires(i915->uncore.lock)
   300	{
   301	#ifdef I915
   302		spin_lock(&i915->uncore.lock);
   303	#endif
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
