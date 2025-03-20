Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555F10E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742475067; cv=none; b=WVv3Ci1wbsvIeIVQ+4W5Nj2RcWeHLoCYm71Dw7CWFZuRYLSzIqlL6r2S9oPLFfpHdaiXijhymUTjAjth8KXlia74gj6DhR8BXjhE1Lq9Jr4PgCKtoSm0Xw7WZA/3BGsdX7F3O+YekgIz0NON516wtxJWNrx4aMubCF8iC+FR0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742475067; c=relaxed/simple;
	bh=iJ3f++0nL5//9wUrjGjZRnYX2HGGlC5GGe4ZraoJfy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+hPysUH7oXGgs4WWoaBtXP8/zOgnEyuKQR2uEJaNCKHO6YVAXXhGFIkkRtRpnU4JcsHmRnKhpB4M/ZIWPps6dbkCzS5OFClG9w8oTwcv8kjzVkcr1G8kpc2JLD9yFJXNyYarGS1Q390jF9FILY6LdhzDxgwSChXXbEpctZKfbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZH/MW92t; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZH/MW92t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742475066; x=1774011066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJ3f++0nL5//9wUrjGjZRnYX2HGGlC5GGe4ZraoJfy8=;
  b=ZH/MW92t6PTSlQRab4Xw7QjzF3l0BEzh8XVZHYmiAtltrRCgxp0mF4j8
   +ERA7AtQn+b/vGuOglZTXsIFmyrZ3MmuP7co5gxT3Qdw40R0+pQcxTUd9
   +WVHHCnTeyOxDYmd84QmdDbnW3Qm0MpD+Hpjgn3Sfgpvrn1/7dgO9D9Ec
   VpY6+E8z9Rl0WgadsJgx+2LHVXvGD3as3s8zDkjpYKrn8MRVQHEjFXXZT
   P8Gh5OJAQbosY75HakE4ixgUHnVTjlSgIeVmpQX7no2Shb0kZ3ab0Ew4F
   lHF0rWvREpYZERhGCIlbug/7pr+E8dNRH18eVyxWsEKW2GvoN1oOVPz5v
   w==;
X-CSE-ConnectionGUID: 2DbvGk9GTkqE8Xd0lwGuJw==
X-CSE-MsgGUID: aNGHDfnGSMm5u4eCJOKMpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="31289153"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="31289153"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 05:51:05 -0700
X-CSE-ConnectionGUID: RJcncgYHQTysC1xJ+CxyRA==
X-CSE-MsgGUID: JE4lFGYrTKWWZCOYq3tFCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="122803313"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2025 05:51:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvFMT-0000RT-33;
	Thu, 20 Mar 2025 12:51:01 +0000
Date: Thu, 20 Mar 2025 20:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] drivers/android/binder.c:7311:5:
 warning: no previous prototype for function 'unload_binder'
Message-ID: <202503202025.IgH9HXIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   89a67676aaa0e0d1dcc4e0a114f51e090df535c4
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [0/1] ANDROID: binder: change how Rust Binder is loaded
config: i386-buildonly-randconfig-003-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202025.IgH9HXIN-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202025.IgH9HXIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202025.IgH9HXIN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder.c:7311:5: warning: no previous prototype for function 'unload_binder' [-Wmissing-prototypes]
    7311 | int unload_binder(void)
         |     ^
   drivers/android/binder.c:7311:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7311 | int unload_binder(void)
         | ^
         | static 
   1 warning generated.


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
