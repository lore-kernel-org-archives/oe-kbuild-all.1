Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50650212D7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755974878; cv=none; b=O5GzMXmFQ0q7OdhgUVs8PapJ2ATRbnk49MM0uhHV74rMYt5ACNujqHHqDc1W1nand/yzp5wJ2zZl4NyuQ5iUlXrFKvEqIf035fbrVhSOkoUIr3v0EvCezlsf2dL4sfMZPR3zjZuZzQ1G/StVSKXj282LMSm2C/8Zu9dNh1BgRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755974878; c=relaxed/simple;
	bh=5h/UykMLbSaZ3E32V0jf+t2lvQoebZvyGO7EW8NMAok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUE23jK07H4eubbfg8BXg9ljC6AV9YYKV3Oaf+iCWhLlhKhMOnJkWDw3NkK3pemq4Lc+LGjUuZpyTzFtezpRhkto7Hlz1EQErPHrqiSWq8513+N/VTdC0WE3YMhc4w5JKNLj0nUXsMQd4v66po5iwewV0IHBR7T+IJWfu4Iw/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqhzXOma; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqhzXOma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755974877; x=1787510877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5h/UykMLbSaZ3E32V0jf+t2lvQoebZvyGO7EW8NMAok=;
  b=QqhzXOmaECu3O8mT7aJsXWqPeF3hvsdUUqKv22M1C7EXQPdaVhjrVtg/
   32VJpJXT6gtuXhP4mPh3DmrCfoCHuldRf3qkh2Tu4RJUJMPeyeObqBnM7
   henKeUKC8qlXcZSeUO3UBTVf9cKgE8BiF+4V/T46yrPA9JW3nqLtW7d3i
   3fbfZbSjiZ4Qkw9dmzdhO7ZEZpp7QWCuCy193IYHfDhlNoKTBwwN21Ap/
   Jy9U05bYUAQiH15QQocvETN/xjvDOJ7endcnS7T8twVQOOMzVL/b13KBR
   DXc3KRfheUiVOY4OelHcA3033PNYDNR3FsU0/PX1FSPaXsqAuzcjjV6wf
   A==;
X-CSE-ConnectionGUID: Jdk375snQAeHbUmzm1THeQ==
X-CSE-MsgGUID: G2h28hztSieFuAFw4nZQjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58165584"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58165584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 11:47:56 -0700
X-CSE-ConnectionGUID: htXau2QJQR+AC5I8cuJ8Lg==
X-CSE-MsgGUID: 6s6LBBXfQ4Sje96576cpmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168160485"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2025 11:47:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uptHJ-000MWB-2E;
	Sat, 23 Aug 2025 18:47:50 +0000
