Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7719D093
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774421038; cv=none; b=Jak015iJuETLr8kM3x+Ma5V3X/TBBfX/+5Cwpi49VBVf2Lqzq2owyC3hqXTe3UqB51gxE3QAk666Quls8RktNWP4rlzmXEvFoHrxNLDnBliiVtKu5AQ6i3nWkyZlmdRG7SdIB+xRk7cqOqm4C++rpyG94VBGoZ9M5o1d25oFKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774421038; c=relaxed/simple;
	bh=ReqkpqoAfSQLoD1l8avLb336iJd22c3hyM6VocBsLKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HueteTsZ1+Mb0cCUfthDnlG0C8QODAi6nHY5nVf+OEfksSk4yax5mRLdUvvLF+iR/5Nz45dfj0HU7f6PBz5GjW2No5f5EzsMUTf+XUrSh0Sb/vGCLpMammOHSHKgU9+bJpiS56njKUG0dxMZ/fBpzLXiENI39UPWjyb/3S23K54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDYqM+8e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDYqM+8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774421036; x=1805957036;
  h=date:from:to:cc:subject:message-id;
  bh=ReqkpqoAfSQLoD1l8avLb336iJd22c3hyM6VocBsLKw=;
  b=lDYqM+8emTmgpSrbp3zN7XiceoRVUQf8sl6Xd/00MGOfJiMyxO9qjvuS
   k31JVv/MTqKmvuc+CuemNDPYcYzDv78vZSYdb0Ck3IGuG+1yA7hmILdtQ
   W4PFNP7J7sQHRq5RvJumMx0mfENUYDRNZSZIZsZrt3kKZaio7VYZhui4h
   pXTIVk1aJZ/lGO3x18mxcCOgK+uczbZ9ivNoGH2bDsP6GRsBlQH0VIoUF
   5BWgFj3q7LgKLlneJZ0v0KaacDnoTWgT/p9BH7BGLmGGiOcVFHKg2nvQ6
   WpFbYAf9kg3SwTFcDLIpr2ot6/i462dZJbHmSjeGhzoN6DLE5F9lIDXB7
   w==;
X-CSE-ConnectionGUID: 7+JcW+jNQEGrbwQwcgvbiA==
X-CSE-MsgGUID: /niRB1jtTXaE3cDIwwhTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75340212"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75340212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:43:55 -0700
X-CSE-ConnectionGUID: HeM5I9SlQr+WVSb0s6eGvQ==
X-CSE-MsgGUID: xi2OBcYDSWuBd9RQwER7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224600433"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 23:43:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Hy3-000000006KH-3Emb;
	Wed, 25 Mar 2026 06:43:51 +0000
Date: Wed, 25 Mar 2026 14:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/44]
 drivers/android/binder.c:7335:5: warning: no previous prototype for
 'on_binderfs_mount'
Message-ID: <202603251439.tHm5kMl6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [0/44] ANDROID: binder: change how Rust Binder is loaded
config: i386-randconfig-005-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251439.tHm5kMl6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251439.tHm5kMl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251439.tHm5kMl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c:7311:5: warning: no previous prototype for 'unload_binder' [-Wmissing-prototypes]
    7311 | int unload_binder(void)
         |     ^~~~~~~~~~~~~
>> drivers/android/binder.c:7335:5: warning: no previous prototype for 'on_binderfs_mount' [-Wmissing-prototypes]
    7335 | int on_binderfs_mount(void)
         |     ^~~~~~~~~~~~~~~~~


vim +/on_binderfs_mount +7335 drivers/android/binder.c

  7334	
> 7335	int on_binderfs_mount(void)
  7336	{
  7337		int ret = 0;
  7338	
  7339		mutex_lock(&binder_use_rust_lock);
  7340		if (binder_use_rust == BINDER_USE_RUST) {
  7341			/*
  7342			 * C binder was mounted before loading the Rust Binder module.
  7343			 * In this case, we fall back to using C Binder even though
  7344			 * Rust Binder was requested.
  7345			 */
  7346			pr_warn("Using C Binder even though binder.impl=rust is set.\n");
  7347			binder_use_rust = BINDER_USE_C;
  7348		}
  7349	
  7350		if (binder_use_rust == BINDER_USE_RUST_LOADED) {
  7351			/*
  7352			 * Rust Binder is requested *and* has already started unloading
  7353			 * C Binder. Fail the attempt to mount C Binder.
  7354			 */
  7355			ret = -EINVAL;
  7356		}
  7357		mutex_unlock(&binder_use_rust_lock);
  7358		return ret;
  7359	}
  7360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
