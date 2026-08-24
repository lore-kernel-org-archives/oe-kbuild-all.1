Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB82F0673
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787537034; cv=none; b=j6WIxzIUpxIPkCWuPz13vqPi+2E2YWZVlDPtHNLkgEvUmyOSh7xJ82yyYXKkcsCgATK+Hjw1nn6bQK4SVNDJIC0twZyqC9ACIIHVNvez+AXEOf0X1+lLyIXPUSROe19DKaVdLlZaVy/Lqzckf5mHucODq84JrME2MH+unTGZxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787537034; c=relaxed/simple;
	bh=UrkPFQ3vGt+NXuvOFesFl340GJ+NMBtUZTd8q7IgJFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IZf5wlzomhA7yv3t+HsNIwU600Dg2sgzMizYTOX8stFPgZcKoOI8nUrB41tPBrZPWr5EgbPWQCxDnlqCi3l3RXdIWV/tR1GFwRS3OB8nlA+HJ7vJGANoNasd/+LB3GIdhiAINGKUYTX/OPtE9Yx4dmlpRELckVu3XFS1N6MfxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+J94s4Z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+J94s4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787537033; x=1819073033;
  h=date:from:to:cc:subject:message-id;
  bh=UrkPFQ3vGt+NXuvOFesFl340GJ+NMBtUZTd8q7IgJFs=;
  b=B+J94s4ZBWt4QLMudBpL2po8ClFoZqMVBRBnIGpeNCYyZBylrSjndKtB
   Otjk+UkGGTYHLysdsvZPJYr+b7iNxYd8jcTDtpQoRUSndfJAaViPIpABk
   691Ay6F7vXG4UN0Jt/WpWQWQqGs/0jVHL8YQUvHKI+bIqM4m/ZvlZ6yme
   00P3w2fXHj4DBXQN7RhppLerZeoAvk+QfTawfZ0JgVQ7e7Y5LZupK8CbM
   ZdoO1O3Xc5yhoaTKyhNkIqCD21CBAiOlI4NMq2VPubckVtlYlyOMOwrQa
   GwMDTfFLdBfWWzl6HQih90aB9Ful96znl2S0mxiEEUMlLkVgmw62Mu65U
   A==;
X-CSE-ConnectionGUID: kE4fD6JdR/K1unkkaoDwPA==
X-CSE-MsgGUID: 74UuzbhXSSO6H0V+COT/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98572682"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="98572682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 19:03:49 -0700
X-CSE-ConnectionGUID: 3fK/AQR2Tx+8ebbUSawbHw==
X-CSE-MsgGUID: 9ZuvJgHbT1K9d+JzK2ajEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="305064356"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2026 19:03:48 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyK2L-000000000Bj-2eVT;
	Mon, 24 Aug 2026 02:03:45 +0000
Date: Mon, 24 Aug 2026 04:02:52 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/158] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that
 doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202608240332.fNd9gquG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liqiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   fb512bc986e8e5e13460409fae533531d54fa59b
commit: 236d23635bae7a56449cee273112529bf220fb67 [0/158] anolis: drivers: support for xsc drivers from Yunsilicon Technology
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260824/202608240332.fNd9gquG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240332.fNd9gquG-lkp@intel.com/

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
