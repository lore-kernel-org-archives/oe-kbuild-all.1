Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0584370D6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037531; cv=none; b=d5pEUm2EyZyA5CLzPljKJp1czMKbsQKh0e6SS5N7MlqSpwYovvrf1FmZ7AptFdDUlTGjVuUYEgFMg3ertmA78Kptj86SsJZPiG05X4NFryGpMxluPrn+EOVRC4tFj1R2cfMNECcjCydlTZuOx7Edebl/x4RbdwsBb4+g5y0GR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037531; c=relaxed/simple;
	bh=CehRAJfIUTP3jjhVhVTxA0h7C6E3ohORC33qPUPN8xI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DEqe5FECWIfnht1KocrlJGNepHlZBcPKjk/esFV/Vym8MZCDSg76cu+b2CV2zu8SJEKBrie6O4KOSgRv79jbdeTI/Ph86sphWGEKPULFyuRES8bVbYEMnehuaZuDgwk1lyrulKUouxzDE9TRwLB84Re9u0s3y/TCArAhHJSYEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaadnMEc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaadnMEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787037529; x=1818573529;
  h=date:from:to:cc:subject:message-id;
  bh=CehRAJfIUTP3jjhVhVTxA0h7C6E3ohORC33qPUPN8xI=;
  b=eaadnMEcpjeDIwSBJOtRNvLj/fLEhGXABAEJLKSPr8YqgI0aZRvGhc/M
   mCDTZpi1fYO7nQP4L9Sq8yBnEBXQPcQqsUqcATCBwviXfV4wn1PoJZWOs
   HC5r3FZhozK2wxjEa46Nxc2Lv4W5+dDVDg/OGvYWQ1SqsP+nD0Jw1rJbe
   ZMJ9JN5TIJhS6jAoa8R31jRYLuIfitC5gSjlI6Ys2E/BWWwZyeaD43RKm
   iHCoUdDe0m+EnKEKx54mUTCEl1Q+jQoFt9Hq9gNUwcoCT+WEgS0as2unZ
   81SbaVPt4/qN+NRMN5sOgkjlnqxBe0Vr2TTHq6M+nDxWv9J4Mud2pWRjG
   g==;
X-CSE-ConnectionGUID: BtqSEFVpTp2ZnFdo/7/JdQ==
X-CSE-MsgGUID: YAT9JsyBRlOXqm+FXQPjBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91334339"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91334339"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:18:48 -0700
X-CSE-ConnectionGUID: DhUyfDqFQhWrnzDgMkFZMA==
X-CSE-MsgGUID: zCKZHMqcTeqj0fVrQjMn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269448172"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2026 00:18:47 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwE5s-0000000073d-27Wj;
	Tue, 18 Aug 2026 07:18:44 +0000
Date: Tue, 18 Aug 2026 09:18:09 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linuxsecuritymodule:main 1/1] htmldocs: Warning: README.md
 references a file that doesn't exist: Documentation/API/obsolete
Message-ID: <202608180938.hj2kI6pr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel main
head:   0b9bc2a3c36b742f372ce72d6bd3049841a48dc1
commit: 0b9bc2a3c36b742f372ce72d6bd3049841a48dc1 [1/1] lsm: add a LSM specific README.md and SECURITY.md
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260818/202608180938.hj2kI6pr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180938.hj2kI6pr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
