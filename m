Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54E2E630
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734526790; cv=none; b=gpL1K72LI9SBkzcHLsgEU3N0gIXpEXADbdrw2DglU6jIUafCLCgi/Fl11z9ohqdfDM+RB56PhGQQSO+JCdeDZhIX4JUGRwJ/faaBlhEB6724ChqLQFcgPtqYdiWmSzIWpyH30RuUUgz91NF8q5xBM+Klj7Vf1ZzqkK6RaFpy90w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734526790; c=relaxed/simple;
	bh=05/KSLouOTQl268euCv6dsi9P0ZRSec21uvOlwvfKa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7UtwWgQw7vho1oP6h1zZZk6tGt1j+2+Lddc89ZrKc/dkKhDn2CyMjWVNm+BFN4QibzkLJhQGdHNXzItqEhz5yRIgtLIZ6FtuNjW6Mvt/pwKZGsjauPqR057+0rdZ39Bl3zX8xN1eh0mIHx61J5ejR4w62vAZ8VKwJC4zXR5byc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wumigfrr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wumigfrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734526789; x=1766062789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05/KSLouOTQl268euCv6dsi9P0ZRSec21uvOlwvfKa4=;
  b=WumigfrrxwPAObBsgLfSA7ua241FFAJBKHv/lxxYFrGGekMVC5PM/mn9
   IequY+E9tzvvSx4Yn1pvyNaDjQ8s/hpDl/z89a1g4ULEiUpwu4C+RXZi8
   kubObJJ5SsKEyNx3gC1lB7WGnbxqHI52S5jz0X06Db+RkxFW8UOet2yN7
   /++5tDu6Wr4uMNN7CpKAuAhjFWo/HvMOdPUfvIQz+SUAsq/bfkG45LNjf
   c39aL0Jt1UH1OO2yW5Jq4spO7D0zOREZig+0YIjaYit+d1Em2Wwf9fMiP
   QNCLosKn2XqDLF9WMcoBSGvsu+GbvLycez4H827oDfNjkzGhvjY5BpFEz
   w==;
X-CSE-ConnectionGUID: fR4f07WyS8C+PVUUNLBUIg==
X-CSE-MsgGUID: 4Odtyxf5QjurMgl1zPLhHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57477122"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="57477122"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 04:59:48 -0800
X-CSE-ConnectionGUID: Lnk8uvJSRbW1kp+LSt9LfQ==
X-CSE-MsgGUID: Xl/TZHeAT9Co7r1dBGuXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98675235"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2024 04:59:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNteS-000GLE-1U;
	Wed, 18 Dec 2024 12:59:44 +0000
Date: Wed, 18 Dec 2024 20:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 3698/4476]
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14400400:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412182022.bnXp7rTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa366f1b6e376c38966faa42da7f0f2e013fdab
commit: acb247afab5bc2b4462f4dfc17a9d930e1153e52 [3698/4476] arm64: dts: renesas: r9a09g047: Add I2C nodes
config: arm64-randconfig-051-20241218 (https://download.01.org/0day-ci/archive/20241218/202412182022.bnXp7rTI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182022.bnXp7rTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182022.bnXp7rTI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,scif-r9a09g047' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r9a09g047' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif' was expected
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14400400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14400800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14400c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14401000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
--
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14401800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14401c00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@14402000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: i2c@11c01000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g047', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g047' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a08g045' was expected
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
