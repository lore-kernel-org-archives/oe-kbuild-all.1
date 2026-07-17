Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14053D903B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289459; cv=none; b=kZIzZWh9hBm6pPBBbAWM1fxYtshVe7lt9KzTjCAB//iscJopPsmuT51zgrMmZV+jrxt50+a+wjEHUvldl1DAtu0TBc582CQ2n3oOft8lvFfAGjm0yHpe8Xe4uQSvaL/BDfNNojMiklr4BQcl7lPZcp/BBclEU8vcjTzp65e5pZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289459; c=relaxed/simple;
	bh=8cdXqM47jU7Y88mxyQ0DMIfYlfwZfyfhl47vspLatH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TtiqYGMUKf1y1sfpkwlddpZDmfxVtLJyQm8JFezbrB7KLUqq1oSXUR11ge9fXHAb/JfGC1s6W9sQbZIc9KC1TDaSkm0CEcONiSusezDaDhZq//FQnTAnJxFvv4DszptNeZniAAva0Gp+29SVYWgoTE18JVrxivzJYP3ZNiLi/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8g99uyD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8g99uyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784289455; x=1815825455;
  h=date:from:to:cc:subject:message-id;
  bh=8cdXqM47jU7Y88mxyQ0DMIfYlfwZfyfhl47vspLatH0=;
  b=A8g99uyDuuY7MAEPjy2oPZYyP4uNzLwxlIVDa79WTMkALA+Atw2mJOwI
   gFVAof+AfGXnNTP+CK+hDQ3K6chS3EyNealb3YY5M0eFHcmbadaqebfer
   yjbE0AOi7XGYUWrVoH2pUTt/ye5aLyVUSbQkDlUsTNvLGIsbb5MZB/84L
   HMixPYk3RRipKQ3aM9z0dUeu67XaqAoKPVSfWSWnqjK2kepVa0gGvTrT3
   DZwvgoo52fCstK1N2SlBZlVECLlFNijVDH1Rehi+NKCuckL/Z9GHEbTLF
   sN7nnjKPkgLBvF4xX3BYrekfXXIFzkcjLJsTw/KecjeNIDX1STmWdR7te
   g==;
X-CSE-ConnectionGUID: MCZRfjObRYWOHlAE5mDnOA==
X-CSE-MsgGUID: OtjTfHJJTPOJ8W1nN+AO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85157932"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85157932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:57:30 -0700
X-CSE-ConnectionGUID: HPE/qvJCQ/Wne8KKrEUqqg==
X-CSE-MsgGUID: mwwS2jh3Tfqxg8MmVuTnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258759616"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jul 2026 04:57:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkhBx-00000000Si4-3YMG;
	Fri, 17 Jul 2026 11:57:22 +0000
Date: Fri, 17 Jul 2026 19:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 arch/arm64/kvm/pkvm.c:756:5: warning: no previous prototype for
 'pkvm_enable_smc_forwarding'
Message-ID: <202607171934.slvzMeUv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nikita,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1a1783c017b188c47740a5de7ffa05a4b75a2f09
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [12/12] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260717/202607171934.slvzMeUv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171934.slvzMeUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171934.slvzMeUv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pkvm.c:756:5: warning: no previous prototype for 'pkvm_enable_smc_forwarding' [-Wmissing-prototypes]
     756 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pkvm_enable_smc_forwarding +756 arch/arm64/kvm/pkvm.c

   755	
 > 756	int pkvm_enable_smc_forwarding(struct file *kvm_file)
   757	{
   758		struct kvm *host_kvm;
   759	
   760		if (!file_is_kvm(kvm_file))
   761			return -EINVAL;
   762	
   763		if (!kvm_get_kvm_safe(kvm_file->private_data))
   764			return -EINVAL;
   765	
   766		host_kvm = kvm_file->private_data;
   767		if (!host_kvm)
   768			return -EINVAL;
   769	
   770		host_kvm->arch.pkvm.smc_forwarded = true;
   771	
   772		return 0;
   773	}
   774	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
