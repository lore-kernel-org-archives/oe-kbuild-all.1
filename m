Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C15D529
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835645; cv=none; b=PdievjEvE7+cJfXUAdtMaAQGwOE+BFTGliuU88A846ktZUGjM3CINLbU4BTFaFsK9KWFu3dPA7O+Ia/dOqSxxS2yFGdMzx8nOJB7ntZVPQX9MKlZP/mmz5Fk/JLDKztJhjHfdFLJs7rkW6i6C9BivpQOMpCWUUWAaGIBeiifkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835645; c=relaxed/simple;
	bh=Kaw56mXVmXZtBKB3AL191sC6xCf0yXFJ7XhOTd3lkZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ItQxOtEDrEfgkpauAsfMIcfDlVk+GvuB1P23ttZ6lmBJmHO6D96wmZ1rWb9c/5roUQ0fIfcIpkIzRurZqxuDSzXimAdMLR2vcsOoR0v1F80hnkotdzic3o9TDmpwSTzQNK7UrCcLzf0yCrHd1ZUbysrtyYTH1ghcN+SjMlJsZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVC+w82r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVC+w82r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727835643; x=1759371643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kaw56mXVmXZtBKB3AL191sC6xCf0yXFJ7XhOTd3lkZ0=;
  b=GVC+w82r6E4Sv45gXNHk9bxp07zlCCfyguCInaWAwEOcoOCzEDczNDf/
   I2WzQE0tBc4NaxVfB0gTBV+8sL1iy+g43Sro7qUKWrr4ay1XZUwtRiY64
   jNIgm3uyVv6j0RKbUf5MC8NWJuB04yL8xRhSGGBtFPqbr7lwSkh+c22ST
   wzzcz02mFjEkfx/fwJalD+icBz7vEvoHKolan++MbqSLl155gn8Y0CTPB
   quzM5L+EUsyxER06YUPti85XFfmkXRkKx7Mueq7oMAiyKFtE9RNt42BGL
   12oYa0sYhOdxHgqY85HSYPrfjw8iUyDUdVjIsIMLhRyuL+UlBWpU1GJSO
   A==;
X-CSE-ConnectionGUID: REasf6q9RmOxwAAPkkM3rQ==
X-CSE-MsgGUID: mnND9Sb/R6CtQb4wg6a0wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27089213"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27089213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 19:20:43 -0700
X-CSE-ConnectionGUID: fNhZNdIKSqqVZm93pzUr2g==
X-CSE-MsgGUID: j4o0y4urSi2eVBRpZUeZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="104680513"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2024 19:20:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svoym-000RRB-11;
	Wed, 02 Oct 2024 02:20:40 +0000
Date: Wed, 2 Oct 2024 10:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 241/1491]
 arch/x86/kvm/x86.c:10803:13: warning: 'kvm_vcpu_pv_sched_fini' defined but
 not used
Message-ID: <202410021037.LEU2UXPg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 6ba4260ba1152c232c9367f791822b16fa060175 [241/1491] CHROMIUM: kvm: x86: upper bound for boost duration
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021037.LEU2UXPg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021037.LEU2UXPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021037.LEU2UXPg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:10803:13: warning: 'kvm_vcpu_pv_sched_fini' defined but not used [-Wunused-function]
   10803 | static void kvm_vcpu_pv_sched_fini(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:10793:13: warning: 'kvm_vcpu_pv_sched_init' defined but not used [-Wunused-function]
   10793 | static void kvm_vcpu_pv_sched_init(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_vcpu_pv_sched_fini +10803 arch/x86/kvm/x86.c

 10802	
 10803	static void kvm_vcpu_pv_sched_fini(struct kvm_vcpu *vcpu)
 10804	{
 10805		hrtimer_cancel(&vcpu->arch.pv_sched.boost_thr_timer);
 10806	}
 10807	#else
 10808	static inline void record_vcpu_pv_sched(struct kvm_vcpu *vcpu) { }
 10809	static inline void kvm_vcpu_do_pv_sched(struct kvm_vcpu *vcpu) { }
 10810	static inline void kvm_vcpu_pv_sched_init(struct kvm_vcpu *vcpu) { }
 10811	static inline void kvm_vcpu_pv_sched_fini(struct kvm_vcpu *vcpu) { }
 10812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
