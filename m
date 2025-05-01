Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C921E51FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081383; cv=none; b=sIpw+T3hn+LvDPYuM0X5/IFJmVtZ0yZK38gKXmkyT70cI0Jcz7JmZ+oSBTawrsZkVmMspYq8O1GcU72qjrmr5dzZQ+SZLY/+PBmjSl35z0sqWsLYfDCPwUCyZvQMt7MWQ/H3mtRSOwC/C5S1JJRAK6qspcaMWuypbub2a3jc2iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081383; c=relaxed/simple;
	bh=5pXXH8Cma00XLZOeTel7SucniM9qCoc9PgEEHpRwKLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4FBTIRQXbQFUOhM6luG4HOG7d6xIYuflHa838677Zg8Ay8PcKcoB3NInrTNBEERDyv8kHRQ6uQyrmbxhtMD/dgmqtRRzVcmWR+LNOYFZJtaimhBeBJeP0G1ht9wsnIzRWntpkfZuF9px+2uwZD8s8aOPRzY/+15rDefaVE7EzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VySm+BoH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VySm+BoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746081381; x=1777617381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pXXH8Cma00XLZOeTel7SucniM9qCoc9PgEEHpRwKLQ=;
  b=VySm+BoH7ojE9Yi5D4EAcs73jAwtu1CcJCAh/IIrn9U7yq6P8lwTDVDu
   Q7IetuOYAYsKhzg4KX5V5A0zhLiExhWcuGz6vrAZ9DXo3bRgSVST/+iEz
   O+QRzSdwmCRx03cjUevYi2JD6GWu8B0+BhLYDiHXhuKZdn+ugOjiAAWvz
   Kdd81QTc5EddaJByfN0Zmnnj23Bp7iclm6rjLW3TExACfTO0MWu8MdhTn
   ZJOL4dXaKOK0Oub0yuihm6JFeCgILqQ5imiBuneXqmYlElq/VHHjTG6vw
   b268KLV3op+jfjCcFgwhuRcO2Ru+3C1s0HJzAShE0q5LrbvQQGQY7b/34
   g==;
X-CSE-ConnectionGUID: nJYdkVY4RdO/5hZYOUUlsQ==
X-CSE-MsgGUID: hxFPvtNLRImeDZ0N2kzbzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65169207"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="65169207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 23:36:20 -0700
X-CSE-ConnectionGUID: WuKCHov+R9CWve83oxOX7Q==
X-CSE-MsgGUID: jqtTrEzSRmymNry8OarQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="134823627"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2025 23:36:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uANWp-00040X-32;
	Thu, 01 May 2025 06:36:15 +0000
Date: Thu, 1 May 2025 14:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [linux-next:master 2359/7638]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e182c000
 (microchip,sama7d65-flexcom): i2c@600:#size-cells: 0 was expected
Message-ID: <202505011415.xAxdWvj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
commit: 1489c57f55f1fd063593cd5e9fffab40658f6663 [2359/7638] ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
config: arm-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250501/202505011415.xAxdWvj5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011415.xAxdWvj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011415.xAxdWvj5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'microchip,sama7d65-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,sama7d65-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected
   	'atmel,at91rm9200-usart' was expected
   	'microchip,sam9x60-usart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/atmel,at91-usart.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e1828000/serial@200: failed to match any schema with compatible: ['microchip,sama7d65-usart', 'atmel,at91sam9260-usart']
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e182c000 (microchip,sama7d65-flexcom): i2c@600:#size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/atmel,at91sam-i2c.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: serial@200 (microchip,sama7d65-usart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-usart', 'atmel,at91sam9260-usart'] is too long
   	['microchip,sama7d65-usart', 'atmel,at91sam9260-usart'] is too short
   	'microchip,sama7d65-usart' is not one of ['atmel,at91rm9200-usart', 'atmel,at91sam9260-usart']
   	'atmel,at91rm9200-dbgu' was expected
   	'atmel,at91sam9260-dbgu' was expected
   	'microchip,sama7d65-usart' is not one of ['microchip,sam9x60-usart', 'microchip,sam9x7-usart']
   	'microchip,sam9x60-dbgu' was expected
   	'microchip,sam9x7-dbgu' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
