Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923DE496904
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533219; cv=none; b=HUahBQEOkT1OEErWi1ILEitw5f+HQwP/uYOudc9GATvfLJT4GUsmbsQno7kZsOYMSDS4P/55ws6MMudk2VKESzIVwSjBqKLpt8FiPT5uOo+cvv0J1jmOxs3wxS05MbSHIti6fCWYD2aeD6JfdmOkjJ843s6w+FnvYB5NbG460VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533219; c=relaxed/simple;
	bh=yS7ruAQxbGeCMVhGAp45xrL+3L/lSXnmz9oOCXUHpT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BEbLSzS6c/vO6Rdqgvem7Oszx3A8MNlESQ02+Cx1Uc5k3R4VWDCxJIadHsNhhxDrP5vyGhnRwWAtFb37gpRP2K0g3+EsfWqeYersIBX2YxozS8i/Ot4ztjFUI1NbjCJ4WtLSHUqElW8Sot2BIUuU1h8e/VzqDkZAFdgf5POliEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myFTBniO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myFTBniO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778533217; x=1810069217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yS7ruAQxbGeCMVhGAp45xrL+3L/lSXnmz9oOCXUHpT0=;
  b=myFTBniOJxw8glBEDuQbULU71vG2e+6x/ASKortJNDEPEkvvqUdA4qZK
   wIYgo6MMRZmmfjw5T1/3A5U9yAlG8+093luXgeYGGC9i0cHGz8DD5Nbmw
   gzelpsqkthx3Advjv1RIq8rCeZmjfRlh/nHdzFvCdwQZ+ukAHwDpK7HqX
   I85CF/5h323B6IFHxaYvXn5umSVjbvBAG9pH4KF/cT+X06kE52/IZLldr
   jxwcx6DKyhiq7TxjnTQCSPGcDhrcPlfhglOhGtDN+8vANHsVFPttH9Hog
   DpgoR4AyW57pZQ3i1XUZebNWJYt/mkZsilv1ys4IzulJgOvTMNPfCRNiG
   A==;
X-CSE-ConnectionGUID: u7GDA8HeR9C64uyUkgjtjg==
X-CSE-MsgGUID: 9R4IDlf2TJG5qX6E2A43ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83305959"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83305959"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 14:00:17 -0700
X-CSE-ConnectionGUID: z/quadhvTmmd9FwlEwkfTA==
X-CSE-MsgGUID: ij7X6pkDTNmEkrYQ95o9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="261058715"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2026 14:00:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMXjX-0000000082f-2drQ;
	Mon, 11 May 2026 21:00:11 +0000
Date: Mon, 11 May 2026 22:59:27 +0200
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>, linux-doc@vger.kernel.org
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 21/30]
 htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
Message-ID: <202605112207.TL7dR71j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   165e81354eefd5551358112773f24027aac59d5a
commit: 5c44f48e91deefdd42e567a2779d331937c97cd0 [21/30] platform: arm64: Add driver for EC found on Qualcomm reference devices
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260511/202605112207.TL7dR71j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112207.TL7dR71j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
