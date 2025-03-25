Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE612CA6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 01:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742864532; cv=none; b=dsB2ynLw97W1++f2I4tpaLIyrpRhnyVtLTffg407y0pucItY5ypMV0uFs+S5U6VwbadVWHtIkr7dJmaDvOgRTTScps0XUjiPKRN6Hn6zcIlFK7RVB8fMUmsfhCnq1/7H+M2rxTwEakwLtMeFozHA79ktxeX0qExEHGKY0zm/x/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742864532; c=relaxed/simple;
	bh=yqL/j5fvHhZ+MHKhBmTZ6hXjq5TjBfSHiMyIlD9rEHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3ZHgLJsh8wUc9nl0Nj45KWmRH8+2sC4cyAU2AqGILXz78Ey2AjPIxUtfTfdeP2ncFgD8F+zJd91t0DqfjmfaI/grBDUdypsa36znF8PuAC6tlDvsc2bv4b8Oq7yXSnk6QTmIZeyfN4FSrzMaVhcLW/e5wI4c7Ep19xUH6WBKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQ/6G8uN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQ/6G8uN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742864531; x=1774400531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yqL/j5fvHhZ+MHKhBmTZ6hXjq5TjBfSHiMyIlD9rEHA=;
  b=JQ/6G8uNewlTgp9/jXmLcxv5W1t2XRKmPQkoSGlhvXCYrLBqct8fWCWQ
   CVDfudKCiKqQeRri+Gv08QzwCt6x42PRtt0cQXNme9E7XM0L4l80htROE
   YRqTlAcN6BCb9ydhOk4JfUPxgDPFfaitw+wyWB+XTvOgWIr9IerFyWHOC
   w5AYKXXUEHZH/0evi+jnTaIUUUKYdbZfIpwD55rCGRNUalKWziQzfQoTN
   l1KL0U0NoCwJdxreEVI+O7H9ErQ57MHr5dEr82vuhvKXlrgVvjwljIYfQ
   5mkTm4bl90zFJvfT+ItXpx7I55gB/S4eqdfRr4Qb9cPXDhR5q48M7gY6D
   Q==;
X-CSE-ConnectionGUID: 298cNZ2mTHaLal+WS0G5Fw==
X-CSE-MsgGUID: +xDLlIYuQ4qdY97rVztXgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44199464"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="44199464"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 18:02:11 -0700
X-CSE-ConnectionGUID: XzoHlSQbRJGTtkM6qkOnoQ==
X-CSE-MsgGUID: rL9uyZSbTLiRTEG3hXiHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124193945"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2025 18:02:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twsg2-000431-3A;
	Tue, 25 Mar 2025 01:01:58 +0000
Date: Tue, 25 Mar 2025 09:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/logbuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202503250856.aXgCLsK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8a625f475caa4e029dfbbe7fa253e895f71c08a3
commit: 9b44f2fb794ccd5a17777e317bec959558d21f9e [1/1] ANDROID: vendor_hooks:add restricted hook for logbuf
config: i386-randconfig-r113-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250856.aXgCLsK4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250856.aXgCLsK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250856.aXgCLsK4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/printk/printk.c:293:5: sparse: sparse: context imbalance in 'console_srcu_read_lock' - wrong count at exit
   kernel/printk/printk.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:301:9: sparse: sparse: context imbalance in 'console_srcu_read_unlock' - unexpected unlock
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
