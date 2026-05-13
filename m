Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618138643B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683718; cv=none; b=sGmTOAseaRpRSkyyPF6SAR3y5hPCcUrqWCxS+y1XE1eJ7DuOR1eYb/2tCH+aZ2YfIxBR/iTXcos1Llo7UIH9tJTe1T0MQYR3XXrMRs2di2bxK1sVxTVKdZoJlaXbKnqKSohfqmG9N+kGoUVsLiAaRlGZdbc87IxZtB5E+qJc718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683718; c=relaxed/simple;
	bh=TXXKcOJFg3Q/mdRGZDVydgQrIHnCfhIhzPaU+xMFzfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hnXui9vYFDOiP4xBDtx38pAe9JIKM0++ixT1JItQhaNwwx5U3qMfu6UXr81saUwAp/4oD9N4eRsiNPUY006fPa0F7c+XfqdyVDOQs6rEigIPlv+NzTdzS6jHgENshxdOaaTfQ0bBhsMvRiNbrwP8N7qGCDyaAwQP0i30zqOlsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xxncm/Vu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xxncm/Vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778683717; x=1810219717;
  h=date:from:to:cc:subject:message-id;
  bh=TXXKcOJFg3Q/mdRGZDVydgQrIHnCfhIhzPaU+xMFzfw=;
  b=Xxncm/VuIeHlDsrWbMmMl+IXMSYYSlZP8ww57xf/V3W6ejAGMQZd1exm
   YtKTY30N5twx4HgBqcey5GGn6eoPJhyucp04fTH+b6niTWuHQKNVrz3d8
   o5jwGhGVd9T9pnidjLs8ZN0rf6KfN5/8jY4bZiNKWUtSlxwy8zf3qCuqC
   41bofEoziH5r06CeyIK/XTJ3Ofx3XsukAhXEnfTd6TvTNdFV8WIimSIBY
   KrKiD5Yop55OCiMZJm+3H3vtzQfG4PwDjPWIvbk6YTvQLL/EclqCHflvm
   Rn/J5dPr5TQcUxLTTe5QL5P7InkSfzuAWi9vm+S7kquvdqAd6OOm99OB3
   A==;
X-CSE-ConnectionGUID: RpymLq1FSD2/RVNJGXn9dw==
X-CSE-MsgGUID: zT1yjyejQt+OfKxFcZQKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83465830"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83465830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:48:36 -0700
X-CSE-ConnectionGUID: Ilo9eImiRbqLNBVJ8akKJA==
X-CSE-MsgGUID: CosiElWQQ4qKEqZHG6ZAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238352618"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 07:48:34 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNAsx-000000004Gt-3iJH;
	Wed, 13 May 2026 14:48:31 +0000
Date: Wed, 13 May 2026 22:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202605132225.rUDqmkgc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: 814ef095f12c9fa142043ee689500f3a41bb6dab powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
date:   8 months ago
config: powerpc64-randconfig-r122-20260512 (https://download.01.org/0day-ci/archive/20260513/202605132225.rUDqmkgc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132225.rUDqmkgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 814ef095f12c ("powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132225.rUDqmkgc-lkp@intel.com/

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
