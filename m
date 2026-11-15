Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744686;
	b=DQ4CXb57oEytyi0yqUW/lfjy+1D8A3iJuwDApYbX7hWjp7ahxYu0q6FSpZS2/j4O4Va6
	 nHPpYhTuwaXMuNDhCdDUCSIjoRsI7eZo3zUXDgGYlAvjX6Qx3RWV2R8NYCOSy/qr9Etrt
	 X6THfEiEzyGK9Skp44gBgepuAEF/MuP+DRknAR6AFfNo0XbyzHq1RQIDfKM4weOYMxI6G
	 pWfMm/7LKpDT0sQsRvslysxoVs+QS6BVWADavkm1bg/mfbO69GB7dH+fs2pTtfz/VObXW
	 laJ7DjZomhv+1NBP2c0AVGLX4nUOxEghLW6lAhMnMQ1OWYjiaEDUdP/tdyOx1QXA3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744686;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+Z1tpfhQcACHpEOF1cu0guZ20RkMXOu1X6q29Fpeico=;
	b=D3ESoHF34yVjZozfRmlbiQvXIrd3x1jwZj7pW/q7rLWpDjCxLjSBnERAh9NZBUlfNRdR
	 wbU38B5jcadA++7cibicK8mgcpu2S8rTwluKIX/jPoMYPDBjBkBjiMkkF8sNNS4aYoy0i
	 Iq+t4yR0fQGhvGwbIiOZ5mPcNkuBbWU99sbcICroR3Zjp4wJjdwFuSoMJmtr5QJsAd+/A
	 ycjRxxv8FS26+YnQVL5Ete61gNBnEUH7JUDkB86Ovh4aJ+oehqGipe6bouCNrZVu7Fvv8
	 MHSn9cwNMx6OO6vxKS1k5q4JPyeXAJ1avbsFbakzHDOZq5XbmgUIO86L8g5VDH7R21A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DsnvUsOD;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3039606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 12:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3039606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DsnvUsOD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794744686; x=1826280686;
  h=date:from:to:cc:subject:message-id;
  bh=esfqVhfHyeCkvecdH/y15fAIhoem04jXLJkGSp8TSrA=;
  b=DsnvUsODFPiFSuEWz68EO7DWM9R5V2ei5RQ7QCI17RS2t/qqDVNUqE9b
   nD0yDIbKa5YmKcmDNzLBbKCHOFJOEFxlX1QWQok0w6oIiXCHhmzfrFhu2
   saM2y04RFaLa/DjZr83d2Gl8awtk8WC7OC2Jtf8WKYutauLnysrS8LBKu
   g1JyDQitSDXt7rzkcgNxYxmHka9V39hcjdzk6tv8hZc76GlQ2hergJB12
   GxadZFFBkbxhrxJW9D8ekdgeY4iSzjnslmfotyY6YLda/YWUYl5PFsfGT
   g3pMM0huCsRtwbdWMHJ+3PRran5sEsuE6zJ33Q8BunL1OTX0LG02P5nda
   A==;
X-CSE-ConnectionGUID: t+1Ou3syQd64jpO06SFKyA==
X-CSE-MsgGUID: k9E1PebnSGmtdA9qszMoqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3390481"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3390481"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:11:25 -0800
X-CSE-ConnectionGUID: PtYbE+9nRr+gSm6AKBHKag==
X-CSE-MsgGUID: szUctr06Qlu8t1HrF53lwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9861463"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Nov 2026 04:11:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZ4s-000000002AW-1Tpp;
	Sun, 15 Nov 2026 12:11:22 +0000
Date: Sun, 15 Nov 2026 13:10:58 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/181] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202611151339.ezxfeKZ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f2db664ee044fbea206f4d976d61e47d4cf2158
commit: c7c64c09fe63f588a04810463284fca7e4961929 [0/181] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151339.ezxfeKZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151339.ezxfeKZ1-lkp@intel.com/

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
