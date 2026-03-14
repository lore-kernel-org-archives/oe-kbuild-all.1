Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F781DA62E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 07:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773472044; cv=none; b=mLzl1/OxMOEvv9kNIXGkWyMd/U/UaHUms3xMoh67xRRM+5xMjwKB53/pSiX180XJwqdP0d8zfq3IQH9ZpPPjzYzdZwyfvgkReE1wrojXEYEQ1ioRRAvWCMMYcqq8QGtJJDosps30B9oThKvFdkykJDw+pGxGjC91Qe5l4U4OuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773472044; c=relaxed/simple;
	bh=w5lHU1jDT5uYe3hCNYeo/9f2ynVEMD+plxrnxxFytG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bc20vixUF1JJymm4cWv8WY5W4pLvcLQ3QqoOrxnZVGDzPhmJm0AEWCU+rVSI5EIRNIQJGFFc3H16p424NeHCFpVeRX5VI5/PSmLdoiyPEPsmtcu/2aoQYS01RI41BzEh36G9OEJRlfr7ewCa/Yhcge7bHJ8hYW4Jug2hdlNt2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRIC1JKC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRIC1JKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773472042; x=1805008042;
  h=date:from:to:cc:subject:message-id;
  bh=w5lHU1jDT5uYe3hCNYeo/9f2ynVEMD+plxrnxxFytG0=;
  b=iRIC1JKCuI2BmZTz3jMEMZfWwMGgJPopfPyfbPSnJCUrkSxeyB8v5yA2
   oX5Guuf4DMpwIjnxi3qKbktOhjGwV1DZimMrA065aGmrlI9FkdQvfxS0V
   LqYNDC+HF7ceRkmLH4oKNgIu5KWW0unKtZAh/8NOOhL9y4qRLcJd9R0hu
   eernCXSQQ5BpWDBmQwJasQKflxnkfG3zM0NLTkldkYQ2pN1nS9VNRlGT8
   4FG1y4n+MT6rwWwLIiBRb2hqnvH5V582bplOhvCMbC9Id/bhVSFcWvqzG
   CH1RVvLzBXAHiDjz3J+GcCMSyPziMnVHsT7qJl2wEIo0I5i3m+YJxJuPf
   w==;
X-CSE-ConnectionGUID: TueaZdqQSFafm+taTytaAg==
X-CSE-MsgGUID: MWR8OkCTTHeO02sUhLOqjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74604061"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74604061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 00:07:21 -0700
X-CSE-ConnectionGUID: 7w7Qa6LHT0+66CWpS/SHoQ==
X-CSE-MsgGUID: J7AyJ0yST4eXM6rolYwWQg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2026 00:07:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1J5h-000000003lF-0Eub;
	Sat, 14 Mar 2026 07:07:17 +0000
Date: Sat, 14 Mar 2026 08:07:03 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/188] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202603140708.VWYkV7Ou-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   c7613c5b9abe312616b29d60eb64cd4d557571f1
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/188] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260314/202603140708.VWYkV7Ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603140708.VWYkV7Ou-lkp@intel.com/

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
