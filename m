Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2C63CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740445872; cv=none; b=YNPJjzn4HIZXtJnjLGaFVp/IZgfDBuxUefmXRKXYeH108YNCCVXllU5KYVCl+4qDt6L9VAKHLHoc7aKJ38FW1WmoIeu/gU7smCNcxxK/x62gdWgyLLrdFH+0W7ir35rnAZHSof3qfUoe5gY7EwsP7U292EyHMPrG5WdBTLB2soo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740445872; c=relaxed/simple;
	bh=L763dyhChZuj8nJnEBbs1VcPsuFt1qR6b09zXzGrQqY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0GGRJnMe4xxXSteJV53/y3omot+9nRReompXBohJxLR7HpdJYzgTgq61irQ3Jhl86KyqKGRLz3AS+plMr9V/ml7v7ExKyXfqEoYnf400r/sx841ItTrIHf3p3QAYD9nleIReahwuZ3LnJYygn8JayxT1ODdazJyJG1+F7uf47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WejBJn0w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WejBJn0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740445870; x=1771981870;
  h=date:from:cc:subject:message-id:mime-version;
  bh=L763dyhChZuj8nJnEBbs1VcPsuFt1qR6b09zXzGrQqY=;
  b=WejBJn0w6L6xPVrymmE+hrsocgk/LFcM5lKtX93wBg3/M/rnkuf8J2rG
   1GTdXQSBHZmmph+zx8WCszafk5zoJQ3v2ZKnzvXg4tf3d/DAPMtqVpAGF
   /L/Zl4w0F9B2GMiJDq2GBSDbZPjMiCbcZJgnsSC7SkDCReS0WAkTKxPa4
   oRUB+8KMm5CCbAE41ySH0nByKT6U5Cry7jAPj6TLL79Wh+WLZpazDhTn5
   l+n/JXin6+tWG+kpzy2sTD0BdC07P2L4j5dGa0K7XIXC0aPIZ+qB7McSk
   2+B1Sf0fx6hvnOrTJTD1joPxl6Jdgc/6ACQgLTSb0Zi2dYwCf6/VfXw1Z
   g==;
X-CSE-ConnectionGUID: xN4N4RoRTX+tyY7PVj5fgg==
X-CSE-MsgGUID: G3HBhJ9bSMe6z2fZ3FgVmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45012997"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="45012997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 17:11:09 -0800
X-CSE-ConnectionGUID: UjvqE4jNSzu4ywpOhpcaYA==
X-CSE-MsgGUID: 766hrpfHRf684VE4FJLU3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="120856551"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2025 17:11:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmjTW-0009Xn-1I
	for oe-kbuild-all@lists.linux.dev;
	Tue, 25 Feb 2025 01:11:06 +0000
Date: Tue, 25 Feb 2025 09:10:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/68 1/1] arch/riscv/net/bpf_jit_comp.c:1478:47:
 warning: array subscript i is outside array bounds of 'const struct
 bpf_insn[0]'
Message-ID: <202502250915.sGKZwYJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/68
head:   1512b732e7eb769e47792aa376270df979374d81
commit: 2353ecc6f91fd15b893fa01bf85a1c7a823ee4f2 [1/1] bpf, riscv: add BPF JIT for RV64G
config: riscv-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250915.sGKZwYJb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250915.sGKZwYJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250915.sGKZwYJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp.c: In function 'build_body':
>> arch/riscv/net/bpf_jit_comp.c:1478:47: warning: array subscript i is outside array bounds of 'const struct bpf_insn[0]' [-Warray-bounds=]
    1478 |                 const struct bpf_insn *insn = &prog->insnsi[i];
         |                                               ^~~~~~~~~~~~~~~~
   In file included from arch/riscv/net/bpf_jit_comp.c:9:
   include/linux/filter.h:526:41: note: while referencing 'insnsi'
     526 |                 struct bpf_insn         insnsi[0];
         |                                         ^~~~~~
   arch/riscv/include/asm/cacheflush.h: Assembler messages:
   arch/riscv/include/asm/cacheflush.h:25: Error: unrecognized opcode `fence.i', extension `zifencei' required


vim +1478 arch/riscv/net/bpf_jit_comp.c

  1471	
  1472	static int build_body(struct rv_jit_context *ctx, bool extra_pass)
  1473	{
  1474		const struct bpf_prog *prog = ctx->prog;
  1475		int i;
  1476	
  1477		for (i = 0; i < prog->len; i++) {
> 1478			const struct bpf_insn *insn = &prog->insnsi[i];
  1479			int ret;
  1480	
  1481			ret = emit_insn(insn, ctx, extra_pass);
  1482			if (ret > 0) {
  1483				i++;
  1484				if (ctx->insns == NULL)
  1485					ctx->offset[i] = ctx->ninsns;
  1486				continue;
  1487			}
  1488			if (ctx->insns == NULL)
  1489				ctx->offset[i] = ctx->ninsns;
  1490			if (ret)
  1491				return ret;
  1492		}
  1493		return 0;
  1494	}
  1495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
