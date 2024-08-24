Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917668F62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724538140; cv=none; b=d6UsgDX4mCIQw48NyTbibUNmbHG2fUtbaQW0tcxRXuzw1+qWftTqj7XvoSJC5o5qZviAlyaj3UfuGJLz6tvjlyPmisA+uhvH47QQ3m+g2tZw7sRMMZTqiyWJFzp1YgNCEJATBMdO3xaH/QbRWlbXs/y9dwpG6VfeBdAJpuWkty4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724538140; c=relaxed/simple;
	bh=NSNIejz7n+4+XN3SPDQZ7C8YIgoYm1SedJqvlcQH+rI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vt7cQRDgEvgdKAdULPPlJhuK1O6rBU9rCPDnQuB9FbZLwz3Xb3OQtscYUZMrg+HIgrnC9U7+iGYOvpHYSwVpExUhOf67q90/B3tcpQw9XATqbjSgNhF2PNDoQu3bXXlhidlw9+OzMd3s2sGtqy+xyjg9ipstin/Hp34EqpwMCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUIVQ4qS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUIVQ4qS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724538139; x=1756074139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSNIejz7n+4+XN3SPDQZ7C8YIgoYm1SedJqvlcQH+rI=;
  b=iUIVQ4qSlZm4gtU5kUe1SKLbB3j5GVLYGLd3SsZnQjN0yN6L+qcD/Fvw
   sjM1jEm5VLlwSAg0TWkOT27uIC/uMTYjm0YgX7E+2Um/CZfX0rfcOlg6F
   7TyCpp+gZYzetQwsFk5SxyxZcUDqeIKCxaQUDIdm14YNZWpFnE1s1oC9X
   Z0IvjejZvBmSsFwC0oB0E2Gt28DkKatYR9Kv5UkNyIyHn5yTqUuETGeEq
   6edxkC3nj3PYSka6uhAuvqyO0tY8mYtcUGm5eDxWpQZCWiaY1NarBL5Zg
   pIbatSbLh8sbog6fhzL4suTmGOQgq9G80BeG17kjnPe4LBPSGVYDxdfwe
   A==;
X-CSE-ConnectionGUID: Yfv3a1K6Qb2gdTOpxejkQQ==
X-CSE-MsgGUID: E1+tCNGCTP+EHuLUzr6Ykg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26865453"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="26865453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 15:22:18 -0700
X-CSE-ConnectionGUID: 5xpM10XSQn6bcjCKXpYAMQ==
X-CSE-MsgGUID: 9lw/aWtVQeunYsnNfDvsag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="85336238"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2024 15:22:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shz9B-000Elr-2f;
	Sat, 24 Aug 2024 22:22:13 +0000
Date: Sun, 25 Aug 2024 06:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 5392/6439]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9000:
 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408250602.uO2sD1kX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c79c85875f1af04040fe4492ed94ce37ad729c4d
commit: ac552a63bb8911b5c9dc925f179785810f3004c3 [5392/6439] ARM: dts: aspeed: catalina: add Meta Catalina BMC
config: arm-randconfig-052-20240823 (https://download.01.org/0day-ci/archive/20240825/202408250602.uO2sD1kX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408250602.uO2sD1kX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408250602.uO2sD1kX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: ftgmac@1e690000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: crypto@1e6fa000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: lpc@1e789000: reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
