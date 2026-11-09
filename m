Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235616;
	b=P+U0h1OPm4V9iuG2YFAJf9fD/Lzo5XLW/jl/dd0DoWuMkczZzr6VzuibnALDp1811OlS
	 HcwlJNzlpSUwd8dAZyPFvqMNqtf9Y3T85aJ32cfJYT6Qcg6mAnZhx/83bn94V6sBBhCvf
	 ouvsEUOx484e4C5IvSu/lmeB93i0psDMjRvJa21j5FTJltKP91z7ZBZtHLPxBIENWL9eb
	 NsDL3aXTYmln8Z5ly5VnocEKblQaEyRvTc9CZ0xbVljMCbThWvUIfNQqOMPotoLI6Cwd5
	 j1YCpj/KKjwOabxObRQGpt03jCoFXFqwPGmgIrgS0a6K+vKo5nANor7KGUok4XxqsiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235616;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xYaizuCtM4gmxG34dm6rQ1LoZyOJYpNHHFu53e0cKFY=;
	b=SP1F7+NXt06UToU8mZjudMToy08ckmLnf2aXVZIS2M/7oTgIW5F05lMh/xm+Bn4G4DBj
	 FXAwdbJoyJF/xthsbaXxWJIkI3EqzmsCC7nt4IqmcKP/hlpgoM85sfdNjir9+tT8U2SXB
	 5XJgVZy/QLz5Kn0OCopgk5iUsLHlEIymsGvFbX8PL0fL3x0pM0AJM+VeB7MQgS3eFayxc
	 kmrFAt2DYGnjnT7ecLzNX1j5lJ8PL24Un3KxAG0NMXATZMPLR8GCro+YGNBgldPLJOn5k
	 A2ogf+xOMF1RZyJ0ZHhYEMWHhgGYwopTbf7Ei7smlSyRecbQ/jUPsCYKxjyc0i6mZRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NmnNdjZ0;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46187606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 14:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46187606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NmnNdjZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794235616; x=1825771616;
  h=date:from:to:cc:subject:message-id;
  bh=3s98d2Wk02UU9HUJuvUWR6L1OAnuBfy2yJbQQH3S67Q=;
  b=NmnNdjZ0m2WAlhll++jg6Gqj0X2Cj6TLOZH4Dyd6FZWRfC17jzvWN6J2
   zDliKMVhHlDct8fhqoaLeyz5E/+Lk1revqPdJGmQ/yxSxf+ZwrEQnBxeo
   uiR1BDLftrIK1EgEfBORcGSRRSexRG+WyxD3gsBes4PXOtrdp4wmJ4csO
   JOO12//zSnCO8ANI+o6oMomaBOC1bUdP3LTHtQkHlkSW6q6hUPLmg1GnD
   xy3IAQeybWQfCH7YETSeth/gfx/owJYi3zjVPIAUhy/TrKmlZVF1PfUF9
   Z8BqnJRMi3Lv0aRI8MDfSmRexPy8uvPJ9Z/yGCzsvguyJiAWm63upicv4
   w==;
X-CSE-ConnectionGUID: t2Bd4k8LQMet9uDtztnzjw==
X-CSE-MsgGUID: KUDEzvMSQ0e7E/OOOdAayg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2836718"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2836718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:46:55 -0800
X-CSE-ConnectionGUID: bnJ3qW+NTdyudsBP7zPu9g==
X-CSE-MsgGUID: OvR4yFX1RSONjfryYKR2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8215944"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2026 06:46:53 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQQe2-000000000L9-0mk3;
	Mon, 09 Nov 2026 14:46:50 +0000
Date: Mon, 09 Nov 2026 15:46:47 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611091554.gZw8qHKC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: c178127e627efce9560b07a81e3d2682759ad608 [51/154] arm64: dts: mt7622: fix sata
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611091554.gZw8qHKC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091554.gZw8qHKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091554.gZw8qHKC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml
--
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
