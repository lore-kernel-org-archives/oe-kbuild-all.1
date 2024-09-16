Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C958C33DF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450446; cv=none; b=Jcg1z4BX6wwiq58QfzKYARt+dgRr3EdreDu5W6m9QOvMszZyZlM28GALnHyzJzMKvyaeBl5JgCoZKdgaK0txfh1v1bY3cp824nynFSQHSCjiLYA/yNzvYqB/EUi5fW7dJKL1hks1c9fA4hkKCy+tsz7n7VIk/bRtiadjQqT/34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450446; c=relaxed/simple;
	bh=lGoN757I9n1b/lpihFk7jhxPkG+B4CuFa/2hAC5a0ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8SMeWt1m5hH5j1w8qlH1iPgfy9W+NReU0t5HZZ2q7b3nLJ0t486G3/xaMLZ+NXrRVdj6K5m1RuL7ibeQoCYy0JqYHhK72PyH71Yh5xgYtv+g1WNbYBOJD0dvHq+EdPX5rEiQxXleRyH3GuR2/ed3RqivjIUuHomJlqmCbVYYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mp5QHIAq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp5QHIAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726450445; x=1757986445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGoN757I9n1b/lpihFk7jhxPkG+B4CuFa/2hAC5a0ds=;
  b=Mp5QHIAqbdgn3+IEUEwNNdtDha0FVUtQdXO021tZPnVGSpGELOSaEMsl
   8coYAYkny3eOk18OcW5twjk6ICYSECJyDyAJ6URMWWtemzsucT20EkGEv
   tL+vCOBaNiNQjgZgcu5dxL0ZL/7dWC2Zecla0KJzjvmRMK9M7703cSK93
   FLSnR0oLDDkQlOX4+/oz0Pc5YFU03d33HMnJT9s62IVM+o15j9JBavfiu
   II4iPADmUyapJAaN8c5i27lpRZABKqp7ZsGqkhHmQRQ61saQjCDrmmvOK
   Gi/giJDEUIL9M/d3ctgo8GcKZsglNymM+atVLgmC8JMxlPyIJ8FGin0sT
   Q==;
X-CSE-ConnectionGUID: iwCVOD2TSkqRcRSpILPW0w==
X-CSE-MsgGUID: b59nQQ8nQzGEfRcwkDaLiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24761228"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="24761228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 18:34:02 -0700
X-CSE-ConnectionGUID: ti8493v6Tce1noOHXrgORQ==
X-CSE-MsgGUID: 1Bt88PTbTUCWmZWyAil7Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68977049"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 18:33:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq0bx-0009DW-1R;
	Mon, 16 Sep 2024 01:33:05 +0000
Date: Mon, 16 Sep 2024 09:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 12926/15124]
 drivers/platform/chrome/wilco_ec/charge_schedule_sysfs.c:126:25: sparse:
 sparse: symbol 'dev_attr_peak_shift_battery_threshold' was not declared.
 Should it be static?
Message-ID: <202409160900.JIZ1bCko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   ad8dacd5a4263ddf51685be3c2190a341c26869b
commit: 9b5bb1f4afd2f2dd2fa16272e842bda49a427198 [12926/15124] CHROMIUM: platform/chrome: wilco_ec: Add charge scheduling sysfs
config: i386-randconfig-062-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160900.JIZ1bCko-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160900.JIZ1bCko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160900.JIZ1bCko-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/wilco_ec/charge_schedule_sysfs.c:126:25: sparse: sparse: symbol 'dev_attr_peak_shift_battery_threshold' was not declared. Should it be static?

vim +/dev_attr_peak_shift_battery_threshold +126 drivers/platform/chrome/wilco_ec/charge_schedule_sysfs.c

   125	
 > 126	struct device_attribute dev_attr_peak_shift_battery_threshold =
   127			__ATTR(battery_threshold, 0644,
   128			       peak_shift_battery_threshold_show,
   129			       peak_shift_battery_threshold_store);
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
