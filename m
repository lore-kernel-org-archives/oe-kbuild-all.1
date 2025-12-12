Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17963205E25
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765576583; cv=none; b=FaglOWIIgU7O18mLhhq0NQthtqAmv6S3BUAzGdxriwLBK8eOI09di8AkzJ7bPFu82TKgtqFyYDKzdAR57FFZH1gzIsqLA01/u8+OfwLa+TdtjIpVb7Xhco7CHxYsK2jGM2hIg7XSJow7//L2kzNtxu7MgLpdDyo3SxWHjsiH9gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765576583; c=relaxed/simple;
	bh=Dxhav/Bc+rpiuC3PD2yeJ+uYSobTthl/6Se67balYFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nj7SoEpcZNX2BWlY/nYXf2CVWEiz4sh45HRpjHH0xKliFaFMy/JsInkOrg0WlfM2piFqW9YRVS51IORpX2gGx73hN1+9QPCqOQbbtHlZw8VCZOOviIPxJNfd+f8rA8fNx5mFcLByDZOYss6+CuRTSfa0Cs2LzymUYSXwQCuul5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEjLlsjM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEjLlsjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765576582; x=1797112582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dxhav/Bc+rpiuC3PD2yeJ+uYSobTthl/6Se67balYFY=;
  b=AEjLlsjMjKUCw31EiVblbbysiuDwwRX6wRY1TzWPu2FakZSI5VQm48VY
   Fn1wbmw2SAS0b2nc5yKsgfbvjN3B0zN3V00s5SjsAilsCE7EfLewBm0F9
   SBJSBoqau4I/AbwH/swFToRRzB8mTo1OGP0M5iFqy+7Ki88la276qzqpA
   5z4KLvd7itaCRs0/v18tmDka7N49N03QZ1ZxODHsiURaMsB3tlvBTFYDy
   a+a8klTQFeSLHfEhOmfqADeWtLZnKZxzoZGgNRVuEsiOsRR4Sv+ar9jXt
   ul9c7xdPfUGPYkr42GUkCKEAwd2o9n3hszyKOra8PMMexX5SyIKsZx+tp
   g==;
X-CSE-ConnectionGUID: cTkdErr9QEGHsfvHgNeXgw==
X-CSE-MsgGUID: 0Qax2gitTieQtD1uyZhIow==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71211470"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71211470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:56:21 -0800
X-CSE-ConnectionGUID: K/30yr6iSM6Ni8KDCkzvGA==
X-CSE-MsgGUID: e1qP1g99Sueug5j5rXcPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202275902"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2025 13:56:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUB7Z-000000001qe-3MH3;
	Fri, 12 Dec 2025 21:56:17 +0000
Date: Fri, 12 Dec 2025 22:55:33 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] posix_timers.c:398:13:
 warning: 'check_delete' defined but not used
Message-ID: <202512122201.Hhwgzg7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   fbfd6aedcdb51da80c81b27b298b8691212febac
commit: f3a29e7eb6dea8119f0d5132e39b52adf4d1ea76 [1/1] ANDROID: Disable check_sig_ign within kselftest_timers_posix_timers
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512122201.Hhwgzg7w-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122201.Hhwgzg7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122201.Hhwgzg7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> posix_timers.c:398:13: warning: 'check_delete' defined but not used [-Wunused-function]
     398 | static void check_delete(void)
         |             ^~~~~~~~~~~~
>> posix_timers.c:342:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     342 | static void check_rearm(void)
         |             ^~~~~~~~~~~
   posix_timers.c:235:14: warning: 'ignore_thread' defined but not used [-Wunused-function]
     235 | static void *ignore_thread(void *arg)
         |              ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
