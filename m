Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD1214226
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496490; cv=none; b=BkoiRc0cS1d7l++EAtCUijpGxzk4dMtfX0jrHtcBO+qpNKf6q4rIdnNGU8nIeCvIEuwKGoHaiRmwFLo9ex4MxuJV6E+MDP0KWK/imdDaLW3VjFGyCH/BtT1zQSIXEQIPLvuL3yWRACNcnrWa9fbaTjd/Cj3LK3chPZoS90b/Des=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496490; c=relaxed/simple;
	bh=OxzzFqHFsdx1ws0TyFHweT4ooDKCw15cbuNriT9NDDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLnebfdQRoR/nxq1kM+5ITH+X7Zq5Hy1+vvEy6N5njLRH8M4cGM32EA5422HST1ZN+zrbZ2v2KagKsjoxMdiocl0KZKJLnLe05jW79Fjme5tZgrrzu2mZjqglUbA0l6MD4r1z7lUWNqJhwLfX2280Fn1vsNoIH0eRzOA1Wn8C7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZN7nuoN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZN7nuoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745496488; x=1777032488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxzzFqHFsdx1ws0TyFHweT4ooDKCw15cbuNriT9NDDM=;
  b=HZN7nuoNmvFX+tfEGqvMMbcPQz9tIUMzMKYsesqPjbsmaIky6WUvRC1P
   RDLHYJd8PkNS75z3YE++9etBauljF2VjdJ/bRLKGWJqA4S/BS6GFwd0eB
   rCb6ctdnVa1+NqVpW3uBjb04k76+czrki9RePfgP0CMjv6M+Oba/ty/Uk
   msgCgracHWle96VW36YimYmH5sE1YNoPGJuw0BzGeH6mMW8pLxlWGBZCc
   LUq3Z58CATob5HjAU0Q88fq8BgklAygfg4OtOQe+NX7BN08yf5jE5DCl9
   b2V/sywZr49y6PPxc88LPvE8Zmrjc5y3twqkYVT8oEZjpQcCQGC/Ia1Ci
   w==;
X-CSE-ConnectionGUID: QcRDKapmSYyRc4oW9sbE8g==
X-CSE-MsgGUID: ugN6Db5dT3+p/s3RwRb5ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57776545"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="57776545"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 05:08:07 -0700
X-CSE-ConnectionGUID: LmONTds/Q6O+Fq+DTPKRvQ==
X-CSE-MsgGUID: qwsgce74RkGrqmhc2Ub/AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="137773492"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2025 05:08:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7vN5-00048j-1p;
	Thu, 24 Apr 2025 12:08:03 +0000
Date: Thu, 24 Apr 2025 20:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 4795/6092]
 arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb:
 /soc/bus@fe000000/serial@7a000: failed to match any schema with compatible:
 ['amlogic,s6-uart', 'amlogic,meson-s4-uart']
Message-ID: <202504241949.WdDFUXBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 5fdecaafa2377731b84c9f3af5994d990224015e [4795/6092] arm64: dts: add support for S6 based Amlogic BL209
config: arm64-randconfig-051-20250423 (https://download.01.org/0day-ci/archive/20250424/202504241949.WdDFUXBJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241949.WdDFUXBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241949.WdDFUXBJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['amlogic,s6-uart', 'amlogic,meson-s4-uart'] is too short
   	['amlogic,s6-uart', 'amlogic,meson-s4-uart'] is too long
   	'amlogic,s6-uart' is not one of ['amlogic,meson6-uart', 'amlogic,meson8-uart', 'amlogic,meson8b-uart', 'amlogic,meson-gx-uart', 'amlogic,meson-s4-uart', 'amlogic,meson-a1-uart']
   	'amlogic,meson-g12a-uart' was expected
   	'amlogic,s6-uart' is not one of ['amlogic,a4-uart', 'amlogic,t7-uart']
   	'amlogic,meson-ao-uart' was expected
   	'amlogic,meson-gx-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: serial@7a000 (amlogic,s6-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: /soc/bus@fe000000/serial@7a000: failed to match any schema with compatible: ['amlogic,s6-uart', 'amlogic,meson-s4-uart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
