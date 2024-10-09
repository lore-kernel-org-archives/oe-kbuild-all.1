Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8705B1E1C16
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728497355; cv=none; b=XX8prEkJYbmArZDLpO9d1NAu8pSrCazc95mOrCzmaeIP2RhijZlcEZxVVxihJyR5Q3XzCVKXHTjqTqIz8M92JsFtzkt2ypTT7F2AwUDa5Zjdk0c4rsu1a9cMXbHAsgHD5Ew+d9tmZP4+ZxDmlqxXpgQcoUjPX7J4qO9GTFGi2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728497355; c=relaxed/simple;
	bh=xiWKREAhIvUWklW1DLVH3lIGEKdPUSnpRawJex0ODwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BecL94mG/0umJ9OoxcCBKSwX2y4jcGq6TZ6SLVNrStABBemT0lHyTpp5H7cHa0bKFgk09DfOFUfRs3vVLnycYTH0YU+uZSHUTvJ8TroVNkwO6soHqvZZJK16wih9MzErtowHvqs9qypePb4FtJ6KzScJ77fvKmBO3xoFGLkOHR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLrMplwE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLrMplwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728497353; x=1760033353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiWKREAhIvUWklW1DLVH3lIGEKdPUSnpRawJex0ODwI=;
  b=OLrMplwE3ghHINx8GXcysYi6WSCNAERpGL2uwsqjsByFFy746blf7q+Z
   WEXoSl5hxPtwB7+zTx7MCmk1jVMrzBKK3AlduWOmsxBc+ouTjEgcOAzV7
   64yRZD5Yf35D29yBPM9t0P5c7KLJ3JtUsYsXUVFV2b41s+xp4eqJa/jT/
   QXCaP+l/Zjj/hvw+KVzTv0t0ySonE8qupRbWUZN/lv5hjKNrKduUEi/2G
   cz1TVvtYoQrP9CsgWNkaaN4YTHVs6f3UeT99rJ+lI4UHgpkoCrcxuI9WK
   c35HR8VIAqXATOJZXXvYd50Bcp+J2w7IQZ0kzbDnYXoSHBaMYsmFWo+8j
   A==;
X-CSE-ConnectionGUID: u0axGv1FSAueDlDWMgX03Q==
X-CSE-MsgGUID: S3yBFm1KSMWTQYqHd70D8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31520282"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="31520282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 11:09:13 -0700
X-CSE-ConnectionGUID: qduMhrbKTMO/GGynXoJM2A==
X-CSE-MsgGUID: V+ObZWekSqSVen7OjG0RHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="81347118"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Oct 2024 11:09:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syb7V-0009am-18;
	Wed, 09 Oct 2024 18:09:09 +0000
Date: Thu, 10 Oct 2024 02:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Shao <fshao@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 1566/3432]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: spmi@10027000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202410100243.LRJmkKkc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: 86bc9aefaef7190b74699e55eb2da3d6f07c19f2 [1566/3432] arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
config: arm64-randconfig-051-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100243.LRJmkKkc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100243.LRJmkKkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100243.LRJmkKkc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
