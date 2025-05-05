Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4487914831F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746415971; cv=none; b=b5mbQh5ioYGN9qP3brZ6gMvMO3odexyovZnX1yCYNFM9ekm7mQHrcGpFHWNtOiN+ka9W35rtXh6H/oCOcXKLvH3Jjcr8y2CvwX+am7oC3U2zsuIT9BrUqPZ5WEk201LusMxwcwh6mowrHHuTFCY2u4dGu+5FYBsrsoUO/AQ0jRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746415971; c=relaxed/simple;
	bh=MyFMXSZ1rL+hOUfuGH7kMtbMwdV+FP/psQxs4EFWm1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7aZDxE1Nru83XgvTv4gaBUjzcK6mZCf6p4cOfuDbOrWBVfLmFxfSFLEpg8QeCiRQlim/yxY4OEmySiYHhg441WuPSILnx5E5ClNpDckw1mZrMSZlsXOaE1bcmAsrHXxKeO7/Lgm8LM7EpBPgicpDfGv15xmz0fPLT+ekGY54MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR9v1+ah; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR9v1+ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746415965; x=1777951965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyFMXSZ1rL+hOUfuGH7kMtbMwdV+FP/psQxs4EFWm1k=;
  b=KR9v1+ahRiIuthzyHFsPBPBtEKvzguTkFa7ZdcQeEejQTMtco3i2JWxG
   fPgnEzGr90YOdqsk3u9QTYedUcgzNjU9cwgUSDlj7ZtdOiNFKpbngYsc6
   TIpptssJj/OY4S9QCol66WLIJp47+WDDD4WyRH/z/TpjpXR4Y1SXxNJiW
   /DNZsi+pCyllz2jNkDAuD9kveZEO0MavbyeiG/H1Ssh+hnoA9y+32tQUI
   ucTwwupljDy1f19IeJADFUwbYwM22XW3IV8swAca81Lc1wD1EosshMJrz
   GIc8TX+3BVluQMVLv7YgKl8APy1n8Z9UI6j82q0L4N+QvCklCP0fQJkwJ
   Q==;
X-CSE-ConnectionGUID: xh6C7M2FSd2KsXmZgnxPBg==
X-CSE-MsgGUID: D+j8z1hmSAGnp13jOiJQeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="73407570"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="73407570"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2025 20:32:43 -0700
X-CSE-ConnectionGUID: HdVu5kYfRqqIDbuwo6ClZQ==
X-CSE-MsgGUID: WBNLzXHSQraoNO8t8l8aYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="136078778"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 May 2025 20:32:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBmZL-0005QB-1Y;
	Mon, 05 May 2025 03:32:39 +0000
Date: Mon, 5 May 2025 11:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3117/8235]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000
 (mediatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185], [34, 190], [36,
 4], [36, 41], [36, 42], [36, 7], [38, 41], [38, 42], [36, 8]] is too long
Message-ID: <202505040919.JU2xN45j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37ff6e9a2ce321b7932d3987701757fb4d87b0e6
commit: f0935480253ede5405045a4e733f4476343cbb91 [3117/8235] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250504/202505040919.JU2xN45j-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250504/202505040919.JU2xN45j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505040919.JU2xN45j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185], [34, 190], [36, 4], [36, 41], [36, 42], [36, 7], [38, 41], [38, 42], [36, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[92, 13, 1], [92, 14, 1], [92, 16, 1], [92, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185], [34, 190], [36, 4], [36, 41], [36, 42], [36, 7], [38, 41], [38, 42], [36, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 128], [93, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[54, 15], [54, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186], [34, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186], [34, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[103, 164], [103, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186], [34, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186], [34, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 192], [93, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 20], [38, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 24], [38, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14, 1], [121, 16, 1], [121, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 128], [122, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 164], [132, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 192], [122, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14, 1], [120, 16, 1], [120, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 128], [121, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 164], [131, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 192], [121, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14, 1], [120, 16, 1], [120, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 128], [121, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 164], [131, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 192], [121, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14, 1], [121, 16, 1], [121, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 128], [122, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 164], [132, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186], [46, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 192], [122, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14, 1], [119, 16, 1], [119, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 128], [120, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 164], [130, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 192], [120, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14, 1], [118, 16, 1], [118, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 128], [119, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 164], [129, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 192], [119, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14, 1], [118, 16, 1], [118, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 128], [119, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 164], [129, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 192], [119, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14, 1], [119, 16, 1], [119, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 128], [120, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 164], [130, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186], [45, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 192], [120, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185], [37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42], [40, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[128, 13, 1], [128, 14, 1], [128, 16, 1], [128, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185], [37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42], [40, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 128], [129, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[58, 15], [58, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186], [37, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186], [37, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[139, 164], [139, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186], [37, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186], [37, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 192], [129, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 20], [42, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 24], [42, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185], [39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42], [42, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[130, 13, 1], [130, 14, 1], [130, 16, 1], [130, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185], [39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42], [42, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 128], [131, 131]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14001000 (mediatek,mt8188-mdp3-rdma): power-domains: [[60, 15], [60, 20]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14002000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14004000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14005000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14006000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14007000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14008000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14009000 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@1400b000 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@1400c000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 10], [39, 186], [39, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 10], [39, 186], [39, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f09000 (mediatek,mt8188-mdp3-rdma): iommus: [[141, 164], [141, 166]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 12], [39, 186], [39, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 12], [39, 186], [39, 191]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
   	'mediatek,mt8195-vdo1-rdma' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14f0a000 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 192], [131, 194]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f0c000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f0d000 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f0f000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f10000 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f12000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f13000 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 20], [44, 21]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f15000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 24], [44, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f16000 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f18000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f19000 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f1d000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
