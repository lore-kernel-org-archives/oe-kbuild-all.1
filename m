Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1F21255A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 04:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781412096; cv=none; b=NHJM1bNqnF6oW8Mke+gshvF4D7QwAVV4CWGAIshLbYd1AjhJKQcZnjxD3L09LRJjjoh/8TFbmxxM2jEh8ni2DkbP18k5n8ZLCazs3ELlM8bBFE0CGcvdxvQzjtEymUwEW3miXIL8LJocVOT0Av7TCFPaxS3cglks+8eTwwItiKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781412096; c=relaxed/simple;
	bh=IuUVjR0H/FfTWwNlOp33LVCMS9U7U49U/vVPic5tr8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sjmPdhNEA7h2Vtk9aeQ0cWfosIyFlHwmWaCjzEWEJDRb/K9huZHB49jKH0hnMRP1Z7pU/UH7kszxJjqsvHf56av7jr8uYiRaDQ4vynOok1BnqwuHRlg4XwfI9DadBhCnnaD5ql70lYOQC8c/m+qkXzupIEgWjqdVSCL9DdU4H5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFsiYn8w; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFsiYn8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781412092; x=1812948092;
  h=date:from:to:cc:subject:message-id;
  bh=IuUVjR0H/FfTWwNlOp33LVCMS9U7U49U/vVPic5tr8I=;
  b=oFsiYn8wYPGZ8CcAC6Va0waBgoNyhL7IfPGvZXuSx4vaQtID/o8da1QV
   MbfByyPK0jCPBMCyHcKE2bK93+xFpJClZCc0fB/MM0ir3ANfIQ9vCcGq9
   3d9dLQ1f+SIuOTy3ymhBEr54jdvxWrtSs5ZjwfTYrZaek0gGBJTHt+t/V
   RorUgLBj6/fLcug4qwHeBh319Pf4I8LTgelf3Z3E8SveBuMKJgwsoP8ms
   xKHehysC8NEDNxBQDKwP9pOTmFwNiDNgJt1sjyFKGytfxi05rRBCy0+jT
   7gU7gMWrdgQAi04dd45XaXwN4DJdFmhRFS3o3G+vZ3E0Yl5zes7mYUyk9
   w==;
X-CSE-ConnectionGUID: R0GDhWKDSrav7Nqxmskj7A==
X-CSE-MsgGUID: gIjeZ7cnS2+Dud1uYphVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93682109"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93682109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 21:41:31 -0700
X-CSE-ConnectionGUID: Kan3QVesRRaIZB67zOB7YA==
X-CSE-MsgGUID: d3H4S3KzRp6CPhfKnIX6fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="246063109"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 21:41:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYcf1-000000004dh-19ZA;
	Sun, 14 Jun 2026 04:41:27 +0000
Date: Sun, 14 Jun 2026 06:41:01 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/17] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202606140616.qgMJabWa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   32202562935a0f31664867f324729f0e461080ca
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/17] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260614/202606140616.qgMJabWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140616.qgMJabWa-lkp@intel.com/

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
