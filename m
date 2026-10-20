Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502337;
	b=yRx1Yz18mivVcdKoGu6XGetU4RvhbbbDbdLhkTcz4K5KnCkF0tUQZgL2Wqj1QfEteiux
	 fM9o01y6WrFEFO7HRmy8A43Kyf18sQeTNySyv7uBcdMNHEu+Mm+Vwa0Chz/hn2iK+nC1T
	 BiMV3EiKWK++UwWFZh8eui+Qxft+grRX+BLxWkC5D4GX9cr1svcsGnnXlgI13eUsZ6r5V
	 n1rpVZiaVrRl54fAf1bGbPK9Jekz+tfBaCHsObZHAhlMq9W/g392y4djXop+tmgc408o2
	 0JDeuVM8vaUZRLfphrtTA8LjJXQ33YNVGj3GEBQi8eiAPkM2DYwKrz0G971fTWE2aGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502337;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iAgg8RIbo1bYBFr8GKNG/QyHOAiS7O6P1PTo9pXX3Ro=;
	b=zxnEnCyC9fwryZWacr+0G0+syOh6uoq4TewgR3LN9CB/OW+0CyXAHIXtAuzwAEKzAKMG
	 ee6bzGsVbxTpcF9s04HQspLF4QBvHu7PjnVfs0B/TwbvYFUMRSgNpEE7IbCaugxD2YSha
	 cT3g3liFmBOtexHYtV/Rg3AbnKyE6eh3nB/MSN2KUHntcTOXHEnojhbk5ziWOK7bo0c0w
	 zMfzUBTdQtPsBoYrozfE6DC1ajeoFTg+rb4Bg/zRoMvLKtOSWWjKXFQRxA9+bDhV+VnoV
	 EZ52Nc9vhrUkDcX2ee0mcNJ/miG4bRBZ9fGaLkNjSC1LAwoFzbnlGFc4m6ptz/GTFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RYYzNfhD;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3A606A330
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 13:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD3A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RYYzNfhD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792502336; x=1824038336;
  h=date:from:to:cc:subject:message-id;
  bh=+EBijW/S8dwSH0vxJF16zGVSUPo1qTGuqAEFK8Hlfng=;
  b=RYYzNfhDl+4+jzUq5IpZR9EotJ9Z7GjbmfMDKwjSqV/Viu/vMr+F3PCJ
   vG4JXurPXQwDB+bvjN3K+wRNzEBkD3ELEzPZaI6DJ4qFZwoVcYfnRD79n
   6POGwaXTex26NdEMmFiAKMVi/wzLkE81rbEtMWpLyiATalLy8bMXKdFkY
   jKqjz7h3mH8hZwULkmxkisS8ksfCChEuQzCjENUtVceoTjxeInZVc6umd
   bDtfvWzR6CcDTJFDbfI7h00hmUSockj5X6Y4TCPqUXNJtP/LPVJot7aZt
   +pVHPp9teugdlrVz8JTG5Q82Q0tPH4x1tvvavW1RxUTukEJlEMROR6gGN
   w==;
X-CSE-ConnectionGUID: vJZ5mLgASB+YHD+n7Uvqsg==
X-CSE-MsgGUID: DmiERWblQjWImSSNDdA/Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1087452"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1087452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:18:56 -0700
X-CSE-ConnectionGUID: GvuF7OQDRjGjpkWUsnLz2g==
X-CSE-MsgGUID: 03UUvOJER3q6++4mVHasjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2928073"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2026 06:18:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ9jv-00000000NWY-3Scv;
	Tue, 20 Oct 2026 13:18:51 +0000
Date: Tue, 20 Oct 2026 21:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/android/binder.c:7311:5: warning: no previous prototype for
 'unload_binder'
Message-ID: <202610202155.8ayCXKJS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3e51fbb70e49abad7825a515cd80d4a72f061968
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [2/2] ANDROID: binder: change how Rust Binder is loaded
config: i386-randconfig-1010-20261020 (https://download.01.org/0day-ci/archive/20261020/202610202155.8ayCXKJS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202155.8ayCXKJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610202155.8ayCXKJS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder.c:7311:5: warning: no previous prototype for 'unload_binder' [-Wmissing-prototypes]
    7311 | int unload_binder(void)
         |     ^~~~~~~~~~~~~
   drivers/android/binder.c:7335:5: warning: no previous prototype for 'on_binderfs_mount' [-Wmissing-prototypes]
    7335 | int on_binderfs_mount(void)
         |     ^~~~~~~~~~~~~~~~~


vim +/unload_binder +7311 drivers/android/binder.c

  7307	
  7308	/*
  7309	 * Called by Rust Binder to unload the C Binder driver.
  7310	 */
> 7311	int unload_binder(void)
  7312	{
  7313		int ret = 0;
  7314	
  7315		if (!IS_ENABLED(CONFIG_ANDROID_BINDERFS))
  7316			return -EINVAL;
  7317	
  7318		mutex_lock(&binder_use_rust_lock);
  7319		if (binder_use_rust == BINDER_USE_RUST)
  7320			binder_use_rust = BINDER_USE_RUST_LOADED;
  7321		else
  7322			ret = -EINVAL;
  7323		mutex_unlock(&binder_use_rust_lock);
  7324	
  7325		if (!ret) {
  7326			unload_binderfs();
  7327			debugfs_remove_recursive(binder_debugfs_dir_entry_root);
  7328			binder_alloc_shrinker_exit();
  7329		}
  7330	
  7331		return ret;
  7332	}
  7333	EXPORT_SYMBOL_GPL(unload_binder);
  7334	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
