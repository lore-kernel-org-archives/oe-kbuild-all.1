Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A0318C332
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251334; cv=none; b=CVbd1ZEZ01okUQaNEbf0pk2wDr+eeQPVl7yM9Is6hGcPE8Gvfk9eGwj86ZGq/uuCh+FBorY6Hj24J/+P2iHzH7wn9GjCaKu5Hf2a4QTUyLBeyJ8/CvGeHNCRZD8w7I1jex3hFupjmp+p1i6ymArgGUfvZQ7rnEHy1Yl1j0faZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251334; c=relaxed/simple;
	bh=jqi3WNZG8lHtpdwe4k1H7SjEKxX5y9Lr9aN7PNBWtYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwRAEopGhupm/8MyeqK2Q4RjKYkqin0Ri/7jRPmSgwkJw92mdbjMQ/E4bCQluxmDXc4HJ+79U8016JALrUGCB6fR5HsWwqwRH6mQ3eGw5tCg6qNO+jGTkZN9aGh7/p6vos9UQUsCpR0+jSn1a6WdvT70KhfrF60+obHfAdFaYSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9JWERd6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9JWERd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741251332; x=1772787332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqi3WNZG8lHtpdwe4k1H7SjEKxX5y9Lr9aN7PNBWtYQ=;
  b=c9JWERd6Z1AiDHluuXp9ey2umvY/Axh6LghrN3FT24kB3XzKohnUAWz8
   IdqtjbzlJFuYRCjuwvr6akfhIxlW18Au+OLog5V6pdF0x3NXtEkGnY6+O
   uRA1AYNtaOGufqYasyVDeUxtFQddFZxGIBqQd+Z18wwLatOzse4uOo0e2
   GQzhpxsl3ec7NUHweOqzGlktUoYyu61o6v3hKIbbX0vGNrW9HQebypoiL
   LrQvPC7Fy6frS290yPx3AMbBJM8UewIFsvTMdWXk9EVJKLO0bEv+iVY9D
   ELeTD3RMKuGFBuVezf0ask+GkVSQH37M538qFUxnZFJbUJ59jPJwv92ep
   A==;
X-CSE-ConnectionGUID: i3uqVaRmRjeTVqiH1S+04w==
X-CSE-MsgGUID: HO84Ul+AS0qLRF+327udWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53658785"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="53658785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 00:55:31 -0800
X-CSE-ConnectionGUID: RV6e8QNnQwGblAZvnFM7Qw==
X-CSE-MsgGUID: tE5WQ8F1TieJKL6MOvVnYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="124058047"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2025 00:55:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq70E-000Mn6-35;
	Thu, 06 Mar 2025 08:55:01 +0000
Date: Thu, 6 Mar 2025 16:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 6750/8790]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb:
 reset-controller@e001d100: compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202503061631.aQOR8Zhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7ec162622e66a4ff886f8f28712ea1b13069e1aa
commit: f4573d25c14d1ccd7401bc5fcd56eb76811df418 [6750/8790] ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
config: arm-randconfig-052-20250304 (https://download.01.org/0day-ci/archive/20250306/202503061631.aQOR8Zhu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061631.aQOR8Zhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061631.aQOR8Zhu-lkp@intel.com/

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
