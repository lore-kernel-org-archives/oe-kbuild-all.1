Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8FD442139
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423401; cv=none; b=f4H9hC1+LlzX326hEFQFR/w5U0EhdDhnv5zmcCX9SXpyOa5LJZMhhyrwVEqV/I6j1fOsGRxEZBaIa0mFwSqes9FylXCpAbCo2BBY3MU3lQR/+Ois/ZXf4QSBz9Y5GQG9YntWtYFjZN5HibYQ1XtI3HcRcX8+Q5nioioNEjYvl4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423401; c=relaxed/simple;
	bh=Af4da0DSBDWE0blkCsXRxeRjaoCiurC9+EanOWRCBV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y8CGPnpyhtTj346YzmCEjeG1to/PF6OdfVvs8imezZGyewFheN0+fwAtLHtwVO4OAPu/btFGdpSiUmMK0XowjKYhkAzz8FoyTUIn4/BvIR64ddomIc4hzXSD8f0fGc3ltbyW9xQip8Hin1hqB98fi2Fh5E73I8qyo1U1IOkKPzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMRUPRmo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMRUPRmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785423400; x=1816959400;
  h=date:from:to:cc:subject:message-id;
  bh=Af4da0DSBDWE0blkCsXRxeRjaoCiurC9+EanOWRCBV4=;
  b=WMRUPRmo7wGH0n7bc/GIj7u1aJDHkdY5NzEFFSF3o+dU/CSn3imCUar8
   MIj4Kqv5AMbwrCJdc3TQ61fokj5y8BTSUu4ZDSrL0jSsKg8OpbTh/6w4S
   oZWc9/B45e2rAKaur+QnYRGnkRk1rgsfxB+yVJfdoN4QE/RCagykt+qL8
   SGMsc3LZkOHG5flAU+QvDrl4L4SXeOTpZUWsJuNpW1Wx1UVTAHYclzpGv
   v/AyLUgWO1e4oPE5ZHGUu4/IMxj8SIEZ6hOIXQkplwfTjHGBNSHjcG91V
   fp4e2ElIv0+jWfgvROeC13xn0UiHPVPVPV9mopk9VLnAX920Jb57yab6z
   A==;
X-CSE-ConnectionGUID: 01V3GRnETQ+f1lgfqK41Gw==
X-CSE-MsgGUID: Nn4xVAaOT8WNpSaXEYNQ0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97558575"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97558575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:56:37 -0700
X-CSE-ConnectionGUID: azo1JBE9TXaWkt/ra7s2YA==
X-CSE-MsgGUID: UsjV3QOdRTms5twdSMpzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264599139"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2026 07:56:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpSBV-000000002Oo-0C4X;
	Thu, 30 Jul 2026 14:56:33 +0000
Date: Thu, 30 Jul 2026 16:56:10 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: 
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcie-2-hog:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202607301619.a1PiUAs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11028ab62899e4191e074ee364c712b77823a9c4
commit: e309fa232d12b969afac43a4b7d83dee025cfe63 arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
date:   3 months ago
config: arm64-randconfig-2054-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301619.a1PiUAs2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301619.a1PiUAs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301619.a1PiUAs2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcie-2-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcie-3-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcie-2-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcie-3-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
