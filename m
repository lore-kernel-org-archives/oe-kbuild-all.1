Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E57337E5F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784452197; cv=none; b=pNt46nqT412sW82G8cOSKVuaj/Rdscj5tIso0X9wlslsd9uhOyYXCPuc2hxElkyvBJlVS2++SQgRxRwm296v+zpt28t9jP6Wa8TQ16rfxsxT7DLQspJ30qdXxVFHQ1F47jQY1d889ngSxJUEf9qaYB4yk9GQ8fnBTm1c6hsP6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784452197; c=relaxed/simple;
	bh=JJjilyjlwkpisPb37+rXkZD/bifwB7TPgkwx4nScHcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gkaWNeHWi1ofZcLhZjHrTZ9DCQZsIdmZZBqHirxiHMC9tPE79rnMTnd3cub+rp9yWvaPaaJCWiMoLxj8b3PV43N8DZ2ISuRigHCef7rE+Kq4UiEwrQCkFgpOq6dWaszpelIslUqg1SRL3DmzbsCFJo7T0S6hOaSv4PoTt3xDpDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEoSQKqQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEoSQKqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784452195; x=1815988195;
  h=date:from:to:cc:subject:message-id;
  bh=JJjilyjlwkpisPb37+rXkZD/bifwB7TPgkwx4nScHcg=;
  b=IEoSQKqQJAUiHKOmgcIlivJIwSb9UyAQ5MkWTTeIdQzCYsayhQDuyxqg
   tNB91ifQyKiEc5nc93aSNcf/0MPfaKcRVGhDlf5DauzGr+JBBVpChjkN6
   I2jmvkEmI0GAR80L9paPmN6H05N1bP7BZWsXbxL/dODz41eAnRKYT70MQ
   Cu6vxHlpT8yXAdkVNHVB+WUOPG26gZjlDaber2VRtCcahNvZBvKr72sn5
   CH5NvBWsIyi35+GNhj5H1QjEMit45e5+JjJ0eWUcvKEnBd5mwYJ5Cbkks
   H31MwzFAfumpumS6Rrt9FNBym2nlfoHONjss7aNJWqbUUbBwlg2f0vOaM
   g==;
X-CSE-ConnectionGUID: ChKejaXvTSqSK7qvirMDJw==
X-CSE-MsgGUID: oOjG4lS7SEGIyRCZODoFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="87598461"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="87598461"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 02:09:55 -0700
X-CSE-ConnectionGUID: lIRl7SncQEWZW3zLmTHHcw==
X-CSE-MsgGUID: JMIgnD0OSJmTFXALpcno9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="252806998"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jul 2026 02:09:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlNWw-00000000VO1-2TbJ;
	Sun, 19 Jul 2026 09:09:50 +0000
Date: Sun, 19 Jul 2026 17:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202607191622.5ceVzb9r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
date:   10 months ago
config: powerpc64-randconfig-r122-20260719 (https://download.01.org/0day-ci/archive/20260719/202607191622.5ceVzb9r-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607191622.5ceVzb9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 814ef095f12c ("powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607191622.5ceVzb9r-lkp@intel.com/

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
