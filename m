Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A92221560
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742473030; cv=none; b=sJ9wzWwQa/DFL0t09aYOYcdpf45HP8VGhPBnZs/HuH5/1pEqOAy1S2rmuxBZvAbWNxzAwrmmr2jN2DD9lvYrAz+1qD8/9uT+I6QSaJz1YcSkALYCivGwQ70cf/QvhJfYo4dyZtRpqPtHkhmW3jQYLtgLA1gS05PlpMBdyWIt7TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742473030; c=relaxed/simple;
	bh=S26rzvURVNIeVYnvjlLmYhrsM/u/aCGGhgYldPnbuO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3Wdsvy3250GQVTOWsdOqU9+OAeMLNwUeU00RmWhHnOUBJ/woSN5Bx8Lz8HneTSKQithZcfiUFdULY2Vd/HwSEHD3rQEReMBKGAMVfUCw6iRGSyX7wYwt1bps0B075IfeLPjtdZe8t6/0TKqiBQr+vDRS25UhZPusJDRLWDqngQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2ICYKyh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2ICYKyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742473029; x=1774009029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S26rzvURVNIeVYnvjlLmYhrsM/u/aCGGhgYldPnbuO4=;
  b=e2ICYKyh/ScGYq6bekk8QAOHs55homu/BpSDwCS/IlCARRaDEgjwKNBX
   Ug2CFUk/aUD/6rTQKXHsqpVNp1q8HmjzMdY3w5eQoF3LaB+umo6Vmjeio
   uD6prYA2DWvJp02cLld8J1iwmloruBCGI4WlNuEVLFRzALbc0QI/6IR2+
   Xx1uyyyWWld2PjHtX0wwDrCu6b2n2So5BZoGKtD0/5C2nkuO/BNlyXNzZ
   vfogDMlrRTNz2dkjXEoUo5ssvMLxT0qCAJvafXfATzNF+t/L0V8VxQdQO
   kaYFaxuTyAyx5zt+UOcAF8ZyJSoapjTnJJnKgNika5Xluhxlik/nzXZJc
   g==;
X-CSE-ConnectionGUID: C6ebBFUwTCeS7//OB5opmg==
X-CSE-MsgGUID: HNyC0w2UTlG6VHF3mtjWOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43429201"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="43429201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 05:17:08 -0700
X-CSE-ConnectionGUID: YumUU9x4QMWjxbwKkS9cLA==
X-CSE-MsgGUID: YEyX0SjfQa29kldo9CHCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123589171"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Mar 2025 05:17:06 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvEpc-0000QN-1Y;
	Thu, 20 Mar 2025 12:17:04 +0000
Date: Thu, 20 Mar 2025 20:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] drivers/android/binder.c:7311:5:
 warning: no previous prototype for 'unload_binder'
Message-ID: <202503202031.ZNNdS8rm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   4850878e63a729a4b37a07303b28ec83d35758f1
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [0/1] ANDROID: binder: change how Rust Binder is loaded
config: i386-buildonly-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202031.ZNNdS8rm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202031.ZNNdS8rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202031.ZNNdS8rm-lkp@intel.com/

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
