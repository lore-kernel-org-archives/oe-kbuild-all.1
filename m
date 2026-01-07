Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EFA326D65
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767789422; cv=none; b=cyjIF7GXS31U4avCqUNggzdESeHv1xnihE3zNoECNMyCKQqMzApCAYEmfHY6Svj40cBQ24ora3/gUBtPxRYUxtKre6Ic7jkiOvvRk5tnWGVz1tDsdlmIBD3QNzYmFQaK/SnnRTv04FUvnApXqTncAi8GAYJEQenx4Evzef0swwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767789422; c=relaxed/simple;
	bh=VaI4QQT4OwnZfeOT/ZI8igCppg57+SX8jnnm8YdWofI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CUfi7QSJJlQ2/XdzCvotVvrW+HaOVn0ZAThV8Fg1DBQjNYruLB8JjGR1MvpghwOPEEzM2Z5+1N1s0ew0Rwb8q5PlcjXFisfczhBKH2SHyMUw7E85DO+kuA36BLDscV9uTV0SUHFtlG2pMcp6VLK4+ETCXhvwnYP1hZeXpYRIsBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDYMvPi6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDYMvPi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767789421; x=1799325421;
  h=date:from:to:cc:subject:message-id;
  bh=VaI4QQT4OwnZfeOT/ZI8igCppg57+SX8jnnm8YdWofI=;
  b=XDYMvPi6kSzvFJY/Fmnw973RJ70kUolDPAwsRFaqCZaCtoMbJgOYBEDR
   jl9invmoiaepzOAvAIouMzwQH2QbfvPc+gy9LSMR8jMrv/RTDfzU4q3ck
   7eEIIxWXrUvqdJJNNd9euR/ENNSW3x0B6W41CRDdtB3bb1qhaIePec55j
   tIPmMHs595+KOqe/TpwNTTvrTbSVg8H9olwTiuKZbP62yBQiPAiGdBgXP
   0I2sg43++6UsKzHnfALwgnWXgGyAP5uKfebdag7gsFGF101u8JR0BOtBH
   SDR77yZsGDsfFatNsF3h3pIMMQlP/A4c8gPia8PJXMc4WSu/BsCjUBl1F
   Q==;
X-CSE-ConnectionGUID: /A5fqeQ8Rdmwyid0O5wByQ==
X-CSE-MsgGUID: eODYpxsdT5q24D42FzyG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86743795"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="86743795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 04:37:00 -0800
X-CSE-ConnectionGUID: ftsW07aPQESpJ7tX/sMSKg==
X-CSE-MsgGUID: gJNhL0uUQbarSGoDkMDd1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="207390973"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jan 2026 04:36:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdSmW-000000001aK-39EW;
	Wed, 07 Jan 2026 12:36:56 +0000
Date: Wed, 07 Jan 2026 13:36:15 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/pcpu-blkd-rcutorture-exp-testing 15/18] ERROR:
 modpost: "rcu_cpu_stall_reset" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202601071346.hCFzXd0F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/pcpu-blkd-rcutorture-exp-testing
head:   93b7149fabee79b3970d81a57b4e48fb140bb0d5
commit: 8dc7fca20b988b512ba607884ce4ecc4e02996bf [15/18] rcu: Reset stall detection timers after ftrace dump
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260107/202601071346.hCFzXd0F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071346.hCFzXd0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071346.hCFzXd0F-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rcu_cpu_stall_reset" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "rcu_cpu_stall_reset" [kernel/torture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
