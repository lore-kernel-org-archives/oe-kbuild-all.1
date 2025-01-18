Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBAB67F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 01:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737164165; cv=none; b=oV3x5KSKZv+GSc8+QMmefpFxMGhnHolUCeIOGmzblKpLzmmJTkpQFO14SYoJm/IJqdrBB4qKtnYoIzABmkIkz1Fjrz5X0ixSsS2UCiBKSb4JM2JoyljYeGZACyfPSgsC0Terwo3BfAXpIA9f/TccqkwRVEzjeztrARWXjsu5JO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737164165; c=relaxed/simple;
	bh=1A10aRAeBZ9AVrLuyrrqFGsI4amCNrGGTqNDFT9nAfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUmDHcyTPA7/qDGnHIfmdjwWbIwGDqfCfoB8shxPs1FTsHVH5dvYZSpx9UYTkV/JT4/N48DqOF195QHRvjErLnDULBOwPiUh7jkm06mVG5mprEWWEADnt/4k8uFlVzEg9aPajw7BPX0aI7FTBYBO8WyDmidTew4C5QK+53l5wrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRKNjfpF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRKNjfpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737164163; x=1768700163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1A10aRAeBZ9AVrLuyrrqFGsI4amCNrGGTqNDFT9nAfg=;
  b=jRKNjfpFydRrItw26OJmccSfuntxUDdtR5aZ4Wz5fYqvs42sXUqDOkfB
   Dd+tSSt6Jiwr96YmXyPMK7zXAmHuXOwXAZIxuHsLULbjyys4uD2RJhSg5
   927x/LwqPnKPKGko3D0a8/59N951FwZSoGtwReTZ3R5kZQ/Kb8wzudImh
   TbIJ0nNCV6FssaFCDD3VPj434LDKEGAB3z2zvOOxf0I1MWZxXXfIb9Zon
   hQjZyTXw9fJqGgSzSX0K02P8n5O3jbC+FXaMmFGdynW+NfbXdhpgTq4Oo
   GAuJzS4/DgNOeYCdSVI7BEjF11lkmVlEZB8diKD7nwPLA+Ie0UTXSUitv
   A==;
X-CSE-ConnectionGUID: BLE09jLkRJ6iYxTi8GZKdA==
X-CSE-MsgGUID: ZIAIN5B1TTi76NNSpWn+TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48282112"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48282112"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 17:36:03 -0800
X-CSE-ConnectionGUID: V+G3PHQySy+c4Kmdwi2/0w==
X-CSE-MsgGUID: POZXeA1CTbi/L4W6OBmB/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106853721"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jan 2025 17:36:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYxkl-000TvN-1d;
	Sat, 18 Jan 2025 01:35:59 +0000
Date: Sat, 18 Jan 2025 09:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] crypto/crypto_engine.c:184:
 warning: Function parameter or member 'need_pump' not described in
 'crypto_transfer_request'
Message-ID: <202501180909.ZEWjTPgZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   23d1ade7402eba239eb9bb4a5494d92a497b5021
commit: 739c6ae42f823093807c676b32ceb9d1597f9058 [1/1] ANDROID: gki_defconfig: Enable req modules in GKI
config: x86_64-buildonly-randconfig-003-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180909.ZEWjTPgZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180909.ZEWjTPgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180909.ZEWjTPgZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/crypto_engine.c:184: warning: Function parameter or member 'need_pump' not described in 'crypto_transfer_request'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +184 crypto/crypto_engine.c

735d37b5424b27 Baolin Wang    2016-01-26  175  
735d37b5424b27 Baolin Wang    2016-01-26  176  /**
218d1cc1860c45 Corentin LABBE 2018-01-26  177   * crypto_transfer_request - transfer the new request into the engine queue
735d37b5424b27 Baolin Wang    2016-01-26  178   * @engine: the hardware engine
735d37b5424b27 Baolin Wang    2016-01-26  179   * @req: the request need to be listed into the engine queue
735d37b5424b27 Baolin Wang    2016-01-26  180   */
218d1cc1860c45 Corentin LABBE 2018-01-26  181  static int crypto_transfer_request(struct crypto_engine *engine,
218d1cc1860c45 Corentin LABBE 2018-01-26  182  				   struct crypto_async_request *req,
4cba7cf025f355 Corentin LABBE 2016-08-31  183  				   bool need_pump)
735d37b5424b27 Baolin Wang    2016-01-26 @184  {
735d37b5424b27 Baolin Wang    2016-01-26  185  	unsigned long flags;
735d37b5424b27 Baolin Wang    2016-01-26  186  	int ret;
735d37b5424b27 Baolin Wang    2016-01-26  187  
735d37b5424b27 Baolin Wang    2016-01-26  188  	spin_lock_irqsave(&engine->queue_lock, flags);
735d37b5424b27 Baolin Wang    2016-01-26  189  
735d37b5424b27 Baolin Wang    2016-01-26  190  	if (!engine->running) {
735d37b5424b27 Baolin Wang    2016-01-26  191  		spin_unlock_irqrestore(&engine->queue_lock, flags);
735d37b5424b27 Baolin Wang    2016-01-26  192  		return -ESHUTDOWN;
735d37b5424b27 Baolin Wang    2016-01-26  193  	}
735d37b5424b27 Baolin Wang    2016-01-26  194  
218d1cc1860c45 Corentin LABBE 2018-01-26  195  	ret = crypto_enqueue_request(&engine->queue, req);
735d37b5424b27 Baolin Wang    2016-01-26  196  
735d37b5424b27 Baolin Wang    2016-01-26  197  	if (!engine->busy && need_pump)
c4ca2b0b25814c Petr Mladek    2016-10-19  198  		kthread_queue_work(engine->kworker, &engine->pump_requests);
735d37b5424b27 Baolin Wang    2016-01-26  199  
735d37b5424b27 Baolin Wang    2016-01-26  200  	spin_unlock_irqrestore(&engine->queue_lock, flags);
735d37b5424b27 Baolin Wang    2016-01-26  201  	return ret;
735d37b5424b27 Baolin Wang    2016-01-26  202  }
735d37b5424b27 Baolin Wang    2016-01-26  203  

:::::: The code at line 184 was first introduced by commit
:::::: 735d37b5424b27aa685276b8b90b7e57c4705ac1 crypto: engine - Introduce the block request crypto engine framework

:::::: TO: Baolin Wang <baolin.wang@linaro.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
