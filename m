Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C046AF37
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643716; cv=none; b=UVCv53V7u6Zl068aFBHXZwsHUNcnwF3dJd4sLau0iWKx7QqHg/hWd5XFCB7Zl8pZte2PfEuFVdqSU+zCmPYN71+v+bBDXL2sVATZreeEeSn0Tw4jjUITCUlWQAs7i8ELGFuAZP7e2j2wmUewnmOqns09Ffbpg1bszgrYrSDF5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643716; c=relaxed/simple;
	bh=ClLeZPtNVYDiYwZfY+4ztE2EJMExj0X7wjvQKxuennQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wr4xMTNwWnIGkS3CLNhzmq6Rroq+0Pkjnt/ymKfhJKPKtjJgSomd1p40ZPrnVTXyFcML359ojCTc97MVN7tZl1bjAxenDHkgxLQDBu0d2dKDNcfjRYWNUaBaKXUqrHRyHK219y4KA2gqApLDNKykgqAt/5fYtdGgsTo6OlzJov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZBLy1tF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZBLy1tF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780643714; x=1812179714;
  h=date:from:to:cc:subject:message-id;
  bh=ClLeZPtNVYDiYwZfY+4ztE2EJMExj0X7wjvQKxuennQ=;
  b=gZBLy1tFnoICLmrJwj1xIpXeci8frqt01nGHJdgvWnewvvU0Pnon2JIo
   LQ1k0ZydUfNbRLdm2E+xE1Q2fAg3bS44bFyaKFIjqHNA8qJ4xrWus2qWi
   DCoeQ1MQOjDCOk1IyjjfbhbjYLyGe/zJuGXCDUSUA/1Y4zb9hn3pmIfuw
   nsXwmylCYdPaw19278qGzlAgqMZAf6WwRh+YYR4CI6q/lIUTwmp8qN/2J
   K+GwqA5aftuIgJhBPyKDkLTzq+G58AdGzEoD8mXy2pLuKdDwOzeWoi3Q+
   dArEh/TRCzDS7coV/JMtqPHfVUJ8X84rEijl91+Vt1CdBzYJvL03zmqJU
   g==;
X-CSE-ConnectionGUID: ZX0ARdU2SrW+wMvdW7DPRQ==
X-CSE-MsgGUID: PEZNj2qzTduQmu1ekgjrKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85328564"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85328564"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:15:12 -0700
X-CSE-ConnectionGUID: BJtAPHzuSUGwtcE3DTTwTg==
X-CSE-MsgGUID: fCugz1BuTneMr8weFvbjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249108125"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Jun 2026 00:15:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVOlo-000000002VM-2nhq;
	Fri, 05 Jun 2026 07:15:08 +0000
Date: Fri, 05 Jun 2026 09:15:05 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Thompson <daniel@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Alex Elder <elder@riscstar.com>, linux-doc@vger.kernel.org
Subject: htmldocs: Warning: MAINTAINERS references a file that
 doesn't exist:
 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
Message-ID: <202606050946.JGkrxO1C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-net-qca-qca808x-Add-regulator-properties/20260605-091912
head:   a2cf643cd5401eea03d3f1a49d81e7d066ae6047
commit: b6d9c722ce11c43b1e14ca3a15d993e470299502 dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
date:   6 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606050946.JGkrxO1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050946.JGkrxO1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
