Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA335290F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751159265; cv=none; b=O67sI819vDTaHmaJ8miUZCaOidfuyGtCieyiAElMKcYYYxuVHzMmLl3+h2qNVbAcVHydFtpt1axRlqZRQrT5tXaxZpHRNJs2OkN6wH9tvnkFfi9Zc01/ke67WKnu3uluQQVYggcaCCSn+nKRz+sGJCedooXFXGKI0yGXCGTTtL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751159265; c=relaxed/simple;
	bh=860yXkz+L3mqEEi3UDEtxiXrUpsrXVkqBfhVyUzjL00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ray/Sh5Ak7fjn8anPKtnt8IigAuL4Iu05y4SG0mz3J2Un4Z+HhNd4Na9J35SqvpRjjSUYZFHpwjsAdQvLJ4hCaOG4Cs2j1ce6R+YGV2EgVjxKaiEAMRyopMdoMOTz9KG5DKI+Urh2FpdVUWdBLm6LSeU4KIeALFNIBod5we1MU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT8JPnlo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT8JPnlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751159262; x=1782695262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=860yXkz+L3mqEEi3UDEtxiXrUpsrXVkqBfhVyUzjL00=;
  b=jT8JPnlonWCHT7JuneNB+Qjptep/SsOQn9ViefXBJtE+JP4xtKQuhXIp
   rlYW66/466yPwyT8HGlPZjz2ZclEqabu+Q5eZsd+Tmq8A5AX4T9dCEiZ2
   s4RkYyvu/aekvGMeNspdochN4M3sGmKdW5N7b60tAA2MbNVFY7MVDgElJ
   zQ7keRAaKrUKreb6HME1YmCg8V6zXKjXXDOpR051K9LN/XdR3u/FpkCOA
   07x5GiNW563vPfGA+ZA/HOrrSvq0l8h397hzLp5X3nDYIEChP/GhfGif2
   McxVmd4wTnq+Zv/bOuZ+SRfXv6nMhW0+Ku+yur26KRrQA15U+sXGqhjRT
   Q==;
X-CSE-ConnectionGUID: esZPD/v0RGeZWGSL0cmX2A==
X-CSE-MsgGUID: GzPWDTZ1TP23dpdYP5WoSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64115735"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="64115735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 18:07:38 -0700
X-CSE-ConnectionGUID: Nx/dD3edSIaNRVMI6t09uA==
X-CSE-MsgGUID: oj0ukV76S4Ka3WYe3tRsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="184043224"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2025 18:07:37 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVgW7-0000qR-0s;
	Sun, 29 Jun 2025 01:07:35 +0000
Date: Sun, 29 Jun 2025 03:07:02 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2985/2985] kernel/watchdog_hld.c:502:12:
 warning: no previous prototype for function
 '__hardlockup_detector_perf_init'
Message-ID: <202506290345.5mLGiKER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c245365237da527fb423d85e7ec54648113f843d
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [2985/2985] watchdog: Fix sleeping function called from atomic context
config: x86_64-buildonly-randconfig-2004-20250626 (https://download.01.org/0day-ci/archive/20250629/202506290345.5mLGiKER-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290345.5mLGiKER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290345.5mLGiKER-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog_hld.c:502:12: warning: no previous prototype for function '__hardlockup_detector_perf_init' [-Wmissing-prototypes]
     502 | int __init __hardlockup_detector_perf_init(void *not_used)
         |            ^
   kernel/watchdog_hld.c:502:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     502 | int __init __hardlockup_detector_perf_init(void *not_used)
         | ^
         | static 
   1 warning generated.


vim +/__hardlockup_detector_perf_init +502 kernel/watchdog_hld.c

   501	
 > 502	int __init __hardlockup_detector_perf_init(void *not_used)
   503	{
   504		int ret = hardlockup_detector_event_create();
   505	
   506		if (ret) {
   507			pr_info("Perf NMI watchdog permanently disabled\n");
   508		} else {
   509			perf_event_release_kernel(this_cpu_read(watchdog_ev));
   510			this_cpu_write(watchdog_ev, NULL);
   511		}
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
