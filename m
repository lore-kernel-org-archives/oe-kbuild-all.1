Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA07397E6E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152038; cv=none; b=U+0qzRyR2tx0Rb5UkPtC0y8fAAW1yH1ufG5z8xJQ1Vq5rLNACk06YZa2MGb6jLGHn2brL8ImW+gNXZGlPkUu3e12lHE8FDDKn2/Q2l2kUrp4hcxvw2VGKnR/4i/ddFI9vUbvjPPQjP0YPpHAl0q+smNpzlZyMZEoUESK+z1msO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152038; c=relaxed/simple;
	bh=LUo0d7GHI/WFqekJPb5UVDAxzTgO13YJpLCp6un7e0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OxosyTtdzVwxih8HtT/sPkZKc6ADVIQKSid/xWFcIYiJkMmi0HR029fJ+voX9/CHVVUdZbQ9J7P5+Dh1IGzSee5aQ+j2Se7UIRNmojQ/FJPgLgAv78wT8hawsm741S5EYGzUvfl203+LkOuYEYIMkdcMRWnob5zYy1DvvWDwvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5J8ZxGS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5J8ZxGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773152035; x=1804688035;
  h=date:from:to:cc:subject:message-id;
  bh=LUo0d7GHI/WFqekJPb5UVDAxzTgO13YJpLCp6un7e0I=;
  b=Y5J8ZxGSAADOSQiAU7ZsL8E7v130gS8U1uWb3hxBmM2h4xn5KHDS2Vny
   CrvOMGHlv0myRYpBMswlD4+zMqrYq//g1K9czu7gInjvUi+9dtJSiyN+f
   GCKtsBGwZPDqYCTkDoajCQjrq84Tue0b3sgAwfzmRShT5waVdksOB5Bsp
   hgH5WZyKxvqaT3RTJjUlZKiGoU27mGUVlbTbVnRBxG5MoJHBLx/9a531L
   nuzCBj9DjxVgD9uz7iLBr93vkoLM2DZQfmmp4PFoWwvbZl9Q0lePLmvcb
   WdSwesotce4YsVUeO/+foN9MFcBF7vQBKJ8U34A0XPkvQwQ9nuvKML/W2
   Q==;
X-CSE-ConnectionGUID: wYFFXmEmRPuyBkWWqRD0OQ==
X-CSE-MsgGUID: 3bM3x577TYS6yJYbT3YWBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73222468"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73222468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:13:53 -0700
X-CSE-ConnectionGUID: oqu6Q1y2QeiDfCdOkWrusw==
X-CSE-MsgGUID: rvPgkFenQQGG9t8ytgdEYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216497565"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 07:13:52 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzxqI-0000000023I-0Etz;
	Tue, 10 Mar 2026 14:13:50 +0000
Date: Tue, 10 Mar 2026 22:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 114/114]
 drivers/firmware/arm_scmi/perf.c:615 scmi_dvfs_device_opps_add() warn:
 inconsistent indenting
Message-ID: <202603102237.sbNinQbV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   4326a928dd60688b2286fb031f879fe535fa3449
commit: 47933171f3e7a3880def7b21e958f38fe376223e [114/114] BACKPORT: firmware: arm_scmi: Simplify error path in scmi_dvfs_device_opps_add()
config: arm-randconfig-r072-20260310 (https://download.01.org/0day-ci/archive/20260310/202603102237.sbNinQbV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603102237.sbNinQbV-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/perf.c:615 scmi_dvfs_device_opps_add() warn: inconsistent indenting

vim +615 drivers/firmware/arm_scmi/perf.c

ac8aaf348cf54a0 Sudeep Holla     2019-07-08  600  
1fec5e6b5233a08 Cristian Marussi 2021-03-16  601  static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
3aa5b5408fe029a Ulf Hansson      2023-08-25  602  				     struct device *dev, u32 domain)
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  603  {
3aa5b5408fe029a Ulf Hansson      2023-08-25  604  	int idx, ret;
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  605  	unsigned long freq;
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  606  	struct perf_dom_info *dom;
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  607  
a135c8813815585 Cristian Marussi 2023-07-17  608  	dom = scmi_perf_domain_lookup(ph, domain);
a135c8813815585 Cristian Marussi 2023-07-17  609  	if (IS_ERR(dom))
a135c8813815585 Cristian Marussi 2023-07-17  610  		return PTR_ERR(dom);
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  611  
47933171f3e7a38 Ulf Hansson      2023-09-25  612  	for (idx = 0; idx < dom->opp_count; idx++) {
47933171f3e7a38 Ulf Hansson      2023-09-25  613  			freq = dom->opp[idx].perf * dom->mult_factor;
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  614  
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06 @615  		ret = dev_pm_opp_add(dev, freq, 0);
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  616  		if (ret) {
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  617  			dev_warn(dev, "failed to add opp %luHz\n", freq);
47933171f3e7a38 Ulf Hansson      2023-09-25  618  			dev_pm_opp_remove_all_dynamic(dev);
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  619  			return ret;
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  620  		}
742d32f206d82e0 Ulf Hansson      2023-08-25  621  
742d32f206d82e0 Ulf Hansson      2023-08-25  622  		dev_dbg(dev, "[%d][%s]:: Registered OPP[%d] %lu\n",
742d32f206d82e0 Ulf Hansson      2023-08-25  623  			domain, dom->info.name, idx, freq);
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  624  	}
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  625  	return 0;
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  626  }
a9e3fbfaa0ff885 Sudeep Holla     2017-06-06  627  

:::::: The code at line 615 was first introduced by commit
:::::: a9e3fbfaa0ff885aacafe6f33e72448a2993d072 firmware: arm_scmi: add initial support for performance protocol

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
