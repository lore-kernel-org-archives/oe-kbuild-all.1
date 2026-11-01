Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793493496;
	b=E3m+yG8VQQC9JU7nNRd5mRgOXlpch9mc8fm4Jz2PXbfKdcbvSoKX9mk+PLD2bCGiGgaF
	 hu/bmo1RAGJpjdN2UJeZhhX+EAdlBGCvmLzYP3UQxq6mawGls3zeel9Y8rtAHy6uMIeGa
	 wXoNrY59vihndxQH7dFOcMkA+3ujYPGjemZkeUJOeO9n+kXW3qsDZZFiqjv6qONv3Ib3h
	 HVp0tqTM7G2LZO0sG6KUC4giI9PjcfAgq3acDXWq0YMMNYwapXOwTYpZ/o2AQ1DI45vMt
	 O6MaAhqtgyTN0Z1Hc2PNZ/qMX6FXaMThR6klsmQrlovhMokeEUEi7ZQ217ZeVVmfuRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793493496;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=932SrwKyw9GmWYJ7qXWfEHJvKGFO43PGlv9ucU+h3G8=;
	b=pneEI+PJ9DxMnEWLZtYm6ZbNL6rD29dOGqIIrmmSZCJ98deR6Fn2RSk6SAFMZGoPdoOA
	 Xuo9ETMoXUoWA26hK1qRja3RFCjXJexhGSua65H1W55EILp2MNQno4uP5Ds86sayDxlWA
	 pQj4VGHXYRhAzU4l/iB6oPj3X0W8h3eKalpiPx7+te3BMoPclGlOTiiY9F+bw1OqbMVVX
	 TJ2pt8taG7obUhi4S8ZYU9MVwMNyLjk1uwZG6OpWwuMa7e4jOmFoFDrC8QzSldDUuahsm
	 BU009piYk+8g9uX/RjVIXZpsfXcmC9pgzCFFvtdVt6IZ0kaNTXiEvmVwJjYOBIxczOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnAlkk7T;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 00:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnAlkk7T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793493493; x=1825029493;
  h=date:from:to:cc:subject:message-id;
  bh=nqrGABJZgnCxI+2iRGXH7hhJyFjK7EEQc50CVxcoPWQ=;
  b=LnAlkk7TrRlaet7UjMZ2RQ00xn+JkdelQf62gNrkc3RkMw2oduNls/qV
   /QHB5hClPZyLKgauhrYepAAyVN+PsS0SsGt5qMbToUL0OuaL317YWS5gG
   eU+iUJF08HT3eGCIU3a1XeZIMLonwx7sgB9M5gGLEl8H06kS72uoZWk5Y
   ftiynXBpKupLZHw743oK1QAF/N04L/slQm4j6kMnkoSRZhBYp5xxR/GkP
   AxC6n6PAF+pZzxhsstG78/rYrsij6vOv8LNruYLM5QrZA6aekRbkRKxzX
   7MT5DDjaxVgh81l0V0tpUhwM8xTZ4ojZxt9gDJX20pdGVfg2q4F8FNiwB
   g==;
X-CSE-ConnectionGUID: eE0mtcNmRbapYYDV1ix9/g==
X-CSE-MsgGUID: /ddfmWKLR1SlIP1LwpbE8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2231804"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2231804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 17:38:12 -0700
X-CSE-ConnectionGUID: /Db3PgaJTxyvWHBoNCoNFQ==
X-CSE-MsgGUID: fQkMfkZcR16WmuJidtB73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6319548"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 31 Oct 2026 17:38:11 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNJaL-000000006H5-10fq;
	Sun, 01 Nov 2026 00:38:09 +0000
Date: Sun, 01 Nov 2026 01:37:54 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] htmldocs: Warning:
 drivers/cxl/Kconfig references a file that doesn't exist:
 Documentation/ABI/testing/sysfs-edac-scrub
Message-ID: <202611010117.3jlB31ab-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: ed5c8dfc6d3edc60a1be40bdc829b985f2279c75 [842/842] cxl/edac: Add CXL memory device patrol scrub control feature
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010117.3jlB31ab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010117.3jlB31ab-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/cxl/Kconfig references a file that doesn't exist: Documentation/ABI/testing/sysfs-edac-scrub
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
--
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/cxl/Kconfig references a file that doesn't exist: Documentation/ABI/testing/sysfs-edac-scrub
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
