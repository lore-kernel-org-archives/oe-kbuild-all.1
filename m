Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59A2111
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735414238; cv=none; b=iE9W21PrkGo5BNxtYS2ImLnq9KQ6yG0AykfUBOJq1uPvmXt80AEytJjqEnWKGAzBLHQPkmoWE6X7SKZIS9TI58XxukF1RzyjLJpGTbE9Tnu4c1VwgpoxkWS4tAp3Sqfltis4SZGFC6h/KWvmcr7S8pfVtqikr4h2m2C3K2lll5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735414238; c=relaxed/simple;
	bh=mQAGqJXlXN4+Dfs/zlEF947Ct6Gc554Jh8gHTGwuq3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSqnIejgeAH76FPnmbhotPWIUJGJbn1rd9WE/T/lLEmvW5Wo3S6NW3Z41nlgsXneOqd7Kp5gK/CCHjwWpg1aCAXFmadbDrCcxZdzzaphDhTeIhaU02VUl41PxJQxIH3Cunxw0PkaIrQ1HU5sCdOKU/1A1M41WgycyGhQ37QAPVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSUmZMiA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSUmZMiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735414237; x=1766950237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQAGqJXlXN4+Dfs/zlEF947Ct6Gc554Jh8gHTGwuq3Y=;
  b=ZSUmZMiAzfnPPCy4PcA+GPR+GPrH+ofWOE7Cyjd3YzL0hknbHaH4vnE6
   rAAkjRsC7ucMl63lugfEd0xMfFvTk6uRZvCpD3vvaROu5gbAjx/PcxnrK
   6FeVfoLTxO1ydKEjOzV7ZMljImcMXt6eNGqQKRePU4hrZ57oM4gb6Nrp2
   NZSD1gFdzfMvMIWWaDtclBaypjbAL4wQL7byTnpKIP3oc28dokv0ynqZ4
   XyAXfQQdNQ0Yuq0zqiDA6qjVPCxCkn5sNG5+xvawhns84DPGmSrm/ovRF
   HoqnBXwRZ5PzhWZEVj+d9iLJaSVjD/pWoMxKfSFwjQZHUGuM3OrWgoplZ
   Q==;
X-CSE-ConnectionGUID: NO+4K6oMR0WmVxY2OiNlQg==
X-CSE-MsgGUID: XgpsM7RqTmOtXG0eci8nHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35029610"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="35029610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 11:30:36 -0800
X-CSE-ConnectionGUID: 8fmAO+mmTW+2iaL+5EkxDg==
X-CSE-MsgGUID: BoPTyMzXSR2SiEJGMBSAlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="131256397"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Dec 2024 11:30:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRcW8-0004HD-02;
	Sat, 28 Dec 2024 19:30:32 +0000
Date: Sun, 29 Dec 2024 03:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: 'snprintf' output
 may be truncated before the last format character
Message-ID: <202412290337.iiDfMw5z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 28edaacb821c69241f6c0be6bbd29f7145f1b44f drm: zynqmp_dp: Add debugfs interface for compliance testing
date:   8 weeks ago
config: x86_64-buildonly-randconfig-006-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290337.iiDfMw5z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290337.iiDfMw5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290337.iiDfMw5z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                                              ^~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:17: note: 'snprintf' output between 18 and 20 bytes into a destination of size 19
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/snprintf +2312 drivers/gpu/drm/xlnx/zynqmp_dp.c

  2278	
  2279	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_ignore_hpd, zynqmp_dp_ignore_hpd_get,
  2280				 zynqmp_dp_ignore_hpd_set, "%llu\n");
  2281	
  2282	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
  2283						  struct dentry *root)
  2284	{
  2285		struct zynqmp_dp *dp = bridge_to_dp(bridge);
  2286		struct dentry *test;
  2287		int i;
  2288	
  2289		dp->test.bw_code = DP_LINK_BW_5_4;
  2290		dp->test.link_cnt = dp->num_lanes;
  2291	
  2292		test = debugfs_create_dir("test", root);
  2293	#define CREATE_FILE(name) \
  2294		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
  2295		CREATE_FILE(pattern);
  2296		CREATE_FILE(enhanced);
  2297		CREATE_FILE(downspread);
  2298		CREATE_FILE(active);
  2299		CREATE_FILE(custom);
  2300		CREATE_FILE(rate);
  2301		CREATE_FILE(lanes);
  2302		CREATE_FILE(ignore_aux_errors);
  2303		CREATE_FILE(ignore_hpd);
  2304	
  2305		for (i = 0; i < dp->num_lanes; i++) {
  2306			static const char fmt[] = "lane%d_preemphasis";
  2307			char name[sizeof(fmt)];
  2308	
  2309			dp->debugfs_train_set[i].dp = dp;
  2310			dp->debugfs_train_set[i].lane = i;
  2311	
> 2312			snprintf(name, sizeof(name), fmt, i);
  2313			debugfs_create_file(name, 0600, test,
  2314					    &dp->debugfs_train_set[i],
  2315					    &fops_zynqmp_dp_preemphasis);
  2316	
  2317			snprintf(name, sizeof(name), "lane%d_swing", i);
  2318			debugfs_create_file(name, 0600, test,
  2319					    &dp->debugfs_train_set[i],
  2320					    &fops_zynqmp_dp_swing);
  2321		}
  2322	}
  2323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
