Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF12701D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288522; cv=none; b=FSLhO6Gk80EaJox198Ur1xGuYYOHuB8iL6LBuS09T426eGlgGKOvvhIM0/pM9C1tr0AA/dmRRUFmxiaWiKlGPYCUa2DP9gIJiIqP4nnn+2gu6KsgCmKQ9r5MwJaLxtmKGUKaSXnPPRoyHWGjShO/yyIrzK3paJQIktWIOjEwy2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288522; c=relaxed/simple;
	bh=mY9616acF2IG8FVM0URdFrlOmz6IRs0qStCzrZnJXUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ts8yBQhGHHCsIHVtsVJ2rQJv+hIqjs6vP87eTZmmeIlWUpIiYp43xpz5drRXEmkq95p2S3Ng19rJHoaNEOL/DOOvAY1QU2Pvhb0zXwfid6qL4F8yFb0yaXkJycjtgnkOjFgXKNQL1Y9I6uqFfBOlWILVF4Ydtk0kbOwqVmp/6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZG65Wa1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZG65Wa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758288521; x=1789824521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mY9616acF2IG8FVM0URdFrlOmz6IRs0qStCzrZnJXUw=;
  b=lZG65Wa1eqsOZh34Nq7OANX4A/dRVLoGTGF+k85ttFXMeAQiD58J6Ksv
   1HUcXXR7o3gyU1bN42UT0K75sNF2HH0Fygtvqobc1oFAkJyXS1GYZBigp
   o75NsHuljsmgCLRw73FfOpedVToUbs5DIMk4NATvzTqjx2n8O1i0DnGG2
   azYVaB/5NgKGZ8u+KnGheLFqeEXEuh6zwcV8pB7yE5sHfSb1BQoP1yoyj
   5bX6bBnDGgRCBxUs2mQWsbYkEAM0sl0hXxuuaWiXFjduSkMvf6d9CAG4e
   JqAmwhaI1VZIHuLtGxSOL6i/yeGUuStdP9mSnGR9sNcYvUJ1dtoLDipXI
   Q==;
X-CSE-ConnectionGUID: N1UAzTR0TTanUEzLRCB86A==
X-CSE-MsgGUID: 1pHZaxbJTGm1/8mReq+wJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60696065"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60696065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 06:28:38 -0700
X-CSE-ConnectionGUID: xE+ArmMTQfmqcwOlyBW9hQ==
X-CSE-MsgGUID: XFc3l1VAQHulDTJLIUeHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="181108118"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2025 06:28:36 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzbAA-0004KD-15;
	Fri, 19 Sep 2025 13:28:34 +0000
Date: Fri, 19 Sep 2025 21:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 7409/10654]
 arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: clock-controller@40410000
 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202509192136.CR5pSGKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
commit: 0463d9d492dfc896f61fd6319688e02341fea772 [7409/10654] dt-bindings: fsl: fsl,imx7ulp-smc1: Allow clocks and clock-names
config: arm-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250919/202509192136.CR5pSGKJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192136.CR5pSGKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192136.CR5pSGKJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/freescale/fsl,imx7ulp-pm.yaml#
--
>> arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/freescale/fsl,imx7ulp-pm.yaml#
   arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: pinctrl@40ac0000 (fsl,imx7ulp-iomuxc1): lpuart4grp: 'bias-pull-up' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx7ulp-iomuxc1.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
