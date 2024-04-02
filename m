Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6059B12DDBE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712091860; cv=none; b=Pm05luhZgbbTLZWc0bZpKOOhKGRanDWtUXj6CN+0DJMGvDerJctonGwhzmhwTA1qzZw5PRhf10qyZhrx1/krSICbbpCjI47xRjQcAGLSme5OS0r/ps82kdu4C/bbdpLkpLD5gLvGbae57aGMZt1tHoCltBsPAJeNIFoXCYM46ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712091860; c=relaxed/simple;
	bh=xoI6KYFIWNf2CuXENl82pk8BGXc8PkPolRmppFw3VWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKaF8H7dMFFszsAGFLc9nuhH5HMECWvrkplxKE02lxbJQZkw6T8KwyRiVxvhtWj8j/S0fbHZcsNPvESRlwmj6c0WCsylt5M6vt0r4cP3OT9esxdpx34pQ2uJqYH7VtYkCiwvDo2bDzUENRMbJLF23jfuT34kps49kvCizkNFbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ytz6CV0G; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ytz6CV0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712091858; x=1743627858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xoI6KYFIWNf2CuXENl82pk8BGXc8PkPolRmppFw3VWM=;
  b=Ytz6CV0GO2PmBtfZstDIBBx56y3t0g+MmILJ+InUkWjZcU9w9ajYBYfF
   ZcoqeCdMHvndcvRZCmrxeTqtwqZQKTsu68YZuWC9PHZ6Jb1csn093WAPw
   eH+7r7kqCj3kk2lmqKE0KlSc0ujsSOU+C+og8hjgGaMLUMHyhVQ+IWvna
   ExrPut4Fy0cTuL+PX2jsC7P79YskuSHvgAgw0ZrAJG0P3Jmc7K/aeNks3
   9gnp9d5nHY1SYO7vPSazS+KJu7voM9w//SmmCuF3sjZZDV5LJ9ggO01Pg
   zITL2cw6IMjxR92hY2IFmxv8zFxXmvdbTFo7cPNrhfrHQCRMgnnLSFYYS
   Q==;
X-CSE-ConnectionGUID: Bvnmt/AQQi23qIHfbZJAaQ==
X-CSE-MsgGUID: iRw/6fLISdGiMXgm/xMEeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11070699"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="11070699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 14:04:17 -0700
X-CSE-ConnectionGUID: nZlLiumYQdelhiyRj7/BWA==
X-CSE-MsgGUID: PPpzx9OWTvqw53Kw7WuFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18254672"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Apr 2024 14:04:16 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrlIk-0001Y9-0x;
	Tue, 02 Apr 2024 21:04:14 +0000
Date: Wed, 3 Apr 2024 05:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Anup Patel <anup@brainfault.org>
Subject: [atishp04:kvm_pmu_snapshot_v5 15/26] arch/riscv/kvm/vcpu_pmu.c:11:
 warning: "pr_fmt" redefined
Message-ID: <202404030420.LrYfLnBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_pmu_snapshot_v5
head:   b0e65c6b9040f92d37b78f24aab4948fd3f26bf8
commit: 77445e9905bd24241148bb9786af53c67e1a054d [15/26] RISC-V: KVM: Implement SBI PMU Snapshot feature
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240403/202404030420.LrYfLnBP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030420.LrYfLnBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030420.LrYfLnBP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_pmu.c:11: warning: "pr_fmt" redefined
      11 | #define pr_fmt(fmt)     "riscv-kvm-pmu: " fmt
         | 
   In file included from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from arch/riscv/include/asm/sbi.h:11,
                    from arch/riscv/kvm/vcpu_pmu.c:9:
   include/linux/printk.h:347: note: this is the location of the previous definition
     347 | #define pr_fmt(fmt) fmt
         | 


vim +/pr_fmt +11 arch/riscv/kvm/vcpu_pmu.c

8f0153ecd3bf18 Atish Patra 2023-02-07 @11  #define pr_fmt(fmt)	"riscv-kvm-pmu: " fmt
8f0153ecd3bf18 Atish Patra 2023-02-07  12  #include <linux/errno.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  13  #include <linux/err.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  14  #include <linux/kvm_host.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  15  #include <linux/perf/riscv_pmu.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  16  #include <asm/csr.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  17  #include <asm/kvm_vcpu_sbi.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  18  #include <asm/kvm_vcpu_pmu.h>
0cb74b65d2e5e6 Atish Patra 2023-02-07  19  #include <linux/bitops.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  20  

:::::: The code at line 11 was first introduced by commit
:::::: 8f0153ecd3bf184bc06afca25b737c707fa4d765 RISC-V: KVM: Add skeleton support for perf

:::::: TO: Atish Patra <atishp@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
