Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA43C3444
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873870; cv=none; b=FREfs04fMLfZxfRlGQTZeBkbC+My1VPkLzQfHbpmcVKY3HuHryGkdyV4fWNhlXkURa9OxarLwAOR1GYUO2KewAlzxX3kj/eO+5xp5o5nSQy61Oe8iHOCGco5L++EYtPObEpkcYMfQxhhlzckLDQTt0foREbsoF7FUA8TAd0ld4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873870; c=relaxed/simple;
	bh=JfOa53QeHju57riWcdHYnim427GerxScSSpQ1xwKd6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OWwi3FiNA8o/V8jAzuWUEsbUO9Qy5LiZ08DM0OkYthNDuvnMBFDN0g8Wx1B5KoQR+pJG2rw3Yaq+MsDthuyuw0I9/qEEkoOUhTnsNPqKAdZDMg/5qmiNJYApaUqKIKZfKIWPBby522v0eJyWNLg5J+LrxMWGuUgdA0wzvrss9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zbyg48Nb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zbyg48Nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774873868; x=1806409868;
  h=date:from:to:cc:subject:message-id;
  bh=JfOa53QeHju57riWcdHYnim427GerxScSSpQ1xwKd6A=;
  b=Zbyg48NbgG8zpS6W/MIOLIfZt9lJt5dTdlDAvPCPbvG3T7/wh1LaIQo4
   26R3KsQu5AX0i9xmX/Vz/+qN1cFOzoubUp3E1UJukqjW9xKAqj4SK6hY8
   /iOxAcxSbltweUsxJ9gyJEtwJN5PJ/uqIU/oquPK4dcCPrMZOj3Hi+tDd
   xozqdgXPXr+A7MEK5eVQCsO7fQXiQ/3T+XnAyy9G67J2h73/MFTT66USX
   r+5XXKo+up9Rq1zLFlju/s9W3kJ9xeHZj5uXdNRV+Uk+7G5bw3Nv1fO5G
   LkA9LBOPiiHTeZh/cnMNCsUR0bkTsH8EYt5Agb4mYJbxGvWcoKwmoBpFq
   Q==;
X-CSE-ConnectionGUID: o69V0H/QQ4CFYhDqSNjY5g==
X-CSE-MsgGUID: 68XqxC4/Qf2iI0RMs2PFgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76056130"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="76056130"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:31:08 -0700
X-CSE-ConnectionGUID: gNq1dtCnSMOhyf2Srhs1hA==
X-CSE-MsgGUID: xnoToEoLRsWH7AGfWvFyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="227660472"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 05:31:07 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Blo-0000000014j-1xGP;
	Mon, 30 Mar 2026 12:31:04 +0000
Date: Mon, 30 Mar 2026 20:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for
 '__pkvm_register_psci_notifier'
Message-ID: <202603302020.NZeMLtSX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 68d457650f79d4b9f8f23b82a8d0a06c4c74419d [4/4] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260330/202603302020.NZeMLtSX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302020.NZeMLtSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302020.NZeMLtSX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_psci_notifier +35 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    34	
  > 35	int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
    36	{
    37		/*
    38		 * Paired with smp_load_acquire(&pkvm_psci_notifier) in
    39		 * pkvm_psci_notify(). Ensure memory stores hapenning during a pKVM module
    40		 * init are observed before executing the callback.
    41		 */
    42		return cmpxchg_release(&pkvm_psci_notifier, NULL, cb) ? -EBUSY : 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
