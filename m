Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70712B176
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475019; cv=none; b=UiqxM4T/DfB1WQVdUfuYSPAkScj9PimbGYVTZ225UYI0IDZ8BVDjOLBwvX/dL5YjVhDRfGRGmHTTkvAi4C7FXqvuhEtsznUdmio3qin/XOdSeLPmk+RlDl/7V2DDADXjEoOv+WNrVz8jsFLjRGn/xWifGh7iSGOxPTVh1XnRKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475019; c=relaxed/simple;
	bh=NVSLX5RkcazniOM4CcxL2EfKOdq/b/a5XSoT8RIVKzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XY+tLVoA/GRLccNGoqu3iXQdrMnE45iWIausmu61LP/CAakLeK07QDKxA9RoIPRJiVCNRgXQe1JI1ROq10beq+e/QFKjpL4yM5zDtqia3RTth6KrBTNG8g3q4LMdMlJqq/A+dgAiyJJsSXJemjnKYUjGutylZ5/WjI1Kty7d9Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwpD/Esq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwpD/Esq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714475018; x=1746011018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVSLX5RkcazniOM4CcxL2EfKOdq/b/a5XSoT8RIVKzU=;
  b=JwpD/EsquJR5l6E3zUPvrbXSr0ULX2QijfNlNQUpT4dHvF7g/PQNONGn
   86poy0g/hMIueypNMIYFdI+lAOX/i4/auhgJzqBVbqvr88zkGgMp126+i
   6/dBPcS1TZvO3SC+k4pr3D5tp0Rxjs+LZ2B1zjQDYoLdZFUOf9mZygcya
   bpwrOZafnYmFa1aadXk2PbgDZVgW+4VaVj2xeMVgF2lKKVZ9l8nfuL8RD
   4SlORqx/LnZDcSlkZQqLOMjVxFne6Njlh+DTa8msyrzDnJbi8q4zp/PW1
   OVP/o4S7OELadpYItwcJbptC9GO4pO7qRVlW2vTnAi3KIAUn1E2icNkKS
   Q==;
X-CSE-ConnectionGUID: y07z7z2zSseRrVXR4rbfjg==
X-CSE-MsgGUID: TU/LPGXcSsOIOWt0PgHFaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10051715"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10051715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 04:03:37 -0700
X-CSE-ConnectionGUID: +Z42UG5FSmWj+NaDoNLkjA==
X-CSE-MsgGUID: onRaXnErQn649wa35OwzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="30880209"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2024 04:03:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1lGm-000843-2F;
	Tue, 30 Apr 2024 11:03:32 +0000
Date: Tue, 30 Apr 2024 19:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master /9709] dtbs_check:
 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb:
 pmic@3a3: regulators: 'boost' does not match any of the regexes:
 '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$',
 'pinctrl-[0...
Message-ID: <202404301941.eZF5aiRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: 4a9da9a43f99e537e1dad5759b3863ce34febd2d [/9709] Merge branch 'for-mfd-next' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404301941.eZF5aiRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301941.eZF5aiRQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-lite2'},
   	                      {'const': 'allwinner,sun50i-h6'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-mini'},
   	                      {'const': 'allwinner,sun7i-a20'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-one'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-one-plus'},
   	                      {'const': 'allwinner,sun50i-h6'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc2'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc-plus'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-plus'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-plus2e'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-prime'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-r1'},
   	                      {'const': 'allwinner,sun8i-h2-plus'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-win'},
   	                      {'const': 'allwinner,sun50i-a64'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero'},
   	                      {'const': 'allwinner,sun8i-h2-plus'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus2'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus2-h3'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero2'},
   	                      {'const': 'allwinner,sun50i-h616'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero2w'},
   	                      {'const': 'allwinner,sun50i-h618'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero3'},
   	                      {'const': 'allwinner,sun50i-h618'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'}]}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/interrupt-controller@7010320: failed to match any schema with compatible: ['allwinner,sun50i-h616-nmi', 'allwinner,sun9i-a80-nmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@3a3: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
--
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-lite2'},
   	                      {'const': 'allwinner,sun50i-h6'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-mini'},
   	                      {'const': 'allwinner,sun7i-a20'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-one'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-one-plus'},
   	                      {'const': 'allwinner,sun50i-h6'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc2'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc-plus'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-plus'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-plus2e'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-prime'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-r1'},
   	                      {'const': 'allwinner,sun8i-h2-plus'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-win'},
   	                      {'const': 'allwinner,sun50i-a64'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero'},
   	                      {'const': 'allwinner,sun8i-h2-plus'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus2'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus2-h3'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero2'},
   	                      {'const': 'allwinner,sun50i-h616'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero2w'},
   	                      {'const': 'allwinner,sun50i-h618'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero3'},
   	                      {'const': 'allwinner,sun50i-h618'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'}]}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/interrupt-controller@7010320: failed to match any schema with compatible: ['allwinner,sun50i-h616-nmi', 'allwinner,sun9i-a80-nmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@3a3: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
--
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-lite2'},
   	                      {'const': 'allwinner,sun50i-h6'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-mini'},
   	                      {'const': 'allwinner,sun7i-a20'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-one'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-one-plus'},
   	                      {'const': 'allwinner,sun50i-h6'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc2'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-pc-plus'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-plus'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-plus2e'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-prime'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-r1'},
   	                      {'const': 'allwinner,sun8i-h2-plus'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-win'},
   	                      {'const': 'allwinner,sun50i-a64'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero'},
   	                      {'const': 'allwinner,sun8i-h2-plus'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus2'},
   	                      {'const': 'allwinner,sun50i-h5'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero-plus2-h3'},
   	                      {'const': 'allwinner,sun8i-h3'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero2'},
   	                      {'const': 'allwinner,sun50i-h616'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero2w'},
   	                      {'const': 'allwinner,sun50i-h618'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'},
   	           {'items': [{'const': 'xunlong,orangepi-zero3'},
   	                      {'const': 'allwinner,sun50i-h618'}],
   	            'maxItems': 2,
   	            'minItems': 2,
   	            'type': 'array'}]}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/interrupt-controller@7010320: failed to match any schema with compatible: ['allwinner,sun50i-h616-nmi', 'allwinner,sun9i-a80-nmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@3a3: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
