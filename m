Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462E2EB5AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256939; cv=none; b=LCkqaNbICiK15L0HE2au9SPtbviYpYFD+7Yzr6ioEvLF8pZ2fS1cERnqj2CoV7tj6KmW1lo15AOXWZpGlmB+paF4T3QpSUTXJrzOLBG+BDYNYqka+lgsk2OYK8s/kpKvEBwiaEZPD7A/6iheQ8E/jYz0iRiWYwjDJv2LsPHBhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256939; c=relaxed/simple;
	bh=IsAb5h+yGvzZhOkxJ2c85bzs6t5uxA1VgG2k5782ODo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdxyFiRhhr4v3RMuOSAFDO/XZJftTVNm2zinnUnMyIzDu3uVnSkqmvjza3y52L+CEjl+lHxDn4KRtaOLd9+AKvZk5i4NjH1RdZeey3eb/G9PXdaTQWJvLcBDOQRGNyvZ7K6uOAbpw3EeF9MJLZmQNwlXBC6dmHT0rcDGLgBG5gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftk6ebIf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftk6ebIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750256937; x=1781792937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IsAb5h+yGvzZhOkxJ2c85bzs6t5uxA1VgG2k5782ODo=;
  b=ftk6ebIfyLil7hzCp0fuUCm/W+7eDVcV/+TAWLer630/Ddkltjab5dxN
   QcfEKG0nm3VML4eyPx3Mm99nawDrLa1OwsRfXO5ReOzFSpMtMsBOiXwY3
   hMyL+7iVGOkGWaSmYqRJ2Y/aKY1jSi82f9mfIibdP0XAmtZjN2s9hJVgH
   aSrOgsxkPG9UK5uoV4iOFZ/UVrFuOQgT3bz8ZaOL7XuXDR9dtgKX4j6+S
   aRNEWcmnm4I0eY8R+gPoGJ8YecDOBpWGJCTzGkY/FbWwwQ4gSpMFYdGsO
   zAs+fQdiKZ+rm/FWPqZKsbVpgnow+9uUZfABydt+rLCItZUn5c+ZwPakM
   A==;
X-CSE-ConnectionGUID: SLDf4tRnRNqEGifPmONLeA==
X-CSE-MsgGUID: XbRzuJVLTbqU/IczyutIag==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="69920141"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="69920141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 07:28:57 -0700
X-CSE-ConnectionGUID: W5sH8EuPRyytvQb5FCpH6A==
X-CSE-MsgGUID: l5p1nStrQEKIYAipo6kJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="154438900"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2025 07:28:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRtmW-000Jsa-0d;
	Wed, 18 Jun 2025 14:28:52 +0000
Date: Wed, 18 Jun 2025 22:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 4/4]
 arch/arm64/kvm/pkvm.c:756:5: sparse: sparse: symbol
 'pkvm_enable_smc_forwarding' was not declared. Should it be static?
Message-ID: <202506182216.uIGWNa4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   de302629fac9207afcc2ab5feecc614c8badd5e5
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [4/4] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-r122-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182216.uIGWNa4B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506182216.uIGWNa4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182216.uIGWNa4B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/pkvm.c:756:5: sparse: sparse: symbol 'pkvm_enable_smc_forwarding' was not declared. Should it be static?

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
