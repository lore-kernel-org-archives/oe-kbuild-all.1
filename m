Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5C1851
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708477385; cv=none; b=PlKdr7hHlSEejbc6d5K1swV/Ze4i3kHgekc2uLy3b/Mq0R++JZr704M/HU7qh+mqi+JOLMflMZFBxeaU62PFSgbFpkzjfhDxZsZCM1JA8/tMfufnXgAmRfemNqVNJxhkn9wl9XwMA9DmYBMNSv7U79chWktIzZ9vUgp1l4tGUkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708477385; c=relaxed/simple;
	bh=RGFza6xuUdV2LBwRXQ+QnCq560jWcGs0kSxQc6SEGk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jz1kz1fX5FFPPI7WAqHVkewCncHmeyaNeE0JIFGCfr9+vMTYqcI4cg1OO9JFg0PiQatTY0R3gTEDaR1cLFYWMrAuoo0gKNZJ/9LkYkF6UgCWWlQBtQpl55QUnOSCgyRhi+IfDjpXSt4cS1r5WPKWwhEI+iEzYzYyLYluFLGyuW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJdlZdVG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJdlZdVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708477384; x=1740013384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RGFza6xuUdV2LBwRXQ+QnCq560jWcGs0kSxQc6SEGk0=;
  b=gJdlZdVGr8cwl64cmNipfT5hj5IK+BXexNWrf8+1Gr4L3cwh5PfX+nH8
   /XPkwoEX56+xd2lxLzUNj6T16kiILwk7EIRzOVquNpulivpiVqBIe7jWd
   Nx08wq2jzv0BcvlJkJ8l2bs+8aIk4Jn3pznc26ODMk1v2C3dVJU9P8NEg
   58IziyQ+o2agoU/+BROkTA647sxrbLZ4HZIEAzRvx4UNWppC+uu+dIWZx
   zGDT971kMUeSmCUrzAaIiMIgRToVzxlU3zrLLmCWKw2LLBEpP1z8dVSG1
   Ql552UYLNcqX8/a2DkhNpZ7i9FGrZLNgrF62VK18ziGTcKmh0OM7ryuUK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="25078283"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="25078283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4854733"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2024 17:03:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcb0j-0004ud-1B;
	Wed, 21 Feb 2024 01:02:57 +0000
Date: Wed, 21 Feb 2024 09:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 13/14]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:578:42: warning: variable 'vcpu_mc' set but
 not used
Message-ID: <202402210818.qOHyRfoI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b1dc7ef48b6a01e0608710e47201b1182d801183
commit: 42a3c8cb2d770a3fcb69cfe4dcdc2063fad96046 [13/14] ANDROID: KVM: arm64: Use hyp_alloc for pVMs sve_state
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240221/202402210818.qOHyRfoI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210818.qOHyRfoI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402210818.qOHyRfoI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'teardown_sve_state':
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:578:42: warning: variable 'vcpu_mc' set but not used [-Wunused-but-set-variable]
     578 |                 struct kvm_hyp_memcache *vcpu_mc;
         |                                          ^~~~~~~


vim +/vcpu_mc +578 arch/arm64/kvm/hyp/nvhe/pkvm.c

725625afc485fe Marc Zyngier      2022-04-04  572  
9251f19da0f66c Fuad Tabba        2023-03-23  573  static void teardown_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
9251f19da0f66c Fuad Tabba        2023-03-23  574  {
9251f19da0f66c Fuad Tabba        2023-03-23  575  	void *sve_state = hyp_vcpu->vcpu.arch.sve_state;
9251f19da0f66c Fuad Tabba        2023-03-23  576  
9251f19da0f66c Fuad Tabba        2023-03-23  577  	if (sve_state) {
9251f19da0f66c Fuad Tabba        2023-03-23 @578  		struct kvm_hyp_memcache *vcpu_mc;
9251f19da0f66c Fuad Tabba        2023-03-23  579  
9251f19da0f66c Fuad Tabba        2023-03-23  580  		vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
42a3c8cb2d770a Vincent Donnefort 2024-02-19  581  		hyp_free(sve_state);
9251f19da0f66c Fuad Tabba        2023-03-23  582  	}
9251f19da0f66c Fuad Tabba        2023-03-23  583  }
9251f19da0f66c Fuad Tabba        2023-03-23  584  

:::::: The code at line 578 was first introduced by commit
:::::: 9251f19da0f66c8f8b6ff259752e6f767966200f ANDROID: KVM: arm64: Donate the memory for the guest SVE state for protected VMs

:::::: TO: Fuad Tabba <tabba@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
