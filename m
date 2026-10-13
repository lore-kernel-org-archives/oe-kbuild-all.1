Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DAE272816
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 03:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860915; cv=none; b=lf3cCyzKVj8vB/3dBD+cKSRrDGkOSu2skv+J8/H6U0HK0BsdGaUHlpdVwG7bLJE754bCD+w+pMpAnM1QwKd/a4nf4AbaheuNo0T0L7K/hdXBucG6edUGwx/IKWoN4Usb9JbNufdtYkmBvLqa6epez/xxaDO6OUl1SuR9mHSVzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860915; c=relaxed/simple;
	bh=0JlWwOe7ZdAcjuTwG0BpQj6ociyoLJdojM9wIKv2wuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rJS6/mKuXrV7HKYGk0hKaORrXRMBxnM+c/hdTTkpbjdSh5PxVRG/f7JXyI2kSTZ+8bjEkgZi+sK0oIheGeWeY+nV9eKYiKwwg49rJd4y8wqaxoSeNrkK4OIhsrzuFKdYpqlsarEHetlFp6QcRqgLEoVU5VVpWQ9jUIlT0leeR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLEU6siD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLEU6siD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791860913; x=1823396913;
  h=date:from:to:cc:subject:message-id;
  bh=0JlWwOe7ZdAcjuTwG0BpQj6ociyoLJdojM9wIKv2wuM=;
  b=PLEU6siDJuRgXLnkB9KgxQckV4njMEGLuTSN58B4ZE9vB2Udp4+eys1k
   nobefwlAhD/U+207iBLyNDFlgeVZ7BVKMK/lguNR89herYfjyuuuhFBLx
   zQQ5ATcqywkjkakhQAzyPtz2/xpnyuiCL2FsXlCfTUFE6Ce30tSXEgBYO
   0qM0p8nEYtJJk8xWi7I7a666NOk4tRaqNcf4oomV7lJgQNL6kgWaJoejE
   R1sRhlskrNE6ck+9DoofFrHJUZm6HI4rrHWeFMVqaGXHnkLioVms7lX1Y
   g4vvUJaO0JeM9rfGvZFlXaLqr6/lPypBDCUB8u9zKf4a9giBugIZlj6Q6
   Q==;
X-CSE-ConnectionGUID: 0qykOq/RTaG404ptlhSLkg==
X-CSE-MsgGUID: ZeGNTIeSSlS0NLX4Qgo2Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="473952"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="473952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:08:32 -0700
X-CSE-ConnectionGUID: YutuxUlLTciTkwz6D+zvjg==
X-CSE-MsgGUID: YwapI7yYSCOHCnz7Ntk2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1015829"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 20:08:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGSsO-00000000AMN-2ppa;
	Tue, 13 Oct 2026 03:08:28 +0000
Date: Tue, 13 Oct 2026 05:07:50 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/4]
 include/trace/hooks/logbuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202610130554.CkAyFjjz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   dcf0464117570a57171bce407b999285e386a098
commit: 6edee2163e4ce0ec712dc3a3abb6ac3ccb118707 [0/4] ANDROID: vendor_hooks:add restricted hook for logbuf
config: x86_64-randconfig-2302-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130554.CkAyFjjz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130554.CkAyFjjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130554.CkAyFjjz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/printk/printk.c: note: in included file:
>> include/trace/hooks/logbuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/logbuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/logbuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +15 include/trace/hooks/logbuf.h

    14	
  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_logbuf,
    16		TP_PROTO(struct printk_ringbuffer *rb, struct printk_record *r),
    17		TP_ARGS(rb, r), true)
    18	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
