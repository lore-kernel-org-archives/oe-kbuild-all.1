Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5FA3EC2FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181988; cv=none; b=ECqL5U7R2eoUOJQwV8XBM4+0FozMwrhcSjHZfkMMPslYJvjmcl8s6AERP5fi256pKnS1rqvt/cPYPfoMPgZCupnQ1VT/7e/VcOnsKuankjyVBBHxP444X/+lnfZRlH/WEibS84tKWLRbarn9LC0sug5LIWdDO/NZV8qiJWVbGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181988; c=relaxed/simple;
	bh=+smj7U4VSUykFS+tO9DyRy6TbXv07wceE728XDAolNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qJhWoZX3Bkdv2HEUs5RS+iHh2Y8Or5tL3YyE7SKI7zZwSnyH73SajIc4Cy/oVHIbEa+bHMWCY+NFiPkGqAyEs2hQblw981RdUeqIkhNTpAKvsWBrs/iaePktBpTVXCIUOXEmg0gdsYeH6pninQnHJ5eQA8ihxeb5LLDyxNiNvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeU1nXuY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeU1nXuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776181988; x=1807717988;
  h=date:from:to:cc:subject:message-id;
  bh=+smj7U4VSUykFS+tO9DyRy6TbXv07wceE728XDAolNU=;
  b=UeU1nXuYt0VFQli+RWnb7f/WEH9ENVdOGjWQeo6rvhkPMN4Ccl6TTcpM
   DwhJfo1Nk791NxQS7s/jI+6JXTJM2P5aaqLCldZ5VSpC8bt0WSOgBXsFe
   D5AB9yjrIVrLNxEl0+WFlATWYcF6n5pSsMBO8Vph9VEH723hVLz7/a8zd
   CdHMABi7/q4VIFvyUfQ6JXO0S7YomJ6BOB1dYQG12TGqXm4G6oS58Qeff
   PhA+ca4OfS4KZT/FC8IiohZnAJem86PZeXWo3V3coyUcCQiIpXyMBLRqD
   EOQETEU/WbXcZyMDFlPe6EK7CZR+MA8//GplL0CU0Eht1wC8g0BXsw02I
   g==;
X-CSE-ConnectionGUID: 4+YcfyakS3OGAqohVqPwlg==
X-CSE-MsgGUID: 7UEQH3aaRaa+SInbt/D04w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76849423"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76849423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:53:05 -0700
X-CSE-ConnectionGUID: XcQRvm5dRe2Rh8DE0nR8Pw==
X-CSE-MsgGUID: eFnFxd4JQKG9z/35iQLZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="231884664"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 14 Apr 2026 08:53:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCg4T-000000000RV-0git;
	Tue, 14 Apr 2026 15:53:01 +0000
Date: Tue, 14 Apr 2026 17:52:49 +0200
From: kernel test robot <lkp@intel.com>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: drivers/bus/mhi/host/init.c:506:13: warning: unused variable
 'ret'
Message-ID: <202604141709.5pv5oyvs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/bus-mhi-host-Add-support-to-read-MHI-capabilities/20260414-193638
head:   b723228ca2b8d16a9c3a1b3825aeb47319ca66b9
commit: bc53f90a07a26ae0ed21ef1cdae348197cc60cf3 bus: mhi: host: Add support for non-posted TSC timesync feature
date:   4 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260414/202604141709.5pv5oyvs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141709.5pv5oyvs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141709.5pv5oyvs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bus/mhi/host/init.c: In function 'mhi_init_tsc_timesync':
>> drivers/bus/mhi/host/init.c:506:13: warning: unused variable 'ret' [-Wunused-variable]
     506 |         int ret;
         |             ^~~


vim +/ret +506 drivers/bus/mhi/host/init.c

   500	
   501	static int mhi_init_tsc_timesync(struct mhi_controller *mhi_cntrl)
   502	{
   503		struct device *dev = &mhi_cntrl->mhi_dev->dev;
   504		struct mhi_timesync *mhi_tsc_tsync;
   505		u32 time_offset;
 > 506		int ret;
   507	
   508		time_offset = mhi_find_capability(mhi_cntrl, MHI_CAP_ID_TSC_TIME_SYNC);
   509		if (!time_offset)
   510			return -ENXIO;
   511	
   512		mhi_tsc_tsync = devm_kzalloc(dev, sizeof(*mhi_tsc_tsync), GFP_KERNEL);
   513		if (!mhi_tsc_tsync)
   514			return -ENOMEM;
   515	
   516		mhi_cntrl->tsc_timesync = mhi_tsc_tsync;
   517		mutex_init(&mhi_tsc_tsync->ts_mutex);
   518	
   519		/* save time_offset for obtaining time via MMIO register reads */
   520		mhi_tsc_tsync->time_reg = mhi_cntrl->regs + time_offset;
   521	
   522		return 0;
   523	}
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
