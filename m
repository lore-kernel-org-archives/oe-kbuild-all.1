Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299C219E1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 04:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723178235; cv=none; b=QabDFsMCIk/AU6ovGanV8Xaev0Jc6Ot1ob5CoHRwG3NeHCGCQxrw/HVvf4A2G5+8vu6TI2hRHMDE52FWCMFyOIk9UwPmBpbSMqrm46CfecZYtpgGBm93+lN4deY+bnnbIN4L/1qtgYhwTgqoOBLGT/67PLfdMsPC7pjZMehXcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723178235; c=relaxed/simple;
	bh=aWByCONh9zK76bCvSoxjMc7jkiqugRNV33O9nvB42vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtFof2krDrOVeIoMHBdgbfoiq19NaVxR/32SRJ3ZiOxybMNNrty9m/QupKJLsbW2sJ7vs76z2q2W8UflH3Zj4+Q6x5hjsJyTYUcqHFvfepXEoUDrzbj3T8IpittwpXIzD2M49GKHQGhuYWq4oUoVzd/TWSq0LCQhyaZK8rPZyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcMVBhtq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcMVBhtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723178233; x=1754714233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aWByCONh9zK76bCvSoxjMc7jkiqugRNV33O9nvB42vw=;
  b=mcMVBhtqT/FcWGr/BGciViW8XowdrbgIyhCFjRDlFNGy/EKKBxZuoy7+
   Gm7s5aoK4rxM1zt2k0mOLygaeTepFP5+iBscFQGnXFdMCgZDzOhXnSkQO
   ozb4eE5bToDcQV90xzZzoD6arDLUDYo867VjRcCvrVNrgUGRKrwz/hiQW
   PuMILvPs4s6cfG6eIPoRDZyEJqq8UT2oDNTKoslEpVmK490vc5ITi8HpU
   HXqOp9CPazJL6pr8/sx8N4tNhysxVyrG0ibcZbQtq0aTEEOZ2rHRbgbMh
   GbWZZ78kkremWXIQkZEJ+sWR5QGgAzAwJZqHMevUODIYEn8fo3iEKIE2v
   g==;
X-CSE-ConnectionGUID: gfUXXjhqTuqYQBfp4aqnxQ==
X-CSE-MsgGUID: ymXeiPdXTSurrt108YM9GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25133112"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="25133112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 21:37:13 -0700
X-CSE-ConnectionGUID: VWOeHMAQQryE5At8GtiXsw==
X-CSE-MsgGUID: 7y4/176uSLi2AjB6E0ciyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="62395736"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 21:37:12 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scHNE-0006qA-3A;
	Fri, 09 Aug 2024 04:37:08 +0000
Date: Fri, 9 Aug 2024 12:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 42/43]
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb:
 /soc/i2c@10058000/camera@3c: failed to match any schema with compatible:
 ['ovti,ov5645']
Message-ID: <202408091253.8xIt6fmV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   ab928510d84ecc8ba347a32bc3a2ef037003ab93
commit: 144a0d5e9c6027005a0b046f2479611818e893b0 [42/43] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408091253.8xIt6fmV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091253.8xIt6fmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091253.8xIt6fmV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:80.11-89.6: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:115.11-124.6: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: /soc/i2c@10058000/camera@3c: failed to match any schema with compatible: ['ovti,ov5645']
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
