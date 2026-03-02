Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732340148A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462709; cv=none; b=WCZheMTQthgguxlkAKTmOKNK2hd0LC5xrOXDSAf5TRzU1QMda9cMUQwukEqtFDsJK46hJzPc0tSDHZnFeLkgqbn+/ZPDW8OLCxtmLdz/JVZhiEPoRFAtD+CgTgosxbpLMshfr5mez1KFi74geZZhSIfJEfVs/4+vkXAQ8VUXh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462709; c=relaxed/simple;
	bh=LvcVjutaQ5itsACoMwFQ3xfs+DWwSkEUaG85E4fZGgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Edxa7NhUHQbf9uvf4gmRZes7rptePn+mG1F0Whxd8iVntkvQ881/bt8KV4KeGgWN3KcFb4VafaSZ2iwZyOcC0RqO9bvVPRdQ582j+pfQIHT2c66e/qLo2lRHATsxxaImNv/KelUrUq78e5msqNtTHakM4yD9Ltmw5d6IAWTtnJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0HYnfVv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0HYnfVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772462708; x=1803998708;
  h=date:from:to:cc:subject:message-id;
  bh=LvcVjutaQ5itsACoMwFQ3xfs+DWwSkEUaG85E4fZGgw=;
  b=J0HYnfVvC5WHzXrhV7Ic4cZIUutsBLhsGUJMMeP5OsryLX0WfFRLygJv
   EU4/vejNkfNrSqvtM+fsClYZYgHIWhEYpm4LCjvIeRuL0y4c3mD4IFLvH
   yTIxNKiTsW0utbC44jWfEV0xEiilDdRWQ4QdIIHjuozcPy2gJhnEMCfee
   Oms4jtw6/bT1v7GQLWf0CfLj82Tl2EH4Ceo5HngrTzl54raB0bwgv2f0I
   LRjrXNNzomQ2rEfnIGstwC5BqXghHj1cQSkltjSXcH+ef0TD8AB7zIgWj
   CXRMlbtATbyK01yblC54cWGLBbZLu8city2DuDnKIwyfYucvtPjoJqlP0
   w==;
X-CSE-ConnectionGUID: 15gt+TAKQqWs6s1S2Y+0wA==
X-CSE-MsgGUID: oKWQ+3EfTLKPYE9XxudocQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73370791"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73370791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 06:45:07 -0800
X-CSE-ConnectionGUID: lS4KJfbtQDeKSG1cVnr6IQ==
X-CSE-MsgGUID: T/B/pzjCTR+hCdoy9MRH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="244719211"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2026 06:45:06 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx4W7-000000001E9-32z1;
	Mon, 02 Mar 2026 14:45:03 +0000
Date: Mon, 02 Mar 2026 15:44:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/6] htmldocs:
 Warning: Documentation/filesystems/erofs.rst references a file that doesn't
 exist: Documentation/filesystems/dax.rst
Message-ID: <202603021544.QGt5nDLD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8426c769398ef6f4ac3f61df3f3ec10bd11b0e50
commit: e745179c76d0b623f7fe543a8c905cc198145c69 [0/6] FROMGIT: erofs: dax support for non-tailpacking regular file
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260302/202603021544.QGt5nDLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021544.QGt5nDLD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/devicetree/bindings/usb/exynos-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/omap-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
>> Warning: Documentation/filesystems/erofs.rst references a file that doesn't exist: Documentation/filesystems/dax.rst
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
--
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/devicetree/bindings/usb/exynos-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/omap-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
>> Warning: Documentation/filesystems/erofs.rst references a file that doesn't exist: Documentation/filesystems/dax.rst
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
