Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48338DDB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720068743; cv=none; b=BFIo9JP2hvJpxpOeDHxXgdmJ46bnYeyZZfMS2ET+BZR3ZFuTE6IYPE5DpLIkel0K9rk2gpEuuTOn0HhxXNOkZ6Crc8i+LlaLbUrZuuY6cxMT6RX+2tc0D8nE8zYESIu8wFwipbOIWMXk95R22OwEPn3XxNzX+Ijlxx4R80AJje0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720068743; c=relaxed/simple;
	bh=Jz44BVPyrrHq4iUS+7EJUzMETghv9EtPIVx+8B/lm9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+j84EU9Z+EkdTyGLnLQTW6FKfxG4OySP3ojqXNovyCA7A5jonAEy4a05RwiSvAw8gqjKax31n7s/FHbZWx+IcfdJYtOqLq4JpEF/o4K2oXLdzGT/wB5rwy5gGiSifT23iWpdUnaPYlHB5oUb9pP+AmDvfA7JiE+ezh45xJgBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gt/vms2i; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gt/vms2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720068740; x=1751604740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jz44BVPyrrHq4iUS+7EJUzMETghv9EtPIVx+8B/lm9k=;
  b=Gt/vms2i3CWN06c7ED2Gt0mhxwUEBOnCct/3oJx0CmBPTdt9s1qjvLdO
   BZaTs9nCsegy9rSQENuQKTQs+FnGcvHDFUlgEZXkI8RH9KKxzwfjPEjOJ
   ZjZuXlwLi7sf3hL1RAJxVpF9bAJTMGmZod21tph2xVTofKwUSIt0O+ufH
   XwUNLeSKvse6NbQBPq0OJaYKyPl+5imuOmY+GLX3OEYj5i9iyvl7wO6V1
   /fZhMhYWc0jWvyEDJcPgcp3WZZ5z9lPY2eJ3iR/kZfCOE+kbbiMn1h6Bd
   uSydxkKxVa5nwjyWiS62t17y5Z8FSN8U1ezdsbdI/c9gtpwkQyrD5ukuJ
   g==;
X-CSE-ConnectionGUID: r+wM9U0QRE65P3hvKfcqww==
X-CSE-MsgGUID: H0Dl560BSvqSDHuhnqiaqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28721610"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28721610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 21:52:19 -0700
X-CSE-ConnectionGUID: qR5BK6LiT6uODBK2gl5j5w==
X-CSE-MsgGUID: UFwAcGoMRc6bmEJVMoukxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="77210414"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2024 21:52:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPES6-000QZS-2k;
	Thu, 04 Jul 2024 04:52:14 +0000
Date: Thu, 4 Jul 2024 12:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 104/187]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860e8000: compatible:0:
 'apple,t6020-dart' is not one of ['apple,t8103-dart',
 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
Message-ID: <202407041248.477NpOUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 957ad850ea5673d9e20ee51f4358e49e57daf0f0 [104/187] arm64: dts: apple: t602x: Add ISP nodes
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240704/202407041248.477NpOUd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041248.477NpOUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041248.477NpOUd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: display-subsystem: iommus: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/iommu/iommu.yaml#
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860e8000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860e8000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860e8000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@3860e8000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860f4000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860f4000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860f4000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@3860f4000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: display-subsystem: iommus: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/iommu/iommu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
