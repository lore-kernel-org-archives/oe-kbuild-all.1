Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE553321C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784098; cv=none; b=J8O7DY1UU2D2M1ou2rkIe4EKCmg3fCWqsP+q8b+nppN7qSyXyTfPNzbR7zUZ6ilW2qJMfDqitgY7C2pfbpgmkTtWi3ebUT3AVxTPGTs9him6Or7t+O0JOwNe71xzRrIWwfgr9bHSI6jj+im4QnZFboFsXMvSiigDUQItRsiuV/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784098; c=relaxed/simple;
	bh=JbmzKiT+jsc9Afv98Gxrghvcbb1GM4+JKA/KeH8M/24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mAEfKs0d6itFQMNcFeXRDyEshtcM/HiRA/17O+oLMPnouSKXvi0I4EiZABrnYoNA78F2sGjwP4YRpFspEu0larzsNLNLU5HOKVwSiSsFceFXYRlABIaCVcur2mlvjjy9/7R5ICbwJpvDXTBoTPjAKpHNDqtPmCYIdbHT4ooNerk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8lQmAXq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8lQmAXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765784097; x=1797320097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JbmzKiT+jsc9Afv98Gxrghvcbb1GM4+JKA/KeH8M/24=;
  b=T8lQmAXqmrc4D0KJTGy5fzlB2ErRKmWimXUKC15Eky6picXwpCnVHccp
   in7I08gEjLbORIV5SaSCf6b1e4shTK5NWMlP8AdiAj0FezcC/da3KIi3P
   ooVuKGBET6wH5RCOjpO1mU7k5WWa0hc8ki4rVbx3L0WSifNj6JCwY713S
   Jw+rDSPyP84Xo529Joe2wSmp+L42RwfljmX5xd3561O/YxO0AV+hQNkFA
   +8TGhy2KxjfK+EkjAoc7Ko+MOcuDnb3PV+fp/5JUIlPRQ3593wyQWb8Bp
   yz9eAp86/qOFbkt3MzJulapJpAk/3R/vr/63iSalnGaQ5RCqp/A2T7OdN
   A==;
X-CSE-ConnectionGUID: qNh4QHBMTAuf4QQakpYwQg==
X-CSE-MsgGUID: V11brVDeRNWRFeDWXHKdpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79051594"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="79051594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 23:34:56 -0800
X-CSE-ConnectionGUID: XoEJlZIfTkKX0F0iv3LFig==
X-CSE-MsgGUID: ULZG+gfyS7SrldK8nIrTKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201844351"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2025 23:34:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV36a-000000002bE-3BIw;
	Mon, 15 Dec 2025 07:34:52 +0000
Date: Mon, 15 Dec 2025 08:34:11 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-mtkdts 2/4]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb:
 pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do
 not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202512150844.o10X2cRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-mtkdts
head:   651b3b0abad5dded7a4e0f3864b89da3a270e5f0
commit: d2e1f0dbd46abd1c2304ff1524f6031cf21f2324 [2/4] arm64: dts: mediatek: mt7988: add dtbs with applied overlays for bpi-r4 (pro)
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150844.o10X2cRP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150844.o10X2cRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150844.o10X2cRP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
