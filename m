Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB6522F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726336097; cv=none; b=FMs4PIMm4X9Y7/2C4Sg/adcnzQxHEkyJSCf2f1AT2DzfeWuktzbDPtaVqzPN9gDc8ohRDTylwnCF3Z2cQEDNVxlALbENH+77W5ROeyCHqGqsHKNj5zUlULle5o3pK5OmbEY2IQBTbbd1JsDlhYRkWkKujVZmVKviFovCaNDLd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726336097; c=relaxed/simple;
	bh=cK548Ct58amoIBtXoE1d+DjKvAhMuwW27uzCRup95cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqHG01FDubsmf0+/yTAJAoQzFUjwQM6h91qj/5q1CVyyWqeR5urYdzKsZoSfqkgzzDHyc2QRFj2VRpaKdXVLEhSU7QAR9I8GrNKsjaXylXPE7UPqfyjROHcyioRvZ4KR1QH0p5GhJgx8SB5gnTvUk7p99KZsXiY+XqwGx9TjBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lu6p4OVB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lu6p4OVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726336095; x=1757872095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cK548Ct58amoIBtXoE1d+DjKvAhMuwW27uzCRup95cY=;
  b=Lu6p4OVBogq7Oa60iItFs7L27AQmAvVG4nn2myOlrKNwW6l7MWx/MkP2
   BX0i+dkkoZL+PrTkc0eojTL7qjHd3Uvnp8SwIyORHI4+XZiK6dHhqn63Y
   62Ul60Ird321rV8k+/LTPhRzvsAwgFqb5XxBlqloq0O19YpG+k8l/wJtq
   io8xWe9Qj90D36ms3GG0/xUDR+CY3aCDTOjVmannykRRzSHp+OO7PyU7I
   bxjN4d+3LUCRXqJquFrxrtrv2EIxMC2iEJ1Oum802PE7rHnCOfVyifD7o
   McKhxcOozB7nEcXAI+D/PCpO8bwUIxWh40QJ08DCZG5yv8idomK7uNwf7
   A==;
X-CSE-ConnectionGUID: OFRkxbFYTc2TMJOrAye7TQ==
X-CSE-MsgGUID: 0SRLtUrSSLmV2xvk7SOTrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35898497"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="35898497"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 10:48:14 -0700
X-CSE-ConnectionGUID: ayduuy5HQtK03xxlmLulGQ==
X-CSE-MsgGUID: PbZr8I0xREG1yCWxE0/tHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68945180"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2024 10:48:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spWsV-00081y-0i;
	Sat, 14 Sep 2024 17:48:11 +0000
Date: Sun, 15 Sep 2024 01:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2]
 include/trace/hooks/reboot.h:12:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202409150120.adXoFKN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1fa94a14074632ecff57ab73a2c9677521b7524f
commit: 70e95a10a553c0c530694b8939d25fbb984647d0 [1/2] ANDROID: vendor_hooks: add hook to record reboot reason
config: i386-randconfig-062-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150120.adXoFKN8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150120.adXoFKN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150120.adXoFKN8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/reboot.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
   kernel/reboot.c: note: in included file:
>> include/trace/hooks/reboot.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/reboot.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/reboot.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +12 include/trace/hooks/reboot.h

    11	
  > 12	DECLARE_RESTRICTED_HOOK(android_rvh_hw_protection_shutdown,
    13		TP_PROTO(const char *reason),
    14		TP_ARGS(reason), 1);
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
