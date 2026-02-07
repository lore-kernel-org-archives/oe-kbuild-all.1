Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572AC31195B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470626; cv=none; b=FTVCl3qUnZZ3/2taTvLrE3rbSxVi5bCh5aKQxFUKDXrtHabirmQyg5q4cn1yubi7oQtWteNaLLlg9Nv6ItFuRAc+ZzBPDJOkcclG/X93pnBFCXCDTJtXODtesqvKUIv2L8a/jT1YYZVKifY0T2J6k3rs2diInVBNFax0ES+B4yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470626; c=relaxed/simple;
	bh=u4La8AwY6U4dTTrNXJz2JlSxGJfxVCQk1guZqI63wVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dzhBWyczcAYvYJ9oH49CvUqplAoQp9y1Bw17C+1mrAn+ISZOhp/gbHKM1YtyZdF4zTo1xHVBqu2CG0RWaa75p0Ur+TMQdAAQqRdrUsrlsHZKaHrdxo8YNjtHt3AItnry8L7QaxJQcxzHuOa2fIM0xa2VezTmoc8WAYVUcrYYhiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhqWDYvF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhqWDYvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770470626; x=1802006626;
  h=date:from:to:cc:subject:message-id;
  bh=u4La8AwY6U4dTTrNXJz2JlSxGJfxVCQk1guZqI63wVs=;
  b=MhqWDYvFJlaEPhMC7qmGc8feAdd7dsF3fpvCkq+l0302NDSxeoUFpVoC
   dblkxdymcZprgCdcUm399RTz8KNctd+5mH/9MhuK6RC+weTsbB1qAf2Iv
   bIknZkW1RFtaxEBjK5vTd7+Ya/7Nhf+MeraOuzKDKzDLmf2qh23UJvSWg
   QDu1Fhq4hRzhsTbY4VJtULDNFnO0kFs5EhK/HEjoY8SoI5cIW70IIo+Vk
   mAdiU/oGE4WXSJym6NLtPqbquf1qEHcD8ohSj5ltcU/o3uhcFlHguTDKM
   zjOc7kWUDGsJE+zJgyGtylXeoQrYjHf3PCjonGbceEKeQWb3vgqdMVU9V
   w==;
X-CSE-ConnectionGUID: 3jdXKEGXQpaOotHHOuZkEw==
X-CSE-MsgGUID: JrXHW91YSgyuYwfvmEcHAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75273535"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="75273535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:23:46 -0800
X-CSE-ConnectionGUID: wB9naAPFTr6G3brKMza2Iw==
X-CSE-MsgGUID: r8gy/hSgSkGEU9yZF9IWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="211148830"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Feb 2026 05:23:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voiHm-00000000lfE-0zGq;
	Sat, 07 Feb 2026 13:23:42 +0000
Date: Sat, 07 Feb 2026 21:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 arch/x86/kvm/vmx/pkvm/hyp/vmx.c:69:28: error: call to undeclared function
 'per_cpu_offset'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602072114.ytZ7nd0U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: ecfef3a789a7fba5c1ba6f75298fb37b41661722 [0/6] ANDROID: HACK: pkvm: x86: Setup FS_BASE with the pkvm percpu offset
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072114.ytZ7nd0U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072114.ytZ7nd0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072114.ytZ7nd0U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/pkvm/hyp/vmx.c:69:28: error: call to undeclared function 'per_cpu_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      69 |         vmcs_writel(HOST_FS_BASE, per_cpu_offset(cpu));
         |                                   ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/per_cpu_offset +69 arch/x86/kvm/vmx/pkvm/hyp/vmx.c

    14	
    15		vmcs_writel(HOST_CR0, native_read_cr0() & ~X86_CR0_TS);
    16		vmcs_writel(HOST_CR3, pcpu->cr3);
    17		vmcs_writel(HOST_CR4, native_read_cr4());
    18	
    19	#ifdef CONFIG_PKVM_INTEL_DEBUG
    20		savesegment(cs, selector);
    21		vmcs_write16(HOST_CS_SELECTOR, selector);
    22		savesegment(ss, selector);
    23		vmcs_write16(HOST_SS_SELECTOR, selector);
    24		savesegment(ds, selector);
    25		vmcs_write16(HOST_DS_SELECTOR, selector);
    26		savesegment(es, selector);
    27		vmcs_write16(HOST_ES_SELECTOR, selector);
    28		savesegment(fs, selector);
    29		vmcs_write16(HOST_FS_SELECTOR, selector);
    30		/*
    31		 * FIXME:
    32		 * GS_BASE is used by the linux host to store its own percpu offset.
    33		 * In this debug mode, linux host printk symbols are used to print logs
    34		 * which may still using the percpu. And with CONFIG_X86_64, FS_BASE
    35		 * seems not being used. To avoid breaking linux host symbols, choose to
    36		 * use FS_BASE for pKVM percpu offset instead of usng GS_BASE.
    37		 */
    38		vmcs_writel(HOST_FS_BASE, per_cpu_offset(cpu));
    39	
    40		savesegment(gs, selector);
    41		vmcs_write16(HOST_GS_SELECTOR, selector);
    42		pkvm_rdmsrl(MSR_GS_BASE, a);
    43		vmcs_writel(HOST_GS_BASE, a);
    44	
    45		vmcs_write16(HOST_TR_SELECTOR, GDT_ENTRY_TSS*8);
    46		vmcs_writel(HOST_TR_BASE, (unsigned long)&get_cpu_entry_area(cpu)->tss.x86_tss);
    47	
    48		native_store_gdt(&dt);
    49		vmcs_writel(HOST_GDTR_BASE, dt.address);
    50		vmcs_writel(HOST_IDTR_BASE, (unsigned long)(&pcpu->idt_page));
    51	
    52		pkvm_rdmsr(MSR_IA32_SYSENTER_CS, low, high);
    53		vmcs_write32(HOST_IA32_SYSENTER_CS, low);
    54	
    55		pkvm_rdmsrl(MSR_IA32_SYSENTER_ESP, a);
    56		vmcs_writel(HOST_IA32_SYSENTER_ESP, a);
    57	
    58		pkvm_rdmsrl(MSR_IA32_SYSENTER_EIP, a);
    59		vmcs_writel(HOST_IA32_SYSENTER_EIP, a);
    60	#else
    61		vmcs_write16(HOST_CS_SELECTOR, __KERNEL_CS);
    62		vmcs_write16(HOST_SS_SELECTOR, __KERNEL_DS);
    63		vmcs_write16(HOST_DS_SELECTOR, __KERNEL_DS);
    64		vmcs_write16(HOST_ES_SELECTOR, 0);
    65		vmcs_write16(HOST_TR_SELECTOR, GDT_ENTRY_TSS*8);
    66		vmcs_write16(HOST_FS_SELECTOR, 0);
    67		vmcs_write16(HOST_GS_SELECTOR, 0);
    68		/* FIXME: see the comments for HOST_FS_BASE in the above */
  > 69		vmcs_writel(HOST_FS_BASE, per_cpu_offset(cpu));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
