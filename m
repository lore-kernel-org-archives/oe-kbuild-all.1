Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA3126C03
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737222768; cv=none; b=f06sr6a65EJXtC5vRyUDmuz+clmrfyru3n7rP1RLTlyds8QbQ1BHJgDXmj507thNgsMM4H0L0IYxNlXM1RMTfEWfuXwbVAsu0+EUb851oe+BLQMn6z38k0v+RX/3S/e+udWzOkT909JB1FAB3EEw5fDLcgZzNGw+6n3bDeN0coQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737222768; c=relaxed/simple;
	bh=D6nxwbv7RsvGV2OkKqPXPYHG9Iw+FDYHUypvRaEpMhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5rvXGHLwqYmUvy4nRwn4Lr9C0wT2Pqf8/QmkS0ZBjzzw6Dl87tSnBWzGBvjOpC5CC5KlRoeE7bOxSka8W3ZKjlVfrXUPFW5bjf9OV09MdGzx1icrQoPPbM0x/LiDYXn7bmW+tjssdufa67w2cnYL0jqrA7w0lGaeN+hN6uzQnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P49CJRAq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P49CJRAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737222766; x=1768758766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6nxwbv7RsvGV2OkKqPXPYHG9Iw+FDYHUypvRaEpMhM=;
  b=P49CJRAqy4NdT2eLzrpoyeiZd5I672NBsbAMKipK8Lhb6CyAGxVEs4Tv
   gwY4SbwH1nk+aWolH1SFnmf8Vov0irg4AVc3HotjvxTu/ITzp4UcjY8sD
   ogDKhRUrhr3CxzRLxFaMj1E0ZwOpeW3B1sxGT4g8ozvrs5pcD3V5WageA
   sewo6KmofmuAfFJng2oT2TNysXlTqg9Vdovc66QDz3DFMAPOaxKVOvA0t
   plCJndpYzTkog7s0GT5XOJbAeqtsXDtbWI6ZDEgk6tSriDgh1p4v+igRn
   7tPZxcIBjwqG0o2GI+quzVT9WqOr/VELkHSVHiKS5sKd9nlNuA/USOQ6n
   w==;
X-CSE-ConnectionGUID: 1Y9s/Er/T0qvzsh123Z7Pg==
X-CSE-MsgGUID: p3koilyISPiW21jvghetqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="63009152"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="63009152"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 09:52:45 -0800
X-CSE-ConnectionGUID: M2WHP9WgTB2TpAzJuXms5g==
X-CSE-MsgGUID: ZxT5asUtTjKPjjiK92VOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="111078955"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jan 2025 09:52:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZCzy-000Ugk-0F;
	Sat, 18 Jan 2025 17:52:42 +0000
Date: Sun, 19 Jan 2025 01:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 292/292]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'mboxes',
 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202501190128.BO66BYiq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5c75fa9e727eeea4f1aac71a5838a1bdc76d0dd
commit: 6918c019ec1fdd19c6bafb906b2e3a2d8f85f6d7 [292/292] CHROMIUM: arm64: dts: mt8196: Add secure mboxes to gce node
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250119/202501190128.BO66BYiq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190128.BO66BYiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190128.BO66BYiq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30021000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'mboxes', 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@30140000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@30140000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
