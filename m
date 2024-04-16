Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A4813A3E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713310105; cv=none; b=tS51pXH1e6kEOBT2qzz30t++FF+Z/VgY/LVciCTkQf91c8sx+OVProbUiGuaaybQwdoLPIQ5rK4+uiFs3rUd7H2K0aMRaHlLPag3jh4CNbh1W/ls1k4fjr6Q+YNtILMwhUGOzpC3d9gtE3Dv+Ty1Dy+xln8NWVsfhgLMKzFlnow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713310105; c=relaxed/simple;
	bh=o/m91AAWooHrvd/CwFAuz1XE0KauQ2Ma+s0g0RAhE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnYeimrbHgn/Tt+StE9/n4yjjX/L9hjgSAHsrsYaOTW5GFt/Nnzupgac4M1Abx9b380J+9cIY0yLtSTylNCzGMgKlMh8czmQq3E92+W71QrERp5UjbaF3G5gMa7XNXqH/53Mq+qLJs6NEDODIYWKLvIPWMjFkcmU1e8MyZr9JTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPF1lNTl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPF1lNTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713310103; x=1744846103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/m91AAWooHrvd/CwFAuz1XE0KauQ2Ma+s0g0RAhE5Q=;
  b=NPF1lNTlbZdfldP2jSWYHB6az+w+vM3XM6UCpDA6GvzgFT1sVCQkh99X
   sEMaF8iC/b/0/W8TshYS+Qs12eLBl2X8mCbYGFEV7ej9tWtmNb2L5/Hzw
   5p2TWQdLhLnV/6NhSoTqwKHSY4IQztkDNLrPn6/Qc99/K0Rz1/SgWTOR9
   WLOqvkdR5p8VeY6D0QTqDZGREPZ8aUPswVq9E3r8g7tBDFbks/3DRJ3GH
   ulRYeoScEU4dnNI+1w5c68jG8H5FhpXgy7XQ1JExhcXCgDXTp+xSm3rAg
   prz87+mf6trOx43lI56AxtLGweJsv2Ab1FD5zAgpMIj1pUbqsn5BbO7u6
   Q==;
X-CSE-ConnectionGUID: /4G7MqJ0SQKe66gJZPZ14A==
X-CSE-MsgGUID: r35JAHqMT1Wehlqn2pUKCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26294539"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="26294539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 16:28:18 -0700
X-CSE-ConnectionGUID: mgev37eXQNC2HMZW779Irg==
X-CSE-MsgGUID: 5qSrHN8eR2e8V4veVIhYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22478446"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2024 16:28:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwsDm-0005qA-2B;
	Tue, 16 Apr 2024 23:28:14 +0000
Date: Wed, 17 Apr 2024 07:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>, linux-doc@vger.kernel.org
Subject: [pinchartl:rpi/v6.9/isp/v2 16/24] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
Message-ID: <202404170711.8Ri744mI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.9/isp/v2
head:   5101294c3b11eb468b977df8b494c4cc4264a582
commit: 3d28ed2a4e36222cb404c08eca65a1cbae14fa50 [16/24] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170711.8Ri744mI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170711.8Ri744mI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/media/v4l-drivers/bcm2835-isp.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
