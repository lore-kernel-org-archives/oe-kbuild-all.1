Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F2E2C11E6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 02:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787540095; cv=none; b=c3/lNeEC1aZBFCdkojV2RniUx2GTj3iCAubeI4vPwa68ScU67/BOihk2eDfgYtvYuEqRgaJTrHt0f3jqyyP3C52jUNEjp3JcvrYO58QGBOU3ZKug6nTjgqvWamLnWPZyIUxn/bcziMNOvEo8sOh3TXy/wzamp0JfdMLxbRAOoaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787540095; c=relaxed/simple;
	bh=rcmo0JbQRxUB+Bm7J3+XY/EEjbntCNkzpux3vORx/Ys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oAP/5zUmFaKRR7AUAxbCQ3iWBRlgKul7a+0vLch8dgDOBuNyDC1EbRxNTxX0jVIlqtPdVk2s9qXl6M34yf25O5LY2KsRsa3X8ZcROkCsO9SyCOmQoxUuxmnGtgBxtcEDQuf3LWa6lsmv9q/T2g8eskIaNfTqxZm7W4jpYLykvps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYfO9Vmv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYfO9Vmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787540092; x=1819076092;
  h=date:from:to:cc:subject:message-id;
  bh=rcmo0JbQRxUB+Bm7J3+XY/EEjbntCNkzpux3vORx/Ys=;
  b=MYfO9Vmv34akEd//hAVGZvlPM5LFXSLxRJy5UHP+2od3XpC7BLVDuA3C
   WkXiUxK8IE6B7ZUvEFQppezFDB2PMiX4+vTgnmxGPsRBPHmf3NOAuuyHr
   skmS8LdCKqXInUrfiNt+cqo25LjhTw5okec6SWQzUeGN19Kwpq/zxlssy
   AXn0GyuT/v60+gf6VQSDHawgrme7Xv9gjSPi1F7tIX8/NG/61l6B7tNoT
   Y2jp3On9BgEcVkoybWoWO/IN78F0A2Lq97mg2B01ybewbaP8PjfrW6Td6
   NFhqPVEY3/TmaLjr+uVm7AtJbIX0ML0MJo8oRtmyxnEStCrjKGM/q2FlE
   g==;
X-CSE-ConnectionGUID: 1+FwZTWaRIqge3ELwtEOLg==
X-CSE-MsgGUID: qhBFJAC0Q36FFzpeTdqJJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87998082"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87998082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 19:54:52 -0700
X-CSE-ConnectionGUID: Uf6mI7jYRXeR2QzyZ+cb3g==
X-CSE-MsgGUID: UQheJElbRNenjFN00yZvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="266349843"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2026 19:54:50 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyKpk-000000000FH-0SuN;
	Mon, 24 Aug 2026 02:54:48 +0000
Date: Mon, 24 Aug 2026 04:54:13 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/158] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202608240440.ZNHxgo7t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   fb512bc986e8e5e13460409fae533531d54fa59b
commit: c7c64c09fe63f588a04810463284fca7e4961929 [0/158] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260824/202608240440.ZNHxgo7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240440.ZNHxgo7t-lkp@intel.com/

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
