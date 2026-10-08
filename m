Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C394746D6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453404; cv=none; b=ipvQeOoEcJdGK+sHBpdlBRDyrqdUafWjoT/OAkCSMKVHSA/azU1HaCxpQMK+A/x3F5AwCmn4HvlFqIgBy+Y3yPAC0ya40jHGjHnVvQ9m7tZhOLNqF0zZ1LPROh3Jjtm2AhFAsjZALZY6H49dfu8TJlfeA4kiXKuudpLgIWgL8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453404; c=relaxed/simple;
	bh=wdFW4tBNJxWS6oCnydxuazTDwHOO4KBHrjc85AuJyec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3qV+eXsfagPecIuf/b6W5SYJw5nyil3JnDCcKd0C/nI6e/fX4UyQW0QIfZDbzn6jqPtum5/7rWBE8fs3j07GEMf8+reFu9XEoPyeTM7BWFDTd0WejyyT9RxsKwnasQl4CA8GnnmXpmiZAVqfgkCSls1O/qGhwr4UqkczLCAkEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2XmObJi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2XmObJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791453402; x=1822989402;
  h=date:from:to:cc:subject:message-id;
  bh=wdFW4tBNJxWS6oCnydxuazTDwHOO4KBHrjc85AuJyec=;
  b=U2XmObJiS6IM8A2ZdPF9h8REjBf5KvLO8cT4W1RAI2MbD7ei5NdCa6Cr
   WTlOupytRfcplQzr5Ek2/P48zddDbmRTtOZLQp4rot2EZZFZ/arRUg7Z3
   Hhpvx+AHt1LkZKLz+4hZUsHdbOZuWmVYw4fmOxcW+TaJ13byURZ3YXQXl
   fOBuu/3AenUQK6d7XjCkzQK2lwfX6482GDFiwU8VTlzOi7yEjAVBq0ZtI
   n1ePPdDeCE0PaQZ1OyJbDYU87qidcxyc1YqqxmeCIcCoeWdzenQzZ8ave
   ylDQcjIwQZTF74fO8qiNkJnkgR70rw7oi0fvx612RP7m1EnkBbxEx8egl
   g==;
X-CSE-ConnectionGUID: oQmoHneHSOeinkLiVksfCw==
X-CSE-MsgGUID: 05flCgaUTNSUGWsGB4MXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="240784"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="240784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 02:56:42 -0700
X-CSE-ConnectionGUID: hHB924knS4iu2C17WC/wOA==
X-CSE-MsgGUID: Leq3y1YYQEGka9mHTPkStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="358756"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2026 02:56:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEkre-000000005F1-1C0Z;
	Thu, 08 Oct 2026 09:56:38 +0000
Date: Thu, 08 Oct 2026 11:56:18 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 13458/15025]
 arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-0
 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-0' does not match
 '^ethernet(@.*)?$'
Message-ID: <202610081109.y7A2b830-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: 05e40209cf75cd516b17b6f8e137f3f4ba2d176d [13458/15025] dt-bindings: net: Convert hisilicon,hns-nic to DT schema
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261008/202610081109.y7A2b830-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081109.y7A2b830-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081109.y7A2b830-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
   arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
   arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
   arch/arm64/boot/dts/hisilicon/hip06.dtsi:751.4-754.37: Warning (interrupt_map): /soc/pcie@b0000000:interrupt-map: Missing property '#address-cells' in node /mbigen_pcie@a0080000/intc_pcie0, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-0 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-0' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-0 (hisilicon,hns-nic-v2): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-1 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-1' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-1 (hisilicon,hns-nic-v2): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-4 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-4' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-4 (hisilicon,hns-nic-v2): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: ethernet-5 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-5' does not match '^ethernet(@.*)?$'
--
   arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
   arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
   arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
   arch/arm64/boot/dts/hisilicon/hip07.dtsi:1742.4-1745.40: Warning (interrupt_map): /soc/pcie@af800000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@a0080000/intc_pcie2_a, using 0 as fallback
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-0 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-0' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-0 (hisilicon,hns-nic-v2): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-1 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-1' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-1 (hisilicon,hns-nic-v2): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-2 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-2' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-2 (hisilicon,hns-nic-v2): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/hisilicon,hns-nic.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: ethernet-3 (hisilicon,hns-nic-v2): $nodename:0: 'ethernet-3' does not match '^ethernet(@.*)?$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
