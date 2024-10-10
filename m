Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D71C9DF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567377; cv=none; b=fMgHMY+7aKTyjss6aDUAHuaNwiGyNQWj83Y0QShlMRe/bYlmgCXEH23HxtQLbGU5LWI+Ba8kHt9TQKfvPFXrXZjcQw4xYGelO1LU1auyUWNUr7PqMiQCdFUX/hQmjerHU7VrdNG20Uf0w1IJuYlFGnSoEY1rHCr77ARfEm7ciSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567377; c=relaxed/simple;
	bh=/erl6WDE4ofjPU9j1jvAZ1jAWuZkyHO7ZTweFjQP86k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFOGRcScNO1JIMu1ULK9gd7ob+gR9aCtpjw4p41p3vsbGsE8Wdnmf5m00gP4SaB1gJOYjC3b59yqwjYKuLTXAYxSEl5wQY/hOyseGj/65p6+d3oXW4EZBC1NBgIPe5QQkpR895Bu4S9NYEFaKFrimmtueCsdjCU0ZiYMEOUIzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJSytZBV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJSytZBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728567375; x=1760103375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/erl6WDE4ofjPU9j1jvAZ1jAWuZkyHO7ZTweFjQP86k=;
  b=EJSytZBVhpX5ErPiXw2O7qfNj+o+grYUHIBVRH535sKkB4gOF+Wz2vrP
   PLDidHN3/4pXwK1aj4z6Pg4f9OKba7eDVuNNds/JZg+jEdh7SYPDDaWsh
   foGpJ1vlmKGjI0eM3vzl/t9Nxd8ROtcmKX+7ynIAg026cBABb9ZjRBlk0
   FYQpuXPlgSy4Sh++m26hTmHZo3dbwv18Ie/vMrA6nwYN7lpLDqmHUmX6L
   wG7YzqrsG7tlIlOBT1Kif1MridgMihqSq+n6P0uE0gBnSX7Sn5sch66uY
   5/Q6HfCGlIfzANvnAJLPVPGFawuZIlpkHQ3LQsVT3zXlDjZ7S2rDjFweX
   A==;
X-CSE-ConnectionGUID: 6WyYfJIIS2mOFxXw0W1QjA==
X-CSE-MsgGUID: w9FHX0JgSIObBshlVwhi0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28078692"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28078692"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:36:14 -0700
X-CSE-ConnectionGUID: 4O0xguIDRvKJppIY3Vu9tQ==
X-CSE-MsgGUID: 7vaGLIlhTw+rSa69/RQYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76582125"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2024 06:36:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sytKt-000Ao9-0Y;
	Thu, 10 Oct 2024 13:36:11 +0000
Date: Thu, 10 Oct 2024 21:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Shao <fshao@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 3046/3432]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dp-intf@1c015000:
 power-domains: False schema does not allow [[54, 16]]
Message-ID: <202410102131.CB7yNDql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
commit: 5a206e43176226bc63599873c94a6a94305afb62 [3046/3432] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
config: arm64-randconfig-051-20241009 (https://download.01.org/0day-ci/archive/20241010/202410102131.CB7yNDql-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410102131.CB7yNDql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410102131.CB7yNDql-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000: iommus: [[98, 685], [98, 686], [98, 690], [98, 691], [98, 692], [98, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[54, 16]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[54, 17]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[109, 685], [109, 686], [109, 690], [109, 691], [109, 692], [109, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[56, 16]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[56, 17]]
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
