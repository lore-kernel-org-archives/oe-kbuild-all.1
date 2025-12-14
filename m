Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12A32772D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765747849; cv=none; b=Pr5W5efncGYMKSkXn5r6eN1nnYlOXou/BqLqg1op1UCls2chNVJAesesQ5ZNj3O834k15QPoSRqw9HEjSqyQfIBbGMk+WIGqN7VFpttdZsLEvhycwM5IGrPUF1sv582mDeJoaNt6vBj7ah2eNEwyQB2go1sNMBEacEdrZZkZDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765747849; c=relaxed/simple;
	bh=1wPkb5R3UlQ71ghTELq/P8lUketn82UdJCgtYKIdh4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVRmXN3NKmtScLsP6d90jTJ1Nik8UGzK27nbRP8WO+lM87NGneW9mQZGUmbsYsPE0o8i1ZBP3x85IMVCaDeww1U6yMdyUUDeNi0EdwaA5e00XMlrm9UNyGf3MN1JIPmDOtVqf2VCUB16GsFIKIqo2TxfXO8pGWT+xje+AvOFD2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nm7McbtR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nm7McbtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765747848; x=1797283848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wPkb5R3UlQ71ghTELq/P8lUketn82UdJCgtYKIdh4c=;
  b=Nm7McbtRF4TQX7J8APPxWpk9b86W02oFGJ4fmc3o+ReTMKsRuvZaVKwY
   zKDJpylCafgvN1OCfJrkeqTM41CKkUdN+Vd6G3GnSD6jqm+7O2wEOqOP3
   7+QiFTclcfd/aV7+4sIOVXGbivG3gq2OZQBilbFppZlMXkaOQzdGdzC4P
   Ihlyq2D4p0zmm29UXBbcW5L6ltmaibtFfZmBnI4dDlJ58FPfU4pHNZjHb
   WWhCX5kyiISh0K8up2yDHdwPjr/jrzp5s10CWmcjcTBNuQP4P2dA7EZCe
   EyLgtFcQZ4giMxaciTBAN8IT1nTwohLr0zIYS+KE9pyh1lrPrFQ4NVDtT
   g==;
X-CSE-ConnectionGUID: 0NRWhHhLRBGcqwK/F92o2w==
X-CSE-MsgGUID: w3K5tKQtRfChfp1LGjOw3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85068582"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85068582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 13:30:48 -0800
X-CSE-ConnectionGUID: cj3SsmduSFeLr+Ms/Vpv/w==
X-CSE-MsgGUID: 31cUdfBJTiWYlcerMvdGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202484800"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Dec 2025 13:30:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUtfw-000000009PR-2i2v;
	Sun, 14 Dec 2025 21:30:44 +0000
Date: Mon, 15 Dec 2025 05:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] kernel/delayacct.c:282:5:
 sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be
 static?
Message-ID: <202512150513.7W8iPDpA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 35bb2c8c5fd3f623e062757cd943617efa29a172 [0/40] ANDROID: Add vendor_hooks to workaround CONFIG_TASK_DELAY_ACCT
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150513.7W8iPDpA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150513.7W8iPDpA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150513.7W8iPDpA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/delayacct.c:282:5: sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be static?

vim +/delayacct_enabled +282 kernel/delayacct.c

   281	
 > 282	int delayacct_enabled __read_mostly;	/* Delay accounting turned on/off */
   283	bool get_delayacct_enabled(void)
   284	{
   285		return delayacct_enabled;
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
