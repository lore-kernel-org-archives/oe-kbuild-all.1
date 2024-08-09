Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D87716426
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723224945; cv=none; b=EAh97LFV40+0J8J4I3+p9MoCOYEMA1InlO5bzJ39B6sTvvAFnXrDKzMwY8HzW3k7T6jF+UH1LzCq2CZXOSV69h26WUIwVSXqlhRU0g2d/GXC7UpFyZGZCYZ25YUHXh3puT0At/wTu6RY24+xwuM+Bg0XP1PPxrAxZcW9Ak33k0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723224945; c=relaxed/simple;
	bh=W04MHsVh8NOhDlpd3L999QEV35u7nwAXNjaHR0sIRfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROY1OnUmowAgar6OAx+omsn4zYwtv8rWyrSIwAk+lNYJWdPw1/BvjyMH8NpfiQq0SfyP5IDWmFyEv49345zvqx4050rGZn2nxW2vwwUUYuEZH8lifTkSw+CK8XYEW0kRJkLCOrR6rcrKT9PMCNwDWt9tSck63EaEq1NrPLnwByk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpZxZ9y2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpZxZ9y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723224944; x=1754760944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W04MHsVh8NOhDlpd3L999QEV35u7nwAXNjaHR0sIRfM=;
  b=WpZxZ9y2MDK3SCUYUqLET/wFcszzfuEddk3qlQ0oYIPY4lZ3nSUSNyyM
   ca82PlgiFIGTY1xQtDHxGrVJOprA6OiYMwecpqesxnmVzVK3MlT+HRlKl
   uUKrnkRHm5W70PfbTw4tkC92ZvfeVCCKF07a4kfr6BEKt/MYe+P5btsPf
   LUCvPUpZ9TW4mp5ZrjWBYz7uY9acr5FceX+EphZRu0joQOdNh0RC/0bXp
   oySg3AiOPRg7Mfz0HUYK6Z2EedePJPvzDNWz6dTCixbCVhBGqME8paZ6i
   HCkJyb+wn/ODLbmyt0RvJpqF33ztPgoXsykMz+oDlYc7pAZ2rsbm5AhEv
   A==;
X-CSE-ConnectionGUID: lFHLmfANT7yKZkVPqarMgw==
X-CSE-MsgGUID: wyfu45TpS+CJYowBi2GB2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32557445"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="32557445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 10:35:43 -0700
X-CSE-ConnectionGUID: HcHsWnQ4TT+I/LZtqufOvg==
X-CSE-MsgGUID: PZ8c+huKSp2fBB+reW9b4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="62462102"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Aug 2024 10:35:42 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scTWd-00091B-0s;
	Fri, 09 Aug 2024 17:35:39 +0000
Date: Sat, 10 Aug 2024 01:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 25/42]
 drivers/remoteproc/ti_k3_dsp_remoteproc.c:403:2-3: Unneeded semicolon
Message-ID: <202408100136.0bFKdf1X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   2cc066b2c5d12544415bd84564e633bf852bef74
commit: ad1343ca42653d9262860d721cd5186bb456a133 [25/42] remoteproc: k3-dsp: support for graceful shutdown of remote cores
config: arm64-randconfig-r062-20240809 (https://download.01.org/0day-ci/archive/20240810/202408100136.0bFKdf1X-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100136.0bFKdf1X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/remoteproc/ti_k3_dsp_remoteproc.c:403:2-3: Unneeded semicolon

vim +403 drivers/remoteproc/ti_k3_dsp_remoteproc.c

   377	
   378	/*
   379	 * Stop the DSP remote processor.
   380	 *
   381	 * This function puts the DSP processor into reset, and finishes processing
   382	 * of any pending messages. This callback is invoked only in remoteproc mode.
   383	 */
   384	static int k3_dsp_rproc_stop(struct rproc *rproc)
   385	{
   386		unsigned long to = msecs_to_jiffies(30000);
   387		struct k3_dsp_rproc *kproc = rproc->priv;
   388		struct device *dev = kproc->dev;
   389		u32 msg = omap_mbox_message(RP_MBOX_SHUTDOWN);
   390		u32 stat = 0;
   391		int ret;
   392	
   393		reinit_completion(&kproc->shut_comp);
   394		ret = mbox_send_message(kproc->mbox, (void *) (uintptr_t) msg);
   395		if (ret < 0) {
   396			dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
   397				return ret;
   398		}
   399	
   400		ret = wait_for_completion_timeout(&kproc->shut_comp, to);
   401		if (ret == 0) {
   402			dev_err(dev, "%s: timedout waiting for rproc completion event\n", __func__);
 > 403		};
   404	
   405		mbox_free_channel(kproc->mbox);
   406	
   407		ret = readx_poll_timeout(is_core_in_wfi, kproc, stat, stat, 200, 2000);
   408		if (ret)
   409			return ret;
   410	
   411		k3_dsp_rproc_reset(kproc);
   412	
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
