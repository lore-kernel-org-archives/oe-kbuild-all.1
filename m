Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6307484
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635126; cv=none; b=NTY9RPDZiKyziYrNsnM4bYs/HXZw4w42s3i38KSLPcbcJ9zV+0dk1VyRx52iYGagM6NQmJqAeCDvG/DDdtCSbiWiewO03/tRXmFD0hXl8D5kVBIPefp+Ftc3WlnwHQ+qw8ioOkSIWULrHT2nWSEocZEasX59nwq00vNABVyD7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635126; c=relaxed/simple;
	bh=pvmeE7C7J+kaQ3qLVokT0R4td6jiZ3X266svjOR3hGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzjNEIRG+93R0/o3G0z2hZAFZ155HvhOw78IhvLef0meKpj3DO79ArhtdyU/eefFKRh53HVRvTQdxB4acF0FZk73JfWT7P9GixiAN1qiQvfWNFCBLCYB9wKSZgRcAiZFC9vrk2pT7/qQ0IVqD8oFpXnj5xdnse3yY9fNIH8x894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUPY3CNs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUPY3CNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709635125; x=1741171125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvmeE7C7J+kaQ3qLVokT0R4td6jiZ3X266svjOR3hGQ=;
  b=aUPY3CNsUBlSqDnP7EyQ2Cl4VwisSDAHiYcjmo9eErQUfsbgxRo1/lVR
   vhKj7v6QLdF6KUfgXYwzdayoe++fqEcuJd9HyXalwFY8mJQOlPxKd6SOA
   cVXC8QjDa7veDtqBmB67YQRSe0ShzNvCa5rO1OFlUD+aoRC7Gs/k+3Y5V
   bCv570WVc0aT1KfZecYBtJLSJrwCh3zkGcTJNZf/J2LVPXuMO+JtKhm78
   ZFQqDSwA7eFdqVsck1wBUfPI0TlALRtahAU031NEHV0gIbF4FUO3XBmWG
   2v2WtLOoAGgluwCUrXnyYRAl+8YDjxcRp9PmSnyCzWwn+7Rk57of75enJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4039036"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4039036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="40327641"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2024 02:38:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhSBz-0003FF-0S;
	Tue, 05 Mar 2024 10:38:39 +0000
Date: Tue, 5 Mar 2024 18:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26603/27434] kernel/sched/fair.c:4807:5:
 warning: no previous prototype for 'runtime_refresh_within'
Message-ID: <202403051831.Bioma33U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: ce39c5b91ae9f91569ddd4f8812fdf687631d389 [26603/27434] rue/cpu: Implement bandwidth control of BT based on cfs_bandwidth
config: arm64-randconfig-003-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051831.Bioma33U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051831.Bioma33U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051831.Bioma33U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4807:5: warning: no previous prototype for 'runtime_refresh_within' [-Wmissing-prototypes]
    4807 | int runtime_refresh_within(struct cfs_bandwidth *cfs_b, u64 min_expire)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:4824:6: warning: no previous prototype for 'start_cfs_slack_bandwidth' [-Wmissing-prototypes]
    4824 | void start_cfs_slack_bandwidth(struct cfs_bandwidth *cfs_b)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/runtime_refresh_within +4807 kernel/sched/fair.c

  4799	
  4800	/*
  4801	 * Are we near the end of the current quota period?
  4802	 *
  4803	 * Requires cfs_b->lock for hrtimer_expires_remaining to be safe against the
  4804	 * hrtimer base being cleared by hrtimer_start. In the case of
  4805	 * migrate_hrtimers, base is never cleared, so we are fine.
  4806	 */
> 4807	int runtime_refresh_within(struct cfs_bandwidth *cfs_b, u64 min_expire)
  4808	{
  4809		struct hrtimer *refresh_timer = &cfs_b->period_timer;
  4810		s64 remaining;
  4811	
  4812		/* if the call-back is running a quota refresh is already occurring */
  4813		if (hrtimer_callback_running(refresh_timer))
  4814			return 1;
  4815	
  4816		/* is a quota refresh about to occur? */
  4817		remaining = ktime_to_ns(hrtimer_expires_remaining(refresh_timer));
  4818		if (remaining < (s64)min_expire)
  4819			return 1;
  4820	
  4821		return 0;
  4822	}
  4823	
> 4824	void start_cfs_slack_bandwidth(struct cfs_bandwidth *cfs_b)
  4825	{
  4826		u64 min_left = cfs_bandwidth_slack_period + min_bandwidth_expiration;
  4827	
  4828		/* if there's a quota refresh soon don't bother with slack */
  4829		if (runtime_refresh_within(cfs_b, min_left))
  4830			return;
  4831	
  4832		/* don't push forwards an existing deferred unthrottle */
  4833		if (cfs_b->slack_started)
  4834			return;
  4835		cfs_b->slack_started = true;
  4836	
  4837		hrtimer_start(&cfs_b->slack_timer,
  4838				ns_to_ktime(cfs_bandwidth_slack_period),
  4839				HRTIMER_MODE_REL);
  4840	}
  4841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
