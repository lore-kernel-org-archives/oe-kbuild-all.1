Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B851E33BBA2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769837837; cv=none; b=tdmP9Tf/VBQgjIVmejH/qQgf4rIedgxOHRC4XTTYmrY6VQ41IH6hE9FyIWqscyMK3bTCYg2gP5Z0322z1EKHhxYSJrY6qSv+hVQuI1rHmRE+8/pbAAOhhbH0V+r0x3q1FRFtbb325If+k6Dfv7x20R+Gp4lrjIZYvVivdodVEYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769837837; c=relaxed/simple;
	bh=pso7uns9V16oCRFQa/kiD5G0Y1tbCYNbvoFwgdRZrko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cgEstOjWpgzGo3DQIX0XkNZc2sJKbYmRNsZaV4wBBdfJfYyDwkWVUmRU1DqUxEPsiRPoO2ABCUkyFs0IEEjhJpJ7P+kNOBA7IL7XKrxs1e7EP/tstYY8fqR0LAHJL4kdg6oKFU0o7kMDGkTUi+Gq7xwVCIVMc6dWhldHw1eGO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqS4LgPw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqS4LgPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769837836; x=1801373836;
  h=date:from:to:cc:subject:message-id;
  bh=pso7uns9V16oCRFQa/kiD5G0Y1tbCYNbvoFwgdRZrko=;
  b=lqS4LgPwSfIhF/DrBDucAz2CW1QD3QB0pSY76coce9Q6lJ/NuQCFVo6M
   4NEcfmSIMQZeberWUey8tszgY4cHOB1FcS64zlqDoPyy+WP2S8txE/hWR
   IBVcUwn1eGFKHErGhVLKSzavPK3X7+2Lb+msgfZyigS9dhFGz7Tm93rVu
   OKPyHdJu5FqPSn6rOVmFIGxq45olAOmzxyH4fjsRUD5ZxULSBb1d5fVCZ
   5sWOE5ci18uPRN86hmI/K+LnvpU46kZGlBKhAnY584xebFyjn5FDWABVP
   de023RiiZD3xHaEl9XFQ6AYFOIcUSL9217qRMqw1I253HXkJhmi6avmI2
   w==;
X-CSE-ConnectionGUID: 2jiSqz8XTgixtzTsZqltUA==
X-CSE-MsgGUID: tQRBvjz1RSKdf8F8i9Sgug==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="58665815"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="58665815"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:37:15 -0800
X-CSE-ConnectionGUID: fFf5JDibQXyHGVh53bsBgQ==
X-CSE-MsgGUID: S/Jr8OlsQXmMQ0LV0CuGLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208144079"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2026 21:37:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3fT-000000002ef-1MEX;
	Sat, 31 Jan 2026 05:37:11 +0000
Date: Sat, 31 Jan 2026 06:36:24 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 1/12]
 kernel/bpf/trampoline.c:448:15: error: variable 'trampoline_ops' has
 initializer but incomplete type
Message-ID: <202601310655.mN1RXYTD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 9ecb3af28fc9354376aac0f9645ff70b637c067b [1/12] bpf: Add struct bpf_trampoline_ops object
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260131/202601310655.mN1RXYTD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310655.mN1RXYTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310655.mN1RXYTD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:448:15: error: variable 'trampoline_ops' has initializer but incomplete type
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^~~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:449:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
     449 |         .register_fentry   = register_fentry,
         |          ^~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:449:30: warning: excess elements in struct initializer
     449 |         .register_fentry   = register_fentry,
         |                              ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:449:30: note: (near initialization for 'trampoline_ops')
>> kernel/bpf/trampoline.c:450:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
     450 |         .unregister_fentry = unregister_fentry,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:450:30: warning: excess elements in struct initializer
     450 |         .unregister_fentry = unregister_fentry,
         |                              ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:450:30: note: (near initialization for 'trampoline_ops')
>> kernel/bpf/trampoline.c:451:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
     451 |         .modify_fentry     = modify_fentry,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:451:30: warning: excess elements in struct initializer
     451 |         .modify_fentry     = modify_fentry,
         |                              ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:451:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update_ops':
>> kernel/bpf/trampoline.c:710:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     710 |                 err = ops->register_fentry(tr, im->image, data);
         |                          ^~
   kernel/bpf/trampoline.c: At top level:
>> kernel/bpf/trampoline.c:448:34: error: storage size of 'trampoline_ops' isn't known
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^~~~~~~~~~~~~~


vim +/trampoline_ops +448 kernel/bpf/trampoline.c

   447	
 > 448	static struct bpf_trampoline_ops trampoline_ops = {
 > 449		.register_fentry   = register_fentry,
 > 450		.unregister_fentry = unregister_fentry,
 > 451		.modify_fentry     = modify_fentry,
   452	};
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
