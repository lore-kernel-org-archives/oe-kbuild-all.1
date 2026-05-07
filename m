Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261836166F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143004; cv=none; b=urUXU+jGUXRR6jnxnZfCACwwj1bchWw0Q4vTcEpVk8VIdleuhAaZc8uFSx2gnyPkyD37bLRsTbsToAU1CrQNUVSfAbCzbJ9CgYlWR3GPu+pnFy3bptajlfaZWcX4onGqu8ldThueeDhm/cZSqZwkOgc9vTNvGFx6zdrGJwSxVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143004; c=relaxed/simple;
	bh=RnA5gU+17anntm8jvTXZN7rNBqJgF3aFPqyvBa1dzRA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BXBjnWQ4VvEIFo8rT+5fZW3FsMY/6wdzB3e4otQarY/MYRm0hQOdhHVMMyTrWphOFw9zqsIPxmB23MAvXfkPnGdBGvh/j7sifYz7rKBbMSebGlHZxSGSObejPlcv0yonXHXnUr/2sQwKgOkoTvJ6+EFOJCBmgPjSyAzDZZcXHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNCxgCjW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNCxgCjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778142999; x=1809678999;
  h=date:from:to:cc:subject:message-id;
  bh=RnA5gU+17anntm8jvTXZN7rNBqJgF3aFPqyvBa1dzRA=;
  b=jNCxgCjWBYUaFrtca1rOfRBJeUPH+mnD5k+/gmh/FzXRq3n66xutCt5Y
   MJIMZO18V5YzD7RyIE6F5y7zvtG7jxykXwFZdGt8b1snrDnmEomISkC/F
   xwH1lDsAQRegMf2hRQWCncRGaRyQmAf6HBj6qAVEKiyC7rFnUonX42JnP
   gYO39GrpnWGB9IqPxFbJo4OAamJeFyuLPDpQaQIChiD/GgnO7azY53jjT
   ZSvge90UaB3T+2y9XMAnxqjObaZqCOOTNKcLAglKqUzS9i758KmMAZeVh
   JIKsAMEQhHoWAzNB8tAihdkb1QVDIdRfW1/+oMbMWznFhqh9JAg62s8nl
   Q==;
X-CSE-ConnectionGUID: Q4lBTarbQ/OKFBAf7e35nw==
X-CSE-MsgGUID: dQMCjfJMSmSblFY3QL4MNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="104546557"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="104546557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:36:35 -0700
X-CSE-ConnectionGUID: J6Li2hlzQJKuxAYvkOSqyg==
X-CSE-MsgGUID: QY6HKXs/RGWE/qYmj5qoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241382940"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 01:36:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuDf-000000006nB-20ub;
	Thu, 07 May 2026 08:36:31 +0000
Date: Thu, 07 May 2026 10:36:02 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/20] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that
 doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202605071042.541loCdh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liqiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7869ad90f786f903dadc68707ecf94fd3e89b98c
commit: 010d87517fe5ef837b847f17db54328aee3b6e07 [0/20] anolis: drivers: support for xsc drivers from Yunsilicon Technology
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260507/202605071042.541loCdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071042.541loCdh-lkp@intel.com/

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
