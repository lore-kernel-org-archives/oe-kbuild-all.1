Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C890223E74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611832; cv=none; b=gd6SJhvtDgWrvA9sHx0w5EhB5wOhwQHGNb5XRYJwvWhVgFRI6Jc/8YbZ6Jb/HRF9xtgPf4wJ8pi9Um+hyR0sYCZbXXL8R3Gm7tZVx2chJsT+eDmEq4VVlifPAuwdmM+41uLp7BiFVEq7Ia7C0CjV0eV9wLXhBHzORbBdwmjgg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611832; c=relaxed/simple;
	bh=CeWEo6MYbEtx1WO0EP/TssOhD9/W9wBif5P96FRc6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jrmfAmqWlW+fYZPybsiDYUkrFrcRrivig+uS3WQvLzE4RdB8JKY9oHQfrUqZ5b9GaTHDMEALMlEG3nsTw95xCK6GImuAtQ0Xqu4msCF7wo1PKZY/bT72py12ycH4EROsxLWE3c45Kdl38DY9Gdbq2vgRaHw7Wr6Qgy1VHVKrBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvUL4hzj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvUL4hzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734611830; x=1766147830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeWEo6MYbEtx1WO0EP/TssOhD9/W9wBif5P96FRc6lk=;
  b=ZvUL4hzjh2YOy86Z3tSI8fjwWjz5kzadZ1GaFAWT6qln05UkA43Gwq5t
   IygH8I4nuyJFcOdc+1ElXNcfpQLnj90x23pgoPPC/0YyCvAJVG+P9djkD
   svdoHPhnmYEiTwHb9IFTw/MZGzk8IRTQQjW7Xg0QBRq9dRJM5Nb5+yMOf
   5tPOsG6mapcX8QEk3j+AcHwFH+QoRjfSQpct109sjsnqQIqBrwOKUsO6+
   u/sScaVNMs9sGEmP4r0Vkz76+AJskn0j2HQxBiLz5Xigv3sgRj8p1ohK7
   hN6dNAyNWtin8wFU7VNCIuKgB8lA1gitgkmfyGCY6st5rPTXuWaYOxkLP
   g==;
X-CSE-ConnectionGUID: LdbYPBDuR7y4Lfw94V8p6A==
X-CSE-MsgGUID: eM+MQh4NRwON9hIZfUFTtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35334581"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35334581"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:37:10 -0800
X-CSE-ConnectionGUID: wNNc0XicROekRE3F1T+w2g==
X-CSE-MsgGUID: EAwR4hOeRsqgA/bc2DhStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="97975258"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2024 04:37:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOFm6-0000Et-2A;
	Thu, 19 Dec 2024 12:37:06 +0000
Date: Thu, 19 Dec 2024 20:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: arch/riscv/kvm/vcpu_timer.c:75:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202412192017.t0ZPK7sM-lkp@intel.com>
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
commit: e28e6b69767b3aea73eda0fd3e7b4e1c15a7ebec RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
date:   7 weeks ago
config: riscv-randconfig-r113-20241219 (https://download.01.org/0day-ci/archive/20241219/202412192017.t0ZPK7sM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241219/202412192017.t0ZPK7sM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412192017.t0ZPK7sM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_timer.c:75:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:75:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:75:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_timer.c:76:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:76:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:76:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_timer.c:292:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:292:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:292:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_timer.c:293:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:293:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:293:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_timer.c:309:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:309:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:309:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu_timer.c:310:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu_timer.c:310:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_timer.c:310:9: sparse:     got restricted __le32 [usertype]
>> arch/riscv/kvm/vcpu_timer.c:330:26: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu_timer.c:331:32: sparse: sparse: cast to restricted __le32
--
>> arch/riscv/kvm/mmu.c:735:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/mmu.c:735:9: sparse:     expected unsigned long
   arch/riscv/kvm/mmu.c:735:9: sparse:     got restricted __le32 [usertype]
--
   arch/riscv/kvm/vcpu.c:27:49: sparse: sparse: array of flexible structures
   arch/riscv/kvm/vcpu.c: note: in included file:
   include/linux/kvm_host.h:2033:56: sparse: sparse: array of flexible structures
>> arch/riscv/kvm/vcpu.c:371:21: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:374:16: sparse: sparse: cast to restricted __le32
>> arch/riscv/kvm/vcpu.c:577:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:577:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:577:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:578:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:578:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:578:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:579:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:579:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:579:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:580:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:580:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:580:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:581:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:581:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:581:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:582:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:582:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:582:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:583:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:583:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:583:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:584:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:584:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:584:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:585:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:585:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:585:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:586:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:586:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:586:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:587:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:587:17: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:587:17: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:589:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:589:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:589:25: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:591:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:591:25: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:591:25: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:593:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:593:33: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:593:33: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:654:33: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:655:29: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:656:31: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:657:34: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:658:30: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:659:32: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:660:31: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:661:29: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:662:30: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:728:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:728:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:728:9: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:775:26: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:775:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/riscv/kvm/vcpu.c:775:26: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu.c:775:26: sparse:     got restricted __le32 [usertype]
   arch/riscv/kvm/vcpu.c:912:30: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c:913:31: sparse: sparse: cast to restricted __le32
   arch/riscv/kvm/vcpu.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:320:9: sparse: sparse: context imbalance in 'kvm_riscv_check_vcpu_requests' - unexpected unlock

vim +75 arch/riscv/kvm/vcpu_timer.c

    71	
    72	static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
    73	{
    74	#if defined(CONFIG_32BIT)
  > 75		ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
    76		ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
    77	#else
    78		ncsr_write(CSR_VSTIMECMP, ncycles);
    79	#endif
    80		return 0;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
