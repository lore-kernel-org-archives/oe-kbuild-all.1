Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943FE1552E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690407; cv=none; b=Qnp+dVwQsd3m0jSbyzIZ8vciuEkRkr0XpHCOkBL/Pyebvz2vCC8dGaUiQx1X0ZAQKreY04R1XmLG4W1GLoZCoQlNiShBE3TgjsJdLKXqc9jkUY3fzk8pHz0cKkF+9BRtdhPCKmTF2aMMXEEHE+svFnAornM8wIIfOFa0mDpqeYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690407; c=relaxed/simple;
	bh=3plwYngNIrptusFk6tO8aefs7m7Wul5/zkR9Qlj1omA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YykRNv5g9eY/vQlZvF3yz7AHxhg3CzsusFmwqXO7YLfBvnRFBzaFwX7BhFM7WL5d0VviVhiJnrX4DFZvCl+4AvJ2p+J4gt6e8ICDlG8UieegZFSCc3RODfc+o2IJQDpkI/IOJYHb20xrb/DSQHyKz5px8cJcbqqKmCd6+f0/+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvO97nWo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvO97nWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720690406; x=1752226406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3plwYngNIrptusFk6tO8aefs7m7Wul5/zkR9Qlj1omA=;
  b=NvO97nWoCeTYuzmNK3s5PD1f+QH+oxmQJzvtohoCUGE9mMkg9F+ScHzV
   8/wHp3EdUie8ffnlKOkOsEK6O6228FPo1P7/pRBTDYoyb7tgSB4uK11LE
   xok1yfPc0Py4Wp9DNpx1BHcQ7Kd8ygGBd9N5BZquC5R40bv4CHbqtp4QM
   8p5s5TDShoYAu4SkdQTln5Y3DEPUHzJ8ueFK1ETG/r70hMfQTx+lVSkpA
   sAZUT4Q+IGonkM5sHNQK13Irr1RfhhUKUpJk/XPxfrAZnC9NsiU3ao7we
   kwGZsn5q+pDhcT72RxDrzzkqVr6/JuxYt9tJcBdFh0MsiZesGnP7GnAq0
   w==;
X-CSE-ConnectionGUID: sidZcYy+Qki6GRcEQxkN9g==
X-CSE-MsgGUID: SF8I+k5fQja2teFvcVlf8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21822190"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="21822190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:33:19 -0700
X-CSE-ConnectionGUID: 2ZQCrv27QX+5haWFwownJQ==
X-CSE-MsgGUID: LBNNfHv8Q2mNLn2SDfZwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48580631"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2024 02:33:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRqAt-000Z62-2X;
	Thu, 11 Jul 2024 09:33:15 +0000
Date: Thu, 11 Jul 2024 17:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12569/12643]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:541.10-555.4:
 Warning (avoid_unnecessary_addr_size):
 /ahb/apb/bus@1e78a000/i2c@480/gpio@77: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407111754.UVnc4qZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: e60d42bf54c13b65949032f19bae93e5096d0ec4 [12569/12643] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111754.UVnc4qZu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111754.UVnc4qZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111754.UVnc4qZu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:541.10-555.4: Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c@480/gpio@77: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ftgmac@1e660000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'

vim +541 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts

36d96827f480e9 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Quan Nguyen  2022-08-17  532  
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  533  &i2c8 {
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  534  	status = "okay";
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  535  
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  536  	temperature-sensor@48 {
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  537  		compatible = "ti,tmp112";
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  538  		reg = <0x48>;
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  539  	};
e998856086a41d arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts Chanh Nguyen 2023-10-05  540  
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28 @541  	gpio@77 {
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  542  		compatible = "nxp,pca9539";
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  543  		reg = <0x77>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  544  		gpio-controller;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  545  		#address-cells = <1>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  546  		#size-cells = <0>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  547  		#gpio-cells = <2>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  548  
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  549  		bmc-ocp0-en-hog {
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  550  			gpio-hog;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  551  			gpios = <7 GPIO_ACTIVE_LOW>;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  552  			output-high;
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  553  			line-name = "bmc-ocp0-en-n";
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  554  		};
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  555  	};
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  556  };
695cb117ac2a36 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts        Chanh Nguyen 2023-02-28  557  

:::::: The code at line 541 was first introduced by commit
:::::: 695cb117ac2a3624eb4381c271a0376d9233df44 ARM: dts: aspeed: mtmitchell: Enable NCSI

:::::: TO: Chanh Nguyen <chanh@os.amperecomputing.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
