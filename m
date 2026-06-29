Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35962FD69E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776833; cv=none; b=lcs0fDp4tA6pKLR396VWodR+G5qBzPBL4S2z2W6qQeUKoETGE92HXs/TEGkNmlKoibApFKS7VmuoN61R3LWDE6AnXHx/kHg7Jbsx41AlQeNWp6Iue+jQufP/3o72T3wZz1qt7xxaVWR3eW/zsH9caJP4xtl7lvN8ZWirXKE+iEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776833; c=relaxed/simple;
	bh=4H3r3bA3tIf0X9YTcUvQkF7M2U/Q7HzqhK6zHeX0XxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kTAajXB625GogAjxtkiQBt1rmBePggUaTePkLwCzL57f09O13hZUxfwlzvFZehZUtbyN5YiHiRTc5J7C/3GI9wUIiI99ZZf/LcYz2MndPqho0p8vkgaJvISxgjlVxerJBCJ0XaItCVQCS0bzK0XyYw5k2JKgwy8cBdIpOeT40ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aU6H7RpH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aU6H7RpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782776832; x=1814312832;
  h=date:from:to:cc:subject:message-id;
  bh=4H3r3bA3tIf0X9YTcUvQkF7M2U/Q7HzqhK6zHeX0XxQ=;
  b=aU6H7RpHYfnxkHEkvdavf677gZTGuPMIGPQU7/agtwTNgFBgpZja17zp
   ww1axprjfgaPeFjcOLwDaPiP6VuKXY2HzrptD5wr/t7K/yOQAaJ6Fh4fk
   vZIH+Ny2hDojee3XPb7u66uUk9b2PYCEkktbx+hlmL2yaiyoHmxK/hqYE
   HneD75AdDzjZxd07b2WcbkG9AXylq47Y7UC+FGYJYWyYSJFXcM66nUz8B
   9wNuvDV0RLXqZBEJ+B6VrIuFYhk/pmrWFClXLGhTyiiSEALC8rdIO6zA/
   sxFeN1qTyjbzdvOslFlgvb061C27kPDmsCdG0F4dx7mrRmuUPh/HHXcys
   w==;
X-CSE-ConnectionGUID: Lo5DJP0SRBaptzZ5zcADxw==
X-CSE-MsgGUID: pcWjrTKUQQaOjIsYoOVXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82473993"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="82473993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 16:47:11 -0700
X-CSE-ConnectionGUID: V8fsLCSeQoGjlH55F65x0g==
X-CSE-MsgGUID: mTYKXZUDTAWapjlgMxcRXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="245749086"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jun 2026 16:47:09 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weLgx-000000000H3-1mEi;
	Mon, 29 Jun 2026 23:47:07 +0000
Date: Tue, 30 Jun 2026 01:46:59 +0200
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: 
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb:
 csi@fdd50000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type'
 is a required property
Message-ID: <202606300121.EyECTwB1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: a34ae4f44c9ff4f4170dd21cdb22efad63710af4 arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
date:   5 weeks ago
config: arm64-randconfig-2054-20260625 (https://download.01.org/0day-ci/archive/20260630/202606300121.EyECTwB1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300121.EyECTwB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a34ae4f44c9f ("arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300121.EyECTwB1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
