Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135B363098
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773402835; cv=none; b=RUIPDMVrGG3bjA/fy89ksImCQMW4c7I5z14ybxyqTiHQfen5+aT0YfRef5YRrllUJ5PWM1WvYnAPmALskT1ufUaASo5I8qLKXmZJQh1PyVdtN1EUcsj3WZICpoV83OCaubCnvz4HtaKYF7hCgEd5zAHoZCCBdJRyXcjJ4ZsuPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773402835; c=relaxed/simple;
	bh=SGc08qik6IAv5MkffY0y6qjvu4hXE3fDrzq8lS+nIdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aXohfNIsrxQzmO5mct/Y1twXdv5K8dC8hZotnaVugVf1T0RYLyTfHsJzl6xWRrsFDeVN33PSzi92ccuqSShTo2ebE/5Zrl58meks0lPCNmRzkFbgz60/9gf6f08o11jXjlS3cvf+NGzfU3LSspta44PMMHJmt2V2CihoqjPsZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVdqQuEe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVdqQuEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773402822; x=1804938822;
  h=date:from:to:cc:subject:message-id;
  bh=SGc08qik6IAv5MkffY0y6qjvu4hXE3fDrzq8lS+nIdo=;
  b=bVdqQuEetSOeuUqbXpOuMb6r9axgqGq8VtHEId9JHxaKkzPyvNXKRTTZ
   ezFgL8rM28qotui+vhfaKPSe4opZCXnSti0UWAmxRlIRcLfIGqyWrgDik
   h/3TIDVZn0Hn/dbR78aOSyL+111hz/PiOPaOJfShjbU56lkkmho+T5W6B
   eRvFYCS32gQjJTfRE0eqTSPnobazzmtwmxjQdRlRRl4GYXbtnnNUFhzDA
   E0W/jer6zdFc9FtU+Ss2gg1g5Ub+LtkcLYZ77bhTAfu5QAZmnjU/G6rf4
   HNRE8Ds7TUg3ap3/zvHHFkQiA7sJiXSyaxxKCUjgvXF+ZndcqvVkFdh5Q
   A==;
X-CSE-ConnectionGUID: VCH91R+YQreHOoNH0dCHxw==
X-CSE-MsgGUID: NFUnelvVSE2JOhKeTLYzMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85863226"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="85863226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:53:39 -0700
X-CSE-ConnectionGUID: xmqEmV3MQv6odKuIHGfyHw==
X-CSE-MsgGUID: 1mSEzeejRvaFjn2S+deCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="223515539"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Mar 2026 04:53:37 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w115D-000000003nL-1hVy;
	Fri, 13 Mar 2026 11:53:35 +0000
Date: Fri, 13 Mar 2026 19:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 114/114]
 drivers/firmware/arm_scmi/perf.c:615 scmi_dvfs_device_opps_add() warn:
 inconsistent indenting
Message-ID: <202603131948.xEMc5sUA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a66ac38e2c42b6f1a0205eba3000c2dc085a8e1a
commit: 47933171f3e7a3880def7b21e958f38fe376223e [114/114] BACKPORT: firmware: arm_scmi: Simplify error path in scmi_dvfs_device_opps_add()
config: arm-randconfig-r072-20260310 (https://download.01.org/0day-ci/archive/20260313/202603131948.xEMc5sUA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131948.xEMc5sUA-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/perf.c:615 scmi_dvfs_device_opps_add() warn: inconsistent indenting

vim +615 drivers/firmware/arm_scmi/perf.c

ac8aaf348cf54a Sudeep Holla     2019-07-08  600  
1fec5e6b5233a0 Cristian Marussi 2021-03-16  601  static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
3aa5b5408fe029 Ulf Hansson      2023-08-25  602  				     struct device *dev, u32 domain)
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  603  {
3aa5b5408fe029 Ulf Hansson      2023-08-25  604  	int idx, ret;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  605  	unsigned long freq;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  606  	struct perf_dom_info *dom;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  607  
a135c881381558 Cristian Marussi 2023-07-17  608  	dom = scmi_perf_domain_lookup(ph, domain);
a135c881381558 Cristian Marussi 2023-07-17  609  	if (IS_ERR(dom))
a135c881381558 Cristian Marussi 2023-07-17  610  		return PTR_ERR(dom);
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  611  
47933171f3e7a3 Ulf Hansson      2023-09-25  612  	for (idx = 0; idx < dom->opp_count; idx++) {
47933171f3e7a3 Ulf Hansson      2023-09-25  613  			freq = dom->opp[idx].perf * dom->mult_factor;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  614  
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06 @615  		ret = dev_pm_opp_add(dev, freq, 0);
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  616  		if (ret) {
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  617  			dev_warn(dev, "failed to add opp %luHz\n", freq);
47933171f3e7a3 Ulf Hansson      2023-09-25  618  			dev_pm_opp_remove_all_dynamic(dev);
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  619  			return ret;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  620  		}
742d32f206d82e Ulf Hansson      2023-08-25  621  
742d32f206d82e Ulf Hansson      2023-08-25  622  		dev_dbg(dev, "[%d][%s]:: Registered OPP[%d] %lu\n",
742d32f206d82e Ulf Hansson      2023-08-25  623  			domain, dom->info.name, idx, freq);
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  624  	}
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  625  	return 0;
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  626  }
a9e3fbfaa0ff88 Sudeep Holla     2017-06-06  627  

:::::: The code at line 615 was first introduced by commit
:::::: a9e3fbfaa0ff885aacafe6f33e72448a2993d072 firmware: arm_scmi: add initial support for performance protocol

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
