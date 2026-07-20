Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613433502A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534284; cv=none; b=IjcOPQn6zzxq+ymFD8kFA6WAQ2wpFemZhgqJPsL/lKobSPXJ/UPhRGBGm52Eeshwu8gSjgZmaMaJhmKYnZNpQYk8SgCbPjN5ZveAmuO9u10/XBDyr0cmYdGusSPtJpw360v66TaDBhbAwXZnObsLpOFaGyudPUsERa8oEbFXgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534284; c=relaxed/simple;
	bh=52TNBzsUH4PgOxvZMLxJzC8Wzj0a59k6wWabR5c2Q6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TaiyqRnslZaFcHdChisN6HoqMq0WKeb+s7NscNZUOQGYnkDwWwsaBcWuX9lMMe/3krw31YKE7A1uwCnoP1MJ21c27AuE3Kq3mrPhSVTndXu24DDyETk4We1NAogRWPt5T1a/+j7UfCgCqjwLBk5f8nJ1EQcSn0ULQLk6nKDdLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IajwNI9F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IajwNI9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784534283; x=1816070283;
  h=date:from:to:cc:subject:message-id;
  bh=52TNBzsUH4PgOxvZMLxJzC8Wzj0a59k6wWabR5c2Q6A=;
  b=IajwNI9Fh0+q6b+39n/LZCirbL5bKekLjS9GCZGMBIcItzNXttij5O75
   eu6yd5AzomEOJ0MM8Y8UQi56pF8QGkwBFGGYrGWd/YEPliHeTA7QxO5Y7
   5Pw3/enfVE98d6RvLy+p0+e9pViiMlVzWmbSHBS/2cpEogsjcgZp5w7cG
   ge4535lPiR7HC8mnSO3FmPsTCiAzyG0jiot6FHPKrGLKY/ivqFbeOyHrc
   jqnyHBuUbzqEJX/akRMGd7Tfs7n8rDpB2isqYqR6J/nwh1osV5207/TS4
   EoxpjTtuDXN8KJwkyGbPqed4JwEqTcOy3dEzOJmybqAp0MrjrhWpANyMw
   A==;
X-CSE-ConnectionGUID: 8FEjLirPT+yBOkfCHuputw==
X-CSE-MsgGUID: R2DXlFzYTEK7GGwFpuAe2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102658663"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="102658663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 00:58:02 -0700
X-CSE-ConnectionGUID: HX+P0m+URH60Eajvh1CLxg==
X-CSE-MsgGUID: +U2KW11DT+6Ob6waJqVCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="257452812"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Jul 2026 00:58:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlisv-00000000W3b-4C4j;
	Mon, 20 Jul 2026 07:57:58 +0000
Date: Mon, 20 Jul 2026 15:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 193/193]
 drivers/firmware/arm_scmi/perf.c:615 scmi_dvfs_device_opps_add() warn:
 inconsistent indenting
Message-ID: <202607201530.SkjxuOhs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: 47933171f3e7a3880def7b21e958f38fe376223e [193/193] BACKPORT: firmware: arm_scmi: Simplify error path in scmi_dvfs_device_opps_add()
config: arm-randconfig-r073-20260717 (https://download.01.org/0day-ci/archive/20260720/202607201530.SkjxuOhs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607201530.SkjxuOhs-lkp@intel.com/

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
