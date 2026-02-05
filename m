Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E07258CD0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326134; cv=none; b=KPjvPVzu+SZh1slGRp4rcS0Cr1hEN5v0+N/uXffKozRsVFou7XjeZ+g6oDNBZPJJcYUo1D546FhVh/0c7wxIxIbOdsSc9If6PlZ3C1XOA39MbKTSyhRvdpvARRxuao7bKux6C+EumrBi7THk6z68igahHG6j4QflnYCk+KGLWi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326134; c=relaxed/simple;
	bh=WyWN1XtCgIX2L3Hbw4IoK/UpK6RaziII8yWbHp6orA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E27NOpX0uDtRY4M6LSHXbGdwUZFpiFOz7gvJsnyIrZpHHs/3S1d9Hf5R7/znmcSRzgd3H+pxv/bBfJ/CpF8h6DH768+LSsdkZ4MKn0DBMpPJ74L57Pj+zMzciJLDmbugFBI4DDDpFG0YNGTxFQrgA88Ur4avO8mcQF3WTrZFsy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dg5CccSF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg5CccSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770326134; x=1801862134;
  h=date:from:to:cc:subject:message-id;
  bh=WyWN1XtCgIX2L3Hbw4IoK/UpK6RaziII8yWbHp6orA0=;
  b=dg5CccSFMbBz0llsswNO7ItG7oY8MFAVGSDrVdOE2MtboDOzwFIqmDkL
   IlaNAyA9zDry5RFCHK4yQrQuKaERqU8c0kUaAh0OWFxCSG1QeyVjSLx3J
   oDd0Y/lYzk0gC6lYs0kOnw+qrqay++Eh57SF8YTjhG9mTRHBBhqpPgneg
   vhYNI8cTNZXhofeG55qd6h1Lu6w/norZ6WO9fy/UgctUb6Alob39WyWhH
   QOYdkveyduC4+zWGyY0O39IuogPTb6n9C6g5/QuvNjZ79mpculRrY2BQA
   R2PyZeBo1K2KStCex11wS///XX6YhFt5ckuFYh1hs8+X2Ga3bcshpae7U
   A==;
X-CSE-ConnectionGUID: 5V+LdC6VSWmLs4H/r7GxnA==
X-CSE-MsgGUID: P3yPP2nsSWGie0P6HO4J+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="74135954"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="74135954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 13:15:33 -0800
X-CSE-ConnectionGUID: S1mKv9DkSlm6PpT42rXRPg==
X-CSE-MsgGUID: Vw+XDBwNQVCFaOzvk98eHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="241233282"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2026 13:15:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo6hF-00000000kDQ-41cP;
	Thu, 05 Feb 2026 21:15:29 +0000
Date: Fri, 06 Feb 2026 05:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:238:1: sparse: sparse: symbol 'vm_table_lock'
 was not declared. Should it be static?
Message-ID: <202602060552.R9rtCNB0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   876b4b17abb486d9dc2805798495e0fccbde8d29
commit: 71a9fd9aad9776fed5877c6f50633b92cc6193fe [1/1] ANDROID: KVM: arm64: Handle guest FF-A share/lend/reclaim
config: arm64-randconfig-r134-20260205 (https://download.01.org/0day-ci/archive/20260206/202602060552.R9rtCNB0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060552.R9rtCNB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060552.R9rtCNB0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:238:1: sparse: sparse: symbol 'vm_table_lock' was not declared. Should it be static?

vim +/vm_table_lock +238 arch/arm64/kvm/hyp/nvhe/pkvm.c

a1ec5c70d3f63d Fuad Tabba  2022-11-10  236  
4f1b201bef3e4d Will Deacon 2023-06-30  237  /* Rwlock for protecting state related to the VM table. */
4f1b201bef3e4d Will Deacon 2023-06-30 @238  DEFINE_HYP_RWLOCK(vm_table_lock);
a1ec5c70d3f63d Fuad Tabba  2022-11-10  239  

:::::: The code at line 238 was first introduced by commit
:::::: 4f1b201bef3e4dbb6be6e30fb7f74ca90a0545fb ANDROID: KVM: arm64: Convert pKVM 'vm_table_lock' to an rwlock

:::::: TO: Will Deacon <willdeacon@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
