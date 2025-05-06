Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB82747B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560885; cv=none; b=MF9l7VISK2OrynErSJKPSa0pneIIdqTCc1c0VSRfD25XTawxVkrP5Yl6LtmsrMwiPRJoXzcjeUGhDU46GyXSNHcu2guDndWA8yooAs+Q1aKHhBlvmX8XR9SMXoLPrxAxTDqfIA+UcBkDZp8fwavkVB2sD3hvX1pJlifnY/5aUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560885; c=relaxed/simple;
	bh=0q6raDcD96URkCprlSacAREcy2J8xKPN/Ia8pg9LH8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfKp/TX7ojHEKnRCYnQAUuW5z0zleQV4Y/7D8uGGPHio43xLusDnc0hzmLYM+oLxwvVTaZdIxxBjH9w5VsbsjHNZEU1EKxVJvXV1toRDmI/RsLVNPysQ3iWN1eFxjIBWP24o405MAVrl/G/QJZHPM9kElFy9FaT9W+lbcOC3jDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn1VpWVa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn1VpWVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746560883; x=1778096883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0q6raDcD96URkCprlSacAREcy2J8xKPN/Ia8pg9LH8Y=;
  b=Gn1VpWVaE0EgyTHU3bAzvbQMpuZL5bBFX9gf6MabZdwc5T5tQn7dYp/b
   xkpcitq37rwkk2AQr3Sg/oihvqGf2rsByLLtcKke5o1hf5hzEo9/SBAKi
   WLQvdVky3O4go7ZnFgN95Yy9S5CUXsFZ1f94yfgNhy42q0xK3WgTxZD9k
   b3hIuSasTiBZv8L9SLsucNGgtTxFUDByPwnXC+FqcaBhioqs56yQ0GWO9
   Cs4sCeiikczDu1tceIjHr4PH4rzZ4AY6zetQ0RfDeLglhB8R9rw8ISuqr
   Otu0NogrW51Ctb0nFBfuZvLc03F9RzJW/c7i45MYWBjCoQCawTSF3WnAn
   g==;
X-CSE-ConnectionGUID: ITPxOD13Q+eOyqAgknrXhQ==
X-CSE-MsgGUID: aaIJzkyuQVO7bG4/80yKmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48125876"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="48125876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:48:03 -0700
X-CSE-ConnectionGUID: JkBvL2y8St6kize9vc9WaA==
X-CSE-MsgGUID: Fpt7sJxCTSemOaftqhea3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135598619"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 May 2025 12:48:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCOGl-0006pN-22;
	Tue, 06 May 2025 19:47:59 +0000
Date: Wed, 7 May 2025 03:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: [linux-next:master 8037/8679]
 arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb:
 reset-controller@2000 (amlogic,a4-reset): compatible:0: 'amlogic,a4-reset'
 is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset',
 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'a...
Message-ID: <202505070326.os5TYc8H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 946b51882b84f0cbec2acd203467866a7378abac [8037/8679] arm64: dts: amlogic: Add A4 Reset Controller
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250507/202505070326.os5TYc8H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070326.os5TYc8H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070326.os5TYc8H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000 (amlogic,a4-reset): compatible:0: 'amlogic,a4-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,c3-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000 (amlogic,a4-reset): compatible: ['amlogic,a4-reset', 'amlogic,meson-s4-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: /soc/bus@fe000000/reset-controller@2000: failed to match any schema with compatible: ['amlogic,a4-reset', 'amlogic,meson-s4-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
