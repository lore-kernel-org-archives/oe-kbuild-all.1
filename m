Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5244D1E5B62
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184864; cv=none; b=eYy6KR50iue4c9aHP3zTGWLQg2McuOeqUsG5yMpFXIR5aw71vOVdBvM+zIUNShzBw8hJVD+NRtoNbH+D9KFSe2MQayU2xoPtHaEYJovMypAMd/atiRV7CdwGAk6VDwtd9HgklNvneaQzlKJ4hqI7Ti5fXVV5xW0ir9dEh6LkcBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184864; c=relaxed/simple;
	bh=0gbO60gl4HM//IDkP0PIj+ylQx5Hrljiglw4vqrUB6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dU8MgtQrlpGVcyoYIq3wb9I2DgGPFqWyKeHeekaObCWlof5GmNFdH+Mfa/eFBkiqqTtrA0CNk6JIKwxnagXk5tXkTq4wDjDqfylu/tpZtb+BlJbOUUq3cC768vEP7f/ZasQFf+tFA835YZVnvSBe92E1v6tkkXepvc6NzS8hE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVYypcZp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVYypcZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746184862; x=1777720862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gbO60gl4HM//IDkP0PIj+ylQx5Hrljiglw4vqrUB6o=;
  b=RVYypcZpuPuw2O5P+LDj5cIh9XMqAkbsDBmSRoKknL4V6MG5mDADGSgI
   j/LMCrZBBAU9x0Bca+3f3JbjO6yFGqub552y8feLGbecQKKrvNL3cUrf1
   E1/kXH9isrtS4HAjT9TKb0oxWQZkTSwx8GXqbJRsZxtiJmH//AkdohsEj
   nZoakr5sLFeUKHSvy5dvX6JgNJF3cwbxKX/VG2Exite2NK18GmhA86LzE
   xUnf/Uo7rLpXBjKsnMqPr7zp0x0CEI89bZi1kCXWs646+CGaYwwLOrfvO
   S7Bf6SibtTc9uHpbd2ARFKfEf8Mzr5Kw8rnPka8M0yaygNOVuZNdEnMPX
   Q==;
X-CSE-ConnectionGUID: O12ceLFYQqea331gizHplw==
X-CSE-MsgGUID: ACCoYsldShuy1517xyWXxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51676895"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51676895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 04:20:59 -0700
X-CSE-ConnectionGUID: wPMQWoO+R7W32ECTD0GiEw==
X-CSE-MsgGUID: cK+4Nq5jReyeI+CE/d8zCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139427312"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2025 04:20:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAoRs-0004ha-0j;
	Fri, 02 May 2025 11:20:56 +0000
Date: Fri, 2 May 2025 19:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrej Picej <andrej.picej@norik.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 4287/7938]
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d
 (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt:0:
 200000 is not of type 'array'
Message-ID: <202505021937.efnQPPqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
commit: 7ed7d1ed852d8f4c4dee7a4d4f7807ad59c7915d [4287/7938] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250502/202505021937.efnQPPqx-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021937.efnQPPqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt: [200000, 600000] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microvolt: [200000, 600000] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint: Unevaluated properties are not allowed ('ti,lvds-vod-swing-clock-microvolt', 'ti,lvds-vod-swing-data-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-data-microvolt:1: 600000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-clock-microvolt:1: 600000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
