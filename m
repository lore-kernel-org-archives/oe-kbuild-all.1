Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAA3CF1F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 21:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941124; cv=none; b=R8vnibDo6393/+zXz+X2B7yXnnnQUTdgfs8UBOc74tZXuJcljekNuXsrNUHwQTeVavXtzUSLFuRFWvE5BF1qEzkeRnBs2a6xKfIW7LnIyvceAQwQ8fOI1DjQHO5/HUqYUSNyXAJehdislxU/Ee/Djf82lSN1Zt+Fhz2speUqg+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941124; c=relaxed/simple;
	bh=6KBVqEF6gDy3laUU0AlMwB9z1MjthxMvcG5r/hsA7HM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JgiqPLiO37BeOua0p9+353rqJWXAVDHHJsEie3AF7XbQ9f2vXVFD4CwaHk4MLhc1uZD9gIvcaK+RA+Q28/hJTJel1GHquUemo+f34bIPkYyZSO77C6dfuJeSYPOzUwyA0hjI3cGU/WTWlzgPxZ5r0lMEvLQGVtuPax9D43TzH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nv/PK5aJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nv/PK5aJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782941121; x=1814477121;
  h=date:from:to:cc:subject:message-id;
  bh=6KBVqEF6gDy3laUU0AlMwB9z1MjthxMvcG5r/hsA7HM=;
  b=nv/PK5aJEioxz4TGwKmsYqKHZ0Fs9SwKeXGe+YtBUDxHW+Sh88cKurWm
   voeYa2MoDatEPD+6Y9scI9kVy0T79BFMno9WpzxJIZYSTaYvt66swX1jA
   ztscqg+MIH1p3dQ2NcXkfTUd1VRsmU98welS8s9W7NU8QIDIXS8Q8IqqX
   JW8SycnEuswjwTAJo/4w1/DHiXa/VGdA2kblApapNWOIZpfpLb6kl+Mb0
   e5pNLtphGD3fKFnQIn8+UWZByItukU+DLC1kprJb+nzHhJI1DrdzQZizt
   nzA0GeXEOSrIAje3eA3sOrhSpqW2DRNZqJnzOaXUzxzbf1iC8MaFjG4ia
   A==;
X-CSE-ConnectionGUID: rDDoCbSFTc6hYHchF5zlJA==
X-CSE-MsgGUID: sqfCT+fzRcSfgwyaAmet1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87517995"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="87517995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 14:25:20 -0700
X-CSE-ConnectionGUID: +fwQE2I2RjuvrjOluEji4Q==
X-CSE-MsgGUID: o4B1gpwkQCW8CRiNxdxd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="250030183"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2026 14:25:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf2Qm-000000000th-3Yq0;
	Wed, 01 Jul 2026 21:25:16 +0000
Date: Wed, 01 Jul 2026 23:24:42 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 68/160]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb:
 syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202607012306.igoWtiZS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 33f49c21b3a80ed82e1bda492ea263b0ac3e7983 [68/160] arm64: dts: mediatek: apply bpi-r4 nopcie2 overlay
config: arm64-randconfig-2051-20260630 (https://download.01.org/0day-ci/archive/20260701/202607012306.igoWtiZS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012306.igoWtiZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012306.igoWtiZS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
