Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE72E41CB4C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499944; cv=none; b=Yr8R2tX5oKvDBUVdH3NVTxsTGRXPA7gniACn/RqeXRy+ITn6w/2aM5O8+fTnuIdOBy6XVPHYs0D8T40Z7KrWPzBdifVkDRKN8Ry9K8KtJ4bcXyNY8ci6rcHvV+nvSIfMPo67+2F+S8OFHoXBfHjC082mrf1NfIDhIsaCxWy3oX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499944; c=relaxed/simple;
	bh=tOlv4sA43J5x4vXkLqdrxBjJLeKW30IVO24KaacvvZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VhtklPleSCURe05GsXvbQO5SoOR4Pr4O8cUOg6Ga/wnP2zvFe9n+vCO9amkTvQtFVi0oeC7r63B8Hs8Dql9r+dffRna9sfNjcK1wMFvTu06DG0AR29xUehqG5XGAtKX52P1D+WADuAXy2OTzQZdHFd1mz+gbPR0Epdy5xvJDU60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWBumLRn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWBumLRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789499943; x=1821035943;
  h=date:from:to:cc:subject:message-id;
  bh=tOlv4sA43J5x4vXkLqdrxBjJLeKW30IVO24KaacvvZA=;
  b=aWBumLRnLz9MBzf3m9NfnzmM8V11SViTpPefsJqjHZ+byS1CcL6nK/cX
   ZybYb389KiNV00D3M9TDKE7exVY9br+kw5omr6cB19oJZzBsmuhFM1Zvb
   cTA95U0pY2J8dPJWgnCRg1BF76S6tXMl/SGw0JPqMgocf49/4KEbwU19U
   ye10OUkimD9ql1WcL98ubWmOsQtAqDZIyyzA1Xv0X18AKgzlzQbW+WWWF
   HuEvFH6vJ85uoKWlS444v+OSON88OCkPgmIks6RFiJ5K3m0CB+kS+vR/q
   tns8xQYimybQUyhFSiuW5JRQT8Vf7UucG5Ht8XZb9hzL7Q5zA8zhY8Eks
   w==;
X-CSE-ConnectionGUID: JQE4oT2uTBi0FV5q8XYxeQ==
X-CSE-MsgGUID: C3gRAiFuRwqvKgPqrR5AZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89720658"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89720658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:19:03 -0700
X-CSE-ConnectionGUID: jZ3WqL8hRNGAEGg+mDztTQ==
X-CSE-MsgGUID: Hv8KWEmpQ6KDq95H2ss1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269421546"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2026 12:19:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6YgE-000000004z7-1IiK;
	Tue, 15 Sep 2026 19:18:58 +0000
Date: Wed, 16 Sep 2026 03:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/pkvm.c:756:5: sparse: sparse: symbol
 'pkvm_enable_smc_forwarding' was not declared. Should it be static?
Message-ID: <202609160309.aT2vP7ne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [1/1] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260916/202609160309.aT2vP7ne-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160309.aT2vP7ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160309.aT2vP7ne-lkp@intel.com/

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
