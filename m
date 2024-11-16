Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863FB652
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731794296; cv=none; b=hldvNnIstYNSPUeLdIUCwEDTXSKqB3evIuYTf8GCTB6LlmuDPYfn+byf4XWhGt9TzH4LNmSRejFA0WcnoGjAO1AlVQnxbWo8RW9ezptTuqRJoGwbK51nYY07TUGp/KoS7dT00QcuwlA0xm3v/8nJ17rRfPpkB+pv/NW1Xh+Tx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731794296; c=relaxed/simple;
	bh=4jLyEEr9C6Ak0c5HeN+3TNx6kof2piG6HdFfdNJ2FIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPw2zsniUdxSjOxFtU9kpDDZhITJ+QuCpQtf+AfJIjYbpdON0FcHvQz5or/w1n6itIV89In+FTflgazoxVakaBd5rxT+fnyRZCn7OgTpgCjopo0qPAfDdiCd5pqdq/lg81QnquXq1qng0yImu/Zg7yIpsDxSDHFWxnoIWMyM+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELSHx/4f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELSHx/4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731794294; x=1763330294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jLyEEr9C6Ak0c5HeN+3TNx6kof2piG6HdFfdNJ2FIg=;
  b=ELSHx/4fRYaXxuptsmWD07HNdTaZTraqiv2JB4GMxAsWxNfFY5s54+7p
   76S6xTDU8EizVfmn/ByxAd7vb7PgWel1rlRyyFnNedQfjkRcHiTs1w309
   i60WpknIFOkwAcRxecEsgLYbFWDs7dP31EoArSEbQnVdnWWYSvdXODUOh
   Rivrb+CLlckeEnB7KZelLm5W4gtTopc0XAc3vnJ8PW68KuDATHobSYKVF
   I014nGT9WFL+ZOoR3xMbpDDeP5svgPk7jxgBC6OnOHNHbuG9pKG9yAteO
   DrSERHj1gda/PXUjyJJ4rPLClPV2W/BgZkYds73+b9RZNfXREF93+pNO4
   w==;
X-CSE-ConnectionGUID: BDYpWva+SUqpdBOD3FPPpg==
X-CSE-MsgGUID: fK0BSRnsTuSWS/qTCufG1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54280393"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="54280393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 13:58:14 -0800
X-CSE-ConnectionGUID: t2lJyD1ESly/DoQXuWjCvQ==
X-CSE-MsgGUID: JxmnLm7jR/O45sRtV0kF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88976709"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2024 13:58:12 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCQny-00018l-0a;
	Sat, 16 Nov 2024 21:58:10 +0000
Date: Sun, 17 Nov 2024 05:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 208/259]
 arch/x86/coco/tdx/tdx.c:375:13: warning: 'mmio_write' defined but not used
Message-ID: <202411170507.iPJgIgQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: 551b02324ad2e2c15e819d32b785cb8e45410df5 [208/259] ANDROID: x86/tdx: Add ve_x86_ops to wrap different operation for virt exception
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241117/202411170507.iPJgIgQf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170507.iPJgIgQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170507.iPJgIgQf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c:381:9: error: expected identifier or '(' before '}' token
     381 |         }
         |         ^
   arch/x86/coco/tdx/tdx.c:383:9: error: expected identifier or '(' before 'if'
     383 |         if (!fault_in_kernel_space(ve->gla)) {
         |         ^~
>> arch/x86/coco/tdx/tdx.c:375:13: warning: 'mmio_write' defined but not used [-Wunused-function]
     375 | static bool mmio_write(int size, unsigned long addr, unsigned long val)
         |             ^~~~~~~~~~
>> arch/x86/coco/tdx/tdx.c:359:13: warning: 'mmio_read' defined but not used [-Wunused-function]
     359 | static bool mmio_read(int size, unsigned long addr, unsigned long *val)
         |             ^~~~~~~~~
   arch/x86/coco/tdx/tdx.c:317:12: warning: 'handle_cpuid' defined but not used [-Wunused-function]
     317 | static int handle_cpuid(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:297:12: warning: 'write_msr' defined but not used [-Wunused-function]
     297 | static int write_msr(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~~
   arch/x86/coco/tdx/tdx.c:276:12: warning: 'read_msr' defined but not used [-Wunused-function]
     276 | static int read_msr(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~
   arch/x86/coco/tdx/tdx.c:255:12: warning: 'handle_halt' defined but not used [-Wunused-function]
     255 | static int handle_halt(struct ve_info *ve)
         |            ^~~~~~~~~~~
   arch/x86/coco/tdx/tdx.c:145:13: warning: 'tdx_parse_tdinfo' defined but not used [-Wunused-function]
     145 | static void tdx_parse_tdinfo(u64 *cc_mask)
         |             ^~~~~~~~~~~~~~~~


vim +/mmio_write +375 arch/x86/coco/tdx/tdx.c

   358	
 > 359	static bool mmio_read(int size, unsigned long addr, unsigned long *val)
   360	{
   361		struct tdx_hypercall_args args = {
   362			.r10 = TDX_HYPERCALL_STANDARD,
   363			.r11 = hcall_func(EXIT_REASON_EPT_VIOLATION),
   364			.r12 = size,
   365			.r13 = EPT_READ,
   366			.r14 = addr,
   367		};
   368	
   369		if (__tdx_hypercall_ret(&args))
   370			return false;
   371		*val = args.r11;
   372		return true;
   373	}
   374	
 > 375	static bool mmio_write(int size, unsigned long addr, unsigned long val)
   376	{
   377		return !_tdx_hypercall(hcall_func(EXIT_REASON_EPT_VIOLATION), size,
   378				       EPT_WRITE, addr, val);
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
