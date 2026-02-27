Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6193644D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215381; cv=none; b=bj27ZQ9sZCEhS68GVGcrbp31uvsebMBdraPieFPj/GeJIhZR7US28Z+4i1+A9iMaV2fnFnExz5reSaAlGVALnoXS6h0RMy4TY5WVN4zvreZOzjrNjii59TJItVFy+20LZwpfBFvoxdZx3oY3sy6MSzfWXfsemhDoIv0aBGEtA1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215381; c=relaxed/simple;
	bh=7h9lwSkCXk2Dy7hz2gDyLtUDxBH/Or8iyTCsSS/mgXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YOBPxFgbpZ2pc6kY3GN/FGLJmClVgZ/rDjhGrIx3OpWwMt6NTrRIgQFgPrQQ3oyOH7LEhrw9PWxIITtCS4nt0zjN12H4VfGoVymV3ligSchYyqQ4EPjlFDVcKnHpLIQMOS9+Vl/dWRn3mdkieQMFE06AmKi8slwL3jWgJcIUaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWu6FgKk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWu6FgKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772215380; x=1803751380;
  h=date:from:to:cc:subject:message-id;
  bh=7h9lwSkCXk2Dy7hz2gDyLtUDxBH/Or8iyTCsSS/mgXc=;
  b=aWu6FgKk2C1sOD3cOp8y/xQV9hvrcczArbxyHy0I6udr2pytqKMTuW+g
   Sj6eUnmy29Pw60jMb07AFhDpdztN7UUHJDDYGyHIFiZbq+1tYPnGmpe67
   9Mycr/ZIcs53ns3OhjYBnbl4BME24md4S2FO1/MSQIiIpVW5jXxy4cxN5
   zX8EVipbrhstoGijlZf8GaaD9ChrGWzuRyuTLFkTvycH0okQGA4Zgq8rR
   I7mAGPvpZOZMoTEYNl8ICFYPXanNuXXhrZZJrjNiCYc4VORv5U+SnN2/m
   Ql58t0NoK9BSavMETbi8oE5RxtgcNM3rbBf3ae9OEOk/MDXq4xOavqHGU
   Q==;
X-CSE-ConnectionGUID: tLtJhtygSq6HFQlcq7ASsw==
X-CSE-MsgGUID: 3HvThq5USv68VHOD1JgZoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95922883"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="95922883"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 10:03:00 -0800
X-CSE-ConnectionGUID: Lqu+9ciRQW2RCVm/2aY/SQ==
X-CSE-MsgGUID: rs7lVDmoROCamyhy3wUtnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216095764"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2026 10:02:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw2Ay-00000000AsR-0ZUL;
	Fri, 27 Feb 2026 18:02:56 +0000
Date: Sat, 28 Feb 2026 02:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/4]
 arch/x86/coco/pkvm/pkvm.c:122:13: warning: 'pkvm_mmio_writeq' defined but not
 used
Message-ID: <202602280133.NnG2BGe8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   71f2074b8c1e4e009b1e126ca1a2a9ce14201030
commit: cd1c1ff12613506f091f809f0e6f60b6c3c1303f [0/4] ANDROID: x86/pkvm: Use hypercalls to access MMIO
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260228/202602280133.NnG2BGe8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280133.NnG2BGe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280133.NnG2BGe8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:122:13: warning: 'pkvm_mmio_writeq' defined but not used [-Wunused-function]
     122 | static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
         |             ^~~~~~~~~~~~~~~~
>> arch/x86/coco/pkvm/pkvm.c:92:12: warning: 'pkvm_mmio_readq' defined but not used [-Wunused-function]
      92 | static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
         |            ^~~~~~~~~~~~~~~


vim +/pkvm_mmio_writeq +122 arch/x86/coco/pkvm/pkvm.c

    91	
  > 92	static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
    93	{
    94		unsigned long val;
    95	
    96		if (pkvm_virt_mmio(8, false, (unsigned long)addr, &val))
    97			return 0xffffffffffffffff;
    98		return val;
    99	}
   100	
   101	static void pkvm_mmio_writeb(unsigned char v, volatile void __iomem *addr)
   102	{
   103		unsigned long val = v;
   104	
   105		pkvm_virt_mmio(1, true, (unsigned long)addr, &val);
   106	}
   107	
   108	static void pkvm_mmio_writew(unsigned short v, volatile void __iomem *addr)
   109	{
   110		unsigned long val = v;
   111	
   112		pkvm_virt_mmio(2, true, (unsigned long)addr, &val);
   113	}
   114	
   115	static void pkvm_mmio_writel(unsigned int v, volatile void __iomem *addr)
   116	{
   117		unsigned long val = v;
   118	
   119		pkvm_virt_mmio(4, true, (unsigned long)addr, &val);
   120	}
   121	
 > 122	static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
   123	{
   124		unsigned long val = v;
   125	
   126		pkvm_virt_mmio(8, true, (unsigned long)addr, &val);
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
