Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8621E0A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734727581; cv=none; b=cDuFguNRoHLyhzpGT0XUlk4ASRsqsnuU1qnZkEn1jAUnB/J8i3vAHK1fqL/edSZzI8MI5JD1hV317ARaaNlDG+20S5rEzbJSPVhDK1q+D5QT2HmpqGVnUcaGL5R4uJvqeTtxSefySlZy4WvBYDBYLXq0sVdKoyts0L8Tn2gna0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734727581; c=relaxed/simple;
	bh=e28CXyZiMwo/wC/mVek5AHl3P30muDnls21RQyOUw/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zu7oZ4kVy7QguKfcgoetQMu8el1hpFEeW50Hp3jnh1rJLHF7jTuHDovPJasuLokEvP1xtsoc1bjcDIvui73XqV71tnmLElvMzCQd55kAFEACRgwa+NPR7QVVxjMBtDJHpHHsAuEtsyhVL0vSrn9fPbGwVK3FeWq1EODn+MGCPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPfkBQ9T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPfkBQ9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734727577; x=1766263577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e28CXyZiMwo/wC/mVek5AHl3P30muDnls21RQyOUw/A=;
  b=VPfkBQ9TOj1gqonL46Pz+kOhOyb2FAhOk/eTREnELU8g5wCuhOEQT4du
   Rx8WJBpDevvdb2WOANK57gRsoBVOoQW2soLnBEItXSdmA2f5bzgRLTXS1
   4uhnpSVydDYiKmju3OXBeYp/dPiTpJQ7TdYO7dKTtrPMujrm3qNKVE0O5
   MTbYCyarRNoAuxHs/tKGVTKPrR0ouPa+1OWfJpoCb7xLwBcz9BJt6GOsc
   7rSmxktvKsLwv1NaJVxg02BhWDctqzlPmoVErSb6NI50qFZOdyKUqfCNg
   dUOLMey4OXp3kkvKQfU8x990FS87XRaks48VOfu3VHVKf2pEG/xWdlCeH
   A==;
X-CSE-ConnectionGUID: 3El2scOfTAmexup3icEHKg==
X-CSE-MsgGUID: L9tVY7yoQn+6UXoi0rwUKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38126026"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="38126026"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 12:46:16 -0800
X-CSE-ConnectionGUID: 2AVv9duGRHCeBjGi58LsJw==
X-CSE-MsgGUID: RVsciRPlRwuzc1/MPq3s9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129569258"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2024 12:46:14 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOjsx-0001fB-2q;
	Fri, 20 Dec 2024 20:46:11 +0000
Date: Sat, 21 Dec 2024 04:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /: 'model'
 is a required property
Message-ID: <202412210414.39UglYmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 4fbd66d8254cedfd1218393f39d83b6c07a01917 MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
date:   4 weeks ago
config: mips-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241221/202412210414.39UglYmO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210414.39UglYmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210414.39UglYmO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: gmac@3,1: compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
--
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dc@6,1', 'device_type', 'ehci@4,1', 'ehci@5,1', 'gmac@3,0', 'gmac@3,1', 'gpu@6,0', 'hda@7,0', 'msi-parent', 'ohci@4,0', 'ohci@5,0', 'pcie@10,0', 'pcie@11,0', 'pcie@12,0', 'pcie@13,0', 'pcie@14,0', 'pcie@9,0', 'pcie@a,0', 'pcie@b,0', 'pcie@c,0', 'pcie@d,0', 'pcie@e,0', 'pcie@f,0', 'sata@8,0', 'sata@8,1', 'sata@8,2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0:0: 49 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@4,0:interrupts:0: [49, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0:0: 48 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@4,1:interrupts:0: [48, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0:0: 51 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ohci@5,0:interrupts:0: [51, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0:0: 50 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: ehci@5,1:interrupts:0: [50, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,0:interrupts:0: [16, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0:0: 17 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,1:interrupts:0: [17, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0:0: 18 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: sata@8,2:interrupts:0: [18, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0:0: 29 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gpu@6,0:interrupts:0: [29, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0:0: 28 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: dc@6,1:interrupts:0: [28, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0:0: 58 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: hda@7,0:interrupts:0: [58, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: gmac@3,1:interrupts: [[14, 4], [15, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0:0: 32 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@9,0:interrupts:0: [32, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0:0: 33 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@a,0:interrupts:0: [33, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0:0: 34 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@b,0:interrupts:0: [34, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0:0: 35 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@c,0:interrupts:0: [35, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0:0: 36 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@d,0:interrupts:0: [36, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0:0: 37 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@e,0:interrupts:0: [37, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0:0: 40 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@f,0:interrupts:0: [40, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0:0: 41 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@10,0:interrupts:0: [41, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0:0: 42 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@11,0:interrupts:0: [42, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0:0: 43 is not one of [1, 2, 3, 4]
--
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@12,0:interrupts:0: [43, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0:0: 38 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@13,0:interrupts:0: [38, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0:0: 39 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: pci@1a000000: pcie@14,0:interrupts:0: [39, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@4,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@4,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ohci@5,0: failed to match any schema with compatible: ['pci0014,7a24.0', 'pci0014,7a24', 'pciclass0c0310', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/ehci@5,1: failed to match any schema with compatible: ['pci0014,7a14.0', 'pci0014,7a14', 'pciclass0c0320', 'pciclass0c03']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,0: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,1: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/sata@8,2: failed to match any schema with compatible: ['pci0014,7a08.0', 'pci0014,7a08', 'pciclass010601', 'pciclass0106']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gpu@6,0: failed to match any schema with compatible: ['pci0014,7a15.0', 'pci0014,7a15', 'pciclass030200', 'pciclass0302']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/dc@6,1: failed to match any schema with compatible: ['pci0014,7a06.0', 'pci0014,7a06', 'pciclass030000', 'pciclass0300']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/hda@7,0: failed to match any schema with compatible: ['pci0014,7a07.0', 'pci0014,7a07', 'pciclass040300', 'pciclass0403']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,0: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: gmac@3,1: compatible:4: 'loongson, pci-gmac' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/gmac@3,1: failed to match any schema with compatible: ['pci0014,7a03.0', 'pci0014,7a03', 'pciclass020000', 'pciclass0200', 'loongson, pci-gmac']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@9,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@a,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@b,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@c,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@d,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@e,0: failed to match any schema with compatible: ['pci0014,7a09.1', 'pci0014,7a09', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@f,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@10,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@11,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@12,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@13,0: failed to match any schema with compatible: ['pci0014,7a29.1', 'pci0014,7a29', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']
   arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: /bus@10000000/pci@1a000000/pcie@14,0: failed to match any schema with compatible: ['pci0014,7a19.1', 'pci0014,7a19', 'pciclass060400', 'pciclass0604']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
