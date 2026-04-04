Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B033B6C6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290436; cv=none; b=NuEsEJ/snM09geP1m4J/lN2bGUaT0UU8RNyLy6lkfc+Tt8nrrP9u9WyC5UIGXK6NgNx7iYoI2FWhh9AWwaTuTm8mQwRndLPB3QohQKMtMWKtQca5OUsev7uimiULCfycU/qV6vGKjUlkUvtWnq8+DxyX+Zcxr0Df1uB0hEM8kDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290436; c=relaxed/simple;
	bh=Ux/KkYrwCMnIDVcan8H9J8tUlKzzr9fCywRde6VKZho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CLSnU7WcTr80EzEuRUzH+U9LTWVXDI72PQrVb+YkRDvEYXePoJe4wJ/EdYF8vxi1AeXkWiEmvqAQiFv+cLLd4BZ4Nd3kqCc5TJQ05owfwrI15gDIjRlhO0uc0tktTYQ7Ck9rMDPoDwFpdQUwiKTPUfxOFXIEycJyYBRiSNcjvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSzUdPzd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSzUdPzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775290435; x=1806826435;
  h=date:from:to:cc:subject:message-id;
  bh=Ux/KkYrwCMnIDVcan8H9J8tUlKzzr9fCywRde6VKZho=;
  b=QSzUdPzdB9uFJCTYCgnFXHEmGn1ERxUjyZTkHPo3uz1FTCHY3FaQjIEx
   JmCfgvUZkjL2qXrSYoQ9MqdSH3jCt7CCkCJAHsCYmFsEcLx8E4oZA2StO
   GbssV3fHR2KfL7IobLHp5D4Epu5nuTOAHTKGFESiNvfakYCqWc24wmXwj
   OOVWavpgeP4d3E8Kg+lAqvlhwYAEo66gjIGklybs9w7jW/s2Lw0IVOXbC
   3BWZjlcb8SGfP6bvfOLv0T6Rq0OVBSOJDmkjQhqFBKOvox2lLUE3WXpZ5
   nz+eO6CfYv9DE8FCHpRA+fXM6k4CKO2oGiraUY6YmWbFiyfHBj7RP47DE
   Q==;
X-CSE-ConnectionGUID: eQz714OmTeK3z837MgnM2A==
X-CSE-MsgGUID: PHCRx+MPQp+s8mfAZe1hSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="87723188"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="87723188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 01:13:54 -0700
X-CSE-ConnectionGUID: krth7SfdRJ6nkLvHBANK6w==
X-CSE-MsgGUID: lGFpdBo0QieT82t24AjiNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="226443751"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Apr 2026 01:13:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8w8c-000000009Yn-0ipP;
	Sat, 04 Apr 2026 08:13:50 +0000
Date: Sat, 04 Apr 2026 10:12:58 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/12] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that
 doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202604041025.wdCNBRwX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   bdab5db454db7109fdab2148baff2b25b7dad27e
commit: 010d87517fe5ef837b847f17db54328aee3b6e07 [0/12] anolis: drivers: support for xsc drivers from Yunsilicon Technology
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260404/202604041025.wdCNBRwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041025.wdCNBRwX-lkp@intel.com/

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
