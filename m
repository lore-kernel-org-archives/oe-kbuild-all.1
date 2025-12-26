Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3CBA59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766757934; cv=none; b=Q3/DBFIH/UuznQVTsTguShPtaK8d0X90gEMj0qw8tO1kyXff55lTPlW4xROwvSpXUR3fvwPLQlznp0GWgWSkyAejsEozxDp+nE5dAaQQIj4s9XD3CnZHyZdDWi+k564puOFhSYXovm+tmpjnrKFPpw4nottg7yf9n+/mVkBF0sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766757934; c=relaxed/simple;
	bh=Vn4ote5SeO2R3mRN/GqSGuchDfe7giVhWP+FklhxDko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZMmnNzOlUeonmVC7RDdE7SoTajj+nfreJF9N0EUKgVWrSpuAt+c2umJPva8kfeeLwj2dpepfaJXusnDCBb4d2RJM23TNpo/ijFkbRdj7k6gAuhqU9QzjmcwTARrmU90e8eR6TxyTc+cPgRKuaPU8YSRjGLQsLTbXr3mj1fJqq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1wFU34O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1wFU34O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766757932; x=1798293932;
  h=date:from:to:cc:subject:message-id;
  bh=Vn4ote5SeO2R3mRN/GqSGuchDfe7giVhWP+FklhxDko=;
  b=R1wFU34OyXgrRSXv8g9n3iEp5R55jynEFskNRqeyCeQ8pvmDf1HdZbJq
   hiURieBjEt3h8/oWhtxVczu3V5gFVXjHsnu3kuWRxUMjQHrphiHFhhIXe
   j5sB8aE7ZE2UJU50DzWG7FA2m7a8pEu8KDaluJmXSowHr/G5jdUIaDL5L
   j/Z4c2zqIfl4ih2nFFt3zJpk+YuqgGjTvy2w+syAA1bVwdJe0YtvrX/lU
   BcesCI/Ckh+gPkjVVSliRwb8qMwwRmMF3W+xMgPAizQwMuxNfX/kLZ/dM
   eLqCy7N4eFqmi6SeWBRxfemB0h2cTu9t8+7155jq5psYE5D6+32jdmCIA
   g==;
X-CSE-ConnectionGUID: gTLHfR+JS/ujOkm7ZZta/w==
X-CSE-MsgGUID: mz63nAx4QNaVBfhVu33gQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72367598"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="72367598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 06:05:31 -0800
X-CSE-ConnectionGUID: 8VkTb0TITneTVWX6CdwLnw==
X-CSE-MsgGUID: 8hR+DmEtQYeVFXb0Ru8uzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="223872708"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Dec 2025 06:05:30 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ8Rc-0000000054b-0mOk;
	Fri, 26 Dec 2025 14:05:28 +0000
Date: Fri, 26 Dec 2025 22:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for
 function '__pkvm_register_guest_smc_handler'
Message-ID: <202512262250.aGiBTwKV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   30a5c216991a5dd3eed018653101c71e1e657af8
commit: 340ef6cb4081cb305235a059f1c142345ac1a71d [2/2] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251226/202512262250.aGiBTwKV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512262250.aGiBTwKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512262250.aGiBTwKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for function '__pkvm_register_guest_smc_handler' [-Wmissing-prototypes]
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         |     ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         | ^
         | static 
   1 warning generated.


vim +/__pkvm_register_guest_smc_handler +1725 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1724	
> 1725	int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
  1726							 struct arm_smccc_res *res,
  1727							 pkvm_handle_t handle),
  1728					      pkvm_handle_t handle)
  1729	{
  1730		int ret = -EINVAL;
  1731		struct pkvm_hyp_vm *vm;
  1732	
  1733		if (!cb)
  1734			return ret;
  1735	
  1736		hyp_read_lock(&vm_table_lock);
  1737		vm = get_vm_by_handle(handle);
  1738		if (vm)
  1739			ret = cmpxchg_release(&vm->smc_handler, NULL, cb) ? -EBUSY : 0;
  1740		hyp_read_unlock(&vm_table_lock);
  1741	
  1742		return ret;
  1743	}
  1744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
