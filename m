Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557D43E6DC8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892446; cv=none; b=SATI/9jF0p08XlSEgd/t000BxvxxUNqDdloHmeMHkmcg/fPnINuYW51OUwRTauFB3w5bCr5tgt4TXdmebt5rKHQv0qvXfYZrB0tVW2DWdsLdXYWxKntlRFCzT+7kunNfdelmmSrSPI8xb+jmUAwFugLkr/snUOiDORUpyc6xX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892446; c=relaxed/simple;
	bh=yZngcWCzVqpTSTR0dQQ04LtlV90I9JFNUr3wtABUIn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IG626sLp9jomsWhR7KeMxDbezbJ9rz+EL2Gf5MF5q9yKh+Rcog//gKz+ucg0Y7jv71+9b3Eu8kTgT9CmoGcEMhM0usLSAeQB/ulvtEMk3/jP5X/nHWXdQ0o/8yJEW7OOd/+XLJP08hkCWgJaMCPhvKe/9IsrAKYSxW1Qkzz4OzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUgoz00Z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUgoz00Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790892444; x=1822428444;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yZngcWCzVqpTSTR0dQQ04LtlV90I9JFNUr3wtABUIn0=;
  b=dUgoz00Z5rkPvGh3xSFP7UwPW3W2DHep5KAFZKEuDcNrDJkpqDeq0a4y
   G5fPCz5a8zKfpKrqZhlKDiAeawYOLzQbP6SEbflkrNo8sZYvh6X0JvO0k
   enBV5sK2APp1EqIWhBDumO7ERlwxvOJP/kdmakAxqXCck60Y+o136MOPa
   vO4DkUj5Fv0eEnWQ0CeHpuLeEP4xj1oDW4uvqEtYhevAVAq6rkNlZS2RI
   Txwl4vFrx3qZrgWSrjN/sLsoUunYWtlaiKFSS3XL6Pe800eUgDmpbXGC5
   imBWnav3WfrY+BoUJ/jYnjt5SpgsRQ1qIjPNHEeSKcj054Phm8WifYCYC
   A==;
X-CSE-ConnectionGUID: 6ZM3Gj4DQWaFjTc9+cKxLQ==
X-CSE-MsgGUID: GsB2OGh9SqKGA/3Ki0kX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="109149373"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="109149373"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:07:24 -0700
X-CSE-ConnectionGUID: kx8ACyovTdqC1iL4TfqtIA==
X-CSE-MsgGUID: sqAjmEGwSkS1LCs3485HFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="280855251"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 Oct 2026 15:07:21 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCOvv-000000000ER-2VIc;
	Thu, 01 Oct 2026 22:07:19 +0000
Date: Fri, 02 Oct 2026 00:06:38 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Cl=C3=A9ment?= =?utf-8?Q?_L=C3=A9ger"?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 40/87]
 arch/riscv/kernel/sbi_sse.c:99:13: warning: 'arch_sse_flush_tlb_range'
 defined but not used
Message-ID: <202610020009.P3ILnDi1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 70bf52ad28d50b7278e87dacf8f7df9af50d05c8 [40/87] drivers: firmware:=
 add riscv SSE support
config: riscv-randconfig-2001-20261001 (https://download.01.org/0day-ci/arc=
hive/20261002/202610020009.P3ILnDi1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261002/202610020009.P3ILnDi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020009.P3ILnDi1-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/sbi_sse.c:99:13: warning: 'arch_sse_flush_tlb_range' d=
efined but not used [-Wunused-function]
    static void arch_sse_flush_tlb_range(struct sse_event_arch_data *arch_e=
vt,
                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_sse_flush_tlb_range +99 arch/riscv/kernel/sbi_sse.c

95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11   98 =20
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  @99  static void arch_ss=
e_flush_tlb_range(struct sse_event_arch_data *arch_evt,
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  100  				     unsigned l=
ong start, unsigned long size)
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  101  {
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  102  	unsigned long end =
=3D start + size;
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  103 =20
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  104  	if (sse_event_is_g=
lobal(arch_evt->evt_id))
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  105  		flush_tlb_kernel_=
range(start, end);
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  106  	else
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  107  		local_flush_tlb_k=
ernel_range(start, end);
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  108  }
95dfe3a59cd091 Cl=C3=A9ment L=C3=A9ger 2026-09-11  109 =20

:::::: The code at line 99 was first introduced by commit
:::::: 95dfe3a59cd091457b7c6af4cc9179307bdb83ad riscv: add support for SBI =
Supervisor Software Events extension

:::::: TO: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
