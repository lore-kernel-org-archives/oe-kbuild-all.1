Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A3430CC8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417152; cv=none; b=ZpYdBxA4N5zjRIqLxZQpRRWE71qZzQ6L6D5IRn1TG+DreH+rIc0iype08cVl8MdvxcR0XlcqF0DBVYuLd+CSggFPOaLpfjXlb2VGjsYoxhm2bpfynmfSyYKUeQrwyZy7IzExUS/6lgDtms9UB9GRqPZFym5Zf37Pj4WEmekEz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417152; c=relaxed/simple;
	bh=d3CbBnsZP0LjXGsddmop8LCkt2qLGBWMaLWP5I4WaTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e8Zpj30eWXT/0a+KI0aP6wg9KMesAuJQ85OJmVhGZooXXnlqDOmIYLWf58PWQa/UzkztVcS3KdwUithnxabUxCne8qkr/2VWhXZJyCiBRw+Hi60cWvUq7pTlQmGh7hvXcuXoBjWyN0+ppWCq2NGGhLcY/L7J2i/qTtwS5qCulfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3qZys3u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3qZys3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785417150; x=1816953150;
  h=date:from:to:cc:subject:message-id;
  bh=d3CbBnsZP0LjXGsddmop8LCkt2qLGBWMaLWP5I4WaTM=;
  b=l3qZys3umiX5QLu7Lda7I/gn+DoHEJGsOncu+b+E7u6lYq3UZ5awr5Tf
   9znUySrng/hYyi9hpJFaNKs+RGqs90GTN/sPln0xKMlEC4LFJqEYkYIMo
   m99Z7wJb+cM8AjnXnIpxF+bP9NNiC/88FJiH6oQdFrbNNcRpzIUug3fhp
   4sIAUXsbifaCPzff5XFWW4kBW0F9JWV6JLC/zaBcgHGVvo7Plhcfn1NFW
   t1HgJsp3rwb+YYGHEyLtGpVQrrj22fMdu0yuTkWxEmnURqj+GyR3tNJfi
   a/8MyXH+fVAUxy7IfGGutmXnfwWH+PaikU60d9h1vhN1MOhXc9fXUYvfV
   A==;
X-CSE-ConnectionGUID: ytDDGeZSQV2pCTUP+jTwig==
X-CSE-MsgGUID: IAPsz6NOTRGy90Qe5QEOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111582003"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="111582003"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 06:12:29 -0700
X-CSE-ConnectionGUID: mgP5zX6aSzSY1picNVV+rA==
X-CSE-MsgGUID: YrflrwB8R52tRcgUjMX1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264101354"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2026 06:12:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpQYk-000000002NS-0jxA;
	Thu, 30 Jul 2026 13:12:26 +0000
Date: Thu, 30 Jul 2026 15:12:00 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 68/168]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb:
 pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202607301541.PladSmFs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   1953c4d64c0da95dd5833d59a20a9f1f456fec31
commit: 33f49c21b3a80ed82e1bda492ea263b0ac3e7983 [68/168] arm64: dts: mediatek: apply bpi-r4 nopcie2 overlay
config: arm64-randconfig-2054-20260728 (https://download.01.org/0day-ci/archive/20260730/202607301541.PladSmFs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301541.PladSmFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301541.PladSmFs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
