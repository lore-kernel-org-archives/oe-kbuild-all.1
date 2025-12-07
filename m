Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C251FC8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765065852; cv=none; b=GOfiIuPo0uPDbYB9JxOO2RAXCkc41vBV9It825O8Lzx786fJe0TofIA6fpWg2ASlx/0YGbpfCl+4/mzky6fjmWidR8fYgXoA6EY8lKYxsELpBT0Z78Pklh4IPUmb60Gbhz05rDmn96s8WFuPyHYGbwM3rTlNl4a/eRKhONyQXK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765065852; c=relaxed/simple;
	bh=LvIA3kTvxWWwSfFC1PQVTDISe1mHFyP+IPsL+wK7h5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVjyVydyoRaVkgXiSrqo8bbnEkMGCZNBbnjzoKSq+3ChphHg4p6ylnVJlhYpEB9pO5lKRURQug7cL1Qsf4d+p+b329Gmi6rCpMQ3cICxbS60ZbYRYwA8woLozXEbjPbOJF/7BKoPeNz+S0ffwLCAywrZWFZJYHh+R5G0Pmhsa0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sx8yPLKt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sx8yPLKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765065851; x=1796601851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvIA3kTvxWWwSfFC1PQVTDISe1mHFyP+IPsL+wK7h5g=;
  b=Sx8yPLKtcCSQYuLj0yjey9aftBu6WR+ZLnxbLrOCWlYMbfQNKs5DFe6V
   Kz6zioqKlEBp19q/5cgvjEpn0IyE4wIBCXIbIMY4wGGaMHa9YeSNHCRbR
   yRv2uDgFlU1LKNiKPd4wlnOooKrD++W7uV8hGWVXjfO7gehJU4pyQjSJn
   jyJcpdq7j/jpaQoG2govpksAaLKHJHK0HAh5A42B1iFW0p3rnj8+C3992
   nBxpqSj6O3BQ74QX6zuTIQzQ7zBwosRyq10s8s9Tts/f/o5pQeBGL8+KT
   23qm4sIH3O/EhwAkap8673oYcWvsxJUt7AEVUe7f+j4tAqCwi9oF/I+SM
   g==;
X-CSE-ConnectionGUID: eiaQG10eRDO7DHlrSPxvlQ==
X-CSE-MsgGUID: jCGEf2RwRrSzhpDOncwbrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66944694"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="66944694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 16:04:10 -0800
X-CSE-ConnectionGUID: Uign+NePTyKRZxSVGWyGDA==
X-CSE-MsgGUID: p9aX8CRPQ2i2knG0gmpxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226261227"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 16:04:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS2Fy-00000000Ipx-0vWD;
	Sun, 07 Dec 2025 00:04:06 +0000
Date: Sun, 7 Dec 2025 08:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482]
 arch/arm64/kernel/virtcca_cvm_guest.c:77:16: sparse: sparse: symbol
 'cvm_spin_cpumask' was not declared. Should it be static?
Message-ID: <202512070750.e8G4R9UF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: da1164d1b52edbba7cf637423e626b0647388b23 [3482/3482] Add IPI direct inject method for virtCCA CVM.
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251207/202512070750.e8G4R9UF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070750.e8G4R9UF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070750.e8G4R9UF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/virtcca_cvm_guest.c:23:1: sparse: sparse: symbol 'cvm_tsi_present' was not declared. Should it be static?
>> arch/arm64/kernel/virtcca_cvm_guest.c:77:16: sparse: sparse: symbol 'cvm_spin_cpumask' was not declared. Should it be static?
   arch/arm64/kernel/virtcca_cvm_guest.c:87:16: sparse: sparse: context imbalance in 'soft_ipi_passthrough_store' - wrong count at exit

vim +/cvm_spin_cpumask +77 arch/arm64/kernel/virtcca_cvm_guest.c

    76	
  > 77	struct cpumask cvm_spin_cpumask;
    78	static DEFINE_SPINLOCK(ipi_passthrough_lock);
    79	DEFINE_PER_CPU(unsigned int, virtcca_unpark_idle_notify);
    80	DEFINE_PER_CPU(unsigned int, virtcca_park_idle_state);
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
