Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FACE3A9D88
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136449; cv=none; b=sOCMU92IaWaYuHuHk4MWZ0PuikV37o+gFGoPtwkRZ9cnDtugjShVeKbGvuHtZc+1Ait6/6W36yymW3mVDpH8SJ+kse2su+MumoLQlFkCgMk1pgAhneL082qAyNcY2+XEk8nOBnK9zL01gdaOLrqzWQI7ERGhzu3MAsuK5p61WEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136449; c=relaxed/simple;
	bh=MGmArjfs8JmW+s7kg308EIN9B33BDlP+MneyaNE6/nM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s067fq20+UD6VpuZbvLigQoDwkAFssEiqWERcj3qExhzhiYp3Dy0fQMRjNMS/9fFCOcsgbQloImKcu9QQxzsZjNb8iJZGb+wLLZ5rMxo1x1cA5q2J2HQN8+KFNuRiBcOSrQGrXTQ0ipkZlv5N6sPFfhFNwSIAZn2LJH0AS6gS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSwdQQ70; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSwdQQ70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782136447; x=1813672447;
  h=date:from:to:cc:subject:message-id;
  bh=MGmArjfs8JmW+s7kg308EIN9B33BDlP+MneyaNE6/nM=;
  b=bSwdQQ70vrr39WXWcLXnVmHy7lNL425Ubot3KF2xUn6eYWvT8oGjLbHy
   UmikfTSGc9zjvoICJSzfBugyekcvVhtzN6cAhaFQa7xab79QYrLZL5LgV
   61RhrBfktSimmDDPL2aD6m53WrHq2KNYgcvRxypv4qQDX+pHdO2Z4yWiM
   bgurfBANRervRFk6d5Oyw2eNSV/MRMnmIpMyH1IumkgQvt0+KtgC9Rn87
   3YJdB23PntnE8SHedcOGBgA4P8uIMO0VUDU0crnhN2FlGbIPOFeHh5d2L
   py/wa7AJ2wAnTt3C3YSHRNHPiXYun7xIeRsd9kfmL5aVHGIYqptB1kWY2
   A==;
X-CSE-ConnectionGUID: e2e4VAAZQAO0EyOxkttT1A==
X-CSE-MsgGUID: 7P4FluabScqewCtUxllvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100417095"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="100417095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 06:54:07 -0700
X-CSE-ConnectionGUID: xDpnIoJNSPi/8R9xAg8vtQ==
X-CSE-MsgGUID: wsgE5H9NQ9yBs9oPyHjCfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249344684"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2026 06:54:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbf6A-000000001Ge-09mL;
	Mon, 22 Jun 2026 13:54:02 +0000
Date: Mon, 22 Jun 2026 21:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Babis Chalios <bchalios@amazon.es>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
 Takahiro Itazuri <itazur@amazon.com>
Subject: drivers/ptp/ptp_vmclock.c:445:24: sparse: sparse: incorrect
 type in return expression (different base types)
Message-ID: <202606222129.M1YS26K2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 3b1526ddb25452385b52f2588b655f524a57070b ptp: vmclock: support device notifications
date:   5 months ago
config: x86_64-randconfig-123-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222129.M1YS26K2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222129.M1YS26K2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3b1526ddb254 ("ptp: vmclock: support device notifications")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222129.M1YS26K2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ptp/ptp_vmclock.c:445:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/ptp/ptp_vmclock.c:445:24: sparse:     expected restricted __poll_t
   drivers/ptp/ptp_vmclock.c:445:24: sparse:     got int
   drivers/ptp/ptp_vmclock.c:451:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/ptp/ptp_vmclock.c:451:31: sparse:     expected restricted __poll_t
   drivers/ptp/ptp_vmclock.c:451:31: sparse:     got int

vim +445 drivers/ptp/ptp_vmclock.c

   433	
   434	static __poll_t vmclock_miscdev_poll(struct file *fp, poll_table *wait)
   435	{
   436		struct vmclock_file_state *fst = fp->private_data;
   437		struct vmclock_state *st = fst->st;
   438		uint32_t seq;
   439	
   440		/*
   441		 * Hypervisor will not send us any notifications, so fail immediately
   442		 * to avoid having caller sleeping for ever.
   443		 */
   444		if (!(le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_NOTIFICATION_PRESENT))
 > 445			return POLLHUP;
   446	
   447		poll_wait(fp, &st->disrupt_wait, wait);
   448	
   449		seq = le32_to_cpu(st->clk->seq_count);
   450		if (atomic_read(&fst->seq) != seq)
   451			return POLLIN | POLLRDNORM;
   452	
   453		return 0;
   454	}
   455	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
