Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2538A1CCB3A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703276; cv=none; b=EYm2+yUa8oOnKGuL33rztgGWfPeyp3dn8BgLRXiJT/rk26Ntd8xse8cC/EO8ZaRaEGaicnyQiiRsdrP10EOPWvHILxROLmehp9RLOb9Q1bw8+lOvBBTcqW2iYvQYS3ZFsib+zw2D9EbA1gWISb5aKbhTYWj+bCFc13EVyMy4bMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703276; c=relaxed/simple;
	bh=v0WHi4zq5uNaDG+epX8iKIrN+2S6LwkwrKVIZsmzCYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/1dGrCN0Ho98v/8rdlR6NDj9ROR/u0Nize4MJnIjvQZzqJ8wr0sxHxjLzohIj2dOknXaeyhuwDW7t6ECrilg5wwptV6Eb/NabtjFor9PuKZIar0zdGG9jJbAl1XzGFnZ1zL/FbcxbBZlmGpordSuysppAeQvIyDp08ZePS3k3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCUCpuTX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCUCpuTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729703275; x=1761239275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0WHi4zq5uNaDG+epX8iKIrN+2S6LwkwrKVIZsmzCYA=;
  b=lCUCpuTX12G9usMCUewPmiGURjycXqdgAtZwji8Ku6o7IN+h27nJ7yD5
   uWE6DxWUE3Z2kl5Kfy3C7In5+HWdADkm5mSLb+zqT365pytkGvr3Jq/dK
   KgV75nGWb/Dn6cl13MVP7nW30WYieiyws3MGiRP0y4QGMuz07uPDclvGZ
   VoX96qhjosY6Xw/+CwzkMGBk0A5EtkTwO1mGhrxBXeZJtTWwITrXT5GF0
   QlLtRJiR1TQBCaeE48f3+nx31uRqlXKB0rPfMEQAnSNe4hlYu2l8D/Mzf
   BdSxCsio8JftyeCOES2f1BZNxrCiB16NBJvmmptr1cMK2AgI1miEbNKFk
   g==;
X-CSE-ConnectionGUID: QFal9SqCTgmlSAuWVzzGTQ==
X-CSE-MsgGUID: pUr5WuLnSC2FbcShD7zpyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29465832"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29465832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 10:07:54 -0700
X-CSE-ConnectionGUID: KUOgXpDUQxCR24j+B0i+Dw==
X-CSE-MsgGUID: 2d3Tb2HQT0SKwpo7pWuosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80313171"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2024 10:07:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3epo-000VCE-0l;
	Wed, 23 Oct 2024 17:07:48 +0000
Date: Thu, 24 Oct 2024 01:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 8630/13046]
 arch/arm64/mm/pcie_unalign_access.c:349:13: warning: variable 'regsize' set
 but not used
Message-ID: <202410240033.m9Q1tif3-lkp@intel.com>
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
commit: 695f33b5f601a65864715def55714f3f09abcfa3 [8630/13046] arm64: add unprivileged instruction support
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241024/202410240033.m9Q1tif3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240033.m9Q1tif3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240033.m9Q1tif3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/mm/fault.c:1613:
   arch/arm64/mm/pcie_unalign_access.c: In function 'ldst_unpri_ldtr':
>> arch/arm64/mm/pcie_unalign_access.c:349:13: warning: variable 'regsize' set but not used [-Wunused-but-set-variable]
     349 |         int regsize = 64;
         |             ^~~~~~~
   arch/arm64/mm/fault.c: At top level:
   arch/arm64/mm/fault.c:1615:12: warning: 'fixup_alignment' defined but not used [-Wunused-function]
    1615 | static int fixup_alignment(unsigned long addr, unsigned int esr,
         |            ^~~~~~~~~~~~~~~


vim +/regsize +349 arch/arm64/mm/pcie_unalign_access.c

   339	
   340	/* 0xf8400946 */
   341	static int ldst_unpri_ldtr(struct ldst_filter *f, u32 insn, struct pt_regs *regs)
   342	{
   343		int n = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RN, insn);
   344		int t = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RT, insn);
   345		u64 uoffset = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_9, insn);
   346		u64 offset = sign_extend64(uoffset, 8);
   347		u64 address;
   348		u64 data = 0;
 > 349		int regsize = 64;
   350		const u32 SIZE = GENMASK(31, 30);
   351		int scale = FIELD_GET(SIZE, insn);
   352		int datasize = 8 << scale;
   353	
   354		/* 1) Get the address */
   355		address = regs_get_register(regs, n << 3);
   356		address += offset;
   357	
   358		/* 2) Get the data */
   359		align_load(address, datasize / 8, &data);
   360	
   361		/* 64bit or 32 bit? */
   362		if (scale != 3)
   363			regsize = 32;
   364	
   365		/* 3) store it now */
   366		pt_regs_write_reg(regs, t, data);
   367		return 0;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
