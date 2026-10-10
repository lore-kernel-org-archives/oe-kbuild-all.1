Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A02E738F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616068; cv=none; b=tWCLfk138UhVVQwPv3Q8pzAFN4UkbfEpTQK02TvheQY5T9N/51lpBYqhSEqG7NCfKtj6Gntr7cM+y/7MddYhYmzmdIjZg4WS0vtpYqWkw13rrcBOKlqpYdBdjupmR/duFy2xGpve8u75UuLNzF5rBh5CHcSURfFv1HJv4m90AME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616068; c=relaxed/simple;
	bh=qCIjk0k2pcKrfaMLBxPf5DLKfr36Vi4kZC1jkEfs7Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P+7+p3cOfO67HP5MuC1IFU+e30EvSheOJtGcBn9KihEkul0OGCSHW50W4PfiSF7sooXZrSMoBWPiYQ8Nzu2NT0vxdmpSuRhqg9kFnxjmfTiS+RfrfOeemAbeNfpV9r1lrwzkllCh5YhNloV5Gbu7tWk98VUjy2vGezpWs7Lk+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVzVi/jX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVzVi/jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791616066; x=1823152066;
  h=date:from:to:cc:subject:message-id;
  bh=qCIjk0k2pcKrfaMLBxPf5DLKfr36Vi4kZC1jkEfs7Bw=;
  b=LVzVi/jXMwT0MXvN2F0qlfw0QMjOLZ4nMupkCd76DS20z1mnEZre03xs
   u2OO3m/akq2i59iU2yaujearqUDJCd+CIMJeZJEfgNQGC93SyVHWrcnlM
   hU0IHs1bW8ZzgzA3fJGIWQbeSB42kQk+2pl7gw0V+ClmUgK7hJ9M4EyZE
   0PxvtE+qXJDixhwojYb1PmbLLbYjldBMrASwEAmvDmyLp8L0Crvmu1SIu
   aY3YPWcKR9PzibsdA9uIHt6YvZtYvhigw+iVLHunAyWm9OgXmKLfcfc13
   XRdYzNboIABAwYlPJHrnZxu4JrvhNURmuB4g96Uel88ssxtyGahZuEtZX
   g==;
X-CSE-ConnectionGUID: DuPlpWFRRpSvE5wzqSkgzA==
X-CSE-MsgGUID: vJb4WDSDTxag7wi9kkfNAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="314006"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="314006"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 00:07:46 -0700
X-CSE-ConnectionGUID: IU4Pa5iARWSDKmkoxUCW1Q==
X-CSE-MsgGUID: HbhaYzzNTTGXDaMF3iuzHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="939724"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2026 00:07:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFRBF-000000007cp-1Nm3;
	Sat, 10 Oct 2026 07:07:41 +0000
Date: Sat, 10 Oct 2026 09:07:03 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/195] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202610100929.qMXw2dzG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   cf8b9c0b957f45db78a5233576f7c57c3f615feb
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/195] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610100929.qMXw2dzG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100929.qMXw2dzG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
