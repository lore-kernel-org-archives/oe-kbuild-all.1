Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32261C7B6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 22:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724194441; cv=none; b=NCZOZO/zQ/hrmXGKV9YXzgSUOuel1G6PBgaG+WaogOrjJpuzvN2f8U+LzF2pVJ5NljB9IiLwuyRvncNCMML1clWLaHY2ebcnCGr9clynDZ3ViH5/TaQxsXhM2ja724z1RYTRnGlKkwG4FYH8gb0yLq36LiqdapoKbzFWcZ59N8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724194441; c=relaxed/simple;
	bh=uBaCGDwwmgG9IaXB2LaIOu0Fr6UJnj9KRx4hhiQOq2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5wMCxH2wusGifjn0DfLIJ7111Xn2hf1D+hccYlYK1whHeNuX3eV6C+S+YhD4pR/aGcK5I6xEeXdxNqJLfJ3y9zx7j/PQAwl4HONPQDWf/Y3CiU08R9D1nDK7p+2JdqE4iodIhjSVu8jrolwgf1b//15+VUYCF5U8Zc2FImafxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpYLCv49; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpYLCv49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724194440; x=1755730440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBaCGDwwmgG9IaXB2LaIOu0Fr6UJnj9KRx4hhiQOq2w=;
  b=GpYLCv49G20lTsoV5EKz503x/7LhwzNgLTZBqTOPzIFdXf7gnArpI2oW
   kU188reYMlQSob5ML2VvClsblV9/kmldIO568zCtourWLrbLZNeaVf2tZ
   AAbfWZDuuBHzB/+zC8ts8rScUjC0n6Au0bg72rMk0pqQgCXVGdQ08u8w1
   yF4vyl3Ohwy8DYpJQNRtxWmsJfK6ob8tdsfObsgCOi1jJbJCAePvDV2zW
   VCETLpf2Ucu5CO8G1kjjwGE/6aN1+3ZnQqW+dOcrYXRd5nD3jBjg9bhus
   8NCojAm2K97H/ivfdDXhMUD85Psp5lcoHv2MDGDmwKZX3C8e5lfnFr8nq
   Q==;
X-CSE-ConnectionGUID: WqaISO0gRPaSOt5R4hBlkw==
X-CSE-MsgGUID: /LaYrU35S0S8A6jwyBGzfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13121036"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="13121036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:53:59 -0700
X-CSE-ConnectionGUID: oiq2C9lxQKGYohISpjvbKg==
X-CSE-MsgGUID: rnTtVfj1TymodvHprF8QGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60593719"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 15:53:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgXje-000Afa-0V;
	Tue, 20 Aug 2024 22:53:54 +0000
Date: Wed, 21 Aug 2024 06:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9912/9936]
 arch/x86/events/zhaoxin/uncore.c:2835:6: warning: no previous prototype for
 function 'kx7000_uncore_cpu_init'
Message-ID: <202408210626.fANFhG8u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   304e0163925d5bb281ad9846c091c122b6cc42a9
commit: 008053bcdeaad929fa3f96b75eee49da15ab0a04 [9912/9936] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240821/202408210626.fANFhG8u-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210626.fANFhG8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210626.fANFhG8u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/zhaoxin/uncore.c:2805:6: warning: no previous prototype for function 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2805 | void kx5000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2805 | void kx5000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2814:6: warning: no previous prototype for function 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2814 | void kh40000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2814:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2814 | void kh40000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2819:5: warning: no previous prototype for function 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2819 | int kh40000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2819:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2819 | int kh40000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2835:6: warning: no previous prototype for function 'kx7000_uncore_cpu_init' [-Wmissing-prototypes]
    2835 | void kx7000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2835:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2835 | void kx7000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2850:5: warning: no previous prototype for function 'kx7000_uncore_pci_init' [-Wmissing-prototypes]
    2850 | int kx7000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2850:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2850 | int kx7000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2858:6: warning: no previous prototype for function 'kx7000_uncore_mmio_init' [-Wmissing-prototypes]
    2858 | void kx7000_uncore_mmio_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2858:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2858 | void kx7000_uncore_mmio_init(void)
         | ^
         | static 
   6 warnings generated.


vim +/kx7000_uncore_cpu_init +2835 arch/x86/events/zhaoxin/uncore.c

  2834	
> 2835	void kx7000_uncore_cpu_init(void)
  2836	{
  2837		u64 val;
  2838		int cpu;
  2839	
  2840		uncore_msr_uncores = kx7000_msr_uncores;
  2841	
  2842		/* clear bit 16 of MSR 0x1877 so that HIF can work normally */
  2843		for_each_present_cpu(cpu) {
  2844			rdmsrl_on_cpu(cpu, 0x1877, &val);
  2845			val = val & 0xfffffffffffeffffULL;
  2846			wrmsrl_on_cpu(cpu, 0x1877, val);
  2847		}
  2848	}
  2849	
> 2850	int kx7000_uncore_pci_init(void)
  2851	{
  2852		uncore_pci_uncores = kx7000_pci_uncores;
  2853		uncore_pci_driver = &kx7000_uncore_pci_driver;
  2854	
  2855		return 0;
  2856	}
  2857	
> 2858	void kx7000_uncore_mmio_init(void)
  2859	{
  2860		uncore_mmio_uncores = kx7000_mmio_uncores;
  2861	}
  2862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
