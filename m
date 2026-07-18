Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58E385D6A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365402; cv=none; b=PRkJ3wzWRG9S9CKLAvT4SC2kNuF9edx71BxOKZzLDu9m+avtZQhAytaRoWARlE+nkmeLWyIvmt6GttDDgqJh2f3JmxeKS5qs0FFD3r7JT1t5cEV9QuhmiOxSNWKHoH11eUUfd5q/8W0WnFfvpNgcm8xfE3oq7ZtO++Vs475oLSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365402; c=relaxed/simple;
	bh=Q9o1Wo4egx6u2xNCRQ53PjfoRgN+ltQzUSZTsM2hQZ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iwXUWm3yZZrDV0elH0W60X7iRA+LKhKUhEU8xyoP/1+StMZ5Mz69lfpH6jhKb7wPgbhJQwEaYo/8qX8ymjNJ3Pdj0HU/XexQAXExQDYXJwsVsz3bxluzj4wosC6/s+lLCt4KBqm0dwL0/H//55iyGMNr5EcE3qAoR2ZPTQiTtMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9j9tNqu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9j9tNqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784365400; x=1815901400;
  h=date:from:to:cc:subject:message-id;
  bh=Q9o1Wo4egx6u2xNCRQ53PjfoRgN+ltQzUSZTsM2hQZ8=;
  b=U9j9tNquX1cdyShvdEbgxr3fY472TA2kG5aR1b/+4gDn/VoqqQfQgHkR
   WF+tZ9kWBAaOWeOsNxPN+Dq+r+S6g3ZOL1INACdEjh5RybS0R+tSyz/q4
   M7bUpuJSOmL1R1PvX2FpdhHGp1HYo4FDNRh0vTX9qmuniIVS2udBo6o1X
   hVwXZstlNBT9DOGcOino4YBon+TKnbpB1P+e4jqkGPL/64H1xnVFSKDXb
   uEGfbBT+PK00S/QdalO7aGVlRaVQEkzFUgw+1kQA684t1dMAx7yfgX+Dg
   4lxZFS3JK7dZOxfUcWmtU5jwaEIVP4osy94GjiRh/r9tMSClb16/Y8Th3
   g==;
X-CSE-ConnectionGUID: +abDvYW5RsuxrF0h336J0A==
X-CSE-MsgGUID: dxQnIFh3SkKar1TjsFlp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85222299"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85222299"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 02:03:20 -0700
X-CSE-ConnectionGUID: dJzud4sxRbCyXiXWyIzW7w==
X-CSE-MsgGUID: rbqgRRbMRa2+m3pD6KlTfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="253021343"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jul 2026 02:03:18 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0x2-000000005lJ-0bID;
	Sat, 18 Jul 2026 09:03:16 +0000
Date: Sat, 18 Jul 2026 11:03:12 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/105] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202607181051.n71Kg53S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f8a6ab0f5f0b5f85efcae83321abf317723182d
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/105] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260718/202607181051.n71Kg53S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181051.n71Kg53S-lkp@intel.com/

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
