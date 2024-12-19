Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6E222591
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606303; cv=none; b=MLYsj1e5DE4CZfysdV52zsxVHdl8QPxRnU7ukfL+F/6nS7lh0UGauQ3yEAHXz6JEB2ZpiXpFcOfT3RjXHHOFYEaFHFn4eRRiZrbj0oTPFq2ydbfhVrmdVnPjv0ZOakB2yrTfBprM5V6HrRPzAvxeWDDEZWnOqqILJbQldo+tKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606303; c=relaxed/simple;
	bh=y8oI6Ah6nw0jO5BApoTq1xHknG509Cbu0I0yObH+5Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUvMOfdYFOHPkDvax1QszS1IARw1MqkM2Zsr0hQlQqOCBqSlKrdYiEU/LKMEDQ00NgqZ8xxZ3HNW5XhVaOxKdD9A0H1EzqDduWR3BaKeNoFFZ99G/7TANZBNCrfWG4VjUwzNJAgcIDXpAngZGFKzJMapiVygSIduML4B78GeRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Akrwg7fU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Akrwg7fU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734606302; x=1766142302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y8oI6Ah6nw0jO5BApoTq1xHknG509Cbu0I0yObH+5Xc=;
  b=Akrwg7fUOC4uddCAQ8M5FIh/dfCp/nKcThMcALG00JfUlsBU+sZiqdUF
   3UZn16zQDcCTdd+W+mmVCyKHzrSrDXZeA6BrySU+LvjWuFRNmce/W9XH0
   6tZv2/skE23ABFFKFIjoW2HJfah7J39gbbOb4+B57VfpquyKNCXJGYUDg
   Tg0Y+jAlgtRoftKV5LQhgE4VIb0r7ACEkL2vZEiH7QOsFIM/YnrfYEu0k
   uKrbm3eqPKjoDR7KNaLsWFTjJd6zsAxZAa3vv+SQT/zw3onOgwsQNJ9Uz
   8X6XyZTS3aU2PYfYWcXWuAr4AO9seund2zpP0/avrq9uqj3S/fN1L9/5p
   A==;
X-CSE-ConnectionGUID: iVTRLUKsSB+LDuS4VF7Dqg==
X-CSE-MsgGUID: /Rx2Juk1TYq6GeHMlpg0RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35140007"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35140007"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 03:05:02 -0800
X-CSE-ConnectionGUID: z1/c0spQRiytBAYDpY/AKA==
X-CSE-MsgGUID: zIZ9gnZ+QaSh1YILR3+RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103166927"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2024 03:04:59 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOEKu-0000Bw-0k;
	Thu, 19 Dec 2024 11:04:56 +0000
Date: Thu, 19 Dec 2024 19:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: arch/riscv/kvm/nacl.c:28:21: sparse: sparse: cast to restricted
 __le32
Message-ID: <202412191824.oRnRcOY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eabcdba3ad4098460a376538df2ae36500223c1e
commit: d466c19cead5904d4d5d92adb2b213b411d3b849 RISC-V: KVM: Add common nested acceleration support
date:   7 weeks ago
config: riscv-randconfig-r113-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191824.oRnRcOY5-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241219/202412191824.oRnRcOY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191824.oRnRcOY5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/nacl.c:28:21: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/nacl.c:46:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/nacl.c:46:15: sparse:     expected unsigned long
   arch/riscv/kvm/nacl.c:46:15: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/nacl.c:48:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/nacl.c:48:15: sparse:     expected unsigned long
   arch/riscv/kvm/nacl.c:48:15: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/nacl.c:50:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/nacl.c:50:15: sparse:     expected unsigned long
   arch/riscv/kvm/nacl.c:50:15: sparse:     got restricted __le32 [usertype]

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
