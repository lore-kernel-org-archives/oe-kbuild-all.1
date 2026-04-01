Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66942D24B7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023015; cv=none; b=t3RPAOyaMrn/ARY9kj/Xtyi6oxtaMdfVD2tOUoQzkGKVZh6HnLMeNdZROhi3ZWsEaMGuHknJnpvYoDR7LgCBbUblvX5dZ4U06lpsjfvfR9y8DvGAGmh1n8I3dYp4fh7U6nNUVmCKO2P45xtuJBLa2MIgZhytyidM85NCG0t472Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023015; c=relaxed/simple;
	bh=aKg3qMHg7p8ZiNpTmrOVqtWMPl3OwW5z7gzx6E0vbOw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cOchVqPTXvlA6bLD1ycZ5yvgmjIYrZN01KyprL4VEG1upOKoV9+14gjnERExNI57dOZ86+kmxuUwNVIJ205PbfAJfYKu9jwsHPcrlkcYJuYHb+R3T5DfvX6VjFy2n/sI2/rESBvRRWlmPrAHIMsepNmKRl9fS8F1GoXKN/smjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0D2sXs0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0D2sXs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775023013; x=1806559013;
  h=date:from:to:cc:subject:message-id;
  bh=aKg3qMHg7p8ZiNpTmrOVqtWMPl3OwW5z7gzx6E0vbOw=;
  b=h0D2sXs0hYXjxFvDKC+bVcqM7tyPkWcUgW9pPPfXhhr+RW3lvClxsKUJ
   rmISVOcWzziraRIDX9TVd5mQsjafJ9UPqNnSSXUGqt75Gev/HvIfL7iGv
   d+zX4FZOoGkD2Y5y3gwCsL6B/qnkyZtW88tYplLJlHomh7ceAMbNJxGU7
   FdHp2hSItzJnC653ng2VGPYeWD9lxYTJ5bS3Zcs1Rrhss7K1JjwqhYKRY
   LLBFf0MRkyy091Jh7CL0ivMNUmR1cM5dyQ0WWD0QWMKROHctyxFFILnka
   E7w1yCvVZGajeyEI6P31FwgjrV01G/GQXcpjHVyErV7ds6AGIxAnOjDPY
   Q==;
X-CSE-ConnectionGUID: LYrnCAq7SiKPQjSf3ednUw==
X-CSE-MsgGUID: T6smyS+mRzi5wenuoEnalA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98661031"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="98661031"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 22:56:53 -0700
X-CSE-ConnectionGUID: lcJFdoVlTaOR5yHP6e2LUQ==
X-CSE-MsgGUID: +TVVH2tPSKC+FzoSvwJ0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226559376"
Received: from lkp-server01.sh.intel.com (HELO beaa6a812b8c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2026 22:56:52 -0700
Received: from kbuild by beaa6a812b8c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7oZN-0000000003x-2JE1;
	Wed, 01 Apr 2026 05:56:49 +0000
Date: Wed, 01 Apr 2026 13:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 0/2]
 kernel/crash_core.c:749:1: sparse: sparse: symbol '__crash_hotplug_lock' was
 not declared. Should it be static?
Message-ID: <202604011325.iRprFwx3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   b88544447db55fc1ebf4cdba28b8d56c98ebe095
commit: e2a8f20dd8e9df695f736e51cd9115ae55be92d1 [0/2] Crash: add lock to serialize crash hotplug handling
config: i386-randconfig-061-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011325.iRprFwx3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011325.iRprFwx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011325.iRprFwx3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/crash_core.c:749:1: sparse: sparse: symbol '__crash_hotplug_lock' was not declared. Should it be static?

vim +/__crash_hotplug_lock +749 kernel/crash_core.c

   741	
   742	/*
   743	 * Different than kexec/kdump loading/unloading/jumping/shrinking which
   744	 * usually rarely happen, there will be many crash hotplug events notified
   745	 * during one short period, e.g one memory board is hot added and memory
   746	 * regions are online. So mutex lock  __crash_hotplug_lock is used to
   747	 * serialize the crash hotplug handling specifically.
   748	 */
 > 749	DEFINE_MUTEX(__crash_hotplug_lock);
   750	#define crash_hotplug_lock() mutex_lock(&__crash_hotplug_lock)
   751	#define crash_hotplug_unlock() mutex_unlock(&__crash_hotplug_lock)
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
