Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7832153D8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785590755; cv=none; b=Cn8c/IeDFFIVZEaj/cELF5oeZLngfq7lEjp0E0ikPPnMhNvWSiuYs1k276jMjXjAqqGjwFDSQUq3ubzehTowb0GTXfGucjZSzongIepV6btOqy6bbnrILKLQED47YrtSqfNO4BvPwflhp26jmo4lgHXHNpI6anOUyr4voIdf5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785590755; c=relaxed/simple;
	bh=SljVAJICwSU+kmc4x1RAwB1rVAXTC05p1lokqRpD9XA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y9tr4WHMQ/PBudiF19r/AD57HK1WmVHfxCSTImTiHi38zY1/tjtIEMEkAvzjWo6hkeNnJhlatE9Fm+TRgQ1SyW7AiSdF9YjTp0SNunVb9EC0yjoI9c9gOVmsaymRIMXT7NV2nUV0FfijKiy16Jdvo6/KJZfhZUxRnv6m3/ZhtVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pd2LCJoq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pd2LCJoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785590750; x=1817126750;
  h=date:from:to:cc:subject:message-id;
  bh=SljVAJICwSU+kmc4x1RAwB1rVAXTC05p1lokqRpD9XA=;
  b=Pd2LCJoq+aB3UFMgjQhQHyb1qNmf9oahUiZpl0BgmSwjHocylKG51jS6
   8Hnh+dNaVWul3xxBAGcsjDBeSj59YlKH+4Q8/ZiuhsKfENrihSUw0y4WN
   o4U7RAAojGyu+Ag6tAmovBAPjqqc6HN1VwPZmaWf16tolqVVo/5zAL6dY
   tlivjJXLAuc0+ql0LwOaTqfA1BFy3lOC8/Leoa6v7Uy9KR33qdfGMeVvG
   bWQQGMpKFhtSBZ0HIBbYn2ium73x88nm07xXAjfrTgPFFkRn7Oo/Ci1dt
   XNQ0GLPNDYU6sxtPUfzpPMT5BfFSoEHBgI47uT4wI6t8/ha3ll4sTBsqV
   w==;
X-CSE-ConnectionGUID: OhP6vVxyQ1qX9Ki+m4lk7w==
X-CSE-MsgGUID: U9McpclITMegi2TcQmFCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86282214"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86282214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 06:25:45 -0700
X-CSE-ConnectionGUID: aym1LJKSTuKChwZgknYsDQ==
X-CSE-MsgGUID: VzAFfcf/Rbu4RdzFnH+0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="258133748"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Aug 2026 06:25:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq9ig-000000003Tu-0v57;
	Sat, 01 Aug 2026 13:25:42 +0000
Date: Sat, 01 Aug 2026 15:25:22 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202608011503.qNiTGSWt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/159] coresight: docs: Fix a broken reference
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608011503.qNiTGSWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011503.qNiTGSWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
--
   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
