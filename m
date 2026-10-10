Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF903D1CAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627923; cv=none; b=YHcih4YE/O98AEpmQxJw+2WXx1sSJBl2TEbOcwYLzpDv2fSLfeAn0/wzcsWZCdZE/IIZ4JjaK4criA9Rns1HLp8GPPU7q/ofveFs6Q8FW3dRHb7l+oDiuiau7v2DazVhZKLQMPW103cEsCoEPMmW10Ei2UUNcJmjMtjJVDfh8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627923; c=relaxed/simple;
	bh=e/eZ5SjFwxHSA8FCNDqNL6w3q9QmtA7fJ1t8mWeLRqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dTMKlNE25ULuKl/jQ58cKhmRUbG66g9hmRaOpH/s87+42R9289B8vRIzVAu1mjTbq3MHJqaX1taGoZMV2NYyvZJ89lbr/aOe38y6PlCJogVkWR/E9275pKa9iIfEM0qRoWiPahlvyj8Q03rl2R1ib5AI3IaZDzdd0IV6BtwseVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOxpqmHF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOxpqmHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791627922; x=1823163922;
  h=date:from:to:cc:subject:message-id;
  bh=e/eZ5SjFwxHSA8FCNDqNL6w3q9QmtA7fJ1t8mWeLRqs=;
  b=cOxpqmHF3LvNcJIdENNgoweQqbx8wb2hPBGSBumuUX/xZ8HDVPOPN+0f
   UZXbVbeepFbv837BIaFN5omniST/TjJFMcCxmtsFev5HJfhPzeAbctGb8
   a9TnfLPlv0prlmHRPh/p4tCnMwUTGefQhqlqTcaiHzmo02Lt2an3RawLs
   fnSZL6qTtfLNm2abnj3welSQNjtyThIDCG1zRxwNAOlOtdV5fM++e4gpr
   6O0JON22tTvA9m+as6jdJtg5GXWvunvBZFGSLNfwy//qfWu5vWYHGwH6W
   mjv/DxEewMs1GnvWPeTcokMfciT46hB/PWsjkhkMJ5waCCAw7FyzDnriC
   A==;
X-CSE-ConnectionGUID: ncQvLt+4Q1GdnoQCp1TkPQ==
X-CSE-MsgGUID: 0R9/QW/SQlKRVCEs8KvYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="292621"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="292621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 03:25:22 -0700
X-CSE-ConnectionGUID: ifote9bRSZWqZq/19nt3Zg==
X-CSE-MsgGUID: CX0hOIa6RIG7fBIUtWRslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="475189"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Oct 2026 03:25:20 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFUGT-000000008wt-3GP5;
	Sat, 10 Oct 2026 10:25:17 +0000
Date: Sat, 10 Oct 2026 12:24:26 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202610101255.MuTLg2cb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/14] ioasid: Add /dev/ioasid for userspace
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101255.MuTLg2cb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101255.MuTLg2cb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
--
   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
