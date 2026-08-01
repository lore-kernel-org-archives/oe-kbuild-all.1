Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1A63812EC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785582887; cv=none; b=RGmiZ8hS+dcYeHUdvLVOsQZT3rQM7jg+iyjf3k7PCDXY3gNWDUQ9H4uSYmgaKTnjdDzxGaZUTYi0s1aAq/0Qdq34Cqxj37FpaSpXNzRXlz0JTAOKxnoKWizS71IzCy5o93uxT2wvPSwJ6QxDhTmq/In/TsTk0olqQz4zsfhWpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785582887; c=relaxed/simple;
	bh=8b7CmUsaX67ewhgqWmhFhOGVyjsQTq0THaCfV5zTyek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eZsSqqhlqSU4Jw4bX64T4NJabLBgRc0ElgwOqoNHDuuP/nqwfCKeUQxH4JFDIji2+l65rLoHrvS0UnCBk2D6bTn+L0x/Z6chVOLaWjni2J2RLHORXMKaoNdo8shaxxeLEvve8zrxk/erFVtiLYWsej1QWFbkW6fdECTHfkGAtcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J97okGSB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J97okGSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785582885; x=1817118885;
  h=date:from:to:cc:subject:message-id;
  bh=8b7CmUsaX67ewhgqWmhFhOGVyjsQTq0THaCfV5zTyek=;
  b=J97okGSBVOyRFvmythq6hY9haCE8gRQLCrKEMOXD4qbpY4FYVIB/fcba
   80KvNrlwHAgSyG8bVtolggqHRpHrDfQ6PHIxYzYEIxNx3mmHSXxuHWcX3
   chpcD/+gIMRhDR9TZTTUBAq/NVsLk1S9CzGs8ZdCSjZD5IKVBULqM0joV
   rAKmTJSHb5g2gHCgHX65qZjZlDPqPm1j9xz7QdZqsehu/B3JiU0RUFQRO
   f7wEOQlBMl9MoiePNaV7KBGVs7BfWnufExWwKHIZaOM336Fyi3ZpEJKHe
   qlctFcxA59610drUsMWfGwTlCagE5ap+L1F/XFu4hsVT3HTFO2Y5IG6Q3
   A==;
X-CSE-ConnectionGUID: 5fi48Q4lStqwTRfpf434Ww==
X-CSE-MsgGUID: TO78h0C9QdOUAth6uFzdFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86145553"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86145553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 04:14:42 -0700
X-CSE-ConnectionGUID: eSvojG5STeCrM9f+rKo87g==
X-CSE-MsgGUID: YC/HmQRUSS+3vVb/rYhw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="259554328"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2026 04:14:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq7fq-000000003SW-3GGm;
	Sat, 01 Aug 2026 11:14:38 +0000
Date: Sat, 01 Aug 2026 13:13:49 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202608011347.VkZ7pWky-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/159] ioasid: Add /dev/ioasid for userspace
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608011347.VkZ7pWky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011347.VkZ7pWky-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
--
   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
