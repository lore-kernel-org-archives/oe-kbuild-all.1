Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740958;
	b=K0EvbDjfgESBZOmn5RwzeO1Z1ejHuoapFxE3uXirE9cT4pgrYukO0ecruNyC4lTpmZgF
	 Xp5bj0blmevXOyppkutP3m7gzIqWtCmUlapNnkNovO78xmJJktWow8/K4kCxgiiX3LnO6
	 p94oBi2mPlYmg1p4fg/cZV3wFpfmCB5Hub0qWHaF9puew+M904Rzcnb6Ji1KFZj9er7QG
	 GQnDV4s9SEwjx1xdqWIBMrRUlopHAIn67u7knArk3wPNBmdHfRjV1Tm6I/VnubClPFR6c
	 na9MBJ+re7UXy3Z3oNje4IjLLyWELSkRbM0RjwDc7RDxi7o8evY5dFqLciglFba1RHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740958;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QCPyHcTTZE2wqTgP2MEp25IVTO5bMTxRWUkt4HRpSa8=;
	b=riCqpgpsC/ESHM2HW68WNfSXnZGV8uhYny5MLtUi90yh8ErRZ+tgmcODD4/3GhB4LXm+
	 ooPbd/C8xqqjMrxRK5rIZPPw9KLX7Vef/V4nno4CUy02AFi5RSMCOFrg12pZNsJGm2VBn
	 HhQDd+HMCSAdzg6Y6aj70XHuk5z6OENdUO3/QmGROnohFecsQjIXywAyHuDudMsMsrSho
	 d+ai6j0ZGAEDcqTwr/YOu5QOBMrZR8mv828Ex4ZRdVBzoe0W0i/OFIa4llW4YpKtdYBNu
	 PnbdAKtHzzepNQV8OCtHELkiQpJQWGKaQXy/WL79lpmfbhuUptEkQYKIWA4aopATthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DGS2WqrN;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED8606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 11:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2ED8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DGS2WqrN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794740958; x=1826276958;
  h=date:from:to:cc:subject:message-id;
  bh=uUdUtQoDH+F5xZmtNCXlhnMrly48brQTvztoA1E9ANs=;
  b=DGS2WqrNriEcoe5CBFFG/2s7LR2RoMhGqktR78U5TxW6d6NuIdUcgx7n
   T0OJDtxRvbIl8TxPON880mPGNNtIR3lqvoLjadctvwtLeJBXpHP/OhH3z
   ZcoFh+aQ0fJMuIeXEn67rvfaqrrGQC+0K/sCCnj2LhG23u3V2f5+WADSw
   DlUlmOvl1yrYZ1OZpF4+flMa1W3VyDic5oKDxD2Ec1CKSSo+clGPfNw75
   u54BJwjwjtbXqnTx66D+6kyITXHBT3l4uxWCJpGaVAIVrn3rEv9wHlNL1
   LkG3Gk/HtNcX9JNiyrbd8+y3PFfcteYN/wiWrL4e9S/PJKEoihhux9f0q
   w==;
X-CSE-ConnectionGUID: BjZTFLwDTSycGogOVGb2Lg==
X-CSE-MsgGUID: 4mRFKlvQQuC48SLWDb3lnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3383030"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3383030"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 03:09:17 -0800
X-CSE-ConnectionGUID: KrdGYYQdSrC1l9i3UKT+iQ==
X-CSE-MsgGUID: HtgY8SLLQRmuBR/ieozifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9396431"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2026 03:09:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSY6j-0000000029s-0il5;
	Sun, 15 Nov 2026 11:09:13 +0000
Date: Sun, 15 Nov 2026 12:08:30 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/181] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that
 doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202611151200.KxZvsDFb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Liqiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f2db664ee044fbea206f4d976d61e47d4cf2158
commit: 236d23635bae7a56449cee273112529bf220fb67 [0/181] anolis: drivers: support for xsc drivers from Yunsilicon Technology
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151200.KxZvsDFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151200.KxZvsDFb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
