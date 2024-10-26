Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB061C3301
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938121; cv=none; b=iGPeyDfpDF3hgzB0lPlRAtwTzSB/LziluJC+IvQDD3HriwyzH1V2emKRizKB5PIPNwGOeh2wf98s+9/fVqSZL4Fv27242pyV+zhX/LwU15AlLoVVrdtSbBPx+4g/RI2S60fcPnlXK+W9emSzgQArAM/JL6X4W9Gu3SE0i7jDPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938121; c=relaxed/simple;
	bh=SUzBJK79AHR2cjSGMb3xWgSVxOHXcVa8Vo5kebLEybc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxbtGn9iJar2l4sryQS1y/qH7UToPvT4rOzhJHcSmkkDjsjae5u8k1lWarQ3yoC4zRAjla8DkjFvRRwZ0iQuWHj0zhwEdf9ZByMRDEYZAsOwJLT5gLpiFWN6PbPpaEJg+vVl3z6VC7nbGZ1CF9bJZIj3TIfxiWIEXcc+CgucuIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpQo5qbO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpQo5qbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729938118; x=1761474118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SUzBJK79AHR2cjSGMb3xWgSVxOHXcVa8Vo5kebLEybc=;
  b=SpQo5qbO15BhQ1EMO0lp9ST/CKZctQLM8T4SC6H4RqQLQ5ajrw1A3ULE
   wzZoAQpoHMO+5MwcIQne1O8AdEg2+6vAU7A4u9IdOiLBcv86cw1gXNMmI
   WdjyL1gkn0oRSmat8wDqtmrbaMxUtpFOGWhJKJ7XS1E72bcYL87AEUIRf
   R1zjCCalaEA/PXpl+quiQDmuE509PE6hsrsghwFdBy1M3WLBYA5SCwaQ2
   MDXmIbjrPdBadCGnAVfjvPae98C9gC8DgVkJ2Ih6I8aEtfZEbIsPV6qwg
   FQ9OO+g8PUoXErNePz0NKyGc9aa3rhCycmkNLlQKTVJwx3V0kh5bX7+nD
   A==;
X-CSE-ConnectionGUID: d4KUCNkCSbSvwB0nRoYFMA==
X-CSE-MsgGUID: +cIOIwgaSl6ASa81uWfP+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29717981"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="29717981"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:21:57 -0700
X-CSE-ConnectionGUID: gX5V6LsXSy+wBzzpqlYQCQ==
X-CSE-MsgGUID: 5g3aIFboS7GJJglPjRrObA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81192757"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2024 03:21:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4dve-000ZVY-1W;
	Sat, 26 Oct 2024 10:21:54 +0000
Date: Sat, 26 Oct 2024 18:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>
Subject: [avpatel:riscv_sbi_nested_v2 35/40] arch/riscv/kvm/nacl.c:28:21:
 sparse: sparse: cast to restricted __le64
Message-ID: <202410261821.Hp8PKu2Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v2
head:   7a05f36363ea749eae162c351c3c177cdbb390d2
commit: 321072f310c7ec9488f25f1743a9faed45b36c16 [35/40] RISC-V: KVM: Add common nested acceleration support
config: riscv-randconfig-r113-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261821.Hp8PKu2Z-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410261821.Hp8PKu2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261821.Hp8PKu2Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/nacl.c:28:21: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/nacl.c:46:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/nacl.c:46:15: sparse:     expected unsigned long
   arch/riscv/kvm/nacl.c:46:15: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/nacl.c:48:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/nacl.c:48:15: sparse:     expected unsigned long
   arch/riscv/kvm/nacl.c:48:15: sparse:     got restricted __le64 [usertype]
   arch/riscv/kvm/nacl.c:50:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/nacl.c:50:15: sparse:     expected unsigned long
   arch/riscv/kvm/nacl.c:50:15: sparse:     got restricted __le64 [usertype]

vim +28 arch/riscv/kvm/nacl.c

    16	
    17	void __kvm_riscv_nacl_hfence(void *shmem,
    18				     unsigned long control,
    19				     unsigned long page_num,
    20				     unsigned long page_count)
    21	{
    22		int i, ent = -1, try_count = 5;
    23		unsigned long *entp;
    24	
    25	again:
    26		for (i = 0; i < SBI_NACL_SHMEM_HFENCE_ENTRY_MAX; i++) {
    27			entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
  > 28			if (lelong_to_cpu(*entp) & SBI_NACL_SHMEM_HFENCE_CONFIG_PEND)
    29				continue;
    30	
    31			ent = i;
    32			break;
    33		}
    34	
    35		if (ent < 0) {
    36			if (try_count) {
    37				nacl_sync_hfence(-1UL);
    38				goto again;
    39			} else {
    40				pr_warn("KVM: No free entry in NACL shared memory\n");
    41				return;
    42			}
    43		}
    44	
    45		entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
  > 46		*entp = cpu_to_lelong(control);
    47		entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(i);
    48		*entp = cpu_to_lelong(page_num);
    49		entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(i);
    50		*entp = cpu_to_lelong(page_count);
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
