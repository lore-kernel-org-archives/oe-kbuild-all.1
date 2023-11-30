Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871E59147
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7Q3Iftv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701368133; x=1732904133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92ekBP8kDy2ZeyveWjxGtTPg7X8DWDACEYK5Q4vRGhQ=;
  b=h7Q3IftvDKiC2YQx6Vooncmqc4EYw5oq+mVoFkN7CDZDsb46305+k+O/
   Yx5rJsB5VtJHYCtkVOr/4A27N4Hwrash7+B3BftE3tsIGd/HDXmRpVfIX
   TH6jQ2E347b3feYLXQ+BpPwnC/HprngRsVMRFeM0epqIicRsKCFC4Q1E6
   kNQ3aitbvWVvvyw6vFE7p7u6C8bO5/ZaAmo/FSolwFeZ2MkoCsfvuo9RR
   UJNrWYumPfEmmTImy5rWUj9DRyhPwl9QmN+3spDauQQuIXQlA4JSEO1Qu
   VvF9qX7bpXcQhO62xf+c7hxONDyhIn90n5JtYEz9qlCtUdbr4+D6gt76B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="392236063"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="392236063"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="10867033"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2023 10:15:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8lZQ-0002XQ-38;
	Thu, 30 Nov 2023 18:15:28 +0000
Date: Fri, 1 Dec 2023 02:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 57/61] arch/riscv/kvm/nacl.c:28:21:
 sparse: sparse: cast to restricted __le64
Message-ID: <202312010214.EtCZH1Oh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   23b4d8596c1b6a096138dd87e29e6c6f25175dbf
commit: efc276d1bc8963114ffe55d50ee93870598e90fc [57/61] RISC-V: KVM: Add nested acceleration support
config: riscv-randconfig-r111-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010214.EtCZH1Oh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010214.EtCZH1Oh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010214.EtCZH1Oh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
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
   arch/riscv/kvm/nacl.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
    27			entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CTRL(i);
  > 28			if (lelong_to_cpu(*entp) & SBI_NACL_SHMEM_HFENCE_CTRL_PEND)
    29				continue;
    30	
    31			ent = i;
    32			break;
    33		}
    34	
    35		if (ent < 0) {
    36			if (try_count) {
    37				nacl_shmem_sync_hfence(-1UL);
    38				goto again;
    39			} else {
    40				pr_warn("KVM: No free entry in NACL shared memory\n");
    41				return;
    42			}
    43		}
    44	
    45		entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CTRL(i);
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
