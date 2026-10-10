Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C383F6C3B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629185; cv=none; b=reoW/R5/CzfJX8WDEWhtTOxLmqrVp9C8BLPn7cZBGBNpHr2f1O9sanCpyDIAd6PgUGfZ89AzjwcQ42a9MKQpDYfQkR4zL8uAo4wUSGsRvwALg8lYK9sucrg+AWNt+A3TdCRwKAEF3kK9xAuBVbAY/HFV16cyGx1wA918Pa+hgkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629185; c=relaxed/simple;
	bh=RlDOzBd+kmVlLQ6MfP35Y8+IIeb9vH4yv566qHRANfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VqJaOMvlZj20wbcvMrr17oTCK99XqhZwJmMFVDjYdOcZzqEMxJ/M41XXsSYrBHU95jRd5iMAE0dZ5VOYh7ALDqaGccNKtzS/D4Wy3tnuilRVVnwF48PMDzLg+of3O99VwGOsptqmx1fShaSNYBJI6rjNJP8R95Firci1ol5/sPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0UxZwcU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0UxZwcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791629182; x=1823165182;
  h=date:from:to:cc:subject:message-id;
  bh=RlDOzBd+kmVlLQ6MfP35Y8+IIeb9vH4yv566qHRANfY=;
  b=l0UxZwcU8WIdEgeHYW+ADyX9lMdE20sWjuPEIhj4DChhK/4E1oPpPUAY
   fqe6gGv1NmWiQrEgnVqEytmpWaCOSps1PlLBBZzmviLuFly0ZYa1ENk+c
   CbBHbyy6yPZV4crpC88R1uXXwGzJlM202XWWyZJPzaB5oaHwg3VBjEAvY
   xdNMrPyfRk3cqgutFt+a2ghvYc8urkOW2pFzioFetUJpamAOJvRSZDcdk
   vBHhoDSURejYcN0oenoCZ4oxKE/oCZvlKKSQo7c1pTAQM0V0SXscrbb1u
   kAkQn68XNLPNoYOAA8cVCS5b8U7kqJq/n0ahpoN5la0DadbPQqVLTvrMg
   w==;
X-CSE-ConnectionGUID: PcNeA9IdT8yefoe0i1tuhg==
X-CSE-MsgGUID: xf63xPz9Qzq/2qfa1QGm4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="313146"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="313146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 03:46:22 -0700
X-CSE-ConnectionGUID: V2SdX07CT26iynG47DkorQ==
X-CSE-MsgGUID: 7Cs7TKLARCGPNf0tCu0dDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="600273"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2026 03:46:21 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFUan-000000008wx-3sNZ;
	Sat, 10 Oct 2026 10:46:17 +0000
Date: Sat, 10 Oct 2026 12:45:31 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/195] htmldocs: Warning:
 anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist:
 Documentation/x86
Message-ID: <202610101215.vByoHEn3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tianchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   cf8b9c0b957f45db78a5233576f7c57c3f615feb
commit: 5c79516ebe734e67eb8ab9847049b332100d0c25 [0/195] anolis: changelog: sync and consolidate historical changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101215.vByoHEn3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101215.vByoHEn3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
