Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF433E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 04:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729398619; cv=none; b=EU27PWweQ05sZG3hHH9H8OsCIR5j1tbpDpJBxU3Z+yIdtNvrEBk4pRETbQ2mE9nFU2BAvf3GdFMHkxmjx5v862Z/biNWBxgWe0yl8ITT6HSOfoThw2MIkvZ/dkgmI2sRgG4NrBiTCDiU5D0TAdFpYq22ZLWRZjrh4+p0zJCWJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729398619; c=relaxed/simple;
	bh=XonzJkQKNGbXF4huVfZgGGfCze7qSci52pHIkzRr3qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdIPOV1gEcuWMYn3vxNAbXirH5qPWpZigZhx7rJTDt1MoJqO8mVC+ckgYs18sdPgooQ1RAtIQRmzOrAI34K05KB36BzzGkXz6J1zwUvAgbLk/rXIs/3FC8X5gVErAGHz77OeWR8lSEg2yxeDNyWBqnuyQ4kvSTUqHbIHe98UDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CakPbQWX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CakPbQWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729398617; x=1760934617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XonzJkQKNGbXF4huVfZgGGfCze7qSci52pHIkzRr3qQ=;
  b=CakPbQWXwg6+ZDrK6yA/zANxs4/dMm/oWyemKl0QPg3YUArxriZqncJh
   L973MhGJz+6TdE11mkzV3Wc/pORmfWG3yULJ9r2JfibQC4Q0Ei9h8puxx
   E7V2D61Pxz0gX1EmHs8akX2GVVnbQC7W2W5RIA3rj0WGh3wg4uP/FDyMj
   T89S1843Ue96ji0geQxC4Wsxd6ENofRUgS1XbPPM6uKtzU4+A/AqnMrv/
   XXvGW9OOmgRsbPf8AcYQyM/NZg+Nzh4fnAaux0dJFcsLZ/HiN2yI6ihzz
   +pP9ta3cjSPeMOmit9DjJD7JTtL5EeMv/UoOOsM+ix4c2K6BlB7WFFMln
   g==;
X-CSE-ConnectionGUID: U0hCd6L3Rca6CWI8BOMRfg==
X-CSE-MsgGUID: XIg/KUGqTn2iMHljlwg2nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28355810"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28355810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 21:30:17 -0700
X-CSE-ConnectionGUID: zZqBt3zURb6g2VtizjYxpQ==
X-CSE-MsgGUID: b+b8sHR1RP+ZWHrAeP0Qsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="78872467"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2024 21:30:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Na1-000PtZ-0C;
	Sun, 20 Oct 2024 04:30:13 +0000
Date: Sun, 20 Oct 2024 12:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4278/4954]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated properties
 are not allowed ('bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb'
 were unexpected)
Message-ID: <202410201216.YBBsADJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: 8a2ef90ff7924250db535454ef92ba2961b80fba [4278/4954] dt-bindings: mfd: twl: Add charger node also for TWL603x
config: arm-randconfig-053-20241016 (https://download.01.org/0day-ci/archive/20241020/202410201216.YBBsADJl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201216.YBBsADJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201216.YBBsADJl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: ocp: $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/aes@480a6000: failed to match any schema with compatible: ['ti,omap2-aes']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/interrupt-controller@1: failed to match any schema with compatible: ['ti,omap2-intc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48: Unevaluated properties are not allowed ('bci', 'gpio', 'keypad', 'pwm', 'pwmled', 'twl4030-usb' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/i2c@48072000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
