Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0FC13A40D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727510647; cv=none; b=OS4laEIeTWfPdVGsBTBtARJ4jwzWiN7tK3DXQr88b+HIi+VtJ13e36Xi9fnnClmd+ePKCpCkuC9hLLQJV0Htpwv8vZQCN7YCJYM1NA2niHpK5F1VtO459j+o4hBYEuPdHCGtaRtxofH9N6ttcsw/f0jySCdGB50Md5/vvA+gP3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727510647; c=relaxed/simple;
	bh=l8H/EEhoHqULHSgPCScMJG33T/b7/Yq1Vx1QxWqwXFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkaIn7TF7hpFGY3+aBUNTU4tqYXWHPuOLnvC9meWhVnusCvtJnqrx9L2NPgfziXp3D50DeJNUjFPcDb2u9PhblbOmft5mMRLwe55ufzoELnjhV1qDkKSbSTYe69GN3zgbv1xKeWuCUZN0vxh7JOiojM1R28U8zt747OmVa1PWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPPWNhpR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPPWNhpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727510645; x=1759046645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8H/EEhoHqULHSgPCScMJG33T/b7/Yq1Vx1QxWqwXFs=;
  b=HPPWNhpRPyHjwYaPacAXLEsq43vfZdslKXNKH36r4MB0JqvHGbCl1smQ
   HI1j/7O4k0IMmooQJyP4GYhnnjbM5U5YyTuP+FMg6vHfm1Cd3qvRh7WbA
   OJiWfvw2kJHywqiuIzWt0ut27r6tgqcY2b+MfxGdfkFRsv0+u3WjuOagg
   PsvRVc3SmsEy+OrYRGCnq6FYBphcL2NVUrzpM4TKwrLYnXA1gPWaEk6Hh
   kBpPat71gP/uIGEBMCwDV2kW3llzr/mcli2Qo6IxWZY/dUPwazYD0sHuB
   JNY3S6DqgP+1PvrPNAzh4Bh01QNSWlHEGvRsiz/AOqTEL9Yc3g2EEams5
   A==;
X-CSE-ConnectionGUID: d2fZXd08T7WmUh1BZhlPWg==
X-CSE-MsgGUID: rmFQkunrRiK5QQFMnNdXgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37331698"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37331698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:04:04 -0700
X-CSE-ConnectionGUID: 14gP43/aTPGsnXQXV1P72g==
X-CSE-MsgGUID: 1+a2Sn4BT/uPTe4me746zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72831533"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 01:04:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSQr-000N1L-1H;
	Sat, 28 Sep 2024 08:04:01 +0000
Date: Sat, 28 Sep 2024 16:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5985/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409281641.V9HTIc4d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: 14c3f6144fb0d2149482812401a3e9270bfffbd1 [5985/9999] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2M
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240928/202409281641.V9HTIc4d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281641.V9HTIc4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281641.V9HTIc4d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
