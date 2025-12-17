Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348936C0C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980109; cv=none; b=O3XTULcuXyt3+3j+kYobQbeCMM7Q7IRBfcooDLBq2ct/fxwiGDAwGktuFIkOpQuw8swc02e6Dcz3QRGfeAp7HdtaB2j6hG0JHIO4turlICdwIi2yGEXg6EV/H0ZkByulyFG7lXDP7Po6AJmDbmBArbu+T8PXukLf46spAjsptGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980109; c=relaxed/simple;
	bh=Au8aQ3YxAlUp0igoK50MkVXOPlsfAEcO611d7Rfplxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYgZEH4hZHqsx/Hw52fT9Y0JjcadX6sNP7KfiEAl0iYe4idmu83S1/VMfEqtP2TisTs5AfDXbx8Sgh4S9WaGvtNhOIN6Ay85Gw+jDAnMKE9Aa/jvYcF8vR8q2USVq6hZbNn9UZvFExHJFl4zXiGxOaFBZezKbaztWq4xEWLv8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlVod8sx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlVod8sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765980107; x=1797516107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Au8aQ3YxAlUp0igoK50MkVXOPlsfAEcO611d7Rfplxk=;
  b=jlVod8sxF1/2TWhnFmBYmJJanftHv/cWwGbu9CWxpeguxcpyPeEWS75s
   DznEKGH48DR8g/x89PlHmC4pXO+d/9hppCrSQv3uHxQwf19qgn3Js94UI
   ZhCEXMd2sj2Dx3hatmtCwwD8UuwEnBFhAUTtTdaxo6HNLMfIDZ0K09SDX
   KTAgdbcr/rHzHTmYh9EqJSfp8nQ+3uvYrImTDSLzu2gHj1y9gb6uBHaPF
   3onJPj+5SXlOHEycspnqu0W2Ith7pw/+Mn24QzsdNeqBKqLMh+VHIIAOg
   f6chvatkiQyqMZ+GJSf5+trcNPqTm8iIwFq5rrDTLgeCRAd7mkWtugP89
   w==;
X-CSE-ConnectionGUID: bVaIjxB7RwOxTbfFkWr6bA==
X-CSE-MsgGUID: 3iMJSD8YQlC7ZeXC0QFSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71774699"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="71774699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 06:01:45 -0800
X-CSE-ConnectionGUID: xfVv7DrnQSS2asyg5Yn5Ag==
X-CSE-MsgGUID: Oi7ypVQzR62YABFq+bP0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197578825"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Dec 2025 06:01:44 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVs61-000000000fn-32uE;
	Wed, 17 Dec 2025 14:01:41 +0000
Date: Wed, 17 Dec 2025 22:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for
 '__pkvm_register_guest_smc_handler'
Message-ID: <202512172138.1Dcw8M5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 340ef6cb4081cb305235a059f1c142345ac1a71d [0/2] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251217/202512172138.1Dcw8M5X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172138.1Dcw8M5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172138.1Dcw8M5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for '__pkvm_register_guest_smc_handler' [-Wmissing-prototypes]
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
