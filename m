Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114194;
	b=5cUM0VQXzeQUf/3cIr0xjPqRS0xmUujd+Ch6zwesZQ9nwItjpoGf6elfxNwUHbCBk3Y1
	 t33AIoj+OrRQFtaYFOK0+dimkKqsNOjMoAFIP+/QdkyqoB9lNXI4/rT3+W6rfo6MoAgqC
	 1fqGFUi0r1a9nIu4DcXasQzoaTASMbMYXTHPvYEnBTZjzStntlbhx6bqrYrhJP2OKMV2Z
	 Xt5KEAfiB3xOFATLVeXY4ZZJGwI1AAdFv9FjVLTV9eh+rOOnZ2y1K6qFuo/4OTpe5Lg1u
	 WnEDjPG4UtFEqXllmOjEtKM7CupbBQZhyRo6alQt5Tv4Gn13yZLDCMJz1VkcIaQM59Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/v24mVP3Eu1+vhpCMkROjkwv4iwX7DgzXVgPQMZTAHk=;
	b=eVGDvecSpuopUteewd790xQaRF5H8tyiqY1sCFpWBX5tOwCL994cpbkOVvVRgCjYwH6i
	 EMbsB9FbsqNlKsRcHN0BoDlDJjhwoMBd7LKEMF/QxDQzVYkDuK7/wCV3YEcmbG1+YNPW6
	 Xx14n+7Orp3169kAFmid0vmt7Pdu3x63B/WTmuCDDxKm15zhAQRj0gIGqhcU8qTvyJMQN
	 TTtNpw+jfKJ6gC113dsCvog5/1DfIuX0NzijfWJtHEluFyR8twSiGMnmkEHm5Mo32dQLs
	 crScgoTq6GkIoGihLFY0OxFGpP1gYbxLBUvzkKsp88gU6PlfRefUDOf5cOL0p0z820g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNr3xq5Y;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9C4606A326
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 15:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNr3xq5Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793114192; x=1824650192;
  h=date:from:to:cc:subject:message-id;
  bh=OBOzMKkGonrbjUCxzs5NxFoAhahd5lqC7OGHuuk054w=;
  b=SNr3xq5YW00a9Oq0ySUJ0ppbku35S1UmsCe9a+p7l8iW0I30N/HJIduO
   o5kKgSajbTG/v1kZi+dDfPR6AwXBCd45qDHSKRKdl/V3yleSv2Tx/Ccvc
   60ckTo5cRXVULRtK7ZOLRm34bqQ0ZTjBpr8VeVmfsTdx6nO373fqi6w80
   /jaYQqsIGSnbLIvwALsTrFpFUyhIHdS7Pt8pAHXQcTvk0bYyjtdZjMku/
   2di/WVED+iPKrsRacYb+w7Q3D2Ebhj6hKPQJuUp7i3oUdJEjVNlC4kVAy
   ykQT2voGZgmZR4kMT1ld3odgHmwlQ6NR4Eaw49eoYUH7uZ6y41XxnUr8k
   Q==;
X-CSE-ConnectionGUID: DSlKfY9TT5y1znMIOleUCw==
X-CSE-MsgGUID: N0z1XEdlRuu/eGKR3xCLUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1700803"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1700803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 08:16:31 -0700
X-CSE-ConnectionGUID: 6uSo3pOFTpO3WaAEz1MqUA==
X-CSE-MsgGUID: GW4DGX7WRZ23RugzYHPGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4692508"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2026 08:16:31 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLiua-000000004YF-0wzz;
	Tue, 27 Oct 2026 15:16:28 +0000
Date: Tue, 27 Oct 2026 16:15:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/oom_kill.c:753: warning: Function parameter or member 'tsk' not described
 in '__mark_oom_victim'
Message-ID: <202610271653.nagh3VDs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi zhengtangquan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   b0800a06decb0c4d9b0e0a7f3ad4d38cb76e946a
commit: 6e5f1821281fd8b67e7033f3a07d14d4d18588f9 [353/353] ANDROID: signal: Add vendor hook for memory reap
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271653.nagh3VDs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271653.nagh3VDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271653.nagh3VDs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:753: warning: Function parameter or member 'tsk' not described in '__mark_oom_victim'
>> mm/oom_kill.c:753: warning: expecting prototype for tsk(). Prototype was for __mark_oom_victim() instead


vim +753 mm/oom_kill.c

   747	
   748	/**
   749	 * tsk->mm has to be non NULL and caller has to guarantee it is stable (either
   750	 * under task_lock or operate on the current).
   751	 */
   752	static void __mark_oom_victim(struct task_struct *tsk)
 > 753	{
   754		struct mm_struct *mm = tsk->mm;
   755	
   756		if (!cmpxchg(&tsk->signal->oom_mm, NULL, mm)) {
   757			mmgrab(tsk->signal->oom_mm);
   758		}
   759	}
   760	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
