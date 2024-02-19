Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373BE40BE7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708362611; cv=none; b=tMcrE6qyQL/F1auLeTqQoJTxjg6qMuMAUc6ubhZgI7fvAZmOgbJy2qg2q9CF/Deu6/9pXCg/jIlsKgzX8XcQcRAgEfPFMsYlfsUAdKfAFygBuNdVHnNBxGL5j/Pe6hHs1UkHI/GSCmltPXpvd5k0B3v1QAcm1r/NGkgAbIDF2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708362611; c=relaxed/simple;
	bh=UvclqoCLwD438AhM9ORT2oKNcK0hn2FSX5K8H24b4FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qc4xoGlTJ6THmlOuRVbrJtBVtSWIqw3nHAhJ6ig59HXWIA5EDf4AyPecAm8SIulEwVpnzg4snMwqvaJfCv0UIXAduEnUSIlRIzRAF/HxGjWJfgQHgYWH6nf+0HIgQnvyAB+YZXIv6uLz+dd2sPmeTvoOVwsCsVU9rcgEJKVQOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gy5rse+F; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gy5rse+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708362609; x=1739898609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UvclqoCLwD438AhM9ORT2oKNcK0hn2FSX5K8H24b4FQ=;
  b=Gy5rse+FujrvQcKCWX8GCNPhnCeLps4HnjhQ90j6TPVU4Z9jVeh5Hg5t
   jIy6secB+Ln0rBJ4yzppgcHSM5tzBxx5E/xjMNgUxgbSm7rgSn/I4TfZM
   uKTQuPeRjXtyFmXStGyhR5fcElVf2XvwBN65QAiPzXUZBA8j8PPOuJyeo
   XKtkIMRxRUeOtR9/IINgc3rIr2WUCvghzWDeYdZx2YgtZb+YgcJTacAYk
   9qFqe3n0cucxp4P+T3BsdyE6MMROU6t510+bvVsaaMnzOZ5JDY0piUxmw
   IrdnNIsIoiSK+nGAd5bGF9Dc23q6f7sl9TldtWhVcnn1hCTXMRgn9MPY/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2315237"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2315237"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 09:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4933405"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2024 09:10:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc79Y-0003xO-2Z;
	Mon, 19 Feb 2024 17:10:04 +0000
Date: Tue, 20 Feb 2024 01:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4863/17898]
 drivers/soc/imx/rpmsg_life_cycle.c:126:13: error: 'pm_suspend_target_state'
 undeclared
Message-ID: <202402200134.2fMfdR9j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: d76441df9683065e8b622bc0cdf725ba3b2db0fd [4863/17898] Merge branch 'rpmsg/next' into next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240220/202402200134.2fMfdR9j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402200134.2fMfdR9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402200134.2fMfdR9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/imx/rpmsg_life_cycle.c: In function 'rpmsg_lifecycle_pm_notify':
>> drivers/soc/imx/rpmsg_life_cycle.c:126:13: error: 'pm_suspend_target_state' undeclared (first use in this function)
     126 |         if (pm_suspend_target_state != PM_SUSPEND_MEM)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/rpmsg_life_cycle.c:126:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/pm_suspend_target_state +126 drivers/soc/imx/rpmsg_life_cycle.c

ef6386e70ae4cf Jacky Bai 2021-09-23  119  
fb9fd020919b41 Jacky Bai 2021-10-18  120  static int __maybe_unused rpmsg_lifecycle_pm_notify(bool enter)
fb9fd020919b41 Jacky Bai 2021-10-18  121  {
fb9fd020919b41 Jacky Bai 2021-10-18  122  	struct pm_rpmsg_data msg = {};
fb9fd020919b41 Jacky Bai 2021-10-18  123  	int ret;
fb9fd020919b41 Jacky Bai 2021-10-18  124  
fb9fd020919b41 Jacky Bai 2021-10-18  125  	/* Only need to do lifecycle notify when APD enter mem(HW PD) mode */
fb9fd020919b41 Jacky Bai 2021-10-18 @126  	if (pm_suspend_target_state != PM_SUSPEND_MEM)
fb9fd020919b41 Jacky Bai 2021-10-18  127  		return 0;
fb9fd020919b41 Jacky Bai 2021-10-18  128  
fb9fd020919b41 Jacky Bai 2021-10-18  129  	msg.data = enter ? PM_RPMSG_SUSPEND : PM_RPMSG_ACTIVE;
fb9fd020919b41 Jacky Bai 2021-10-18  130  	msg.header.cate = IMX_RMPSG_LIFECYCLE;
fb9fd020919b41 Jacky Bai 2021-10-18  131  	msg.header.major = IMX_RMPSG_MAJOR;
fb9fd020919b41 Jacky Bai 2021-10-18  132  	msg.header.minor = IMX_RMPSG_MINOR;
fb9fd020919b41 Jacky Bai 2021-10-18  133  	msg.header.type = PM_RPMSG_TYPE;
fb9fd020919b41 Jacky Bai 2021-10-18  134  	msg.header.cmd = PM_RPMSG_MODE;
fb9fd020919b41 Jacky Bai 2021-10-18  135  
fb9fd020919b41 Jacky Bai 2021-10-18  136  	reinit_completion(&cmd_complete);
fb9fd020919b41 Jacky Bai 2021-10-18  137  
fb9fd020919b41 Jacky Bai 2021-10-18  138  	ret = rpmsg_send(life_cycle_rpdev->ept, &msg, sizeof(struct pm_rpmsg_data));
fb9fd020919b41 Jacky Bai 2021-10-18  139  	if (ret) {
fb9fd020919b41 Jacky Bai 2021-10-18  140  		dev_err(&life_cycle_rpdev->dev, "rpmsg send failed:%d\n", ret);
fb9fd020919b41 Jacky Bai 2021-10-18  141  		return ret;
fb9fd020919b41 Jacky Bai 2021-10-18  142  	}
fb9fd020919b41 Jacky Bai 2021-10-18  143  
fb9fd020919b41 Jacky Bai 2021-10-18  144  	ret = wait_for_completion_timeout(&cmd_complete,
fb9fd020919b41 Jacky Bai 2021-10-18  145  					msecs_to_jiffies(RPMSG_TIMEOUT));
fb9fd020919b41 Jacky Bai 2021-10-18  146  	if (!ret) {
fb9fd020919b41 Jacky Bai 2021-10-18  147  		dev_err(&life_cycle_rpdev->dev, "rpmsg_send timeout!\n");
fb9fd020919b41 Jacky Bai 2021-10-18  148  		return -ETIMEDOUT;
fb9fd020919b41 Jacky Bai 2021-10-18  149  	}
fb9fd020919b41 Jacky Bai 2021-10-18  150  
fb9fd020919b41 Jacky Bai 2021-10-18  151  	return 0;
fb9fd020919b41 Jacky Bai 2021-10-18  152  }
fb9fd020919b41 Jacky Bai 2021-10-18  153  

:::::: The code at line 126 was first introduced by commit
:::::: fb9fd020919b41006aab5e892c5c2cb804071cb0 LF-6607-01 soc: imx: Add suspend/resume lifecycle sync support on imx8ulp

:::::: TO: Jacky Bai <ping.bai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
