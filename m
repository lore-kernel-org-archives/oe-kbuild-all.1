Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F871B4F0A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738965500; cv=none; b=o4TfS4gO9JA5KtMzodxJ7n0qrKcEBudySfmrsAzVjZoO4T6mbz29Rmaq2yydDIXRTEEQyHDmUShIAdA/L2tQm5mQH8pBMix+MIoCZFbgT6Eq11AMwPg4bUlD4O+wjcB7stcCLghDIyazGGQJiIgv3bW36dHFvo+FYvMQyDO6Jnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738965500; c=relaxed/simple;
	bh=A8K1lPwcu0u/+g2qPFYDFYyZLdtBTLN2RJHwr4L60kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPoNF2ZObN+lucBuz6fC3ZlLaqPBYJxP9F5ErBXgeHr/RND88SfRXFZFJ6jEMawJicpmcJSc8BzU5RUcbUKLbvMlKpSAG1kBqH5RBZ6LDHgM1uqpLJpsnexC4rTK4pM3INMZ9SuOr469Zu8nRQSx2eICuRSloEbjYn4Gae8iwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A86AE6pF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A86AE6pF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738965499; x=1770501499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A8K1lPwcu0u/+g2qPFYDFYyZLdtBTLN2RJHwr4L60kY=;
  b=A86AE6pFNiYWXtxg+I6qmDBqqrzQq0TVchYQEkwF1UZKXRmwZlu+LCDb
   05s0OqsY5dtOVg407WGBMPTYisEcAqPqFc2CMsw/IWleBoC0flpzzcJat
   Q7Oc5huEFVFunO2ciTjsIynvqKurqLnZ8y2VfNZR2Fh5hJf03FNWih1dP
   yLYTbbmf0YUz5KLKm+Rw/D2zqOIZnhgN6RxgRB1+7qK0zl/O8s6Ag2Ppn
   SS2B0qq8pA+xgGHeLcHHwd1OWkfr4cfAbOyNX9gONU14GmjCdqelfLB8b
   nR3wYG8sHIzKx8hS1k9LgIAZR4HjHfynV1rv6sr6CisVAupHXFVtJSCQG
   w==;
X-CSE-ConnectionGUID: fzonMlTSSW2kJe4Hbw9Uug==
X-CSE-MsgGUID: y5OSchpqRUaiSkU8HFJrvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39311850"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39311850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 13:58:15 -0800
X-CSE-ConnectionGUID: cVCbWYtOS+GRiLlJsh+omA==
X-CSE-MsgGUID: 5sl2Il7+SiKrIEioNkpDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111584873"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 13:58:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgWMV-000z67-20;
	Fri, 07 Feb 2025 21:58:11 +0000
Date: Sat, 8 Feb 2025 05:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/video@36000000: failed to
 match any schema with compatible: ['mediatek,mt8196-vcodec-dec']
Message-ID: <202502080541.4FrTtMC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: f5d71366577c8d26e848fb29e3f402624f3eb97f [204/204] CHROMIUM: arm64: dts: mt8196: Add decoder node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250208/202502080541.4FrTtMC6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080541.4FrTtMC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080541.4FrTtMC6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32dc0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e80000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/video@36000000: failed to match any schema with compatible: ['mediatek,mt8196-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600d000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3602e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3602f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38000000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38010000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38070000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38090000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
