Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE1223DCE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 05:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781415153; cv=none; b=HawBUbH45PM7fdA7qDzd5IHQo0dkSbbgHlBDaU6WxAbNVPd+8O2Ev1uK0/IqjJxL/r4Bdmi28TlCdnBlevFShZgGGjEzZqsPSAkKF3F3RvYoT55zKXnuvRwr9aGiafEWq5mNiu+spvFLL0v0PsI9s9lE6Mf1sFpEKaIzX3nTFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781415153; c=relaxed/simple;
	bh=W3+4eTmieM3cY9bEFeOjHrqQAZYVYAjumT2PSUp8878=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q18S/Q7tEbShcJruoZsDGK1vZoUMydLz1iBDzp9vj8Nse+KcUP1rzQ/vZQxNQ458QS9PBKs6uejrZg4TvQNQGXqSaZV63FEWQ6dMGc6noaobEhqLCaWr+mr5BaXZg7yJ1fhGcaHMCNDZQy39RgEBLU9urjaz/tFAaVYJOQXWeY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6d22HTW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6d22HTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781415151; x=1812951151;
  h=date:from:to:cc:subject:message-id;
  bh=W3+4eTmieM3cY9bEFeOjHrqQAZYVYAjumT2PSUp8878=;
  b=U6d22HTWh3jygBEJlSHjJSn2s6iL5eeZaSF1QPNyujmnaLmkIiVqeevM
   xODgca3txAzgHRDBvZvfpjain38j+IBrVRgTY6Q2I6WsiId0rS2cLp8KW
   hXLRxzdmAZrQY6QKXHBF8RQePl4z5cD7oUtTXSww3WTGcRTXK8+TrQ+sB
   +CQUMZqVfAxZqhplM59OZjZPvfPpX8jDUaa8GoNY9MNEE4WHC/1uhbIhc
   Z6f1/QzNx1036RAneMM4AXXRtuc+hTmaXZ5spiFu/U6qgXKmYJWpboKpH
   VTgD+o6ifD3+VF3pKgvGI8ziQVYfPz6lkp/WjoWtbeWLVZ8wTPLqI+vrG
   w==;
X-CSE-ConnectionGUID: 3HqsgJl/TCajFn6RcPrhnA==
X-CSE-MsgGUID: HefF30uxTCa5H2QAe+S2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82256027"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82256027"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 22:32:31 -0700
X-CSE-ConnectionGUID: s6lPMNkmQ6CMjIsfyHzSZg==
X-CSE-MsgGUID: Q8nQHz+3TVadao9uPVhJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="252271397"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2026 22:32:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYdSN-000000004e5-2Yei;
	Sun, 14 Jun 2026 05:32:27 +0000
Date: Sun, 14 Jun 2026 07:31:48 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/17] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that
 doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202606140752.Xv3OPwam-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   32202562935a0f31664867f324729f0e461080ca
commit: 236d23635bae7a56449cee273112529bf220fb67 [0/17] anolis: drivers: support for xsc drivers from Yunsilicon Technology
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260614/202606140752.Xv3OPwam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140752.Xv3OPwam-lkp@intel.com/

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
