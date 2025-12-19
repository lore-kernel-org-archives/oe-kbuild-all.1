Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A802264CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 01:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766106823; cv=none; b=ghDMNQMSD0lVVMuPQLwXe21ERLXxnLW46Gv1JiKJPQq2N953tZqzTKmpHjTvWrwAWzSg860dUVPLQscteTUPbjQMntdVkMdlo1o/Wlk2DO34udn2oG8gXZyu3u9X86DU8ePL7NfAC59oLra3C44x3jb4oyckI09pGkfvXzmPMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766106823; c=relaxed/simple;
	bh=TNpdkOpI6ooSQBlP4j5AB0uCGung41Bo62HzzG14KME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryipKZVVr/RphGWoJ+3ChAFCMV4ID/YcZ+AeMFQgpHGMiuusL185oeiU/lWraYyPxxKkVGO1S77eHNTH9veR+OlZE9goXJjO9+3S9GmrX5LPkRd7oz49AXW3jdmPpWldAz7K4l67KtnfRDxb9BNSqVUb/d/JUrGfDGZgrB6GCJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZLCQMYd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZLCQMYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766106821; x=1797642821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNpdkOpI6ooSQBlP4j5AB0uCGung41Bo62HzzG14KME=;
  b=eZLCQMYdh9/hcUVi9Wrq2U3rUxV8Ahbmxf3Cyh1rNYzPM23J8xesR6eu
   U+WDxjxkH5+41aTFwBNIsSQLACIO7HU8fkbFFOel+LOPrrcXxqa1Ibabv
   HiVsLEWbDxNJN1XN9rQbXuGbn4z2aTuKkI+vqiE/R68jVOCkaU5qk5Fj8
   4WsLzYYaTc65yy8h8kZr1fMhEjiqhZVKcJiNTb2o3DHrnPwAsmBMtgTny
   V3eWNLp41V5Qfm4f79R8K3RdTvuE/TmFysL92JZ2JXfcICXzfUdlZCG/e
   HcNf93LNaCwvLWSQmWtEAHB+oEVX/ceXQkACsZVilHztNKELx6MMmTh9O
   Q==;
X-CSE-ConnectionGUID: 0eTrbKxVSlqXQnOIeYoBzA==
X-CSE-MsgGUID: rVDWcdoaSvOF4KPFIx3L8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90726882"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="90726882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:13:40 -0800
X-CSE-ConnectionGUID: gLqYoJePQTiQIT2j/lxdbg==
X-CSE-MsgGUID: K7hPvnycT5O45G0+bCHJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229775627"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2025 17:13:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWP3p-000000002q5-2vvv;
	Fri, 19 Dec 2025 01:13:37 +0000
Date: Fri, 19 Dec 2025 09:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4] kernel/cpu.c:1098:5:
 warning: no previous prototype for '__pause_drain_rq'
Message-ID: <202512190930.ilQzZj76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: e19b8ce907a4ccc2f9dbeba218c50d1ff07fd321 [0/4] ANDROID: cpu/hotplug: add migration to paused_cpus
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512190930.ilQzZj76-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190930.ilQzZj76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190930.ilQzZj76-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:1098:5: warning: no previous prototype for '__pause_drain_rq' [-Wmissing-prototypes]
    1098 | int __pause_drain_rq(struct cpumask *cpus)
         |     ^~~~~~~~~~~~~~~~
>> kernel/cpu.c:1118:6: warning: no previous prototype for '__wait_drain_rq' [-Wmissing-prototypes]
    1118 | void __wait_drain_rq(struct cpumask *cpus)
         |      ^~~~~~~~~~~~~~~


vim +/__pause_drain_rq +1098 kernel/cpu.c

  1097	
> 1098	int __pause_drain_rq(struct cpumask *cpus)
  1099	{
  1100		unsigned int cpu;
  1101		int err = 0;
  1102	
  1103		/*
  1104		 * Disabling preemption avoids that one of the stopper, started from
  1105		 * sched_cpu_drain_rq(), blocks firing draining for the whole cpumask.
  1106		 */
  1107		preempt_disable();
  1108		for_each_cpu(cpu, cpus) {
  1109			err = sched_cpu_drain_rq(cpu);
  1110			if (err)
  1111				break;
  1112		}
  1113		preempt_enable();
  1114	
  1115		return err;
  1116	}
  1117	
> 1118	void __wait_drain_rq(struct cpumask *cpus)
  1119	{
  1120		unsigned int cpu;
  1121	
  1122		for_each_cpu(cpu, cpus)
  1123			sched_cpu_drain_rq_wait(cpu);
  1124	}
  1125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
