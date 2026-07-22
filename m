Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2303CA4A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 03:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691668; cv=none; b=Bk4+yAjGHm2EUmOdqqoLLLCSud0Luh2Y777wD/kGjR79YexG0O8cYvxPA56ui28ztXSqwUBTYvfusRApKhTK4pxVyzoBhgDKvk6YeoATXYiQGMmREI4w2cHV1+feu4DJv4KkayVnKOITeykq++PdiOmehfhnCivr0tem9BovODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691668; c=relaxed/simple;
	bh=cxjKITW/kFgxFK8bzfNiDEj39FZ/WhzrXjgH+LURSnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IYb0q385xgxnJQ6+JNcKRgmEXOil0dGZwPqLCSpGXtgpa/Wq/iy00D6uMONaodErBss/np5Y84e3+/tCkO3t6wCESZuOMiUgr7PK1RrSGY63GshI/oRnL/9ZxHRi1P+0RlwSp31cr7qGvi2Tn0GnZnSBM+1VdrNhH/Qm/og+8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euFHvr2l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euFHvr2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784691664; x=1816227664;
  h=date:from:to:cc:subject:message-id;
  bh=cxjKITW/kFgxFK8bzfNiDEj39FZ/WhzrXjgH+LURSnU=;
  b=euFHvr2lOYX5p47njX180Bco+MtYwn/Tq8sHIvYmV7plyDB3znf7yF4Q
   +4+cT7ZHWkbB7fEMeRCF5WztCjjCbEOJA5b/NQvbbE5P7K/+TQ2XUMGF2
   6QA/vmNUxSVT2lQa1h6adJqa+lOT6TBClCdwSLxwoM6pVBxy8UhcDUMck
   4uLue/UYEizuHW4kwdF0fXMUKywRjpFOoyisW+OLMg6XcVooMox5pqdx3
   Vh32nnVGJscsSSshDMs+cp5H8vXvs9nKD8QodvOjSVS33K7lFfhDbyBSZ
   QMV8qr3pdKZOlXz/vuxWQLdEvPdnCVj4kGB//EOr57amjJOdRb/+NtWFz
   A==;
X-CSE-ConnectionGUID: qPg043Z8S3yJGx3KTFi87A==
X-CSE-MsgGUID: Ko08frtISICVBCFIZIWP6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96684793"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="96684793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 20:41:03 -0700
X-CSE-ConnectionGUID: yY907YXFTwelcZOvMwAW2A==
X-CSE-MsgGUID: vuhq34rvSaCiuNDf+cGURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256740084"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2026 20:41:00 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmNpK-000000000Du-0yfl;
	Wed, 22 Jul 2026 03:40:58 +0000
Date: Wed, 22 Jul 2026 05:40:47 +0200
From: kernel test robot <lkp@intel.com>
To: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 1586/8209] htmldocs: Warning:
 arch/arm/xen/enlighten.c references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/xen.txt
Message-ID: <202607220529.ilLrtj8D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: 4dbfe54674859e67b3564ace6cd8a384dfb997ad [1586/8209] dt-bindings: arm: xen: Convert to DT schema
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260722/202607220529.ilLrtj8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220529.ilLrtj8D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
