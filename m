Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421935A939
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205963; cv=none; b=isnPzsH1m14oytXtKAMAZk+TKf8IszgS/ZT1WUuxucxlY1TE7hWG0eoTM/W63hZbaD984y6Ao5V3ZqLKwX4FhPhweMv6hqy7tPlfpiKzXVZUmXQTrquiieBmj8w4jB53jUwfpgi4WQG8F63hhPh9Dfv9WDelV9m3wpvhb7Jd9v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205963; c=relaxed/simple;
	bh=E+yRv16kRPyY+cZJfm8wCTu8kgtQGdrUy9jThVXVaq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=apVMXMm4YiRTpcyg3yOcCVD4u8YRirhL8IXkf+ZDwTgStux6RUiGFqYomc85RrPzW2bdfFisBw/aLucEiPUylT2Xz5dPx0NTDHJJtkGfRER94ZyX+k9wmBrYp9kYWy4opc4ci1W2aQtWfuYrFHFEZpsfkzfoNL12r9v375hKSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxtrmMFt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxtrmMFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205963; x=1806741963;
  h=date:from:to:cc:subject:message-id;
  bh=E+yRv16kRPyY+cZJfm8wCTu8kgtQGdrUy9jThVXVaq8=;
  b=MxtrmMFtrXgefdh0/yF3ELPxV3q93CtDPfqyl6o7lqmIX/Q/jvBqMZhh
   /SGztZuAwBT+zMy0LQ9AjEzORAhrvxJh2KzCTt7ZqKxjuf09f0g4Fmvqp
   GDAGiqj/0aBdxqdief6vAoe5Wt9gkstL2DYUCgLEeu8BDBYs5UhuASTB2
   wIpLsiAXda3hGu0GIMolhTe+nXSKuML1EVJ4k5/ShtZPtbwVQ3GxwBfB0
   tw+zJC4DjuLgortopmFzd3GZ1fj731qK9jh22KnNLb+LfzrCZIKJ9ADh7
   6Xc+HrHvXoTllMWZhU7J3FTM2IYTJVhvbx7H16i0T/cDFCm3PhcpjqcDq
   g==;
X-CSE-ConnectionGUID: yY/WCzgHS4mGwuGdyxlKtg==
X-CSE-MsgGUID: 9xg/4upUQompPqGWOZ1uew==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889030"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889030"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: LDABvKzCT0Gnc9MnmHzr1A==
X-CSE-MsgGUID: v6L4poPsS0Cw/J+H1vhQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226369002"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000016B-2PkB;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/cpufreq/scmi-cpufreq.c:194:5: warning: 'done' is used uninitialized
 in this function
Message-ID: <202604030942.Tz3qVQHN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5298296390b678b55d9e5d5e165ab0feb552f7dc
commit: 85e3a67903c7e71b22cd83438553ab65b6e37efe [2/2] ANDROID: scmi_cpufreq: Add restricted vendor hook for scmi_limit_notify_cb
config: arm-randconfig-004-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030942.Tz3qVQHN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030942.Tz3qVQHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030942.Tz3qVQHN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/scmi-cpufreq.c: In function 'scmi_limit_notify_cb':
>> drivers/cpufreq/scmi-cpufreq.c:194:5: warning: 'done' is used uninitialized in this function [-Wuninitialized]
     if (done)
        ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/done +194 drivers/cpufreq/scmi-cpufreq.c

   182	
   183	static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
   184	{
   185		struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
   186		struct scmi_perf_limits_report *limit_notify = data;
   187		unsigned int limit_freq_khz;
   188		int ret = 0;
   189		bool done;
   190	
   191		limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
   192	
   193		trace_android_rvh_scmi_limit_notify_cb(&done, priv->cpu_dev, limit_freq_khz);
 > 194		if (done)
   195			return NOTIFY_OK;
   196	
   197		ret = freq_qos_update_request(&priv->limits_freq_req, limit_freq_khz);
   198		if (ret < 0)
   199			pr_warn("failed to update freq constraint: %d\n", ret);
   200	
   201		return NOTIFY_OK;
   202	}
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