Date: Sun, 24 Aug 2025 02:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1170/4234]
 arch/mips/boot/dts/lantiq/danube_easy50712.dts:107.4-109.6: Warning
 (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: Missing property
 '#address-cells' in node /biu@1f800000/icu@80200, using 0 as fallback
Message-ID: <202508240239.KTlYowkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [1170/4234] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
config: mips-randconfig-051-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240239.KTlYowkV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240239.KTlYowkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240239.KTlYowkV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/lantiq/danube.dtsi:8.9-10.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/lantiq/danube.dtsi:93.21-103.5: Warning (simple_bus_reg): /fpi@10000000/pci@e105400: simple-bus unit address format error, expected "7000000"
>> arch/mips/boot/dts/lantiq/danube_easy50712.dts:107.4-109.6: Warning (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: Missing property '#address-cells' in node /biu@1f800000/icu@80200, using 0 as fallback
   arch/mips/boot/dts/lantiq/danube_easy50712.dts:107.4-109.6: Warning (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: property size (28) too small, expected > 40
   lantiq,groups: size (6) error for type uint32
   lantiq,groups: size (5) error for type uint32
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: / (lantiq,xway): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#address-cells' is a required property

vim +107 arch/mips/boot/dts/lantiq/danube_easy50712.dts

a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    5  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    6  / {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    7  	chosen {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    8  		bootargs = "console=ttyLTQ0,115200 init=/etc/preinit";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13    9  	};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   10  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   11  	memory@0 {
dfc44f8030653b arch/mips/lantiq/dts/easy50712.dts      Leif Lindholm   2014-04-17   12  		device_type = "memory";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   13  		reg = <0x0 0x2000000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   14  	};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   15  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   16  	fpi@10000000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   17  		#address-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   18  		#size-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   19  		localbus@0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   20  			#address-cells = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   21  			#size-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   22  			ranges = <0 0 0x0 0x3ffffff /* addrsel0 */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   23  				1 0 0x4000000 0x4000010>; /* addsel1 */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   24  			compatible = "lantiq,localbus", "simple-bus";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   25  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   26  			nor-boot@0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   27  				compatible = "lantiq,nor";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   28  				bank-width = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   29  				reg = <0 0x0 0x2000000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   30  				#address-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   31  				#size-cells = <1>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   32  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   33  				partition@0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   34  					label = "uboot";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   35  					reg = <0x00000 0x10000>; /* 64 KB */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   36  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   37  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   38  				partition@10000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   39  					label = "uboot_env";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   40  					reg = <0x10000 0x10000>; /* 64 KB */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   41  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   42  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   43  				partition@20000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   44  					label = "linux";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   45  					reg = <0x20000 0x3d0000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   46  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   47  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   48  				partition@400000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   49  					label = "rootfs";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   50  					reg = <0x400000 0x400000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   51  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   52  			};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   53  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   54  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   55  		gpio: pinmux@e100b10 {
8571e645d1d15a arch/mips/boot/dts/lantiq/easy50712.dts Martin Schiller 2015-11-26   56  			compatible = "lantiq,danube-pinctrl";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   57  			pinctrl-names = "default";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   58  			pinctrl-0 = <&state_default>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   59  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   60  			#gpio-cells = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   61  			gpio-controller;
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   62  			reg = <0xe100b10 0xa0>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   63  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   64  			state_default: pinmux {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   65  				stp {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   66  					lantiq,groups = "stp";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   67  					lantiq,function = "stp";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   68  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   69  				exin {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   70  					lantiq,groups = "exin1";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   71  					lantiq,function = "exin";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   72  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   73  				pci {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   74  					lantiq,groups = "gnt1";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   75  					lantiq,function = "pci";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   76  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   77  				conf_out {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   78  					lantiq,pins = "io4", "io5", "io6"; /* stp */
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   79  					lantiq,open-drain;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   80  					lantiq,pull = <0>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   81  				};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   82  			};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   83  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   84  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   85  		etop@e180000 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   86  			compatible = "lantiq,etop-xway";
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   87  			reg = <0xe180000 0x40000>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   88  			interrupt-parent = <&icu0>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   89  			interrupts = <73 78>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   90  			phy-mode = "rmii";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   91  			mac-address = [ 00 11 22 33 44 55 ];
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   92  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   93  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   94  		stp0: stp@e100bb0 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   95  			#gpio-cells = <2>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   96  			compatible = "lantiq,gpio-stp-xway";
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   97  			gpio-controller;
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24   98  			reg = <0xe100bb0 0x40>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13   99  
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  100  			lantiq,shadow = <0xfff>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  101  			lantiq,groups = <0x3>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  102  		};
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  103  
965f22bc425298 arch/mips/boot/dts/lantiq/easy50712.dts Songjun Wu      2018-09-24  104  		pci@e105400 {
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  105  			lantiq,bus-clock = <33333333>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13  106  			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
a0392222d9a374 arch/mips/lantiq/dts/easy50712.dts      John Crispin    2012-04-13 @107  			interrupt-map = <

:::::: The code at line 107 was first introduced by commit
:::::: a0392222d9a374588803454c4d2211108c64d4e4 OF: MIPS: lantiq: implement OF support

:::::: TO: John Crispin <blogic@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
