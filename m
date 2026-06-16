Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAB93CF1E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590022; cv=none; b=MIlS0ZpOxaDvtrHLH4F69GQIOc7EGVAZbpHpyu6R2djZg5MvMmuk2vGScm4xfq5NmVDVd6oebnnpkQ52MKyXkf08RyD1ANwycPxqJFsHvHAVjuMsnIuu8UvZhM20TJX9N7NtwcY1uMhSUOrgZORSIe2GJwP43VzNOormvVGR89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590022; c=relaxed/simple;
	bh=Q0Fp6a86IGkguvOayYMWhGMAzYMs0Ck6GfgP+UKoo2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=meyx6GH5I80k2RDxMez1Uzo1N6Vg2tufK79NKRN/bZr7rbUTcgS2hDYsdEK8WKOQiNAfc+UpZE2TlHU6ljVGsz2ecyTzovwPwpvnM7nNuyz5ePBPr0uqI3HsFtTArz5sny519XxSYVH+Ct/OJeES31w1c8GfWIc4GqB6cmb0CSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLO6Tfss; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLO6Tfss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781590020; x=1813126020;
  h=date:from:to:cc:subject:message-id;
  bh=Q0Fp6a86IGkguvOayYMWhGMAzYMs0Ck6GfgP+UKoo2A=;
  b=bLO6Tfss2QyDbnat3NeRId+jCpYtcFCsdyFYqs3IsUXLOT0Aj7uduwy6
   aZLK85VirjCpQyiY9awzbocBFtS67iHn9/55/rjmFEZBvImq4364vOMLc
   BdZqLINha7LFx7yMvHWpUWnjJbriifuQmTMKx249xbLmCJ/6s0UCel/AX
   0rEXS03/f1uFDm0ibcTw8JqwFfsJlVaziFCqo5++3FfhyVnGtJefu99v2
   6Zn87nRhHxyJRaKZTqv6RNJ8FN4WrvQTZ14NaDFjpqDbfTaBD4A5W4PGX
   2vmKEQJDYR5gNWLee7MXEcPGv2Bs2hLgW0Cuofz6pFsMzZuRHL9f7+suO
   g==;
X-CSE-ConnectionGUID: /Ef8aO4bTWGT6iAqPsAGUg==
X-CSE-MsgGUID: +o3qD7zDTOKXqUnBxqEhQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82387627"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82387627"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:06:59 -0700
X-CSE-ConnectionGUID: QaiTdyNoThmDBEFu8pXUgQ==
X-CSE-MsgGUID: 4BbZc6Z2TZyiA++EJGQUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247747156"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Jun 2026 23:06:58 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZMwn-0000000053x-2On1;
	Tue, 16 Jun 2026 06:06:53 +0000
Date: Tue, 16 Jun 2026 08:06:15 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linuxsecuritymodule:main 1/1] htmldocs: Warning: README.md
 references a file that doesn't exist: Documentation/API/obsolete
Message-ID: <202606160846.O1FzSF0E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel main
head:   fac1e95155f2b940a514438e0b25c0fd543207d7
commit: fac1e95155f2b940a514438e0b25c0fd543207d7 [1/1] lsm: add a LSM specific README.md and SECURITY.md
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260616/202606160846.O1FzSF0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160846.O1FzSF0E-lkp@intel.com/

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
