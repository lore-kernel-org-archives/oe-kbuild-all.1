Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13025A647
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738725639; cv=none; b=Y+7HZTEHontGGV2cElBgnMwbry4fhtF5Kv+/uCO++aSG4qJBqOY/R+n+NWRHoCpuyKtPU3cjO7UADH74+9ia4q1lt61W1OTRgi1P4HqmzFEWHusrIkkA78gpqLWgE9FC4rbeI0IPhs3orkju6vikwKXOSiU5+YpuoHQl4Ff6HDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738725639; c=relaxed/simple;
	bh=lGvzUmPp0JFF6SI/J0Uf5kNiilblvgMY23Z5c+cNiL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J2wpoEnxAK2Mc874c5IKz5VUCa6/Z5pYTxiypDSNUhAiAcepEfEWn0qR+seE1BN6MTDBbnNZcfw6DXVM/bsmPl7McMyQZD2mGY+BWNNrOkIwLd3WKhPgz9bhOjL+3XlsECeYUnrD4ZB4eNz1pwAvuA2TutHY7TBef/zXSdMsADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvjDvbKG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvjDvbKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738725638; x=1770261638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGvzUmPp0JFF6SI/J0Uf5kNiilblvgMY23Z5c+cNiL4=;
  b=NvjDvbKGqbfBmXTSMJuQ7s9rQI/6m+tB0W+Aoh+jvRALm56ysrbU550p
   PRBojqIEV/23Gquz90i363sLdyan6khOcDvD6ujpT4fOCNUdR/mt5Qw8U
   x5l6McjIsFncrXfWx1JYmj9MbuA9MwAPOkvnVUmcNseRDJRNo3KANyuLC
   quHblMZXCU026Vi3NXX1ZnyVItHRPoVNmh6Jt7nsNa5tA4ARQO8cMAUcT
   FyhrtdUWYO1B5VvX9YFDtcKzizfN01s3VvfMkiFkPflGcHH07hkNBZwrX
   1jJGvGkueu+XKHrqqMVpsdiRzlXGBb1dk7zRvH3LbQr8c/oThl4OWYLQt
   A==;
X-CSE-ConnectionGUID: zNVJg2jKTAal7+79C5haPQ==
X-CSE-MsgGUID: iNl9+5UZSIWELd0agxPUvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39433090"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39433090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 19:20:37 -0800
X-CSE-ConnectionGUID: hfHRpMpyQiOblA+rrrbBRg==
X-CSE-MsgGUID: jvPTBTvtSYKjFWYK4sWuIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="111318573"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 19:20:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfVxq-000tMR-0R;
	Wed, 05 Feb 2025 03:20:34 +0000
Date: Wed, 5 Feb 2025 11:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32970000: 'mboxes',
 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502051146.D9fAzVmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   89cb8bc425a44875dc0420914465cbc1936bef3f
commit: 86aeba22de7abd0d6a22bebfbfcdfc4722ef49af [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: Add DRM CRC setting
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250205/202502051146.D9fAzVmr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051146.D9fAzVmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051146.D9fAzVmr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32890000: mediatek,larb:0: [92, 35] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32890000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@328a0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@328b0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@328c0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32970000: 'mboxes', 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32990000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@329a0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@329b0000: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
