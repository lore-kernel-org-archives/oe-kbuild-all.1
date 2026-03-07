Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0201231A41
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889439; cv=none; b=eX/Q9dXK+kM+XbXYixUJx0tpAU0izHA+OJcWZq7xZMysa++OfRYLh34Lwpeu0SUu61Ibilsy4MWiwb6AwBcR0ZYF5B+ugjXvwYnoTH1AxjrJyIlJ4uLRcF2+ePlVrcNSh+R7wcjvvfRj7Ugn7hzI1K80dibXWmflGhzBuUinSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889439; c=relaxed/simple;
	bh=S13CgRJTkXnw3cJQKEk0oeOkqtIuT+nQDl2TRxGHPJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DgYJiDxU3mEyAKklCiEr4Zs0gEIuALzwYjYc82Cie3mT+YgG/snhGsadlZYhHH5XEBbwi305+Pp/rFEttbosDyV+PVQDN/on3724GiOW6yurySu6B/LS+33GPTo9ABt2oUZeC9FgPa9t7VZbm7yrlt8Qp/tb/dG79La2PCZDIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUtQ57SJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUtQ57SJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772889438; x=1804425438;
  h=date:from:to:cc:subject:message-id;
  bh=S13CgRJTkXnw3cJQKEk0oeOkqtIuT+nQDl2TRxGHPJI=;
  b=iUtQ57SJboSj7gQtRixIzlcMe7rZ9flIRKe1/Vfo/1iDcuE1co+HDpBl
   s6itNXzuScbkJk605KYh1FBiGxZyYPkV4o6YvY7NKZSGNYQMgKqd54N4j
   978UNJdhUaC0GRPF0dqRFhGIkrTxGuUP4Dzrq/uB0uV02yDLmsrU7qWGR
   0JpizzOS6NHaxQ4KBWIwsmNz6AoK206HQLdomUs5YRb+Coy+inv8+qaCq
   d0IhA5AQVTNarZHYHlaMNJZUWG2ETfcBe6YQkLwKTdy1TgazVeM4cfrrC
   iMNHOPEFyuLzFqtJMneHDFvVJzx1mFQqOAw8pjJcB15tyhGLatJmlh3vJ
   A==;
X-CSE-ConnectionGUID: NXrWUUZBS0GLflnFPQudFQ==
X-CSE-MsgGUID: bjP7wl/6Qwec3tL24G8zcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74055176"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="74055176"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 05:17:17 -0800
X-CSE-ConnectionGUID: jvwLw3XJQJOI41QTr4meqA==
X-CSE-MsgGUID: xtDxDrGjQK6aNfy4D1uGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223971432"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2026 05:17:16 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyrWr-0000000021A-2x7K;
	Sat, 07 Mar 2026 13:17:13 +0000
Date: Sat, 07 Mar 2026 21:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 212/212]
 arch/arm64/kvm/hyp/nvhe/setup.c:19:27: sparse: sparse: symbol
 'pkvm_pgtable_mm_ops' was not declared. Should it be static?
Message-ID: <202603072101.hjETD63U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   bb2ec6c2bb3c364e30471f039815e0ba4935608b
commit: ae1ed8a984395ff05728ea212fde0abb93d95864 [212/212] FROMLIST: KVM: arm64: Prepare the creation of s1 mappings at EL2
config: arm64-randconfig-r131-20260307 (https://download.01.org/0day-ci/archive/20260307/202603072101.hjETD63U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603072101.hjETD63U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603072101.hjETD63U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/setup.c:19:27: sparse: sparse: symbol 'pkvm_pgtable_mm_ops' was not declared. Should it be static?

vim +/pkvm_pgtable_mm_ops +19 arch/arm64/kvm/hyp/nvhe/setup.c

    17	
    18	struct hyp_pool hpool;
  > 19	struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
    20	unsigned long hyp_nr_cpus;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
