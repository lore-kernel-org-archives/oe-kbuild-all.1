Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9B3CB57D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624221; cv=none; b=gT7oljm1AuhaNss1hSTDd4/ft3GpPzhBB/lpFu1NdwC0fUJE4777YKDZR+/k4NwTru7pMrAUV7GK5vqVLBAZztz0kKiMJLUc6lLujvlfHSGtrKxq+EHQ5BJ7W1Xp8+p/5E5OuSseATD4z7EjuSg0Kzn7mbPXA5y/IwkYZ//Gw0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624221; c=relaxed/simple;
	bh=ILfYiO0MhbW1zoMIbahXZRbZGKXHZWe2m1SkNIHP/sw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXWC2V2OUvTobkPUuKSk79ZGrYAHppQvVwUJBURiCygPOufOMzT1RL+deobsdKEtQ3h6eQVWz0tE31E0Ir5mWhzf00BWMGaKDAnf1DgfSorlfzHV4XphqP0jEIyxB+v3h6zlP3tNgDMBZ9ALuKpyrN2AdCDqFCE1f5BdBCw+wsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAESCeb1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAESCeb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791624220; x=1823160220;
  h=date:from:to:cc:subject:message-id;
  bh=ILfYiO0MhbW1zoMIbahXZRbZGKXHZWe2m1SkNIHP/sw=;
  b=iAESCeb1W+FzrxxOU9x5ldZoivrN/J4B0Hj2MJeuhM01tgOLxgOkjadb
   iqfmzMc+YZRyIifONm3zRRcweu0Jm9zR4MNNkAvSsNhlLLk6tHMw+uzcP
   eJK1pRHoByc8zQGruFodt3mFT6pkmgSTz9++lFNghJkLaTBwjn0ptkecJ
   e6xgFnDxKdb62TQhi4CHJIpBp9GS7vnLA/61QsSZRD/LxBnknMaOBGx+w
   KifQXCNCM/BF+l3bzOuXywWCCaErjiqs5iQv5wBhivGlWi4FeV2V+2lE3
   liQqAsBVp1StycxEmEEJiTaMwiwWn790xwpZ1IlrVg02LGFTAmLn6bCkb
   g==;
X-CSE-ConnectionGUID: J/KpKokmQ1eIpJh/pOhQDw==
X-CSE-MsgGUID: TkjL4grXTjOALJPINyP4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="406582"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="406582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 02:23:39 -0700
X-CSE-ConnectionGUID: lNg7t6RNQtG5PwmK5uPjmA==
X-CSE-MsgGUID: BC5xsJsqRBW2nPHg+CCwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="823798"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2026 02:23:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFTIl-000000008d5-2U0X;
	Sat, 10 Oct 2026 09:23:35 +0000
Date: Sat, 10 Oct 2026 11:22:37 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202610101135.17yJ7PcB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/14] docs: cgroup-v1: Add IOASIDs controller
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101135.17yJ7PcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101135.17yJ7PcB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
--
>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
