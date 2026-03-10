Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6242B726
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136323; cv=none; b=uctm1tMyJd88A0ufvbC6BmR4Iem/yAWSbtBfhw1Rm+2jnrPfmbhgpjyUHPs7spQhCoWNJ9Cm8Zwku0jTmeSH1Liqy4KKA1yDOWVlXdEE9tjLhuDq0A2D1pT00WRrVt5ljNJY2nuwQ9ETnltD0626OJLGZJbzNMgMRa3/Ucjcmec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136323; c=relaxed/simple;
	bh=ZvpGCv50H8rlJUBbcr18VIwbW93pHdldEcx3+8s+itU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2cJLDFrlPRjBp2BvH6va1g+gW9vE6WpDo/0MiFv1rKgcqVUmwdApSWtrlxXpdG5AdMhYK9sg7LNueut4fjn69EowAJiXC+xF9PC6t7gAVYBs8L+K2SoKJ8eNyY6S/nsAzlhGkhkDlkRW4rmwicxZkBfc+hPB3N0vw9iZHElx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEBIBfRH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEBIBfRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773136319; x=1804672319;
  h=date:from:to:cc:subject:message-id;
  bh=ZvpGCv50H8rlJUBbcr18VIwbW93pHdldEcx3+8s+itU=;
  b=aEBIBfRHznDrBN0aV/ey0CvchgFrG/6eVqtHSEgkcfFHuBzS+zVEjB1I
   halSZSJLHGepiMB04k1RcfJFwkbhRjots8oxfsc6mKmKB9PY1hwdNGFei
   qEMWN9OV9w0xGFV1C20cidI2/7ZN6b614zYzJMcPuB0KYbMC/qRvOC6PN
   EewJ7Qlnn0OxoOrxxgl4LGx3Ezz60cUwuxaUnGroinhNC0g9/YIxcea2o
   F6KGJsdGLJ9FobBr7xJM4HjpMnUUd+cNHLSpRufbrnTTSn3+ZYDs+RPBW
   5iDKStEmwvAUCCaMYjln8lW6/xS9T/eEFCeUxGf9EEqEtTv+YdkzKtPLH
   Q==;
X-CSE-ConnectionGUID: KsKZRkz4TqOSRvswwDIe7Q==
X-CSE-MsgGUID: p2fS7RY5QDWwrJKO/hLo0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="99644373"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="99644373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 02:51:58 -0700
X-CSE-ConnectionGUID: /ZlhXMRFTsSRmDFwjd/aUw==
X-CSE-MsgGUID: aH6V1YXqRQWEy0gS47OfOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220013728"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 02:51:56 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vztkn-000000001fk-2KCw;
	Tue, 10 Mar 2026 09:51:53 +0000
Date: Tue, 10 Mar 2026 17:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 114/114]
 drivers/firmware/arm_scmi/perf.c:615 scmi_dvfs_device_opps_add() warn:
 inconsistent indenting
Message-ID: <202603101747.1OlyUYO5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   8c70b958ea2cf2be1128ca4e98ef274a38cb081b
commit: 47933171f3e7a3880def7b21e958f38fe376223e [114/114] BACKPORT: firmware: arm_scmi: Simplify error path in scmi_dvfs_device_opps_add()
config: arm-randconfig-r072-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101747.1OlyUYO5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101747.1OlyUYO5-lkp@intel.com/

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
