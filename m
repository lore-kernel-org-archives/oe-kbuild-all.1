Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294536B043
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243914; cv=none; b=o9F5jRCtIfmDtrUwLHsuWgarvFkiLRHY6XvabHtQHc+NGXDVyCjnbKNpK6vnot6B/lG6Q7jaVU6u6wc7idsxLBfJ2BWP6rvIb/O9YYY2B5DHySKwJAb0x/K08+VAnBQNbpq1d+8++d8vyz0dajaePeLAe+5+16sL3s9/3f9G46Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243914; c=relaxed/simple;
	bh=x4mm/zPzSTF+D8qm6171SOmzMs9TpMBGjEDpchxhyIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnaP1+LbN3lKPo9lyMsxolY8QKL0T0FICX5+T44BweHOSFb/Q5bINRfVdfNZ8xeDHbsO94AAj2rC28NGtSdC1MfMu9bOxvvLzhuPLBYd7DGUuypx9La3oWXHLtmgig3KcUJVyfl6USsy0KBi9A/uIlqwFPYw4bluTJ1eSbrnEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7XhiAl+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7XhiAl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773243912; x=1804779912;
  h=date:from:to:cc:subject:message-id;
  bh=x4mm/zPzSTF+D8qm6171SOmzMs9TpMBGjEDpchxhyIQ=;
  b=Z7XhiAl+SQZ9KJZ03s05nJjxzpCM0Y5YlcSPGkHb9ygR9BynPJMl+bF9
   c/iT/8UTve77KlE5oPobIxK0Gswh2OdCop/ejePKBi2wLXp1OktE+suO4
   hbAWTtR6F5IFceDtpIZCuE4MqzKVquOnktjt0Ffe8oFdWRf59nkuyRVo6
   +1T80faTjiKfscbBHEXlCcYi5RNAHF7AfROp6uLizEGH+N4bsmbAFIVlO
   wQpzDZFF3kayK18PsV6s9vEWKMf5aOkYVwez5UT0Q9EwAgm5ku9/V3n2d
   HaCRYx4SkgVoID/rZh+3wOLjdol+7ehOqJVNXH7ah3AOqcn6vddjk/v9N
   A==;
X-CSE-ConnectionGUID: ddLr/CQjQg6jA3gICaxJpQ==
X-CSE-MsgGUID: YX/ztacCQeaUUwFtMRdftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74230937"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74230937"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:45:11 -0700
X-CSE-ConnectionGUID: XN8ljB6FSKu4E0M1XrqejA==
X-CSE-MsgGUID: STLFTEcWQI28SasaFRzUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224666910"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 08:45:09 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0LkA-000000001ME-15ZD;
	Wed, 11 Mar 2026 15:45:06 +0000
Date: Wed, 11 Mar 2026 23:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Babis Chalios <bchalios@amazon.es>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
 Takahiro Itazuri <itazur@amazon.com>
Subject: drivers/ptp/ptp_vmclock.c:445:24: sparse: sparse: incorrect
 type in return expression (different base types)
Message-ID: <202603112306.7c5SVcUv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b29fb8829bff243512bb8c8908fd39406f9fd4c3
commit: 3b1526ddb25452385b52f2588b655f524a57070b ptp: vmclock: support device notifications
date:   5 weeks ago
config: x86_64-randconfig-123-20260311 (https://download.01.org/0day-ci/archive/20260311/202603112306.7c5SVcUv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603112306.7c5SVcUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112306.7c5SVcUv-lkp@intel.com/

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
