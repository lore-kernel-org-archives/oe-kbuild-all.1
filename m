Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA227587D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768633007; cv=none; b=fWbuUnK46kTULBGPxE1HAmmIU2se8HGpiZH/JU3SLTjquyivSGqG89Uqwj1obGrlY7dZ3Ddlzcaps8Z01QmpJBznkVYlrfSHTTQX4tvBnPraYznQautcncLny+aEhCbVCpCgh5kT0g2xjxSBqAxMfBoOAXhiNpVQDvN0zEBIFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768633007; c=relaxed/simple;
	bh=Ye+pnq4jzg1roC1idjaq9CJ0VxXmD/xW3vzs/yPKhkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FlfYFn0AJJW4Zz6sUHYsGCoM5Yx8y5f0BlLygSsZaK5VoGFpPRMIybVHlwRH2ERyvNHYL15m/fvGhbtRsHYyfe5QE+Z1iobe1kIdYk8JjYIAmaTFrCTAFGRLgFZoJ8/6ykcJASFQ07bqWMTYP9MvePTBFV0YT4IEm5CmQt5shv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0BdkQWf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0BdkQWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768633005; x=1800169005;
  h=date:from:to:cc:subject:message-id;
  bh=Ye+pnq4jzg1roC1idjaq9CJ0VxXmD/xW3vzs/yPKhkM=;
  b=X0BdkQWfe4NmWMloall6/W6/midA9l/B8l5IbGsDchi8SiX+MpZRfXel
   8O7e46ugw0c6v6H1jBjHpwYwRHz6BxiNHv3c/AROgZLYR7lkopu6qkddY
   v4Im1HuWMuCkwUAuBunlRuscjoPmer2pjqPEye+wsk/tmlWhit1md5Kt3
   hvjXWYfjZn8ISoWL7GVDKv4XAPQ+nH0YujWGonPbCpaGI2N7rXyJFICLQ
   /PgpO6ZVS7iucpJJiRnzZEw5qYfrrP1OoMVZd+mVQAEhcoNO6KQs7iUdj
   W3oVEP5PA4NSvrH7wSJRsFuiGx2y/lFoRWuuDihASTj3GIap8JsW5aLSF
   w==;
X-CSE-ConnectionGUID: QSyPtnamQvCW1YtosMVXpQ==
X-CSE-MsgGUID: Y2i2i3nDQIawnXoI88RW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73792294"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73792294"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 22:56:44 -0800
X-CSE-ConnectionGUID: GPzdokJmQNKpvV8thrm9zw==
X-CSE-MsgGUID: B8POrNIbSUaLJZpsV7qiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205453874"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jan 2026 22:56:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh0Ej-00000000Ldk-0SXL;
	Sat, 17 Jan 2026 06:56:41 +0000
Date: Sat, 17 Jan 2026 14:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 4/15]
 arch/powerpc/kernel/time.c:393:32: error: 'now' undeclared; did you mean
 'nop'?
Message-ID: <202601171416.WGi9FyQB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   6a3d814ef2f6142714bef862be36def5ca4c9d96
commit: 2c587a3927ae42e3fc1e023f3c3e17fb5e82e562 [4/15] powerpc/time: Prepare to stop elapsing in dynticks-idle
config: powerpc64-randconfig-r063-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171416.WGi9FyQB-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171416.WGi9FyQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171416.WGi9FyQB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/time.c: In function 'vtime_reset':
>> arch/powerpc/kernel/time.c:393:32: error: 'now' undeclared (first use in this function); did you mean 'nop'?
     acct->startspurr = read_spurr(now);
                                   ^~~
                                   nop
   arch/powerpc/kernel/time.c:393:32: note: each undeclared identifier is reported only once for each function it appears in


vim +393 arch/powerpc/kernel/time.c

   379	
   380	#ifdef CONFIG_NO_HZ_COMMON
   381	/**
   382	 * vtime_reset - Fast forward vtime entry clocks
   383	 *
   384	 * Called from dynticks idle IRQ entry to fast-forward the clocks to current time
   385	 * so that the IRQ time is still accounted by vtime while nohz cputime is paused.
   386	 */
   387	void vtime_reset(void)
   388	{
   389		struct cpu_accounting_data *acct = get_accounting(current);
   390	
   391		acct->starttime = mftb();
   392	#ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
 > 393		acct->startspurr = read_spurr(now);
   394	#endif
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
