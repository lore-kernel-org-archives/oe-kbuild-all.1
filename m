Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C02FE06E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765509682; cv=none; b=YsdWPBH16aGwIMe9StWG5vDpGI5ys/1F+O/yjY/aQB5as69tqcdNmo2s6W+R5CQiQyhXhn/MSGWkLPNitNqdpqNk2UXsk6EptQbLyBVTLKiygS5HZywR5UygYQWYzkJoGe8SpvoHCBbYuUtNTIiJPO6ISreYginF2+i3bqwfCr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765509682; c=relaxed/simple;
	bh=a9KOUT4v6kmYi68NoTxdPmuwCfUVzDz2MJk4kVdxj+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNzL3Cc99HmzxTiBSpF4Ve6quYl9BDea9D5sq4g/IwVD5b8Z9hIIaTskagaVH7ht3xr3i5eeL5iDIiGVv5lJCRRNkYKSkWpjklm+bdrYxoNTARymby6wP5/OBIyx3m8SgJYUTJ6BI6u1A2CQN7ocxCokOgvje3/jyHl1xr3Eeyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsP1FqGy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsP1FqGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765509678; x=1797045678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9KOUT4v6kmYi68NoTxdPmuwCfUVzDz2MJk4kVdxj+s=;
  b=dsP1FqGyZfDihkZotNK/i21yhIbpi7Rc49SwLO7DRRE5cCtI0W94VRzO
   tL7T+kBTT2FgeGNJCgjlwW55v6KfcOowM39Z0De1miY1w7+CjXpe4mtu5
   ykmYkgmcL33/959NFria1QIpONXa8YJx6d4k32jq6jKJ0WQD0NmWoP4Js
   bYjPbmmOdC2ECKok+lMMoGJ53KEVjmcj97NaS7l5rIiITBt22Syed2PTc
   hdb+jIA1d6dynAeVrEjFHih+GaWHUx00FBsB4FR4GiKpRvEmSbWJzKsnp
   Hhwvgsv/Yi0wr+BSRa4BLBbLURSnpqq7OSSWsXpop+X0iNSlbAjV87MOn
   A==;
X-CSE-ConnectionGUID: T8YwqcClTy2rLanjORLc7g==
X-CSE-MsgGUID: 7G3oS2Q9QNiCLfdp1dBSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67385641"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67385641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:21:16 -0800
X-CSE-ConnectionGUID: 3LNMQbtlRZOUnuRhTz7VPw==
X-CSE-MsgGUID: ATLuPswtQZGV5/hZ5Y7abA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="228033346"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 19:21:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTtiT-000000005Qz-13Rz;
	Fri, 12 Dec 2025 03:21:13 +0000
Date: Fri, 12 Dec 2025 11:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] drivers/android/binder.c:7311:5:
 warning: no previous prototype for 'unload_binder'
Message-ID: <202512121145.fs7ZS7my-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [1/1] ANDROID: binder: change how Rust Binder is loaded
config: i386-buildonly-randconfig-003-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121145.fs7ZS7my-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121145.fs7ZS7my-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121145.fs7ZS7my-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder.c:7311:5: warning: no previous prototype for 'unload_binder' [-Wmissing-prototypes]
    7311 | int unload_binder(void)
         |     ^~~~~~~~~~~~~


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
