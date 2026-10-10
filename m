Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381D3DA5C3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624222; cv=none; b=azOY8zRcfCpnu7TFybLZf2EcoxHeMFTq3YaRvu0ORTrvcupKmZtd3yZUzsdg3sre2pYdz5p8S4EXyfkKVedXFXQlVGHxMd3VUGBRqnH2UOpw7+QvikC9DAWEjt0nLmPQAKBxR7+L3EnCf/1hlxWS0ymCR9xBYR+oTsc//fyZS90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624222; c=relaxed/simple;
	bh=Q45IAU/TWU5rzJRXBkUQhoxA6Tqe66vCYliEPw2P6hs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=knJ72WVm/mT3J4kv6sLLnGH1A30D3xEPLW5iJQchodiBO1Oqr1tVefQZ3l9CvGbuhJACQJ91euDHkeFFzNCmGBAx63ObSU4eDptELOfHvhxLEIN5gC/o775Ay/zK13zIdQLr+wm5VgdTetrFLM6tQedktdUo9y/3I/pZnuF5c1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/S/WGEh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/S/WGEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791624222; x=1823160222;
  h=date:from:to:cc:subject:message-id;
  bh=Q45IAU/TWU5rzJRXBkUQhoxA6Tqe66vCYliEPw2P6hs=;
  b=L/S/WGEhXNxe5Xbud5drZ0gSUhq/YRRZAOLw75I5GJdQcuEnycBipM7B
   2eA5lLnnBDa3NfWWh+DL2np7EUcF8ejHX2m5nb1I9VeKtoKvokbeswkyG
   8aG6e/JQ4b2zu1IrMeO/IJ9EM+cPptRWHZAkGMhNMHJKkqkGbaM/HZi2E
   vUCQruLua989I68sr73a72GRcgAf+TToX/2bg4v67WqXY2DDT3fvk53xp
   mZIURhyGKW6VRmJbCXrAZb2jj22HoEnE1TJuMLoDM6Oz3pEprLvUgqPMH
   Mai/jvTAY7vcOFoyKEGT6wNgpIQ1krFASU0T92n71edxkwRLiP/6vuT6l
   A==;
X-CSE-ConnectionGUID: /eQhrxibQz6YjFvDEMw7Gw==
X-CSE-MsgGUID: 4jCLWQZySsuYphv9Ih8J7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="406583"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="406583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 02:23:39 -0700
X-CSE-ConnectionGUID: VsuB/JgEQgiG+oUvVFNl1A==
X-CSE-MsgGUID: IhY2dNT2R4+s6wCRkP0KKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="823800"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2026 02:23:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFTIl-000000008d7-2ivz;
	Sat, 10 Oct 2026 09:23:35 +0000
Date: Sat, 10 Oct 2026 11:22:50 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/195] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202610101107.UgXAIDlp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   cf8b9c0b957f45db78a5233576f7c57c3f615feb
commit: c7c64c09fe63f588a04810463284fca7e4961929 [0/195] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101107.UgXAIDlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101107.UgXAIDlp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
