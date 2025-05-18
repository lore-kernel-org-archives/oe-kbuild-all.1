Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2139FD9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 18:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747591883; cv=none; b=jAesh1kFOWsJ0IsNznVtZdpL7aswlNTW8r4q3zJ4m3oQghyOzvesqQwyOv5EN3nAjUl1jJhgwnp92jAeN7MD3l/QzhICwPiLIH5DrsWCw/C+sa2SeCV0n9T3QRQaYgSawUfiOUC9Z4rxkYmWJTzWB/q1bD4HQfcKsh5xgwg2vVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747591883; c=relaxed/simple;
	bh=e5JfAC8y3exWtJdUzQMaWu5rnC5Vze4yKJpZjqP6S/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRZYLv71hatJo5JZrZq0ht1xFzb9PAs/f4SuPrn2jENbyM/zSv7vpCwpaxyXITpBdNqS4XiwSyATkMBNlZ/zqB/axK4RAGdO6H3FwB3NLZ0x2Apv3D44wDSJJbdEgCytsS89SCUabOTyDxDdc0UXVSdeSU36xCJD462TRZobHIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmymoKmD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmymoKmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747591881; x=1779127881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5JfAC8y3exWtJdUzQMaWu5rnC5Vze4yKJpZjqP6S/E=;
  b=JmymoKmDHYNnLWUWT5LabkFj7Hyz4eYb0Il28lqSbGlXKJptCYu67Za2
   1t4FhTH2IKCGSujjdRX8V7walo+WIgF0iYiwHo5GO3wDnsIn3tOQcEfkl
   cHev5jXBjwyZ248nPEPzFj84cIMbuHA07RLy+t/DJsGRgbg/ZJStTms0B
   t2ToCftOQUNhc2QH4PKsanOU7hNMy7UAgpmYlrOIlAWkVMk49rhB4oiyq
   lzE98qKVOOdRST6pPoytZykA6SpTvgVRcmk8CcoUDL/zkbSDWecSBLNjb
   GcZltoB8OcgaJ6m43DllOYhtGA6+g1ufIeZNFdMoBLmq4MYvOUUFeAhrI
   w==;
X-CSE-ConnectionGUID: ihSpbUWZSLqj+YP/K2aAcQ==
X-CSE-MsgGUID: 3IJDv6G6QMueCMCZXa8npQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60130732"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="60130732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 11:11:21 -0700
X-CSE-ConnectionGUID: bRtmMwh9TaCwH/15Ny6AdA==
X-CSE-MsgGUID: 8O/QrsQpTkm4vrg1Kvj/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139012739"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2025 11:11:19 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGiTl-0000jz-0R;
	Sun, 18 May 2025 18:11:17 +0000
Date: Mon, 19 May 2025 02:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-05-exp 0/1]
 drivers/android/binder.c:7335:5: warning: no previous prototype for
 'on_binderfs_mount'
Message-ID: <202505190249.iSofcut6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-05-exp
head:   318fd288f5897bd4bfdde5ba64cd16619c9f2c3a
commit: dd55f146240edebbe004b5bf964fed6c1a0bea98 [0/1] ANDROID: binder: change how Rust Binder is loaded
config: x86_64-buildonly-randconfig-2001-20250518 (https://download.01.org/0day-ci/archive/20250519/202505190249.iSofcut6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190249.iSofcut6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505190249.iSofcut6-lkp@intel.com/

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
