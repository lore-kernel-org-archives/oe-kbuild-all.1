Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084145198A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796418; cv=none; b=ssV7ZUG7SMtGnRK6+eTU65zKyVy8HLPOsH/MQPPBSSXyx2zBtbWmZNI2lZpLIle4REvaY8RwT+4rd22mM84wD8p5FO5Lc6dfhv+q0HzCrt/aVjrRKRL5rQDqgBT2+MczZAmDiP88HpCwJZrUcw7pKaIF1DXQZfNcckXg3K2KyWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796418; c=relaxed/simple;
	bh=BhY5ExAqCL33AsKhY/mvhO2XDjhpBRTZIofJRdECBvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/jsqhz7p5w09vxDNNxYn8XtL25nxHmUNwryKBP/E7+YDBMd8MPmI5Mup/rGtYTIadrlEGZyaB67Y0yL6uHVsZGxm3mvXtZgogZCp8Z9lFvsMhlpE7RHikfIQNnfZZhLVe8ylw6AIn/c3yl8htzR/RaGpbBsAviRKA7WESDaqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ2nVRea; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ2nVRea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791796417; x=1823332417;
  h=date:from:to:cc:subject:message-id;
  bh=BhY5ExAqCL33AsKhY/mvhO2XDjhpBRTZIofJRdECBvc=;
  b=TQ2nVReaUGOaU9xV+Ry1WQyLBWA5/e/guhjroLzuaVtAGOtXKF0e7yex
   w05HvuVUWOq9U+QHqyx9/2KGFvWePMeHIgkpj+uZGdeO/Zzjbd8upwExE
   7p/53V5PjCo4GVorWlOI0UAkTqBFmSHDBl4khPvjm9dzhBnu0qoA6Vr0i
   bXyov2KY6vrzGPly4wGV3H/xaOkjRU2Xp/wTXOw5UUnqCBudr362Iiu+G
   PZN1E9pvEmliOEDsm1XaQ2mDwIeMjcMPDhXw7gPeDp8xa4sy58t+xlbh2
   Dz7r9acJHIO69LHcrp5AKI/52H3pR1E3PBUoUxOZlSoO3Gi+RuRPbGmpH
   A==;
X-CSE-ConnectionGUID: usRv5Y2BRkG2WTtxqtP6bQ==
X-CSE-MsgGUID: ObXi6WCwTOa+DRi+asPc4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="507074"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="507074"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 02:13:27 -0700
X-CSE-ConnectionGUID: 4ClRilxUTYGpubjBGc431A==
X-CSE-MsgGUID: ClVPhD4uQ7qHUPv5rApb/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="970329"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 02:13:25 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGC5v-000000009yv-14l0;
	Mon, 12 Oct 2026 09:13:19 +0000
Date: Mon, 12 Oct 2026 11:12:57 +0200
From: kernel test robot <lkp@intel.com>
To: Laura Abbott <labbott@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Justin M. Forbes" <jforbes@fedoraproject.org>,
 linux-doc@vger.kernel.org
Subject: [snitzer:kernel-7.3/trond-nfs-next 7/7306] htmldocs:
 Warning: redhat/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202610121145.K8VL04LU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/trond-nfs-next
head:   8ed84ae4d26a6885be7dd8995bb73d8b7d1cefe9
commit: 1c47b11aea49b86fa76214ea0becb24715da5ceb [7/7306] [initial commit] Add files for generating the kernel.spec
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261012/202610121145.K8VL04LU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121145.K8VL04LU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: redhat/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
