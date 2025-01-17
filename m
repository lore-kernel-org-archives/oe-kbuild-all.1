Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B201B4F0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737099009; cv=none; b=RIE65rg+0StOV4caqusFCqIuzeOGvTtbi6CZUjoB8WXvpxLhTn92QnyblAjOoCdIMj90+HCzB3FuUHL+FP2+BE4mXX7Bk5f4M/Nh4pa3Wn+VVSd52i4qWwZQJRqiFe+PzLXMGGpdV1SlIF3Xg3l6hLzFG1eSUnIndtfsCxaasFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737099009; c=relaxed/simple;
	bh=9b/LVuOoAQ9j6VCa0kkKgjeYBPEBZF/2OwV0vmdoPQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TieObX/5BAB80PI93UdkxADeOE1tfxe6JaWRwkD0gJcvzSxoMaqP8j53WjXSw28XvU1Xn7PuRpwawAg2GH4QCKT8ct1AmqATGYdNzUZAeFXnP8lY97o2LEt5A/tcsd0ORNjspR7ulOSzh7dWcNV226WEgNm34UW8h/B6TCaiOW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaTvnSJb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaTvnSJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737099006; x=1768635006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9b/LVuOoAQ9j6VCa0kkKgjeYBPEBZF/2OwV0vmdoPQQ=;
  b=WaTvnSJb3+zVTxDhsVLfzFjj77fiOeDvnE/hRJ1Lb9x12OE3ar/0WToI
   znq83707CBmEydc6sLuZRcMlrXhEMlSA4jdD9u76m0PJ+zM2qPme4An8P
   rgGAXGfGVgHXXcdddMke6NIjTYmmaN0VPdSy48z61B6u6k4OzugSUMyO+
   TxLNUffP43udX5SLhxZVRJs2yXIf9u3GRgp+wT9CgCM35tCpIoWX2Kgw7
   0BrmTYpNIbadAU8EPrKxz5yFovkXo3qRBGme23tKEBn9cUYwIGYEe18RO
   dB7Zr+ni9BB5xnjYma8LCBhN9G3A7zzeJMQznz52s7Le4zDgquIEhXEwN
   g==;
X-CSE-ConnectionGUID: K0xhTQ4mS2+3lm9ztgNd7g==
X-CSE-MsgGUID: JHwb3WKjQUms58eRcbINkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48107048"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="48107048"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 23:30:06 -0800
X-CSE-ConnectionGUID: GXPI9G4gTJmqhEKmIHQpyg==
X-CSE-MsgGUID: tBRhEVNQSAyjeqU/8ajodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105579315"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jan 2025 23:30:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYgnq-000Sv5-2U;
	Fri, 17 Jan 2025 07:30:02 +0000
Date: Fri, 17 Jan 2025 15:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 53/66]
 arch/riscv/include/asm/io.h:34:26: error: implicit declaration of function
 'ioremap_prot'; did you mean 'ioremap_wt'?
Message-ID: <202501171558.NJ9awtJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   146ca8e2c31ac6fcc918079eaf8072e9f08ca380
commit: 0835ca527c4c5c4674cece7d5a6b6b3aa73d1a9f [53/66] riscv: Define ioremap_cache for RISC-V
config: riscv-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171558.NJ9awtJa-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171558.NJ9awtJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171558.NJ9awtJa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:14,
                    from kernel/iomem.c:4:
   kernel/iomem.c: In function 'arch_memremap_wb':
>> arch/riscv/include/asm/io.h:34:26: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_wt'? [-Wimplicit-function-declaration]
      34 |         ((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
         |                          ^~~~~~~~~~~~
   kernel/iomem.c:12:32: note: in expansion of macro 'ioremap_cache'
      12 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^~~~~~~~~~~~~
>> arch/riscv/include/asm/io.h:34:55: error: '_PAGE_KERNEL' undeclared (first use in this function); did you mean 'PAGE_KERNEL'?
      34 |         ((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
         |                                                       ^~~~~~~~~~~~
   kernel/iomem.c:12:32: note: in expansion of macro 'ioremap_cache'
      12 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
      34 |         ((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
         |                                                       ^~~~~~~~~~~~
   kernel/iomem.c:12:32: note: in expansion of macro 'ioremap_cache'
      12 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^~~~~~~~~~~~~
>> kernel/iomem.c:16:1: warning: control reaches end of non-void function [-Wreturn-type]
      16 | }
         | ^


vim +34 arch/riscv/include/asm/io.h

    32	
    33	#define ioremap_cache(addr, size)					\
  > 34		((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
