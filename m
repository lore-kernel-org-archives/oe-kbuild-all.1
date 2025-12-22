Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9DE3C0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766368401; cv=none; b=NX0snV+Ex79NotoPW7NppmLfM595+/csdi5R87siVattuHP+ZfrAlKORMtHBS6Vkg7lC91YLr/uqLoQk6hi0G/y6ohQNGuMRgQmqUhOl0ysIWZd0YTDlwbVzwkQpIKTi4xHjMMRbu1nc7//E5MADKXTA9LKZC5iAPMNmeOr22GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766368401; c=relaxed/simple;
	bh=PZ0/sEPyvyXWklIz5Kku25ymyWZPD/My0SpanTxyRlY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JVNWclDuG5Pxu7AS9oF8AvpHDPpG/BwExfvZcl/IvPwv8h9TErqzLtewgd57ERoc7hmqMK6sgn3rItW/IJwGCc8vOjtdxjIPdQhlqE7s3IYuTveW37r6iFxA0pSqANKK4QXO57dK3Xr2yrmHTUvoKmWoNvwV27gUx/32554Lbvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqIpGtd3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqIpGtd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766368399; x=1797904399;
  h=date:from:to:cc:subject:message-id;
  bh=PZ0/sEPyvyXWklIz5Kku25ymyWZPD/My0SpanTxyRlY=;
  b=KqIpGtd3ou23HxIC8d9B+ptlpqNFswUlGakNwLvAnuoudWZLcEvqAq6x
   kB2WVufh08B4lihgbxAfEzxNcp+u5DAcQDo1uPxGrAAXp7u57P+tNStrX
   JeWULyTYwfAWaLeGFDWbj2cX+BHuyDTSleuZdIlOHzI64QQnQbUf5D486
   IystVjMIuq2A4Nrfz2hbjctSUlOopYQjjym04tYZ82n6h9f+kQMMuRtZJ
   /sOConXCtlx+RAIyOdVq83ZBwajU9kvFmUYGAMlPfvKqI+d411WuhYDbr
   REosSEdMr/GgOb7UZmHhvgMWSNtqFUUOxRPsW4pMXHbecMGTdvFxEmTcF
   Q==;
X-CSE-ConnectionGUID: L4AFwVF6Qwy8yYXtcSSqvQ==
X-CSE-MsgGUID: jT8DQpXQSUyFEwV1aWI7iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78546392"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78546392"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:53:18 -0800
X-CSE-ConnectionGUID: WDDhyxxNQuWiK9mZLkeMnQ==
X-CSE-MsgGUID: M7vcvbSTQ+i6G7M83Tv6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203534819"
Received: from lkp-server02.sh.intel.com (HELO 9d662e18a02b) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 17:53:16 -0800
Received: from kbuild by 9d662e18a02b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXV6f-0000000002R-3ZB9;
	Mon, 22 Dec 2025 01:53:08 +0000
Date: Mon, 22 Dec 2025 09:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202512220924.CGRngM9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
date:   3 months ago
config: powerpc64-randconfig-r113-20251222 (https://download.01.org/0day-ci/archive/20251222/202512220924.CGRngM9k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 789845e319bbf346d42ee2c0090a9b8e153797a2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220924.CGRngM9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220924.CGRngM9k-lkp@intel.com/

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
