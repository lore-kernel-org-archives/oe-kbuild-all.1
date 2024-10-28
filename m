Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F997192D6B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106834; cv=none; b=lGGDp4vyZHgSPOuXdt44VtggVA+qgrFIvd1Gc16QOmGqFiEtYyhgsikZ3SYXbd2/Fc1prztYrYDaXztldJGbpS+zd7It1zG3RE/9QAN1ppjvVwyA07QOAZOZUtab080Ymgehqx8B4wPR7MZu2Z2Bw2Cwl37oHAy2p2KE+7B1hnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106834; c=relaxed/simple;
	bh=Js+fcyUUKJYjEMHA3oPONcJrsR1imzrF22mI2htpOyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gi+ahiCVFJkBY15yMkQ6qz71YJ4pNDldm4j9VxXwXaMghdPRjvXanPri3P+WQJvoDMd3lOePX1Vio7/HVQrG/m+uPa/EyKy6fOQWnS4qSvwgS5agMruL9RYOzu5t3WeUUu86q1RCnMDDPWuvbrs8qmigPc9M/hii/MPZYQbdATI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/afE0qK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/afE0qK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730106832; x=1761642832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Js+fcyUUKJYjEMHA3oPONcJrsR1imzrF22mI2htpOyU=;
  b=K/afE0qK9adY1DTNd0pEwa80KzDQDob8xN/maMKhWzgKbSmyg4xOBRIK
   q850f10UaatDayC5Ma+J715pjCWPAP2p5wvz9gc4V+ALX8fUB3Px3RILM
   FhknjA3bwOAVmvLESBrPcCU67Hz7VrQU1giOU0pWbcpcGHXiwyhi/3wsq
   rKCzlQiiHS3V23/jJ2SLgU57+BOp4wqiROBHHTcqVDp8vResjmE7+ijVF
   jaA/t+MLHmkVf/dbaGryPYm3JWdRGdo9/aefIrl9ZdbKte/WRIxxYGbmJ
   LALH2/N2E4tAosL4b0LP6N7ZnU2TvlVmZMLf8ladlfxLmYMnmDgLIzkcL
   Q==;
X-CSE-ConnectionGUID: Fou8qDJpT9mqXi7kQWQ6Dw==
X-CSE-MsgGUID: qI/M1nLcTEudOYulArJhug==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33607021"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33607021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:13:49 -0700
X-CSE-ConnectionGUID: ywS4/XJdThuHacFvSITl6Q==
X-CSE-MsgGUID: 49A04kwVR8u7t3Rz3mEGfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86130244"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 02:13:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Lon-000cFP-3D;
	Mon, 28 Oct 2024 09:13:45 +0000
Date: Mon, 28 Oct 2024 17:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 19/26]
 arch/arm/include/asm/opcodes.h:92:34: warning: passing argument 4 of
 'uprobe_write_opcode' makes pointer from integer without a cast
Message-ID: <202410281729.jvnaPrFV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 50e835aa3f397de2a9c72606596f055ec05e1445 [19/26] uprobes: Add len argument to uprobe_write_opcode
config: arm-imx_v4_v5_defconfig (https://download.01.org/0day-ci/archive/20241028/202410281729.jvnaPrFV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281729.jvnaPrFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281729.jvnaPrFV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from arch/arm/probes/uprobes/core.c:9:
   arch/arm/probes/uprobes/core.c: In function 'set_swbp':
>> arch/arm/include/asm/opcodes.h:92:34: warning: passing argument 4 of 'uprobe_write_opcode' makes pointer from integer without a cast [-Wint-conversion]
      92 | #define ___opcode_identity32(x) ((u32)(x))
         |                                 ~^~~~~~~~~
         |                                  |
         |                                  unsigned int
   arch/arm/include/asm/opcodes.h:109:32: note: in expansion of macro '___opcode_identity32'
     109 | #define __opcode_to_mem_arm(x) ___opcode_identity32(x)
         |                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:33:20: note: in expansion of macro '__opcode_to_mem_arm'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn));
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   include/linux/uprobes.h:134:104: note: expected 'uprobe_opcode_t *' {aka 'unsigned int *'} but argument is of type 'unsigned int'
     134 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t*, int);
         |                                                                                                        ^~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function 'uprobe_write_opcode'
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/uprobes.h:134:12: note: declared here
     134 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t*, int);
         |            ^~~~~~~~~~~~~~~~~~~
>> arch/arm/probes/uprobes/core.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
      34 | }
         | ^


vim +/uprobe_write_opcode +92 arch/arm/include/asm/opcodes.h

f5f5195487affe Dave Martin 2012-02-01  87  
0ce3de23f2a520 Dave Martin 2012-09-03  88  #define ___opcode_swab32(x) swab32(x)
0ce3de23f2a520 Dave Martin 2012-09-03  89  #define ___opcode_swab16(x) swab16(x)
0ce3de23f2a520 Dave Martin 2012-09-03  90  #define ___opcode_swahb32(x) swahb32(x)
0ce3de23f2a520 Dave Martin 2012-09-03  91  #define ___opcode_swahw32(x) swahw32(x)
0ce3de23f2a520 Dave Martin 2012-09-03 @92  #define ___opcode_identity32(x) ((u32)(x))
0ce3de23f2a520 Dave Martin 2012-09-03  93  #define ___opcode_identity16(x) ((u16)(x))
0ce3de23f2a520 Dave Martin 2012-09-03  94  

:::::: The code at line 92 was first introduced by commit
:::::: 0ce3de23f2a520a6ac8c2179fb8f88342c4992ef ARM: 7509/1: opcodes: Make opcode byteswapping macros assembly-compatible

:::::: TO: Dave Martin <dave.martin@linaro.org>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
