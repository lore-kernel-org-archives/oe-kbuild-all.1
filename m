Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21A1BD9FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730380883; cv=none; b=b0qPVkKXRMLcAHNfDj2CIXv74jzNLkWyeP0ai1W81MEVUJhcP/tajCmDBXxxNMlJCStkNkYd8MX6RhVtNCp2XZtSWY5QzFuq4cacZbbyfILCujg/QL9w/JIzaKMpy7r9Ccr3GQjSuu+30AMBGxkboSmg9QmKrNam921GIoaEfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730380883; c=relaxed/simple;
	bh=k3f0LnzdIYrnYE8B0KqE3IlH/fbVB+/yBxQLMKHKQLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLgwfJK6U8eNQXrDzrk4iNd+LuWpWyC9NTdJDBLv6tls4DS7XzCo2bjDk1ohwKkBwPdMJy7hbE8TW0Fn5bqbQhZmZaRPWfvf9jNP219mo5seyaImwWfZNwI+KwQ+4nRFNdt7jq1sLpdNS/7B+sUR2oO+9kAPvlf+Sqx6JrzOSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtkom0b0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtkom0b0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730380880; x=1761916880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k3f0LnzdIYrnYE8B0KqE3IlH/fbVB+/yBxQLMKHKQLc=;
  b=gtkom0b0gn0rrUYRmflB479KmRA93vORXjCDKtXhautloFY9mReypW5I
   BZAtBMHTAq1Mj3DS0nq+FyhJZFx3Vdw1FWEftjsYqUK9tLdfFtvzOe8iU
   R/6joQUa+vAyRgoT3dh2ajiC/4PzVbwBHsCLMoFsgcEFRvRWUMAIYPFUX
   r2uhUhoFaEBGfIhnQs3m1RQrEBwOmIhO+yLjdpVU6dsCARmoHEDehKmvX
   PyOIhyo+XA+M4iM74UBh0P0a3DCclWi0OmOxWilLN1skBd/42qjzfvuPX
   QE1Pk2Z92YwrnC2Vld3Ljob6LeICWffHF9+3xEKd3h9Yx2AbMlXijrdYB
   g==;
X-CSE-ConnectionGUID: NE2LcHfnT1+Xz9dHxGKUdQ==
X-CSE-MsgGUID: JxncP9oKRMOZUR9J1ygXwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29535040"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="29535040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 06:21:19 -0700
X-CSE-ConnectionGUID: hD1b/z0LTCmWD8ZXT5vRIQ==
X-CSE-MsgGUID: Z4xp44A8Sk2gVDF01losVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82732587"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2024 06:21:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6V6v-000g84-23;
	Thu, 31 Oct 2024 13:21:13 +0000
Date: Thu, 31 Oct 2024 21:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10809/13046]
 arch/x86/events/zhaoxin/uncore.c:2835:6: sparse: sparse: symbol
 'kx7000_uncore_cpu_init' was not declared. Should it be static?
Message-ID: <202410312109.2PJFJpuc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 008053bcdeaad929fa3f96b75eee49da15ab0a04 [10809/13046] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241031/202410312109.2PJFJpuc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312109.2PJFJpuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312109.2PJFJpuc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/zhaoxin/uncore.c:339:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:340:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:341:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:396:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:397:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2433:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2438:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2444:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2805:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2814:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2819:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2835:6: sparse: sparse: symbol 'kx7000_uncore_cpu_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2850:5: sparse: sparse: symbol 'kx7000_uncore_pci_init' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:2858:6: sparse: sparse: symbol 'kx7000_uncore_mmio_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
