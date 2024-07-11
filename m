Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89BE946C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720682176; cv=none; b=clek6lGmurnqplmlHt5wc/GXNRzZG7FqB1xk9a+8aANqj6+JV03ZSIhrw7viDXiyDb6Nh8Rw0QYw1eWQRqDgkKREGvn0nXJKhnrPo/Q/5ckDEq7c6jTtvfeRVutqIdJXiEoWkEzq8SdReZ6FFZUmnXMvFIvqKHDH6l1rZ7w2y4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720682176; c=relaxed/simple;
	bh=ETar1olpEBIRQkfGVKk0kWt1AOt5RRJB99MR3wWWDcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvM27FWRwBsEgKPbKjmQ36lml7KwNA384e2jdkZCG6Mn92rSz2O4TIlNvmdtBjQuXavLGvjdxRALXSon3D/b6NCUXB4AjjCDNi4g8r0A9tJX1CohiBvYidSidZtnaEkQcbWfHp09pqWBJo1mWUB7wRTFkxmUbYAsjXz5bwqhip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0pJQVY2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0pJQVY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720682174; x=1752218174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETar1olpEBIRQkfGVKk0kWt1AOt5RRJB99MR3wWWDcw=;
  b=Z0pJQVY288hLrrF6+63MW/otpVm+isDdijm/+0RHJa0TuKcmLELlBv/H
   spTa4YOzKpCIxqJWTIFhLoVnkJ/5KNo53iKmFG/yE9Kj01FyfYUYVd2ky
   0sFoQkeTzvfuuUHTiloEby6HHxP2r5weDlBbKzHFaBj6dWTUtrG9xi+Ij
   kN/hUHas1FZV/2Itf0+K/hK8CYdxgrNG8lzsj8fReoWc2cky1BPamCy7W
   QF1++JDWsGDCspoJPSFSSALr9P1Xa4jFTCBJYZsvVrbRGBW0eNZOjtX7F
   2RQqIiCp4hEb59eNL/HN6hq9kVqvYDjNl7oKddX6NtrwPJ2vyUK9xKvdP
   w==;
X-CSE-ConnectionGUID: Q7s1Cm+dSmqCx5GIzVKhZw==
X-CSE-MsgGUID: v78ia/wBSsWZe0MDwERb2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17658114"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17658114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 00:16:13 -0700
X-CSE-ConnectionGUID: aSvxCNAGRmSTLUJnCSfxSA==
X-CSE-MsgGUID: paoSXmCUR/iH7A+NYKwFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53072392"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 00:16:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRo2D-000YwP-0R;
	Thu, 11 Jul 2024 07:16:09 +0000
Date: Thu, 11 Jul 2024 15:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 107/137] drivers/crypto/ti/mcrc64.c:166:3:
 error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202407111523.cG5yrKmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   15f828fd0fc706919f64551afbe431eb66ba927f
commit: 2af1725d4bd6b8b24a1a2b47e1de27949d1cee9b [107/137] crypto: ti - add driver for MCRC64 engine
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407111523.cG5yrKmb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111523.cG5yrKmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111523.cG5yrKmb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/ti/mcrc64.c:8:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/crypto/ti/mcrc64.c:8:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/crypto/ti/mcrc64.c:8:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/crypto/ti/mcrc64.c:166:3: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     166 |                 writeq_relaxed(cpu_to_be64p((u64 *)d8), psa_reg);
         |                 ^
>> drivers/crypto/ti/mcrc64.c:168:14: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |         signature = readq_relaxed(psa_reg);
         |                     ^
   drivers/crypto/ti/mcrc64.c:263:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     263 |         writeq_relaxed(tctx->key, psa_reg);
         |         ^
   drivers/crypto/ti/mcrc64.c:271:19: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     271 |         ctx->signature = readq_relaxed(psa_reg);
         |                          ^
   6 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/writeq_relaxed +166 drivers/crypto/ti/mcrc64.c

   153	
   154	static int mcrc64_calculate_crc(void __iomem *regs, u32 channel,
   155					const u8 *d8, size_t length, u64 *crc64)
   156	{
   157		void __iomem *psa_reg;
   158		u64 signature = 0;
   159	
   160		if (channel <= 0 || channel >= MCRC64_CHANNEL_INVALID)
   161			return -EINVAL;
   162	
   163		psa_reg = regs + PSA_SIGREGL(channel);
   164	
   165		for (; length >= sizeof(u64); d8 += sizeof(u64), length -= sizeof(u64))
 > 166			writeq_relaxed(cpu_to_be64p((u64 *)d8), psa_reg);
   167	
 > 168		signature = readq_relaxed(psa_reg);
   169	
   170		if (length) {
   171			while (length--)
   172				signature = mcrc64_calculate_sw_crc(signature, *d8++);
   173	
   174			/* set capture mode */
   175			int ret = mcrc64_set_mode(regs, MCRC64_CHANNEL_1,
   176						MCRC64_MODE_DATA_CAPTURE);
   177			if (ret)
   178				return ret;
   179	
   180			ret = mcrc64_reset_signature(regs, MCRC64_CHANNEL_1);
   181			if (ret)
   182				return ret;
   183	
   184			writeq_relaxed(signature, psa_reg);
   185	
   186			ret = mcrc64_set_mode(regs, MCRC64_CHANNEL_1,
   187					      MCRC64_MODE_FULL_CPU);
   188			if (ret)
   189				return ret;
   190		}
   191	
   192		*crc64 = signature;
   193	
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
