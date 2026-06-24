Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB33E074E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782332114; cv=none; b=b8UJ5YYb7zmWwiKNnTYPi9yiCTpnN4bKA9J2roavGtByuVeD4EzcougsxAzF+d+Flr7KzMK9i3pdfGdiSUEc6ooBvByz9zE1pdwOFfHuJBLp2bJIfUMRJD5LPA+kqLdq4agQQruma3XTVyYqCa50aNmiiVkZFpMtdg4yy/Bg0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782332114; c=relaxed/simple;
	bh=JIggUnhiPPZlmMGQg7ETzIihtA9vAqiQc2mH603cdVQ=;
	h=Date:From:Cc:Subject:Message-ID; b=bPPBxgWbLyCEXq2OoyhaYoHuqmnxBDuWUuMnbuNbtFdK2lJRdW5s08GeQ14Qs3/nIM2377lDiPYXIsXHiGuC86RQ9xzOt0wWSEvjtVUnqed45rzhIdyz3a4gCUiA13wCMnnzK8BseH01cLrzSmNWxGiBKPe+HvvqlABxSJV2a3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+OOyNEz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+OOyNEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782332113; x=1813868113;
  h=date:from:cc:subject:message-id;
  bh=JIggUnhiPPZlmMGQg7ETzIihtA9vAqiQc2mH603cdVQ=;
  b=X+OOyNEzqEkeiQJKZcus7tT2HtAs5pI5Y2scjmq1r9S4ploEoWCrz1Vl
   LIC9orzr9jDAscgCzWmKQIvin22KM9lw0/VIfmMGtNX3d6AY3qZIH092c
   0JZY5LRi5TSL+NenyVwsJ1q2mty4gTbFgfExLMo9GYbQGDvlfUOFwcfia
   rRfrndg6SRPbtRxKCfmXL0OMhH6mHhC1ZSsktBJXnX+lSyJX0eBUjbBB0
   6POv7TyQmb59R8dpkZbGegcn9Muqge5sTxMQXRFchfvkmb3BgmP8ns47P
   Z2s3wKKZQgq1azQ+nQ3jCePZRnMd9KolPsp0R/7xoXb/L0HbDGCmuQHjr
   Q==;
X-CSE-ConnectionGUID: xFNYjm4RRXOJnFnDnx8VUg==
X-CSE-MsgGUID: e+IUNkEzTwi2D1qBfQxfMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83294865"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83294865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 13:15:12 -0700
X-CSE-ConnectionGUID: ULs9WSw5SwKOJGIztTzrVw==
X-CSE-MsgGUID: CgGrJbGSTp6QaHPj3v31tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274171430"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2026 13:15:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcU05-000000006Mz-1rGU;
	Wed, 24 Jun 2026 20:15:09 +0000
Date: Wed, 24 Jun 2026 22:14:10 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [jlayton:nfsd-testing 3/3] htmldocs: Warning:
 fs/nfsd/nfs4proc.c references a file that doesn't exist:
 Documentation/atomic_bitops.rst
Message-ID: <202606242223.Mks9jBen-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-testing
head:   a6bb4945e70c1078941fda53314ed0eb6198b724
commit: a6bb4945e70c1078941fda53314ed0eb6198b724 [3/3] nfsd: fix UAF in async copy cancel and shutdown
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260624/202606242223.Mks9jBen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242223.Mks9jBen-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: fs/nfsd/nfs4proc.c references a file that doesn't exist: Documentation/atomic_bitops.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
