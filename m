Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143821C9E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858908; cv=none; b=CtdCih7oEcYJUZ2/Dh0MY2pRjkmzuXegASrYxzTdPpAB2lRPMv0hiaIoyKaUhFCxzgRFaBSQ3t+noCxVg325ah8vmQLFKT79DvyQZrWDIxVb6pssiJ/kIqFdW1h7cwK802LKJOqBdFgblABjRrYtqtUt3snE/rfStPkiapjfKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858908; c=relaxed/simple;
	bh=uG0OLZrq42AmdqBa9bOC2UGPAGLvTnQj5tFtjXE+Q8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9ZyHgbpDORtU+EWbtSaBTb0Spkh7E+/w5EvxMBS/xtPa5PgKC5NR0dPB3D8GjX4xHz1yJA9AbgmT+sSAMgVijVWzczrwjoB0h9XHvEW2nM3rMKetP41RSHkm0Zp/vp/Gey6qS9CuTH6LeqIcAHmhD/LYgTBrs0BuZEPfybZM10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yc/Va/6h; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yc/Va/6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738858906; x=1770394906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uG0OLZrq42AmdqBa9bOC2UGPAGLvTnQj5tFtjXE+Q8w=;
  b=Yc/Va/6hV7m3TwFyfwGIcfdN6J47nS+LFF5/fevsqmuZwhZPRwtZcr4F
   nBRKoAMQ6JSXYnvftRk7cGT0ULI0VXu+aOwqbHoB8Z1sqTG6KkEi79W6c
   G4jLCuTDIgeZZzvZiUIANKVpROz3FZnT652E2AOOffyJIsAn7k1rAcwPO
   roHsslyAh56B++75SJWVYAvScOznNSP8RlWJjjDxEiQE2lcY0btiI/cMp
   CD+jcF+ASmq5Fzt8y7CrUq5EdB03wnHADIJGyeMzVykPzdggnTKv69Xlx
   Zmb8X5qLIqdSje2adXHCaipcEHY/oIk7cOljZWRnylI32kjDgneZiwqAS
   Q==;
X-CSE-ConnectionGUID: N01EnGCJQkecy/2LMX8/NA==
X-CSE-MsgGUID: 6yOvzznWQSOzUx/V8qnRfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39582613"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39582613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 08:21:46 -0800
X-CSE-ConnectionGUID: bYLBYI7oTLOUqIqBICMopQ==
X-CSE-MsgGUID: 7pzBhQurTPuAils/cfljcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="142134517"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Feb 2025 08:21:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg4dK-000x4x-0X;
	Thu, 06 Feb 2025 16:21:42 +0000
Date: Fri, 7 Feb 2025 00:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 1575/1780]
 arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: timer@10040000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502070055.P29PYKEE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   808eb958781e4ebb6e9c0962af2e856767e20f45
commit: c22814789cd6dad3eacd229caeec547d56f8587b [1575/1780] arm64: dts: exynos990: Add CMU_PERIS and MCT nodes
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250207/202502070055.P29PYKEE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070055.P29PYKEE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070055.P29PYKEE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: timer@10040000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-mct', 'samsung,exynos4210-mct'] is too long
   	'samsung,exynos990-mct' is not one of ['samsung,exynos4210-mct', 'samsung,exynos4412-mct']
   	'samsung,exynos990-mct' is not one of ['axis,artpec8-mct', 'google,gs101-mct', 'samsung,exynos3250-mct', 'samsung,exynos5250-mct', 'samsung,exynos5260-mct', 'samsung,exynos5420-mct', 'samsung,exynos5433-mct', 'samsung,exynos850-mct', 'samsung,exynos8895-mct', 'tesla,fsd-mct']
   	from schema $id: http://devicetree.org/schemas/timer/samsung,exynos4210-mct.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/timer@10040000: failed to match any schema with compatible: ['samsung,exynos990-mct', 'samsung,exynos4210-mct']
--
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: timer@10040000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-mct', 'samsung,exynos4210-mct'] is too long
   	'samsung,exynos990-mct' is not one of ['samsung,exynos4210-mct', 'samsung,exynos4412-mct']
   	'samsung,exynos990-mct' is not one of ['axis,artpec8-mct', 'google,gs101-mct', 'samsung,exynos3250-mct', 'samsung,exynos5250-mct', 'samsung,exynos5260-mct', 'samsung,exynos5420-mct', 'samsung,exynos5433-mct', 'samsung,exynos850-mct', 'samsung,exynos8895-mct', 'tesla,fsd-mct']
   	from schema $id: http://devicetree.org/schemas/timer/samsung,exynos4210-mct.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/timer@10040000: failed to match any schema with compatible: ['samsung,exynos990-mct', 'samsung,exynos4210-mct']
--
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: timer@10040000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-mct', 'samsung,exynos4210-mct'] is too long
   	'samsung,exynos990-mct' is not one of ['samsung,exynos4210-mct', 'samsung,exynos4412-mct']
   	'samsung,exynos990-mct' is not one of ['axis,artpec8-mct', 'google,gs101-mct', 'samsung,exynos3250-mct', 'samsung,exynos5250-mct', 'samsung,exynos5260-mct', 'samsung,exynos5420-mct', 'samsung,exynos5433-mct', 'samsung,exynos850-mct', 'samsung,exynos8895-mct', 'tesla,fsd-mct']
   	from schema $id: http://devicetree.org/schemas/timer/samsung,exynos4210-mct.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/timer@10040000: failed to match any schema with compatible: ['samsung,exynos990-mct', 'samsung,exynos4210-mct']
--
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: timer@10040000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos990-mct', 'samsung,exynos4210-mct'] is too long
   	'samsung,exynos990-mct' is not one of ['samsung,exynos4210-mct', 'samsung,exynos4412-mct']
   	'samsung,exynos990-mct' is not one of ['axis,artpec8-mct', 'google,gs101-mct', 'samsung,exynos3250-mct', 'samsung,exynos5250-mct', 'samsung,exynos5260-mct', 'samsung,exynos5420-mct', 'samsung,exynos5433-mct', 'samsung,exynos850-mct', 'samsung,exynos8895-mct', 'tesla,fsd-mct']
   	from schema $id: http://devicetree.org/schemas/timer/samsung,exynos4210-mct.yaml#
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/timer@10040000: failed to match any schema with compatible: ['samsung,exynos990-mct', 'samsung,exynos4210-mct']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
