Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868004;
	b=sDXKy44eH8X2eq+7tqXYEF6IMijII9XpFPIBkltiTTSX7cNAyPOBRbbRFEUYtkxEq2a3
	 0CLZq80vE19d+JuJuIKXrMRs/fCLlj170gBb4AmQdQT1QZZmwcMzm/Edn9N2dXdAKPQfP
	 UHLfX1UTL5XQXsw44JjXmVgf0FT5pnB3/VN1OgW+lHRFXOKFlt5rGmQajVLvSj1o6HLBx
	 tpQLe5A+t9URZuJIHyGSOM2uSzLljhXCWp5Vy6+BjxL68aWZniWtT/sUKoSC3mmXHbfuM
	 bXKhkkT5YD9aBOSPEHlSVfD1uJK7sTnUv+hy8RKDpwsxnj4mRh3e/wTAIoROYt/w/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868004;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Z//MJnEdU7UB22vVHJkihsXo6EOhZM/TlYmeCDy9Hyw=;
	b=VtDfIxm2Eszp1veRmJaQYeoh+OtiYKAyjpGAmh6essSHZLyTf2orgr4rkXUdKpkV/57X
	 aguZvck+fp8Hw4/g2k2hutAC2Xh/6h8ARSZvJ5wfGonxIuIWdyepjMkKQFUsMWJhiA7ZR
	 0Q3rBL54MmQa6IIpWLIiFp7gF2MRyZ4xRPm1okYwzSShPxGmSHzElkLLytW3czsC9znXR
	 QsAuecQN5hARoNpIvBqYYp3VT5LWVhqjL4rr+UqKNjXHAyA2kri/NeMCmYFoc0wh3qSvN
	 bNCxIzca4KaY53WPDe8yVInkuyEu9P2Y6DxlTDv24/NOx24OD7mTY9FlHztUvw1Pjrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IkzEBsmj;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB5D606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 08:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB5D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IkzEBsmj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793868002; x=1825404002;
  h=date:from:to:cc:subject:message-id;
  bh=vH76W1zmO8W5b8sW0FsxnXJtfSMz3Hnha/vguDMWIsc=;
  b=IkzEBsmjMuJ3ozxhwpMj8sdU6Eg8lHh+HFUDbcfMh6SqUCQe/4ETjutP
   xV3dtZ7DHc4vtjk+EpMUkec3cxYNaehRCaJj9AUckJjpbBo0fZH6i6ccy
   OJMP9+gmyfILK1dsHOSBnpam7jkZaMJjH/RTaDBixF2uIuMvhtFSmaNbw
   s/jWCjA5XGP0RqaBUsc3UOd9p2OZf9mgCtqqAss7i11VFt4e4z640wrP4
   ilzbCJTUqN8+Vs8oNpJ4ssHbwIXPZyxO49rynJQWg2L9eT4L5XP9U4uO/
   BrauK6EA5kwPBRzHf6PW/0lcReuEVCNan6BdA9u9zHngODw2cr6f+h5fr
   Q==;
X-CSE-ConnectionGUID: J1i8GuowRe+pV+TV4ZDIXQ==
X-CSE-MsgGUID: IYoxgiUlR3yrF4gTAYS+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2739765"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2739765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:40:02 -0800
X-CSE-ConnectionGUID: J4UacmZ1T/+rmoDczbHBQw==
X-CSE-MsgGUID: WvKq8fH3SMqC4k1gNkckCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6827355"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2026 00:40:01 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOt0o-000000009bH-1rrV;
	Thu, 05 Nov 2026 08:39:58 +0000
Date: Thu, 05 Nov 2026 09:39:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 303/303]
 kernel/cpu.c:1098:5: sparse: sparse: symbol '__pause_drain_rq' was not
 declared. Should it be static?
Message-ID: <202611050914.le3P7s3D-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   f012a641c30644ec5bf95cf64d8835854b997f86
commit: e19b8ce907a4ccc2f9dbeba218c50d1ff07fd321 [303/303] ANDROID: cpu/hotplug: add migration to paused_cpus
config: i386-randconfig-2301-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050914.le3P7s3D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050914.le3P7s3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050914.le3P7s3D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cpu.c:1098:5: sparse: sparse: symbol '__pause_drain_rq' was not declared. Should it be static?
>> kernel/cpu.c:1118:6: sparse: sparse: symbol '__wait_drain_rq' was not declared. Should it be static?
   kernel/cpu.c:844:9: sparse: sparse: context imbalance in 'clear_tasks_mm_cpumask' - different lock contexts for basic block

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
