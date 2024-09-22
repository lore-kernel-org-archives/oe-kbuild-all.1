Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6358C11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727019661; cv=none; b=XN672cAizTYMm+cxZHN7g2wAJapCtYmDeSV8XEAyg51j5N+7Ic5WM+uKYP55181uFYK4glLEfwh85luIsCKcumn+93xecpRDfP3Zwyx9wf1aSwnMwv+70M03P1jGQqlNmvEOFiZ/HTjsSf5Zc6tnllKjvfl7Da61sRm9GnvjdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727019661; c=relaxed/simple;
	bh=T0oAMCdypEnb7Ig5nHHj2Gc6UhmZX9V1GRVkLw0PGjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pjw71n6Y1GmIHg/CQC4+3t/iERUv8hZiTXpvSOO4I+WzWhV3QvcLDrKG2X+fw8huNf+VHFrrulQ0eezh2Y6PbH+fLW9E7jYD2ENaX0NSi5z3KuSMcMuYhuS287pB1mup38RJIK3XtMy0HYtiCcJ3mfFMlwZNHNQJS57GpVrWKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA5TFjlw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA5TFjlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727019659; x=1758555659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0oAMCdypEnb7Ig5nHHj2Gc6UhmZX9V1GRVkLw0PGjk=;
  b=KA5TFjlwKC8hybiOrqSUT5DFWdptGuMiJgdRqc6LSZYh9xzfuHOcxzeN
   HJGBxv7DuWFsLmDidzYQNAl9iY7reKBeYR6SduxROFpuYVcpBXgwE+Pwe
   OAWf/UEph/mZiz9HlXt6jRZu0iicy/qXVP4btY9HJn4D8YXor1ErDSGmb
   i5N0TROuY5CDoDmChDZvh1D17AfmNhna2cbcRJtpNPO5fPvfYY72bQuau
   XZ6q535B6fK5fotgVc/ZD2cP9dcdXYMh1AnfIIg78G1XPoehu4/v+XkQ/
   t7NP2V+cYloVYhrSYkIwpTZ3uWZQ2Y4ASBztZGf8HEhxRjzoR5eCDOyLh
   Q==;
X-CSE-ConnectionGUID: W9tTj6bjQxaL1F1nzYEUhQ==
X-CSE-MsgGUID: uLvz7YMUROK3SWRoPB6nGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36556283"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36556283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 08:40:58 -0700
X-CSE-ConnectionGUID: agz9QQ+0R/K7m+N+0uHAUA==
X-CSE-MsgGUID: ec3K2ys4RGesOo9wmuLi1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="108259782"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Sep 2024 08:40:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssOhi-000GQg-2W;
	Sun, 22 Sep 2024 15:40:54 +0000
Date: Sun, 22 Sep 2024 23:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/5]
 include/trace/hooks/logbuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202409222344.TesIhum1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a3c4f110f54b76cbd94691d217eac14144225136
commit: 9b44f2fb794ccd5a17777e317bec959558d21f9e [1/5] ANDROID: vendor_hooks:add restricted hook for logbuf
config: i386-randconfig-r132-20240922 (https://download.01.org/0day-ci/archive/20240922/202409222344.TesIhum1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222344.TesIhum1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222344.TesIhum1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/printk/printk.c:293:5: sparse: sparse: context imbalance in 'console_srcu_read_lock' - wrong count at exit
   kernel/printk/printk.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
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
