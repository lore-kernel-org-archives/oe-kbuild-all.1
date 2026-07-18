Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE442EEE94
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375124; cv=none; b=sbOI8Cln00bT1DFSI5gHIBco9O8cNzpYzmE1JJhen12BXrs7WPyp+3woBsciwPfu07rzo0mjOBt9x/xrg2h1npq9HjQuudZ2ATz8wc++PB3QiUpL/65gNaYZlfw4lERLkqWxh0LRLBHUV2hhmiJnsc+imUmeJmVWO4j0qq7swlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375124; c=relaxed/simple;
	bh=GMb4jxg1WXVHW30GLkviUU3FS5FdkTo/QFQVoqXfaHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ONeD2bY+5uJ+rirRWzwrQ5nj3JUPViwl2ftov7T57zkcTCchbR7NwoK3LkaBo+pabcFnIDNLc4BY+ZbMDDT4rCJ7diQSojfLT1e8mG6s+cbnaQllNGBIgmEKPJ2FSPMt3m200kydEvLlYbdehrjLcufadDQjDOnG2BLOZjlGlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYqUVty6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYqUVty6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784375123; x=1815911123;
  h=date:from:to:cc:subject:message-id;
  bh=GMb4jxg1WXVHW30GLkviUU3FS5FdkTo/QFQVoqXfaHI=;
  b=WYqUVty6BocTsGFv4UKBRXf72AqGcDRU2vbUHQfNrzHglS8n9jB9PP9N
   fz+/+4WMM56HUnK6JXlC9ifo0+6KVKwQ1vIv1bSuozFzd73Q6QN8BUgSp
   rSEdDn78s+dqSZbxZQkUyINFCwfvg7wl/XjbbKVWSBJEwabvJktCRDMNy
   09sm7zdCP4mhU+/Nng2X+eRvx/JrRhOmf9syzyUARvtDhZ9OJllFwFHSD
   jP+stPzhG8dy96Errc/NHTakJExtQO+jvaBYscO35NAm9rImo0UdK9cCW
   d95v/NOIUbqCpaUep5Anc2J2SitAjC1JXt7XRXgL6Br89aAOTSFW19fjx
   g==;
X-CSE-ConnectionGUID: 9360463dS3GQGOijszTqLg==
X-CSE-MsgGUID: 4Wv0g4jsTl6+s1+DuyZS7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84150990"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84150990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 04:45:22 -0700
X-CSE-ConnectionGUID: 2N2XkwHXTI6ayUymKiEfcw==
X-CSE-MsgGUID: s/4oLBmKQ6CHzfXA+AQafw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="287072835"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2026 04:45:21 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl3Tr-000000005oT-0WKn;
	Sat, 18 Jul 2026 11:45:19 +0000
Date: Sat, 18 Jul 2026 13:44:59 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/105] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that
 doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202607181309.zsapvmEp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liqiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f8a6ab0f5f0b5f85efcae83321abf317723182d
commit: 236d23635bae7a56449cee273112529bf220fb67 [0/105] anolis: drivers: support for xsc drivers from Yunsilicon Technology
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260718/202607181309.zsapvmEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181309.zsapvmEp-lkp@intel.com/

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
