Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB741C85
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 01:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165742; cv=none; b=Lc+DJKweybTl86M5hFHCpwJDyHrTeg4wsfk6tziwl5rf8VTbpdIUSAz0X4guXdWegAUMyYk6w5UWBXjKJCZonzdBhjFRyZZElMBQFjh5XTdc99xy43pznsOwKn7oCR0Q/z7dnVK8hm9abpepDVGXOgP0/5kIMxtxmHzssaJBiT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165742; c=relaxed/simple;
	bh=Rgi4LPe4PpCGHXDW0AENx7adeheF8dn9AD0jNLrfDo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cC9j/2atXqiZ9vTXHrdWslhcpJPcvf+ZU6FVorCb5TfFdMg0F8KCKWz/oyqG0brF3yhNang+zGlHAolzgw5G7yMaSQrQYlNj0VGisNwTIRGAqRjvvOkBlOV2uU75rxwz2GIDtYP0oWRtF9kxY3qaR+UmAMZNVJqacLCq+qTmxfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIG4xwFB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIG4xwFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730165739; x=1761701739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rgi4LPe4PpCGHXDW0AENx7adeheF8dn9AD0jNLrfDo8=;
  b=JIG4xwFBrfb7PvqxMtI/0NGC4Coa2rho/0lp0NmkKLP0WxIOhkNgsw3f
   6ErKGVBFUFllDUm+ziXAqEBQZeODC6E6745QV8xbwDaC61B+qRB40GfZ/
   pNr/FaON21ke44ko1WZB2/BQLUeQZaqs5WDyhw9xb9fKDZzHusiT8SS2/
   fFThw+sECr9M2ckhnC26yETT1BiSCaj//m6DKTBJg+l1yH1eAylIhGs40
   tc866bAGQyejHNavHEzUISMSTRQZGC0GSoFktuw2SdTAqCy061Rlyk6Ln
   IunEbvosv3nLoQkKBiLidHimVQJKTOZvQE3gL0x+ImQIwwhIufA7oR/2T
   g==;
X-CSE-ConnectionGUID: hT7vH/5mRCKC9csmUz470w==
X-CSE-MsgGUID: uHsJiisLTFa0VdzBWDAP2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33707423"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="33707423"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 18:35:38 -0700
X-CSE-ConnectionGUID: chbEpxZgRJSXQ58s7QOgqg==
X-CSE-MsgGUID: H4WxFgLVQH6H4Bdo1tYhKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="82611211"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 18:35:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5b8u-000d6a-1w;
	Tue, 29 Oct 2024 01:35:32 +0000
Date: Tue, 29 Oct 2024 09:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6450/13046] arch/x86/include/asm/paravirt.h:229:9:
 sparse: sparse: cast truncates bits from constant value (10000000f becomes
 f)
Message-ID: <202410290937.igFNOJyQ-lkp@intel.com>
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
commit: 64ed8094654cceec3ab5411352b161c6093b38e4 [6450/13046] x86/perf: Add PMU uncore support for Zhaoxin CPU
config: x86_64-randconfig-121-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290937.igFNOJyQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290937.igFNOJyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290937.igFNOJyQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/zhaoxin/uncore.c:2388:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2393:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2399:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2762:6: sparse: sparse: symbol 'kx5000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2771:6: sparse: sparse: symbol 'kh40000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2776:5: sparse: sparse: symbol 'kh40000_uncore_pci_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2792:6: sparse: sparse: symbol 'kx8000_uncore_cpu_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2797:5: sparse: sparse: symbol 'kx8000_uncore_pci_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:2805:6: sparse: sparse: symbol 'kx8000_uncore_mmio_init' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through arch/x86/include/asm/cpuid.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/cpu_device_id.h):
>> arch/x86/include/asm/paravirt.h:229:9: sparse: sparse: cast truncates bits from constant value (10000000f becomes f)
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +229 arch/x86/include/asm/paravirt.h

d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  226  
47edb65178cb705 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  227  static inline void wrmsrl(unsigned msr, u64 val)
47edb65178cb705 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  228  {
47edb65178cb705 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23 @229  	wrmsr(msr, (u32)val, (u32)(val>>32));
47edb65178cb705 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  230  }
47edb65178cb705 arch/x86/include/asm/paravirt.h Andy Lutomirski 2015-07-23  231  

:::::: The code at line 229 was first introduced by commit
:::::: 47edb65178cb7056c2eea0b6c41a7d8c84547192 x86/asm/msr: Make wrmsrl() a function

:::::: TO: Andy Lutomirski <luto@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
