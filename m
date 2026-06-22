Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90234EEE3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 04:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782100973; cv=none; b=OqwxpkBDnAKaBuOBcwyrDkwk/vtr6VhhV8Xa/jPHQXJUVhqwabTicdOfYkTx4T/LzWMozllPRILeMLt40RUl/16Dd6MksSDdJ8UYqCeidPcp2H7SiaJYVZLtKH91yp0VVqmZaR4OCWvwqnMOOUnghI+xkhtGrhRlJTyn1PphqcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782100973; c=relaxed/simple;
	bh=5fIdmR5IV1jx0YaLuAPpIvYuMyTWksa7abZI340diGs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sYupVgAkIjTrnx0mP2ZPjzIxdaett+a7Sn8wHeYdMt0+UHAluDKKJtSmvIurVPyliRnohqctKYEWSwNmGr+nbxcc0i5c9HId6vvWC8P67opny6TNyBBoD04xf/EFTkJEKWCSauczPAwQ/k2ZAaDouB2zkidFMOWe3+REjqOugtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbYqOjWj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbYqOjWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782100971; x=1813636971;
  h=date:from:to:cc:subject:message-id;
  bh=5fIdmR5IV1jx0YaLuAPpIvYuMyTWksa7abZI340diGs=;
  b=TbYqOjWjWVeKfyritEB0WjjL6rw3W09PzI8YSHz2UhiZrevR9VcNjUbA
   9VRe7haaYLtaZUpXHAP/yn0YndN2RWYn+Bu3jUl98eNwMoErO3JmkxdgP
   KXNv45eRggg2L2XXtLiRD+9tHsWIIK0CK4sSchd2OS975GIkMxUX4iVoy
   gr91qP6/IPp6nuGtTmViEgzOczrFjlMTd9hUhuisN/ZroMD0BtM9emHG2
   KE/829do0xSwOlJ/blnv18/VQBmvhPcNWq63x3btlg2HREjnubJa2YdQf
   pdvzcxprI1caNDtVvful4h2Rajw7cGELjtU4W6dOCyJUV8ae9amkfrOCz
   A==;
X-CSE-ConnectionGUID: iLsslyvYSU2xgk0uRRvFhQ==
X-CSE-MsgGUID: 1aHe5dnCRkCRXCCX6Rtz3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82596951"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="82596951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 21:02:50 -0700
X-CSE-ConnectionGUID: Dxk7+g2rQJyjjulHB0H5mw==
X-CSE-MsgGUID: 38I6ANHMTRexpOhW286sdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="248966147"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Jun 2026 21:02:49 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbVry-000000005zt-3ptS;
	Mon, 22 Jun 2026 04:02:46 +0000
Date: Mon, 22 Jun 2026 06:01:50 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/27] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202606220523.TwJedhYV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   adb3ec6f94e47cb5edefdc73edd6eab1dde70fef
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/27] coresight: docs: Fix a broken reference
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606220523.TwJedhYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220523.TwJedhYV-lkp@intel.com/

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
