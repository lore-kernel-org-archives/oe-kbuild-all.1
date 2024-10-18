Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D244C20E31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 04:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729224308; cv=none; b=JFSG02L4y0Bw3M7SLI2dXbfFBuRuLFLbw7I/xRL3udKh4+tK99ctcHLMS+lpLMaNQur2ZVgOF58efGzB7RsxvqNGpR5stEBXMC7cMXgqiwedfcCIkZHz2Bxcs0jV2CXcxvjQEdBCLOkdChP62fNXk+cNc6AtWFmuyH28bfhq6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729224308; c=relaxed/simple;
	bh=jCoTCiAtZVrdvS03wLd5Cwe9o2dBtKsXlpOeFilYRxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5o3UI5jSUW3qzh/s1gFCcF/u6v8Jn6dPFUwNr62I/WQzdgC49cfpBK1ke6WoS0by5EDSW5D3hQibxje5uuKNyrV0ftOLGP2edqGlotZN3r7atG7863SfzPRAmVKY6BFubOh54gIIEkvJyTBn6fcVPDyQkasB42RXqTuLnNWSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1LkXLCt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1LkXLCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729224307; x=1760760307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCoTCiAtZVrdvS03wLd5Cwe9o2dBtKsXlpOeFilYRxs=;
  b=V1LkXLCttOKZ2SkA7PA06SdaaGoz4ikETDiNf44lh1JNYFXes7maCGyn
   D7DFsNqJQYQB/eXEIVbTnpcRWYy1+I9qLDuzwnjl5Xt0rhvFa0QMfuA3F
   xhKVVZooankytnOmKnlLPHQPQDrHvMiFXXFd8igVGOThGWuKVtJ4qe7fX
   nRqOlft2F+SoNxOZm187IvdkT3ydECO6H+F1EPw2QBaC3MKj2opgGMHSI
   RlPZxEMx6ECmrsIsN9lvbeYIBP8BMb97ZdYiOf/kKQbuWNvJB/RvbidtL
   s3kG+xtHLvDea6TPDzWd7ObYpWVcnMehIn6BcySen0Uif0t+4sLz+PTIF
   A==;
X-CSE-ConnectionGUID: EWmAYGYiQAm06qo3VdVJcA==
X-CSE-MsgGUID: M7JcUS4YTrCXpMjVdu/VRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32425514"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32425514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:05:06 -0700
X-CSE-ConnectionGUID: 83fIwyl6SwyUxuTTP6T3ow==
X-CSE-MsgGUID: 1HnhD7SNRNecY4Ci+QR8nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78357271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Oct 2024 21:05:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1eEX-000NFl-1M;
	Fri, 18 Oct 2024 04:05:01 +0000
Date: Fri, 18 Oct 2024 12:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 'thead_errata_patch_func.______f'; recompile with -fPIC
Message-ID: <202410181120.hAK0JoHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6efbea77b390604a7be7364583e19cd2d6a1291b
commit: f0c83a23fcbb424fdff5b38fbcdda3c04003a210 Bluetooth: btmtk: Fix btmtk.c undefined reference build error
date:   3 months ago
config: riscv-randconfig-r054-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181120.hAK0JoHi-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181120.hAK0JoHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181120.hAK0JoHi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'thead_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c:184 (arch/riscv/errata/thead/errata.c:184)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'thead_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c:184 (arch/riscv/errata/thead/errata.c:184)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'thead_errata_patch_func.______f.2'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c:184 (arch/riscv/errata/thead/errata.c:184)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'thead_errata_patch_func.______f.2'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c:184 (arch/riscv/errata/thead/errata.c:184)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
