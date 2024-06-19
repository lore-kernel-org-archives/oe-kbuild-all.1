Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC0158A3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822860; cv=none; b=GcDfa6TmrP8Ppo1kXF3k2ssVM7zInkdEsXtsmJQwrSGSAGUiB/israNlS+rB0aZXRpUBBPgQvPMdfARlCU4rG5gA2VzWESGiyFUbaaavABFqYoZLLcnqOHGgimchDY2kWpiNFG1mI+RPD8OdycvCWYjW5Dp+1F4k0F5/H0RbyDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822860; c=relaxed/simple;
	bh=wbMyDG5iL1ubrOxZPFFVfATGRe/acyyQxkVrftz3F9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4j3Vetc43dDStVgZ5pWxKvnBEw2CG/8wEl2MvOCh+pmFzKR25PPVgpw5GqWE27TBwe/hjLbVqRTjD1ZuUPeLwljfign41b5z2bWMScQfpA2dKTcBfLX013mM+S52NqnKprRrN+1bjDiLAeRx+20P3YIDN6sKzdXBBPQSmf3Hzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYN9d0Ea; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYN9d0Ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718822858; x=1750358858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbMyDG5iL1ubrOxZPFFVfATGRe/acyyQxkVrftz3F9k=;
  b=LYN9d0EagsuI6KWCPJMLTOo33nDfMY7yYwHeuO2+0zY6oO+L05XQkBAe
   Ax76cy+AsEUO51Mr2F+iaDOktAhZygFpKJ6P/hkoj/arFLqHsZ465Xyzx
   piWgCzLl/NOJxmAh7Edqdp4/znIpxSVU/6aQt7Lrgp4z2XuovA0KG+18N
   jqLxkMXsymdEfNoCYqT401FwFgNo39IVvkIK2vy9rpwQJWTfbpsMgfTSb
   5qEUQ+Tf9pVYNuE33+fmVCnPhenmLSdcXMi8x4xtZkUdFO3Hk5/5aTnxH
   BAdGP6PscANxzN2ihuvqWhPbmTubhwPWKx0TNKcRK+AvIxZQQ+A1ZlWr8
   w==;
X-CSE-ConnectionGUID: M54Yl6wkTcC1H4/hE0PzqQ==
X-CSE-MsgGUID: gqxYWZ/aS+qmwn7FeD2GLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15651809"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15651809"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 11:47:37 -0700
X-CSE-ConnectionGUID: QU8WNEkNTY6CSvkcuBlcRw==
X-CSE-MsgGUID: Avx3X7Y4TFaQ966xQ1z7UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42664695"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 11:47:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK0LF-0006sk-1I;
	Wed, 19 Jun 2024 18:47:33 +0000
Date: Thu, 20 Jun 2024 02:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3965/9999]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406200241.uDl27sIk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 200c1bf10773209d5919db7cb98c4983607486cc [3965/9999] arm64: dts: renesas: r8a774e1: Add PCIe EP nodes
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240620/202406200241.uDl27sIk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200241.uDl27sIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200241.uDl27sIk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
