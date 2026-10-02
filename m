Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695FA28B4E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952644; cv=none; b=BrbAkGX1POXsWrUoEB4bDx3kaTlBYRtzc/Hb4iB8+/EdgGKBlZmjykzIldqhKhsJWMrW6YAnRw9ziJmJgxLf4PkRxzOf3HZxNKJ1adT4bvR3aNhr/ASTsPQsIpWDIShNtRdzADDKcZcKmBnLa0E0HQW+RdYGGs+VBqZx2ud7N7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952644; c=relaxed/simple;
	bh=qKV/JB51qG77scUWfaQrzx05bfmXdiE//IrGC57ocrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b5uMVWl5SVRpnAft1JfEsQyFtVugMjcCKl4azP1CyOjPxgekeC8cWGEf25+HVQN03WbANHpOGqLoXLzsVgpjilHWYPTngi0Z6fm5UqEDiKiVE97GT/K2flfrbpWZB2qXUD3ZmS/lkn/MzXBo6Dt2YnQU6OmYYjdQ8C3RkunwNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fadi8g5g; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fadi8g5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790952640; x=1822488640;
  h=date:from:to:cc:subject:message-id;
  bh=qKV/JB51qG77scUWfaQrzx05bfmXdiE//IrGC57ocrk=;
  b=fadi8g5g7iy8rgIZc+WlzlioKC5KWsZap0vaZYwcsZC4U35T7amHZ+vH
   I9v6nrVTg+RRZ8k3VFl5k8mejgINEXHn3xP6x+E8BdIKi4VD4qPqUHmkF
   /BaPrFXOPbAIOal3+96rPI9f2IwBi0LuR4FGAh3UlPv+erKdHnK3rCD+N
   LM5/vuG1ATElZgSUAGbWln+ugmd/5hDcXVx608919rcoTfvVa9cYMFyod
   OveBywI0lgffGnAiq/siFwPq3HgJ0CgYiLoXTYUiVyVCGGA/cgZIoByc+
   vVy9m/zyflJ8HySZmLyK4JwKikVHxenEjwuQTXefxM71GE54E5THVTPsy
   g==;
X-CSE-ConnectionGUID: sI09vvgdSaOzmclNyHkOIQ==
X-CSE-MsgGUID: 8VBTif3aSOqybo4ITIO0Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90577704"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90577704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 07:50:40 -0700
X-CSE-ConnectionGUID: OpKPUzNQTIqlSezIceW2/g==
X-CSE-MsgGUID: NwRgM4aXT+KrdD+0Sn6VkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="314253732"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2026 07:50:38 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCeaq-000000000bt-1bcL;
	Fri, 02 Oct 2026 14:50:36 +0000
Date: Fri, 02 Oct 2026 16:49:46 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [linux-next:master 11299/13246]
 arch/arm/boot/dts/marvell/armada-388-helios4.dtb:
 /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema
 with compatible: ['onnn,pca9655']
Message-ID: <202610021617.AlVUa9No-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 6dfda79476538a9aad1d2dac45453e62c6939522 [11299/13246] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
config: arm-randconfig-2400-20260930 (https://download.01.org/0day-ci/archive/20261002/202610021617.AlVUa9No-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1f84168f595dab2e23aab4181997da0a7f486dc7)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021617.AlVUa9No-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
--
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected
   	'allwinner,sun8i-v536-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml
>> arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/i2c@11000/gpio-expander@20: failed to match any schema with compatible: ['onnn,pca9655']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: i2c@11100 (marvell,mv78230-a0-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too long
   	['marvell,mv78230-a0-i2c', 'marvell,mv64xxx-i2c'] is too short
   	'allwinner,sun4i-a10-i2c' was expected
   	'allwinner,sun7i-a20-i2c' was expected
   	'allwinner,sun6i-a31-i2c' was expected
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,suniv-f1c100s-i2c', 'allwinner,sun8i-a23-i2c', 'allwinner,sun8i-a83t-i2c', 'allwinner,sun8i-v536-i2c', 'allwinner,sun50i-a64-i2c', 'allwinner,sun50i-h6-i2c']
   	'marvell,mv78230-a0-i2c' is not one of ['allwinner,sun20i-d1-i2c', 'allwinner,sun50i-a100-i2c', 'allwinner,sun50i-h616-i2c', 'allwinner,sun50i-r329-i2c', 'allwinner,sun55i-a523-i2c']
   	'marvell,mv64xxx-i2c' was expected
   	'marvell,mv78230-i2c' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
