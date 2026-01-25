Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119D123EAAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769341864; cv=none; b=snA2fG5+QYCpumNkm3khctYPG9auyZJ9XYJjkxyHRso0CDcaMuOzJBuVytbKq0QWEkcXgzlaaUlEN769zDCkDFolf7M24cn6xCwZzbgMWmAqDyt3IqAzv3SWPaxdIGFRzTH8czFM0/LBPzOuhW251baXpLPWjd0iTWJvx19HS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769341864; c=relaxed/simple;
	bh=HaGNHQnpY2c5Tx5izc808V62lO9hk3FWorNqtAKra4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BEKLYeirKXi1A7h88nZ0ScAa76XigBrm7kzKjzKe+ipownvUz+smFRHd1qnIBDbe5mELneUjj04iJAxYpwgD58FlBKptXbE7jAdh1Pjqh5/7HVAUm4nikmemI+Q++siUYlaMUsACKzTwu5N0VmGddA6geJPia3Do7bcymL987EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enzzSOXL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enzzSOXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769341863; x=1800877863;
  h=date:from:to:cc:subject:message-id;
  bh=HaGNHQnpY2c5Tx5izc808V62lO9hk3FWorNqtAKra4U=;
  b=enzzSOXLy9QbN8Ax2OrmHEwhabOYte6gXuNYDp/PbjSsFEFALMzIDeb6
   n1/oNXlsjM0qWJq1lkWijFnPwP3SNXsCc7Flu0XavuBAYFpyLLgDTBfJo
   loi6vwXMbRQfhvMbog/45u83+loMD22q7nfJP4ftHQu6V+dMU4W8YsED6
   Sz0gOm15RpIC49WonUZUBD8teKc5DAeXKSHkIX4jxMLj33rBhdQaHuGZv
   DpEy1hyh6ooR0d2SaCxHrATC3uKpdRr3450TIyyzZDLkZ4gizV8g376L8
   ydgvGGvMezRdgJKGLHKZkz1ZsK8YPGmusWS+40c+HPbs9nPUn8pJ2Qy7r
   Q==;
X-CSE-ConnectionGUID: om00tkzcQde70G5UnY+gsw==
X-CSE-MsgGUID: 5VGbLJCbSvyLJyqhIMPFTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70446473"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70446473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 03:51:03 -0800
X-CSE-ConnectionGUID: cs2uYHu5TFmJNzwPF1nO8g==
X-CSE-MsgGUID: 49SBmQ52QSCS0f0KT+boFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207799167"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2026 03:51:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjydu-00000000Vz0-2fLj;
	Sun, 25 Jan 2026 11:50:58 +0000
Date: Sun, 25 Jan 2026 19:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Harsh Jain <h.jain@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 9228/9539]
 drivers/crypto/xilinx/zynqmp-aes-gcm.c:556 xilinx_aes_aead_remove() warn:
 inconsistent indenting
Message-ID: <202601251908.baMDVVgW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Harsh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 56934489a80a74a067d9129f025c81d1ebf267a4 [9228/9539] crypto: xilinx - Replace zynqmp prefix with xilinx
config: mips-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251908.baMDVVgW-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251908.baMDVVgW-lkp@intel.com/

smatch warnings:
drivers/crypto/xilinx/zynqmp-aes-gcm.c:556 xilinx_aes_aead_remove() warn: inconsistent indenting

vim +556 drivers/crypto/xilinx/zynqmp-aes-gcm.c

4d96f7d48131fe Kalyani Akula 2020-02-17  548  
56934489a80a74 Harsh Jain    2025-12-20  549  static void xilinx_aes_aead_remove(struct platform_device *pdev)
4d96f7d48131fe Kalyani Akula 2020-02-17  550  {
43f0478672c323 Harsh Jain    2025-12-20  551  	aead_dev = platform_get_drvdata(pdev);
43f0478672c323 Harsh Jain    2025-12-20  552  	crypto_engine_exit(aead_dev->engine);
43f0478672c323 Harsh Jain    2025-12-20  553  	for (int i = 0; aead_dev->aead_algs[i].dma_bit_mask; i++)
43f0478672c323 Harsh Jain    2025-12-20  554  		crypto_engine_unregister_aead(&aead_dev->aead_algs[i].aead);
4d96f7d48131fe Kalyani Akula 2020-02-17  555  
43f0478672c323 Harsh Jain    2025-12-20 @556  	 aead_dev = NULL;
75578e5c2040b5 Harsh Jain    2025-12-20  557  }
4d96f7d48131fe Kalyani Akula 2020-02-17  558  

:::::: The code at line 556 was first introduced by commit
:::::: 43f0478672c3239cd10fd460ae84ba2b3f55dc07 crypto: xilinx - Register H/W key support with paes

:::::: TO: Harsh Jain <h.jain@amd.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
