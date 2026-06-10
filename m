Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E4346E7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 19:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121044; cv=none; b=aNkU0p6dt43rbeZvIYO62s4GNs0Qi9OHIZWjV950vAZLHEixvowURuKdUpJiWSxBh3qMYBzZbZky4Vs/pSheO0yDxQGe2VuQSOS+nOR2DpleLPYg4C2DTsVQaHgEn+oMz5yn7pxPtTrOcil3SY1Ltd3fBMgMG2oeOoVN/4XPckA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121044; c=relaxed/simple;
	bh=+wjy6D3TwWyaJRktI7l1nYayo5eOexSl21UxkKHCaK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LahA2qH5YOPVlxH5cX6ZwcAiVx2lcufez0LzMc6MXhHj7ONUkzP1OkjD5Epp1Uk5Tqp4gGSyW8G+NJVQGE2BS1mco5N34eShpRFwgZRzUH0NkE+mzvviBua7AdI55+8xnL0D5e9HlxFXDMee03lOES+/Hqzz+nN4RUdWEmboy6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAMt5I8W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAMt5I8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781121041; x=1812657041;
  h=date:from:to:cc:subject:message-id;
  bh=+wjy6D3TwWyaJRktI7l1nYayo5eOexSl21UxkKHCaK0=;
  b=FAMt5I8W1M8eoYoub+cZQ+nOF2jxPetVZBXiVa63JeMHfW+UOUt1me5P
   2UBrcg5dzCvZrCSsMULKanvCvpGkmdPuiXikKg4plMWAXfQFbafeTjlZr
   43C4BDwaZHAnox9lYS41OrKoC+FQulTT30h58Vb78DWgCwNcUIfJSpvRm
   6vHUZBhVAxHH9hllgY5P1aZL5Jazq2azTnNDTCgxdyQvbSXvGqD9rhHP+
   MyhdXA8v1GjQA78vd3wBTdrx8brcHH8YY/Zpgg29HCFVAzvJ8XbeJPRtH
   Q/iea3N8ohQ508VX52E3qjTFDtYdghQRMwd2nRq1rLhGLBH6PMeODv4h8
   w==;
X-CSE-ConnectionGUID: nhuQJgFCQl2dchqgTFGLAg==
X-CSE-MsgGUID: TJLgq7HoTmKJuzjELVvwdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107364028"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="107364028"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 12:50:41 -0700
X-CSE-ConnectionGUID: +LZjT86QRFOjlLSWHaFrLg==
X-CSE-MsgGUID: EYycuIIoTraJOSDIKyOiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="248134767"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2026 12:50:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXOwg-000000003oR-09H4;
	Wed, 10 Jun 2026 19:50:38 +0000
Date: Wed, 10 Jun 2026 21:50:05 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Li <jason.lee651024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning:
 drivers/tty/serial/serial_cortina-access.c references a file that doesn't
 exist: Documentation/serial/driver
Message-ID: <202606102102.JsRIO7Np-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jason-Li/dt-bindings-serial-Add-binding-for-Cortina-Access-UART/20260610-193842
head:   e97c7dd14b20885c9b9f27daf2c6e0cd9e99d82a
commit: 2b08fdba152665eca1c8194820608a3f284143b6 tty: serial: Add UART driver for Cortina-Access platform
date:   8 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260610/202606102102.JsRIO7Np-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606102102.JsRIO7Np-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: drivers/tty/serial/serial_cortina-access.c references a file that doesn't exist: Documentation/serial/driver
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
