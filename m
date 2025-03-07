Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4F1E868
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353823; cv=none; b=lzBUvLsJ8WWadWsZWFRMmQNrumtC4ej4zFfOCNzDnH2S6EUuHXFr/vcbOeYB5aQB0aEHfRcI1prsKCKIPZhbbQUWRLDO81T0GTdQj0vCJqWKXkyXiQy1WtluvdcEJVqae68s6lxKnJUUlzS6NLrqSz5zQ0F3No2qAo3X1ZCCizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353823; c=relaxed/simple;
	bh=txijfGNJaMM9T9e+g83FHJ5psQT0Ehopj0Ibv4UGGB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a45vewdi1gAs9ZkHXOgF8gdCBQQeZFy696ciElfsHGP1qKUGVagSv2U8tmdwCSsKOUP33SmltXJik/96wOfb6qbJrwLyk7qHZdLuJFSs6EKXEdL4S3ZDMGc5UxarfLhkNCt6OWkxhbaVq1EfTLWP7xHWBkaY4xzE4xXm1/Rderc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfyhOlO3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfyhOlO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741353821; x=1772889821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txijfGNJaMM9T9e+g83FHJ5psQT0Ehopj0Ibv4UGGB4=;
  b=dfyhOlO37kUcDtVOoECK6OOY3WzpZSNZxlQsWGG1iDAkKKaOuPaPRCUE
   MzJXceEt7pOPRBL8kANciPedJKqKgHFJFsdPgzJSpEmF1+NH/U4YuPNbi
   ihFerOFt8GTaScQ8g+LdjJo/5gBpBuLa7wbdABoqQn+Nr7/VfIZ2gTuYP
   BDpT+qrDO6MHIKyaNcewmhA0YhYnZWApqJz41+pv3YlYeUMi+eW7LrEKT
   hdWXbg8UOGldamwI3SLio6MrHBmsa8VejuBWwIouZ0ckudVZ0oKQ/QrSk
   Ksi41bRBlY4mDrndaTMZ+hLZgJ6eBt/mHBrFYow0tlcOghuOuI//TNFNr
   A==;
X-CSE-ConnectionGUID: b9N/UOZcQVmx5kEC/L953g==
X-CSE-MsgGUID: QOPDpCH2TLaanaqoAOfS/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52608759"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52608759"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 05:23:41 -0800
X-CSE-ConnectionGUID: W5zJ2VTtRNOPvWaiIT3pSg==
X-CSE-MsgGUID: 5i8Bu6gPSHCNoptBXQOfzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119317839"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2025 05:23:39 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqXft-0000W5-0p;
	Fri, 07 Mar 2025 13:23:37 +0000
Date: Fri, 7 Mar 2025 21:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 6747/9212]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 reset-controller@e001d100: compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202503072119.iKTU5WPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: f4573d25c14d1ccd7401bc5fcd56eb76811df418 [6747/9212] ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
config: arm-randconfig-052-20250304 (https://download.01.org/0day-ci/archive/20250307/202503072119.iKTU5WPQ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072119.iKTU5WPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072119.iKTU5WPQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/pinctrl@e0014000: failed to match any schema with compatible: ['microchip,sama7d65-pinctrl', 'microchip,sama7g5-pinctrl']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: reset-controller@e001d100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-rstc', 'microchip,sama7g5-rstc'] is too long
   	'microchip,sama7d65-rstc' is not one of ['atmel,at91sam9260-rstc', 'atmel,at91sam9g45-rstc', 'atmel,sama5d3-rstc', 'microchip,sam9x60-rstc', 'microchip,sama7g5-rstc']
   	'atmel,sama5d3-rstc' was expected
   	'atmel,at91sam9g45-rstc' was expected
   	from schema $id: http://devicetree.org/schemas/reset/atmel,at91sam9260-reset.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/reset-controller@e001d100: failed to match any schema with compatible: ['microchip,sama7d65-rstc', 'microchip,sama7g5-rstc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/chipid@e0020000: failed to match any schema with compatible: ['microchip,sama7d65-chipid']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1200000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-dma', 'microchip,sama7g5-dma'] is too long
   	'microchip,sama7d65-dma' is not one of ['atmel,sama5d4-dma', 'microchip,sama7g5-dma']
   	'microchip,sama7d65-dma' is not one of ['microchip,sam9x60-dma', 'microchip,sam9x7-dma']
   	'atmel,sama5d4-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: dma-controller@e1200000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/atmel,sama5d4-dma.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/dma-controller@e1200000: failed to match any schema with compatible: ['microchip,sama7d65-dma', 'microchip,sama7g5-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
