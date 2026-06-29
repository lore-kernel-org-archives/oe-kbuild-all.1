Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA287331214
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764050; cv=none; b=F/o73Yhhtg3X/lY8b8bQrVdItlflhe7DvV7WWAp51kCxtfQ3vCHo4SPK/uLN+bbQXL5BU3EkFHh26+dHutptfcMj+5ovXy/hwNJ85TV86zjf6nhTBYE5eAQsmixu3/zZ9wWFWOU96HiDawlYkXyaVGJKUxYmaeAf04P/uLSucZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764050; c=relaxed/simple;
	bh=Cvm0REFTBAh913Ds0lxXq8lMmNTEjn/kEqZE1VIM0S0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R9kMhGNFR9OLjQE0bol7sf+8bLx4fCdaC/9aAIrx3fmb/2VyEWPK3TuA2Yon258cJ0WaB9QtIR2+rfQ/2z9BU+FdLquihDIKV2k4h04sLacBzebRBvMVIkDEkPcA1guELUuRV3Wn98ieXALKmM4SvgkZJLiViF+Tp61eC+LheOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA1AM99S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA1AM99S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782764049; x=1814300049;
  h=date:from:to:cc:subject:message-id;
  bh=Cvm0REFTBAh913Ds0lxXq8lMmNTEjn/kEqZE1VIM0S0=;
  b=cA1AM99SGgToZ3JYnUBnVW+L1UWIdiIEahNRS4pWHbpX2T/IQ3GRcxtf
   e/C9Oh1M0h2ihCUvEMimFusU6LPrzfKjzvux2KqVFVKKRk0MJlGAbJ2lb
   gbqeWlzMP3la+Qaf4xxQJQ1uSpPMH0mJNw2QIHJyZbuoizS5OkRtiPSEu
   /lNVUs0VBUPqO+jIxNFbecjr35HLMjdy66zjEBgq/uUuD2lodfMEzKYTp
   +nA9WrU4ImRL3ySDDoRgMfPOa0gClW02VbLgIJ/a8n54gfTqcEjEWlSjr
   Iw0xkWmKBdsa9bSiwLmSktMzFnFPUa32N+pC5Ve60QxecHX99+O6JBemk
   g==;
X-CSE-ConnectionGUID: ep1qaNrrSYmp41QJZYmZjg==
X-CSE-MsgGUID: tIWZmI+dSu6sCdCEBm+dxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83341286"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83341286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:14:09 -0700
X-CSE-ConnectionGUID: lIC3y/NGRkSR54hjr2SYDA==
X-CSE-MsgGUID: 4RQAHgCsSsiSM05EL4e+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="282132518"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 13:14:07 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weIMm-000000000Dx-2pLK;
	Mon, 29 Jun 2026 20:14:04 +0000
Date: Mon, 29 Jun 2026 22:13:47 +0200
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: 
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb:
 csi@fdd30000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type'
 is a required property
Message-ID: <202606292245.sDw1zsg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: bfc2779116ab7636a08c254d76a7a43d06feae1c arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
date:   4 weeks ago
config: arm64-randconfig-2054-20260625 (https://download.01.org/0day-ci/archive/20260629/202606292245.sDw1zsg9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606292245.sDw1zsg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bfc2779116ab ("arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606292245.sDw1zsg9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /rga@fdb60000: failed to match any schema with compatible: ['rockchip,rk3588-rga3']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /rga@fdb70000: failed to match any schema with compatible: ['rockchip,rk3588-rga3']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /video-capture@fdce0000: failed to match any schema with compatible: ['rockchip,rk3588-vicap']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
