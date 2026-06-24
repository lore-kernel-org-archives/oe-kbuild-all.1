Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81764
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 00:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259750; cv=none; b=juGqTfvbnMJweXTWnV2j9Czs3tY9H7m5CNcg3cEatAUI+D2NuJqjVDia0OMZHgLBYwvDwdSrk6uJT4sxfgY41Hw+2Oh1Yj+2nKREZc344AzNvfRYRZtcx2+6UwbKil+Mr5htJCUUhpxTAwS+v5vPotOfQXkrSu7WBxSLZvd3ymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259750; c=relaxed/simple;
	bh=kQ8HcrMBCPBiEyxgg2/vVmZaADqo5FP8Ponu7GsKk38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cew6bfpQeSOt/C2U9GwcMDKKSItzflusGoxme75DyvHp3+4S4R2ldPv7XtLsddeGL86EsL1Zdk8TALHxwWbsFvTtkzVuilu5va8ctGD0Uzt7x0Ck7fS/ygDJJ++6vdzadNa1zVzgrozaDyodFsDs2ZxXoBvh7bI/qS0Lw7zZyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+qJ7y6O; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+qJ7y6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782259748; x=1813795748;
  h=date:from:to:cc:subject:message-id;
  bh=kQ8HcrMBCPBiEyxgg2/vVmZaADqo5FP8Ponu7GsKk38=;
  b=L+qJ7y6OEbavFCYBoN3vgcFtIZsbNvttUKlb3tt0W+UbKbAioQKjpASZ
   8F2KZHZWV6OKTbx0YfnA7up+HhNUnt/J9S4YxEgSuY76WGfqlHPMCUY7u
   SpLWGRHuIeuJkxjf+VOEGrDBt3fnYIWMfidbLR1XybjotYyfqm8v1sr+x
   u5KLVHZnOBulvhJtdI4lOi9eY19cmkPHsggSmSgJCXqw47TZMNCa1W4A8
   L0ITwndLAHoMxDhtL5EDyLbxE8mhU7+KbgDSusnWynr7yM3xGY9xqlLTD
   i0H6UtvpZp2UwMt7cDPVnjf4u984en+fYyy32qUE5ImRxZ5bigk+mjYDl
   w==;
X-CSE-ConnectionGUID: iq7G5Iv3QYOxA4Ci0XIpOg==
X-CSE-MsgGUID: hSIc0hY2TGus6hj/dC5Mmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82121866"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82121866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 17:09:07 -0700
X-CSE-ConnectionGUID: JjAQT08SQ36Pvaj+Uwy9QQ==
X-CSE-MsgGUID: IPjm6EULQVCWr4vdiaR5DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249506286"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 17:09:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcBAt-0000000030b-1Tu7;
	Wed, 24 Jun 2026 00:09:03 +0000
Date: Wed, 24 Jun 2026 08:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:cca/temp-in-place-conversion 22/102]
 arch/arm64/kvm/rmi-exit.c:125:24: warning: variable 'index' set but not used
Message-ID: <202606240809.Rhtbtahg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git cca/temp-in-place-conversion
head:   4095e546cca85e5558a35176ef689959971f7d70
commit: f736036d78bbb34392832ec05f7a41367239f7d0 [22/102] arm64: RMI: Handle realm enter/exit
config: arm64-randconfig-004-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240809.Rhtbtahg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240809.Rhtbtahg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240809.Rhtbtahg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/rmi-exit.c:60:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      60 |         [ESR_ELx_EC_SYS64]      = rec_exit_sys_reg,
         |                                   ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/rmi-exit.c:59:27: note: previous initialization is here
      59 |         [0 ... ESR_ELx_EC_MAX]  = rec_exit_reason_notimpl,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/rmi-exit.c:61:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      61 |         [ESR_ELx_EC_DABT_LOW]   = rec_exit_sync_dabt,
         |                                   ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/rmi-exit.c:59:27: note: previous initialization is here
      59 |         [0 ... ESR_ELx_EC_MAX]  = rec_exit_reason_notimpl,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/rmi-exit.c:62:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      62 |         [ESR_ELx_EC_IABT_LOW]   = rec_exit_sync_iabt
         |                                   ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/rmi-exit.c:59:27: note: previous initialization is here
      59 |         [0 ... ESR_ELx_EC_MAX]  = rec_exit_reason_notimpl,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/rmi-exit.c:125:24: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     125 |         unsigned long status, index;
         |                               ^
   4 warnings generated.


vim +/index +125 arch/arm64/kvm/rmi-exit.c

   116	
   117	/*
   118	 * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
   119	 * proper exit to userspace.
   120	 */
   121	int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
   122	{
   123		struct realm_rec *rec = &vcpu->arch.rec;
   124		u8 esr_ec = ESR_ELx_EC(rec->run->exit.esr);
 > 125		unsigned long status, index;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
