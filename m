Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D3721FF55
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 17:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315987; cv=none; b=C6HzS1nJxBfqTCXGXp81dcxDw7vJ9HFpEwarTSIKDuPFv26gnTvXdoiYfhmtbzM/WU06anHYME9x/H2ejXVoxFlD6/t8t3iR6HwcnQAPMaa3P79LZkhRGjfrH6j3jXuKg0g9Bm7e5alSgQ+f3ZGytFovrljOrK/p80xiuXb8RLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315987; c=relaxed/simple;
	bh=PdlqMmzzzQwEbQlTCDyJMMIvhd6Za51T3Hy86aWFKv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sav1QH8O2R645cexh7HCOkD93sEGfT+RF1ScwyrJO2fyfsXvfRrlmdnrItGM6juO+KWZOSeUp5V19jOQ1rxpHxiC1WYzKR+qTKrhF4kwerjZjE/UOTiL6J/0QhjNPXUnbXuDc0QgWU3sNlWmug84ZMhKGqy2OBEmeOK4j66LXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hltHCzzd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hltHCzzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315985; x=1787851985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdlqMmzzzQwEbQlTCDyJMMIvhd6Za51T3Hy86aWFKv8=;
  b=hltHCzzdOO7pvPgp24m+lR1fv6lYBwH+nHe3X7CO+gF1hRWU/NH1KrvV
   jmwXmKXX7J/XCW34qF9ImcEdLzPNZJVI2lB+hmPkyl95t4R50XP/f9plw
   hTCae0WdT5U/o/XyCiAYqbvVqpAYFdsoBJL4LsD11fiy/eWuPUR17g1t+
   /VmNe6HRckW63sEfV117ikniYLZyxxQft4QxlkDvGsPSHImPjn4DVuEfL
   h4Vk8YXe2xQlLuhyugReHU2KGoD2hcePvu4taW1E+fHyp24vas6YF7p12
   s6yT0V2WB961jy+8BVkV5AB4ChWq3MpD3c1lPkj9z2QEIMj/4JpGPcnyI
   A==;
X-CSE-ConnectionGUID: P8fP3qqySJO2gSq7AXfzcA==
X-CSE-MsgGUID: 1WhR1mHSRRmnDV6vd6fgxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68845945"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="68845945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:33:04 -0700
X-CSE-ConnectionGUID: 4cvOrnK2THmDitu52F4aNQ==
X-CSE-MsgGUID: +0esWMCLQyucV8adnH2ppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174233962"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2025 10:33:03 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urK16-0002gJ-3D;
	Wed, 27 Aug 2025 17:33:00 +0000
Date: Wed, 27 Aug 2025 19:32:44 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202508271930.JBcXn7MK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   ec0924f318b78f9cf68f73a94e22131d79f88bc0
commit: 7a025ab026a1cbd5622c8b14875b9e990db7a2b3 [5/5] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
reproduce: (https://download.01.org/0day-ci/archive/20250827/202508271930.JBcXn7MK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271930.JBcXn7MK-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
