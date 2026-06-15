Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147771C84A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781483583; cv=none; b=RZ+qNUrQg6BkMwtzDF3MTwgwQ4NBiySAZcfha3JYTnm5SU4T9DI4U4XPUsMy0hTSV56zdDjvtLMzLLhhfl7PPSKyO6Gwh0HDasKreXtl0T9GPRBa+sIDnMG3VY8rDRgb+fgO/RILbO8aBlebtg7Hc/GMn6fxyo7iQ0vgyBXcV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781483583; c=relaxed/simple;
	bh=Nc/6irzujAE/k54ijerL9RRMeBZ6XbmePBedow3wnRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lfJ4kxfKNgnreOfljjgGLJWslFysFO4F48cm3BUd7pBTdzuCT81R3l8097l2fxRrPiwB9YAP2S01wg6lNGTpU8KTOERoL4kN/r2FtP5z2QCffC0KnTaL0S0twiMvBQ/BYo28I8tBpfwsor8Dx0g50nzPeUsTFk94UQNbnnmLiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6M2Z9x8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6M2Z9x8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781483581; x=1813019581;
  h=date:from:to:cc:subject:message-id;
  bh=Nc/6irzujAE/k54ijerL9RRMeBZ6XbmePBedow3wnRw=;
  b=A6M2Z9x8Febxg7Nh+rDHNJ8LckbnBQhMA6h3WdkVWV2VDXP3j48o2DsD
   kp4aAvCIHHXqa5WDbgN9tvrMD6Q8AStZJ2GN0ZJ/yZQ0jGkHHLr31nTvB
   ey965zCf1tlmORf2MszOuN5Vk8oJmkwblYephvJwdYVnfw2CWhjckqlRR
   X0WXmhdw+jG8JZ41khP9o702ZXESZd/MhAmVv7eJZnwHQcbV+txe8+EZ4
   LO4BaFbXLCsg4ftnbGv5bquM7grnEFwyC/h7dzRYzXlAhjUYXnLPl4aEg
   VF0h9QT6ShvjvnPzPE18wIto4/x/oR7uYRK7ZwrbjoupOZkJmJ/5HBU43
   w==;
X-CSE-ConnectionGUID: vvbrndhvTZmyE3+fZgJzUg==
X-CSE-MsgGUID: wRbQZJpPT6C/Nf/c2M6nNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92895774"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="92895774"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 17:33:01 -0700
X-CSE-ConnectionGUID: EsxXWxs/S6u7GZkT0o3hBw==
X-CSE-MsgGUID: 9BySj3vRS+mB2G9iH63Wgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="251249687"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jun 2026 17:32:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYvG3-00000000RKa-2cEU;
	Mon, 15 Jun 2026 00:32:55 +0000
Date: Mon, 15 Jun 2026 08:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202606150851.t3HJjWTU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
date:   9 months ago
config: powerpc64-randconfig-r113-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150851.t3HJjWTU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150851.t3HJjWTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 814ef095f12c ("powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150851.t3HJjWTU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     expected restricted __poll_t
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     got int

vim +121 arch/powerpc/platforms/pseries/papr-hvpipe.c

   108	
   109	/*
   110	 * The user space waits for the payload to receive.
   111	 * The hypervisor sends HVPIPE event message to the partition
   112	 * when the payload is available. The event handler wakeup FD
   113	 * depends on the source ID in the message event.
   114	 */
   115	static __poll_t papr_hvpipe_handle_poll(struct file *filp,
   116			struct poll_table_struct *wait)
   117	{
   118		struct hvpipe_source_info *src_info = filp->private_data;
   119	
   120		if (!src_info)
 > 121			return POLLNVAL;
   122	
   123		return 0;
   124	}
   125	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
