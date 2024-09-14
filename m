Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F51CDA0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726297013; cv=none; b=s3yfWrFFQnIx7RnpXoi/bZFfH1OferPmhI8YF7f8EFC9p3JIkxF6FeBFHKs0f3wbqvNCpiM26ACwTScbf0BpsZZtfRIv4oH1uExHkz099wR2i9dPZgbpS658oai84i7X0bTOdKiGUCgNa3Sq4I1hnGxRAWBZ2w5qf3uWponBmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726297013; c=relaxed/simple;
	bh=iKbFYRk2J8MOwC4JPMpaffxXFPd+RRdin3b7juYcdh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZvGep4/tL1yWUkoq3Mx680ShN9+Dztt4050l8hvwt0WFvbifvnDqCjYY0+0ACTh0yQZbys4Hause/56Kxa0H8BD9NjDY9gpNHxb0Cu+0TJezKN0QTVuVugMzaAOMqpGPYPVXJe5bOBG8QO0bWwr61MWzMWWLhdoPEcGn2VZ29k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbjnZQCt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbjnZQCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726297011; x=1757833011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKbFYRk2J8MOwC4JPMpaffxXFPd+RRdin3b7juYcdh8=;
  b=RbjnZQCt4g+oog2sgaEP1Rt1YaShaoheJIIUdvrurphAGFfZk8urkL1Z
   ecWwetPNZQk/HBqLGoExU5KNWnxzrL9zrKrIBzUyoWtjrm6qVjmPf9c4D
   eoPWRfGoSEgQQFf+NMaDvBZP+GzKUKKQhUBdYjtjtknW/lLqgr3x/dh1X
   9bhPOtbJnI0gXcW0oCjIgUwHYYz557byhesofcCBjW5SMZRcKFNCwhUpt
   R3bw8AnIlO5//0MXsWK8O7m4xNhesDvoMfVivYrka9LbX5QNe6KVqeLiD
   EVVcmUOwjn3GlvkHfHJfauZhczVLxcRbClTMlhz50OfGEeXHhCo7+0ZIp
   A==;
X-CSE-ConnectionGUID: a/b4QIUXTfSlCGTQfBHcrA==
X-CSE-MsgGUID: ZzW1GU1ETNykkerzaeR0NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47714850"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="47714850"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 23:56:48 -0700
X-CSE-ConnectionGUID: TcDsJtzMSgarwmJbNank4Q==
X-CSE-MsgGUID: mzVjCidHRiGL7QDQpyCrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68572244"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Sep 2024 23:56:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spMi5-0007Tc-14;
	Sat, 14 Sep 2024 06:56:45 +0000
Date: Sat, 14 Sep 2024 14:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [linux-next:master 10436/11962] arch/x86/kvm/smm.c:651
 emulator_leave_smm() warn: inconsistent indenting
Message-ID: <202409141449.UcocWbNb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
commit: 3f6821aa147b6e6fe07e8b35999724518b74a632 [10436/11962] KVM: x86: Forcibly leave nested if RSM to L2 hits shutdown
config: i386-randconfig-141-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141449.UcocWbNb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141449.UcocWbNb-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/smm.c:651 emulator_leave_smm() warn: inconsistent indenting

Old smatch warnings:
arch/x86/kvm/smm.c:300 enter_smm() warn: inconsistent indenting

vim +651 arch/x86/kvm/smm.c

   625	
   626		/*
   627		 * FIXME: When resuming L2 (a.k.a. guest mode), the transition to guest
   628		 * mode should happen _after_ loading state from SMRAM.  However, KVM
   629		 * piggybacks the nested VM-Enter flows (which is wrong for many other
   630		 * reasons), and so nSVM/nVMX would clobber state that is loaded from
   631		 * SMRAM and from the VMCS/VMCB.
   632		 */
   633		if (kvm_x86_call(leave_smm)(vcpu, &smram))
   634			return X86EMUL_UNHANDLEABLE;
   635	
   636	#ifdef CONFIG_X86_64
   637		if (guest_cpuid_has(vcpu, X86_FEATURE_LM))
   638			ret = rsm_load_state_64(ctxt, &smram.smram64);
   639		else
   640	#endif
   641			ret = rsm_load_state_32(ctxt, &smram.smram32);
   642	
   643		/*
   644		 * If RSM fails and triggers shutdown, architecturally the shutdown
   645		 * occurs *before* the transition to guest mode.  But due to KVM's
   646		 * flawed handling of RSM to L2 (see above), the vCPU may already be
   647		 * in_guest_mode().  Force the vCPU out of guest mode before delivering
   648		 * the shutdown, so that L1 enters shutdown instead of seeing a VM-Exit
   649		 * that architecturally shouldn't be possible.
   650		 */
 > 651		if (ret != X86EMUL_CONTINUE && is_guest_mode(vcpu))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
