Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59CE3B2BA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775291636; cv=none; b=asSCAJmOZTjnaxkfMXLE2XY6fU8785Iff8+ec3H/EPetUfok55lS2wqNLCwlUlycmyE20x1H2bMDo3xca6NjCyaRaeXWhWAJlb/nachV2ef3SIzhbS1ie/DFvdduunTttzAxBvSyKo/CA35HW5p1mGG1ICG/mVffvGlL+8cgxoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775291636; c=relaxed/simple;
	bh=MHbpsdLt3bnzF/yhO1NlRH7QsEjakBMxL7+uqnVsFPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rkBJTJIXjkYgRZyG3WBa6S/Znf1MDdBK5TT/Nfb1a6Ic3ZRtzXM42LlvHYQwqQCSNPGd+vU+EkbdEv20c5p7x+fP3uCG9SGOpOqismr/MBXiHEvZiW4DlZRpnz+YFxPcB2jrVnN/e7ZR0cgRQqhGwYIP29po8sQhK43CmSrLxe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbsCVC+P; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbsCVC+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775291635; x=1806827635;
  h=date:from:to:cc:subject:message-id;
  bh=MHbpsdLt3bnzF/yhO1NlRH7QsEjakBMxL7+uqnVsFPs=;
  b=RbsCVC+PHAtpT6oz/ism44ptXFMRuiOgefbtoV3uRafNW+vhTOF87iNL
   d+AUVOrEfldb2gR5oDmvpYr7a7UflacQ9om6qqWbs1IyrK4mVgQU6CNz/
   iceDivUg7N1BNLMRFRv8I+UUEiojaMQZwQgNg/XPBkYywahlxLQ5jRdHO
   1a81JjIlIdIKvCCU7J9Jnhh6+G9fOE6bYgojIQcE0DlxkDnA7QgkMNaD3
   2rVGu3VrfROLgw+IjxL/FjUSkyfdepY0Xtfy+t3mMGfiUn1TGhMIrerid
   E19BqFwyJ5tdyiv8NpXxhHdvk5FgHGMVFqyn/xmDgYcird64otww3Gcvm
   g==;
X-CSE-ConnectionGUID: sEzcNOzJQdSaJPMM9zVOhA==
X-CSE-MsgGUID: /7EYTnoxT+ylPcXcqkDZQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="87788610"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="87788610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 01:33:54 -0700
X-CSE-ConnectionGUID: SroF6y3NQtaok1XoI1yYuw==
X-CSE-MsgGUID: 3sB+4/RVQVeb7HuXVrD4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="250522490"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2026 01:33:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8wRy-000000009Z3-1iKB;
	Sat, 04 Apr 2026 08:33:50 +0000
Date: Sat, 04 Apr 2026 10:33:33 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/12] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202604041004.wzRoPL7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   bdab5db454db7109fdab2148baff2b25b7dad27e
commit: 059837f47f887848d0068cb0431354e8e1197e44 [0/12] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260404/202604041004.wzRoPL7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041004.wzRoPL7e-lkp@intel.com/

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
