Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B7236EB9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737059096; cv=none; b=q65LM97vrjJhk8DT3N/9dfQLN4aosh7Cu2K/4Le+TLaQpjePvt0wphuucFvVAgT4qgcmpS9nAI9RzB2iAN+X/ShVR9Fn9Q51X9HwDAMAueWnmETsTqmKyfVAeIDsV/t/hnJ6JZWaa0zFW6rkMsgZTxHS1iHhMyotWBsP45aeVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737059096; c=relaxed/simple;
	bh=LavV3qcb7WHgSLfifoqR4mCvjSCwKMRtY4IXIgd7iM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUdu6fxKBhQg+N6b5tSfmmfLQ7KbHyoEYYwazVCjvA8EA+TTHoU6ouLlX6OTNmY0f7+uIuz43bgSWpdG7wQQ4CiLptIkRCgDLvW0PPUxnVZGTx5W3NuPMhSH54tcCdVukVuBZ1WkmBnBhilx0QREh3K7VATfPmatNu2JOqvM3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehGU9SCJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehGU9SCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737059096; x=1768595096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LavV3qcb7WHgSLfifoqR4mCvjSCwKMRtY4IXIgd7iM4=;
  b=ehGU9SCJvbhzCq3H2l7ljXISODH3EU1dTB33fvfmN2ANjFMM4ewS5zW0
   O2qvWwrrMREFNj2HPoiMcr6AFTBS5JXRGTwwREwiMq3jkXXssh9SQxdFw
   miYSf3FZWRyIh+enxJdnnD3E8vi5rf5+aeFnxDnuqARdXs6TSsTxMsW6g
   FuG0Knq3QEiivIlNlDGav+4Iz/vMsP/Eyau2HYuc42Zd0xUz3L7Lc9JY4
   pvLwBBUrINhtpflSbrTxAkyRPfd2BfUcZ3K9SyCmUhprjCuybCHSsvGXA
   9ChzRFBP2D0JuU3w07k32cgipL2kxc5OZ00vvvOjhYFCUEHUEilPlowGj
   A==;
X-CSE-ConnectionGUID: EksYX/LiRbiWHR8wLF5egw==
X-CSE-MsgGUID: Z+tzd3p9Q7KGIkGofETmig==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="59944912"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="59944912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 12:24:55 -0800
X-CSE-ConnectionGUID: 3lM8HCw0TDyDqTUTLhEx0A==
X-CSE-MsgGUID: LPHmTpahR9GmGz/o4rfljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="106184814"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 12:24:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYWQ6-000SLr-2v;
	Thu, 16 Jan 2025 20:24:50 +0000
Date: Fri, 17 Jan 2025 04:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: warning: 'snprintf' output
 may be truncated before the last format character
Message-ID: <202501170447.kNoyfjS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce69b4019001407f9cd738dd2ba217b3a8ab831b
commit: 28edaacb821c69241f6c0be6bbd29f7145f1b44f drm: zynqmp_dp: Add debugfs interface for compliance testing
date:   3 months ago
config: arm-randconfig-r013-20230520 (https://download.01.org/0day-ci/archive/20250117/202501170447.kNoyfjS5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170447.kNoyfjS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501170447.kNoyfjS5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                                              ^~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:17: note: 'snprintf' output between 18 and 20 bytes into a destination of size 19
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
