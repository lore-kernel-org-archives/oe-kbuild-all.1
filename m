Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF21A2C34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719530931; cv=none; b=kWHxgXsXuTo0yPOIz/oMpg0CoHKKEmighCudDSEEFvrVGuwnvTnIyrXjlz1qb69d3GXBmK03uZbDOsmg0l3Q80tUxHUgwWS/J+0YJSh4wts8UhX/HUfrXTbgZcMCFHLuzlLOOvWdFnsFXoSSDR4kF12K0uyT/rOvfRbBOOQJqrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719530931; c=relaxed/simple;
	bh=6EwIKOU1Dh5cgZC+rn6rFBOG6D4DD4V6YRDlIp+qNKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QINFU8+eKQAQ57g8ZiOK/YGhe1n+4UvZ9yOMNFaLs1cSC+vVkCuqDfzAvXZ1IwI0QB8cu6MrQD+OkRgu3FoAQvLlLu3zS1ErmiV4lPoW+AUUVIWjdcFh7BqsBQQRJMJJ4I57t9TNTkTDfkzM2mIEsWtA6DTtT0YrdfjCYoOx/go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgBGeOlU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgBGeOlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719530929; x=1751066929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6EwIKOU1Dh5cgZC+rn6rFBOG6D4DD4V6YRDlIp+qNKg=;
  b=KgBGeOlUIamRi7reMp5+FhpMY4gyEQ65jw917PCV9+faPH8Y+60HmyYx
   EQD+ZIanXllHGym0FR/tHGfkp9pjm0w9Uf9M5vx6AgXn2Irv5kG/6O9Ca
   2PL44qEMSb//D5i903lTAWTq53xPDwW1TSv22B1x/n6GeVlK3aBh02ebz
   T9yJ8sVSD+cqrTLJxwOO9FG98wiH1FAfcHaJcvDWVzxuufWTFQFaIC2ug
   L/VNMYc3XkbSjJBbHsO9+HE0fDnauy+BPFXWvBdS0UWMl/FYLVbZyYLWK
   EH7yKgxvIJYsGh9Bwxw0TtTpBXaN+rM9duMXEGBe/bftBWnJX2N35PmpE
   w==;
X-CSE-ConnectionGUID: Ipkrow4hQJGJUSKclDx4cA==
X-CSE-MsgGUID: 90K9lFfiSI+me+XNWoHexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16825803"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16825803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 16:28:49 -0700
X-CSE-ConnectionGUID: 3WzsxqeNT+SkXsm9y43Rhw==
X-CSE-MsgGUID: wd47othBTGGPpHXIeWViYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="75300930"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2024 16:28:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMyXk-000Gck-0X;
	Thu, 27 Jun 2024 23:28:44 +0000
Date: Fri, 28 Jun 2024 07:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: FUKAUMI Naoki <naoki@radxa.com>, heiko@sntech.de
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add support for Radxa ROCK
 Pi E v3.0
Message-ID: <202406280702.5pGvBTdS-lkp@intel.com>
References: <20240623201415.3205-3-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623201415.3205-3-naoki@radxa.com>

Hi FUKAUMI,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on next-20240627]
[cannot apply to robh/for-next linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/FUKAUMI-Naoki/arm64-dts-rockchip-prepare-common-dtsi-for-Radxa-ROCK-Pi-E/20240625-214723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240623201415.3205-3-naoki%40radxa.com
patch subject: [PATCH v3 3/3] arm64: dts: rockchip: add support for Radxa ROCK Pi E v3.0
config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280702.5pGvBTdS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280702.5pGvBTdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280702.5pGvBTdS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:732.17-740.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e-v3.dtb: hdmi@ff3c0000: interrupts: [[0, 35, 4], [0, 71, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e-v3.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e-v3.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e-v3.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e-v3.dtb: ethernet@ff540000: Unevaluated properties are not allowed ('snps,rxpbl', 'snps,txpbl' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e-v3.dtb: ethernet@ff550000: Unevaluated properties are not allowed ('snps,txpbl' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
