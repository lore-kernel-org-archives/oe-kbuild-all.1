Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837861E1A16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000171; cv=none; b=Nek2Emmbh2ukXO2hH30oQiKMiX/Xmh7NqXtPb3N8Y26Y4l3ZOyiBJPWylUkW5YCDpkb3qvZuQ8TS86AMZwhN8gXDqhprr/DKIFwzI0dztlFXmcF9uRh58d2DFLsdCRvwcrGexIq0/wMUqtl/IOKDbpWGFH5nxjo04VPJs4wKSeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000171; c=relaxed/simple;
	bh=k2LCz8L2emgXWuR5RqRSW1zX9ubtLycf2ugH7iADh58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSx5QIn7aBrYZrHhm3K02c2hQaLtL0ccC3U03YhOKcw/3Pyo+9KCS5n4FL/thE+ZnBJRAuF5y8/iyYqdxYmVRuiab2/5LcKxt5GjYLP69IxwF8xy2FE78qXfZX0BRcFyvR0w5QxOW3BlvGtn8aNosztQGdUiYD4o25fAv0yyzSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dR/da5xM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dR/da5xM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746000169; x=1777536169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2LCz8L2emgXWuR5RqRSW1zX9ubtLycf2ugH7iADh58=;
  b=dR/da5xM7R/6gko7IffwMXSOOTrHwKCDhGIAs8TcxmSipT/FgwUTZgNJ
   pV34sq09SxiF9Y8PsD8rc2Y0qRwtrBp41C0lSZ8Y/RRr8UEPwME1A5D0I
   g0oJNxN97+8lJ4jSd+jMcduec/RsteCYYQHb7pGZUYGaRXPglmRoARxDv
   fnnavQlxWAUV9jEeT/pbHuxAh1DtppZkhcBCO7FmVNACWGnw+ZS3nlEN6
   yo36Rb8BI5x5BaHS/X/rBFnV+Bi0rmAe3Amm0VTJG/tuOa3qQj84BYzfn
   qVl105syoOnLuVu8R/88C2QW+RKS3S+B2MZsIc6scGftyWzs+GvkmJVb3
   A==;
X-CSE-ConnectionGUID: LLUMxdp7SBSthkgVx9iGdg==
X-CSE-MsgGUID: BUMsPbImRWuv9MRvVd6Wtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47798281"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47798281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:02:48 -0700
X-CSE-ConnectionGUID: 2lwh/0QTSsCGb87LGlPPGQ==
X-CSE-MsgGUID: SoJhFMjSTsiY/8O/9Ttg6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133958895"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2025 01:02:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA2Oy-0003HN-2X;
	Wed, 30 Apr 2025 08:02:44 +0000
Date: Wed, 30 Apr 2025 16:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 6331/7105]
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/sdhc@d800a000: failed to
 match any schema with compatible: ['wm,wm8505-sdhc']
Message-ID: <202504301545.gDwTgEok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 927e1b7ac361fa1a76fb29caa21853c9d8ba315a [6331/7105] ARM: dts: vt8500: Add VIA APC Rock/Paper board
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250430/202504301545.gDwTgEok-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301545.gDwTgEok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301545.gDwTgEok-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart1: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart2: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart3: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/pwm: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/sdhc: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/fb@d8051700: failed to match any schema with compatible: ['wm,wm8505-fb']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ge_rops@d8050400: failed to match any schema with compatible: ['wm,prizm-ge-rops']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pwm@d8220000: failed to match any schema with compatible: ['via,vt8500-pwm']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/timer@d8130100: failed to match any schema with compatible: ['via,vt8500-timer']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/usb@d8007900: failed to match any schema with compatible: ['via,vt8500-ehci']
>> arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/sdhc@d800a000: failed to match any schema with compatible: ['wm,wm8505-sdhc']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ethernet@d8004000: failed to match any schema with compatible: ['via,vt8500-rhine']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
