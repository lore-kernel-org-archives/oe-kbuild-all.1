Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A01D53C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718462845; cv=none; b=lMcYXJeqrEaFWRSXakj7mx2m4ajvKKEP+nhRa3fRT1thaGJHkUbAN273JLunUXM9JrVF4wQlsbqRpqd9K2HQcF5YGcb7CmwPrUQYu9f9bR88LkofmEPZU96aeTQsrWf2w0Yub6m3amZz5NIjn5KCcj94W0XywjGJAhFGByUEZps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718462845; c=relaxed/simple;
	bh=HPNx0gj9/LxugdLVpCW3ZHGT0NzTgrN3y2o80y+HF1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCtvaUArusrpgD7SgV/98+thFtz9OWP4PI08geUu9fP6jnkUtdzB0mbUD+H3guXE4q0u4Ao3EkyNI9df9BckqrkeNTYN62u3suzA/d4yAYnxRpRbrlt1ph+XD2tJbRiH+033zU3LeSXiJmZXiZrePilJ8EbkkM5LQJUwjSI/VZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2y5RpWu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2y5RpWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718462844; x=1749998844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPNx0gj9/LxugdLVpCW3ZHGT0NzTgrN3y2o80y+HF1s=;
  b=b2y5RpWu0cpgsT8s1OSCCXLuzQ5Cw1QC3hgXjtrnEzuwDQZ8gEcWf9bl
   ocBV7upHxLuUH6U/KmG56x2gehiGbxqh/lIZzORuq0cVnBFnnJcZzWWf4
   csVeh4U/dFXM1uCklebbcM0YgDxDXL6hKEHEWph55hLxqDjXVKBokiI6d
   If+wyqUy6KmczFtERkB6j76HURLBUN/ihTjhLGnGZdEDbB0cWP3pUthF4
   Vbf1GW0ChFadLwQ+iDGD1RBKdGsraVS182QeyS7vTGdgRPQrE4zLs6NKw
   uSL2swKbLwFLizyxGSVfusm2IsV9ENs9BievnvB9xkf3DVUMU0niOAEMG
   A==;
X-CSE-ConnectionGUID: VdYhp8J1QCa1S9T7MknICw==
X-CSE-MsgGUID: FyLdSayZSxmFKUjd3nOyEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="18267622"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="18267622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 07:47:23 -0700
X-CSE-ConnectionGUID: LGOjlI6mR4G4H+noe4cSEw==
X-CSE-MsgGUID: pKC+TcKYTve6/ghhW7GM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40880989"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2024 07:47:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIUgZ-00007c-19;
	Sat, 15 Jun 2024 14:47:19 +0000
Date: Sat, 15 Jun 2024 22:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 178/185]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/sio@39bc00000: failed to
 match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
Message-ID: <202406152251.aolhCjvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   7a67f4836b8673379e8014405fc0a17abea55160
commit: 5bacf6bc5717cf232718e5b3d37a9ba06ea7c58e [178/185] arm64: apple: t600x: Add sio and dpaudio device nodes
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406152251.aolhCjvn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152251.aolhCjvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152251.aolhCjvn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@315304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@31530c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@31530c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: mbox@315c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: mux@70304c000: $nodename:0: 'mux@70304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@315304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@31530c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@31530c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: mbox@315c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: mux@70304c000: $nodename:0: 'mux@70304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@315304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@31530c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@31530c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: mbox@315c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: mux@70304c000: $nodename:0: 'mux@70304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@315304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@31530c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@31530c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: mbox@315c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: mux@70304c000: $nodename:0: 'mux@70304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@31530c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@31530c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: mbox@315c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pinctrl@39b028000: 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: mux@70304c000: $nodename:0: 'mux@70304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@315304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@31530c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@31530c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: mbox@315c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6000-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: mux@70304c000: $nodename:0: 'mux@70304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
