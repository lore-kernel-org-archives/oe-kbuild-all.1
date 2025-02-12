Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E732066C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355039; cv=none; b=W5zC09hERchNm7npHsACcDVSSX4NwXdZvJMa3RYZz8BDZ+YJSFYTaOY/XwPz8nQTFsIG6mwvvwrHu/Umz5C+PBGJo06EhPDqqzKj+kXGkYSzVhWOA1tKD5cuXjt3pSxY+dGoeFMKjVV7+me3hDa6EKzADjvSYjaHY6OzCY4oaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355039; c=relaxed/simple;
	bh=LIAWpFuw19ztdZdZ0v9kAmXgT42+clPdgUdNfsl4JAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hg48d/bEcOs5BhUBbBAgsEsrGzDoM43NrC7i1MtDJwUIBD4UuHQ7WdhJSRe7TnSjllPha9bwgpg5yXHEkLePyUvqlHgyJPJO9gv320/cSvnTdHPnieupB4AD7/iJ9VD7M5v02sfgdzit6y5DXS5aRi6D99uQGk+xtdGSlRXjDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLHKSa91; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLHKSa91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739355038; x=1770891038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIAWpFuw19ztdZdZ0v9kAmXgT42+clPdgUdNfsl4JAA=;
  b=XLHKSa91fScvU5iOk5m9WHj/gOhyd6BX14gnrzUvfek1bhHPygSc+Q8f
   XVSlSBsYuWSzpOrUJDNcR7H5JXWOHybPysLDwYbzaN+a7u2mDx9atUKS7
   rr0TM8grQJhsxgCAKHRsaaaZAaaBV3VBy7nVNRPIu3v5JeVCqfpo3uY36
   kvzAzAqn3Dymm2mUCESMfGMOdXR/yfSlVA2M/sBlYsRJoA7GrXDchgojn
   8qnWdyfJ5x92XzCgX6g8K/QrPo/xmsanYR8o+KkU3w5FJtVJR9tVTzPOt
   xzX3qnM2bJNJaUCGQokVHu9DU8mXNDfBXpJiJzVHFcoQgQCVg+2jjzs4L
   A==;
X-CSE-ConnectionGUID: D2fnHVVnQPWjWinich2BkQ==
X-CSE-MsgGUID: /BxSkDqfQtCFGRR1OF7v8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43659226"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="43659226"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 02:10:37 -0800
X-CSE-ConnectionGUID: TnYJ7dFZSRCxTlfFUyGiwQ==
X-CSE-MsgGUID: jl2ycOo9Rnen2rG3+99fSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="113437205"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2025 02:10:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti9hS-0015Tb-13;
	Wed, 12 Feb 2025 10:10:34 +0000
Date: Wed, 12 Feb 2025 18:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 5/5]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0:
 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502121712.80nrz14q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   7b6df7ad6ccb2c1f0d82abb3ea088c9684cc7545
commit: 36937845ce2ab3a645e27c6a11642cc0b4f038fe [5/5] arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
config: arm64-randconfig-051-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121712.80nrz14q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121712.80nrz14q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121712.80nrz14q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4068.12-4072.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wcn6855-pmu: 'vddpmucx-supply', 'vddpmumx-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
