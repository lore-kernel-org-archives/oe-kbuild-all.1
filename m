Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72851341050
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509816; cv=none; b=sv3+01bixc/cs0YEysPifNx8abUSxjsWfoRzrbJ0ftoYTAHJF+Yp578L5jkzuf+y9MjyieaYOxo//ZxVWhURDxasuOgyKe0oJiTQjZRy8d6Cg9IxWTRUIqYOoIp+0ISwLYaddTbELjW8waDLP7JvRbrz2mpElsZeDWsEQIzdOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509816; c=relaxed/simple;
	bh=Jk6pwivVgR4DaerEY0hxvdxV8KKA06qU1Cp59IJF3Ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eq6LA4OJD0Y8qmKKa55ulDieIsZK/g2g+fdroE3EHIR5WiV+lf0cyvM2KTyxZAsDR7KJYIVd9xDu10/N2G6tyr6eRYRr+HWbMqLvpj/16gYW5YxYLvfCUNX47YcsdmEFxh9Qw89xvJCafTKCn772oQ7gkJBnkrHehEUNs1z4Wfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4sFfsIa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4sFfsIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776509815; x=1808045815;
  h=date:from:to:cc:subject:message-id;
  bh=Jk6pwivVgR4DaerEY0hxvdxV8KKA06qU1Cp59IJF3Ho=;
  b=U4sFfsIaUID0+G+eE3OwIdh+G+16zDkPEtn54oToesPR5R0NwM85RsDX
   uWiYjGnfBlX+a8XaLIaE/j1zYC/xdzZNxz69sGlyZudM4ulQ0alIWpRc5
   AmogNWmE2iq+YgFzr+cSwaTDYQ035kc4rxGHG2eM+fsq7bZgL9rPR/KtS
   Cklm5IHq5wtY7xateRl57w16MqPICrhgtlAnu5lbYH3wyfgOoZNYjciVT
   JzZUTV11eDPvKV3tCOfG0zva9welutmE7qXlvx2Bg5Wi/GV+JTX2mxokr
   nHAC8XTp68rqCfinG6Wka4uQ4Y/J95k1KqPHZLLP0YTvcFpjLBsgknLdU
   w==;
X-CSE-ConnectionGUID: Rqy9dG4EQ12x+d2nnA6lIg==
X-CSE-MsgGUID: 7CF3xpPMRPq+DSQ1gZOxWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88883859"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="88883859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 03:56:55 -0700
X-CSE-ConnectionGUID: Gtusup37SDOh8oaFKTCpSw==
X-CSE-MsgGUID: iIe03JJkQraywQY1kvAokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="224743182"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2026 03:56:53 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE3M3-000000001BE-2R9i;
	Sat, 18 Apr 2026 10:56:51 +0000
Date: Sat, 18 Apr 2026 18:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/3]
 kernel/sched/ext.c:1064:undefined reference to `stop_sched_class'
Message-ID: <202604181818.BCkMTHMJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   73ec59b5cf2573293ee87a7be9fed6a2d0497ffd
commit: b43a624675e325ff4cd8db600ff7cb4e80de0c91 [0/3] UPSTREAM: sched_ext: Fix incorrect sched_class settings for per-cpu migration tasks
config: i386-buildonly-randconfig-002-20260418 (https://download.01.org/0day-ci/archive/20260418/202604181818.BCkMTHMJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604181818.BCkMTHMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604181818.BCkMTHMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/build_policy.o: in function `scx_setscheduler_class':
>> kernel/sched/ext.c:1064:(.text+0xa58b): undefined reference to `stop_sched_class'
>> ld: kernel/sched/ext.c:1065:(.text+0xa59c): undefined reference to `stop_sched_class'
   ld: kernel/sched/ext.c:1064:(.text+0x18b5d): undefined reference to `stop_sched_class'
   ld: kernel/sched/ext.c:1065:(.text+0x18c37): undefined reference to `stop_sched_class'


vim +1064 kernel/sched/ext.c

  1061	
  1062	static const struct sched_class *scx_setscheduler_class(struct task_struct *p)
  1063	{
> 1064		if (p->sched_class == &stop_sched_class)
> 1065			return &stop_sched_class;
  1066	
  1067		return __setscheduler_class(p->policy, p->prio);
  1068	}
  1069	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
