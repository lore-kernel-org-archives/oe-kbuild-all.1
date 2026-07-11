Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0F52C21FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 20:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783801595; cv=none; b=RxjaDizQ2Cqtr9BXak9UcBK9gOlBhguZr3/lIzAx5nvSwj5wuEUh2QdEK5LIJQphWdAeDubQ/Rw6TMgQTM+RwIiG+hyaGIlavGsp0HNwH/kpuVYFH6GVUaG4MZS6U4Hq/KstQkcyqYEJY61XivLh0PhptuhZw12fqXM00oH+9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783801595; c=relaxed/simple;
	bh=/L2kgVRLkC3KAMotA0FPfSUXnUOrWEsTEYaEHHK+AI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YEFC5ToMOxN3p0yYC5MO+xS4rcrNZ8j3WifFKtVClULh41i9TViP8+C9YKc9XytbE8In/w1jIwtAm54qywNnx+e3MR6V08fj7wbotKIgCKR5nfS3CmaqciPeY1wQt7RXkdM3wSTj1NMxpED8D80aNHNOkCdiQ/MVqTeS1Y/6TOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be9yjrkq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be9yjrkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783801593; x=1815337593;
  h=date:from:to:cc:subject:message-id;
  bh=/L2kgVRLkC3KAMotA0FPfSUXnUOrWEsTEYaEHHK+AI4=;
  b=Be9yjrkqgvbNyhjflqoNUNxzvOXeoVmIs7gB79oZd3r8O1Q1MncxT/Di
   n5B6qsBqfhsmsrr8xkMiYGsUwd7BcEa+gazwv+ZyAdU3A/d4EyDRG5lqf
   Mod06opJwpvuCna0Qs4QvrHNGyj85XIYSgbsc5HJ9B5OLympyq9ISJoSC
   tcfUOI107e7z6vRFuYBj952NnWYa0wYblQ+GMKHTgqvSotl35HDTciX8I
   KqJkF/QcwJ2mIN3FmpTnLKhihEcb7xdejpUPuTV5eNkqlgXk2rtlr170n
   /k7bjbiuxX3p1k/nMFYuoZohWIkPTT0NiHfqpmdUavMprGWPkPcwI+usu
   Q==;
X-CSE-ConnectionGUID: sZF1ZcIZTCCl23IvxEp2CQ==
X-CSE-MsgGUID: /jLkY7YtQvq6+RgeObyktA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87013642"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87013642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 13:26:32 -0700
X-CSE-ConnectionGUID: PktHKqw3RhCPJ48DYEYywA==
X-CSE-MsgGUID: 3t9fQKs3Qn+cfWfnt2xTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279587502"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2026 13:26:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wieHM-00000000KNe-26hq;
	Sat, 11 Jul 2026 20:26:28 +0000
Date: Sun, 12 Jul 2026 04:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/android/binder.c:7311:5: warning: no previous prototype for
 'unload_binder'
Message-ID: <202607120431.1gubp8zt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0026e4ecedf04706daa23af4ba4b973ff966a55e
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [0/1] ANDROID: binder: change how Rust Binder is loaded
config: i386-randconfig-014-20260708 (https://download.01.org/0day-ci/archive/20260712/202607120431.1gubp8zt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120431.1gubp8zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120431.1gubp8zt-lkp@intel.com/

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
