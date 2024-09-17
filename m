Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFA652F88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726598913; cv=none; b=RLA3DkmGSOcV8JGEWWqm+RLWMJD1Hk/BNRFC6i9ysASPQgHZptXUFKuOzev926ANnNCjSPwSSOivvv0kiVCaXgsLzsfH5YyTwIF2+jt1su0cQ2JwpfvxUx85akKVWYe0v5knYDUj57I+Rm1kRqT7cBQKMwd3EO9DC+FscKKqUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726598913; c=relaxed/simple;
	bh=pGZiXoy9aEJS9TT3zBcSMOJQMIDq5Mn7DxTmvqgACAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGvUu+kZxGK0VoTo9tOi5UCJ2zc3OqVojKvpbt0dCGkK/mxTyqtvMQPAAsFRPyOH8yPrn40jA+joT0k44lkqqtu5U+LcyY0jAc0twVvvQ4jioiu2pSRAqALmmkeBjkuV5CeBsvIKPPrWPXutyxAWGFIcoCa95ne+t/2HN/5RFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FK47k7/q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK47k7/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726598912; x=1758134912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGZiXoy9aEJS9TT3zBcSMOJQMIDq5Mn7DxTmvqgACAs=;
  b=FK47k7/qG3duM0/RQGMWWMNbTZhPi9bzCJPP/qJyAkHO9XIerdEBsHsW
   6eLqBJkKcKrTnGZv3L/PK2Ybi5p15HJYzX+WAvUQbj6K3eG/AmIBi3+eo
   ph9jokqWLIgLHOlSp3Re19m2xNF5xVwqqYtM1/U83s5znCfmqwcYb1dde
   2dd/Zp2DM1Mqk+/w5ljpWv0zsTQsI/HIUREZ88EhIfdZI58iWuHuWTYn2
   tK6+yqzooRAYRZOdKRtMoZzwn1fCVGj/RwoRkrRpaRlq3XaBhq0FV/SpR
   bHTjBNq51ZXBr0DcV3Y0CtTNm/4N3sH72PAH6veepKTLIvZNLF/4ZwH3C
   A==;
X-CSE-ConnectionGUID: 39o//6e3SoeAv35SLpEaZw==
X-CSE-MsgGUID: Ec+aOYRbQQS9UthwjJeMog==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25359094"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25359094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 11:48:31 -0700
X-CSE-ConnectionGUID: XON/Ji1+Q92zMj0QmThJLQ==
X-CSE-MsgGUID: kF3dohsNTAWvE3k+/6OPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73646363"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2024 11:48:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqdFT-000BRQ-2P;
	Tue, 17 Sep 2024 18:48:27 +0000
Date: Wed, 18 Sep 2024 02:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4075/14977] htmldocs: Warning:
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a
 file that doesn't exist:
 Documentation/devicetree/bindings/clock/imx8qxp-clock.txt
Message-ID: <202409180230.GCIy0Hzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: db232c6dfa4243d2ba2e164c7d4bcd6f9c926e7d [4075/14977] LF-1189-4 dt-bindings: display: fsl-imx-drm: Add LCDIF mux display doc
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180230.GCIy0Hzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180230.GCIy0Hzw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
   Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
   Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
>> Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
