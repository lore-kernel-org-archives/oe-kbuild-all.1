Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A01156F4C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732185584; cv=none; b=uWCzCEPaskQnrNQ3LHWbEgsdZS8YbiHVM86Xw1hE0wqqE1X0CN3M+89h9QZUqljL2gkrPtHbZCfGebOG6BwucKWoNB+ehnwJ4xE1CU3Gex1G3et/nrdamM5fFZJcbRZI38XkgF13EeaqcZt40YujoUanm35wUcGCuR9oSo4L0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732185584; c=relaxed/simple;
	bh=ga6uPcOA89xLOkLdPO80H8C7LOVkpXL1aNZbwwoHGoI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHBrqMT0pBM37zX18tt+fduJZwMNAdOWsqmLDeg5v/43rf1tea6OBqCNLLiS1/z9SQagIRq0ptDyNpzqCd/kRspL4s7us4pgAjX+Rvr89bS3nQmN+1U3K57lJ0Aw9R3vBQ+LiXZWgO2y06dDLzczc9zAUu6kiRRTM1NBl86jIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5WHK5Re; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5WHK5Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732185583; x=1763721583;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ga6uPcOA89xLOkLdPO80H8C7LOVkpXL1aNZbwwoHGoI=;
  b=A5WHK5Re9d68usGvbUNLNm2S856oZ08nNTi9HaGMXmwocyCMQ1z561GS
   AqlQlWAmGF8BnRKwo3B8j/5snulxl669UMufQY+9jiyYVafGeBulN+rwQ
   YUcctFx45ypR2ejDOkUI3BolwRSCaMXiFW5ioDIzzsmNwYN7Q0P0akzBB
   YkgtPXJ+9erZMIIJBwctSRkSDp2z8VlPCd1H52WbXQsvJMDODgpDZHHQ7
   AdvRQAr2Lt/ydo2nAO4IfPwGMheDUXS5mO8vqVKFAyiX5ImoA8I9Icdeb
   fNEZnmSDspXQY7VolQkZYr0n0ZNGX9KX4BbmvbxfEiMc8aTa7RoTFq3dw
   A==;
X-CSE-ConnectionGUID: 1qeE11FuQySgUsy3UPTlSQ==
X-CSE-MsgGUID: 3mK9xa5gQCK7IWJ+XNLJ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49815872"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="49815872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:39:42 -0800
X-CSE-ConnectionGUID: XA23Z3PrQ4+egNRHWP8uiw==
X-CSE-MsgGUID: HwPp3Gy6Ta6URwqYFiagHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="89813975"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2024 02:39:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE4b5-0002rH-0C
	for oe-kbuild-all@lists.linux.dev;
	Thu, 21 Nov 2024 10:39:39 +0000
Date: Thu, 21 Nov 2024 18:39:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 9729/30000]
 drivers/soc/qcom/rpmh-rsc.c:695:1: error: type defaults to 'int' in
 declaration of 'arch_initcall'
Message-ID: <202411211851.ogkD8dGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7d5e03d31c4509fef1c0f7691a23f11d3d56a2e6
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [9729/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411211851.ogkD8dGN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211851.ogkD8dGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211851.ogkD8dGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:25,
                    from drivers/soc/qcom/rpmh-rsc.c:11:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:14: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:399:17: note: in expansion of macro 'rom_out_8'
     399 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:417:17: note: in expansion of macro 'rom_out_be16'
     417 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:435:17: note: in expansion of macro 'rom_out_le16'
     435 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c: At top level:
   drivers/soc/qcom/rpmh-rsc.c:695:1: warning: data definition has no type or storage class
     695 | arch_initcall(rpmh_driver_init);
         | ^~~~~~~~~~~~~
>> drivers/soc/qcom/rpmh-rsc.c:695:1: error: type defaults to 'int' in declaration of 'arch_initcall' [-Werror=implicit-int]
   drivers/soc/qcom/rpmh-rsc.c:695:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:691:19: warning: 'rpmh_driver_init' defined but not used [-Wunused-function]
     691 | static int __init rpmh_driver_init(void)
         |                   ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +695 drivers/soc/qcom/rpmh-rsc.c

658628e7ef78e8 Lina Iyer     2018-06-20  690  
658628e7ef78e8 Lina Iyer     2018-06-20  691  static int __init rpmh_driver_init(void)
658628e7ef78e8 Lina Iyer     2018-06-20  692  {
658628e7ef78e8 Lina Iyer     2018-06-20  693  	return platform_driver_register(&rpmh_driver);
658628e7ef78e8 Lina Iyer     2018-06-20  694  }
658628e7ef78e8 Lina Iyer     2018-06-20 @695  arch_initcall(rpmh_driver_init);
1ee367d36875a2 Will McVicker 2020-02-10  696  
1ee367d36875a2 Will McVicker 2020-02-10 @697  MODULE_LICENSE("GPL v2");

:::::: The code at line 695 was first introduced by commit
:::::: 658628e7ef78e875cfe13064387c1a7a287d6338 drivers: qcom: rpmh-rsc: add RPMH controller for QCOM SoCs

:::::: TO: Lina Iyer <ilina@codeaurora.org>
:::::: CC: Andy Gross <andy.gross@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
