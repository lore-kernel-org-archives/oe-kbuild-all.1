Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97C43CEEE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564241; cv=none; b=rYAKPCrQyVhhuxMicxa3J97IugRirjfTRaa4sDHyNWC9nzriKVTVLorHWx8TyeogMuojHnT311BMPxM6aIDfbAcog9/PGcRYvE01wHGQvcylh/qiQ1fzhFBwj5HfljrQNLobMlLnfXWl6+Gsx6mT2wnUAu6WApLSEh0g8fLM0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564241; c=relaxed/simple;
	bh=VMcKe0LpMj2JIoPQ03X4rOHmi/Dub8ON3b1sMaZSGbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vq9mvsFF5m9hloMRk7/LYnp/ATBkBn96GabC7l1fMGbtOBRM+xazvIyamOVaAN2cJQKhIZ0FSIxVjR7BK2Jiqv8GW5dza1MYe7PEy1TSP5rsD40Jh19I3h6l7NN90sPFBhpAALkppWr7aIf6zEKbD7JwTG6XsWKCA+ITI4O62Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdFJpapY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdFJpapY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777564240; x=1809100240;
  h=date:from:to:cc:subject:message-id;
  bh=VMcKe0LpMj2JIoPQ03X4rOHmi/Dub8ON3b1sMaZSGbI=;
  b=LdFJpapYtfw0c9RFkdJKtNpCJmu14/oB/fic0DFvainzZ8ynCrDKP7my
   02ME3y0ILVJvyRRUVVeLAvQMYi/skUa7eL7lOERj/4nqF4luHrx5m5pwi
   WZtB5nFhgB4gT7U+pDBhc1N2vc7Ti0coftTeL4vgFbEO/nXG1IDBt8TyA
   lXosOPENc+sv7cQy6FV7noHky71D44UJC2cnB8zfbMjZlQXKrahdMT6n9
   QT3RKT2qSV0OZURRK4sry4UFBketA9wf0KtymIwbGJt2aIvb0BSqJZGh0
   Vmk3KlxiVKAYiT+19QSg1lJ2l995eNUEdqF23B+o12HxshGBSju8bDXpe
   g==;
X-CSE-ConnectionGUID: FNferxexRs+hsZapnxikUg==
X-CSE-MsgGUID: ypiYen8YRvaRrpwxfm2fOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="81097018"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="81097018"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:50:40 -0700
X-CSE-ConnectionGUID: dgpvebFhTrGAKJB0ntYz1g==
X-CSE-MsgGUID: nWyuaYbrQKeXzF3kiBhzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258203652"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2026 08:50:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wITet-00000000CYO-1lj8;
	Thu, 30 Apr 2026 15:50:35 +0000
Date: Thu, 30 Apr 2026 23:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Paul Durrant <paul@xen.org>
Subject: [dwmw2:kvmclock4 23/30] arch/x86/kvm/x86.c:2641:13: warning:
 'kvm_use_master_clock' defined but not used
Message-ID: <202604302359.g6ejgjts-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock4
head:   0cb32bb9e5aca98889425721c283ce2fc3f3ff95
commit: c693b7a5eac013c1bbc94bf1fe6d318cc2e7d7bf [23/30] KVM: x86: Factor out kvm_use_master_clock()
config: i386-randconfig-062-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302359.g6ejgjts-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302359.g6ejgjts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302359.g6ejgjts-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_guest_time_update':
   arch/x86/kvm/x86.c:3467:22: error: implicit declaration of function 'kvm_get_time_and_clockread'; did you mean 'kvm_get_monotonic_and_clockread'? [-Werror=implicit-function-declaration]
    3467 |                     !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      kvm_get_monotonic_and_clockread
   arch/x86/kvm/x86.c:3438:23: warning: unused variable 'flags' [-Wunused-variable]
    3438 |         unsigned long flags;
         |                       ^~~~~
   arch/x86/kvm/x86.c: At top level:
>> arch/x86/kvm/x86.c:2641:13: warning: 'kvm_use_master_clock' defined but not used [-Wunused-function]
    2641 | static bool kvm_use_master_clock(struct kvm *kvm)
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kvm_use_master_clock +2641 arch/x86/kvm/x86.c

  2640	
> 2641	static bool kvm_use_master_clock(struct kvm *kvm)
  2642	{
  2643		struct kvm_arch *ka = &kvm->arch;
  2644	
  2645		/*
  2646		 * The 'old kvmclock' check is a workaround (from 2015) for a
  2647		 * SUSE 2.6.16 kernel that didn't boot if the system_time in
  2648		 * its kvmclock was too far behind the current time. So the
  2649		 * mode of just setting the reference point and allowing time
  2650		 * to proceed linearly from there makes it fail to boot.
  2651		 * Despite that being kind of the *point* of the way the clock
  2652		 * is exposed to the guest. By coincidence, the offending
  2653		 * kernels used the old MSR_KVM_SYSTEM_TIME, which was moved
  2654		 * only because it resided in the wrong number range. So the
  2655		 * workaround is activated for *all* guests using the old MSR.
  2656		 */
  2657		return ka->all_vcpus_matched_freq &&
  2658			!ka->backwards_tsc_observed &&
  2659			!ka->boot_vcpu_runs_old_kvmclock;
  2660	}
  2661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
