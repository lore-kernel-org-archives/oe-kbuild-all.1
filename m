Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B9416C69F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735415502; cv=none; b=SpfxHsDHyfoQC9U19GkY6VtPFZF2EJkvVPjMgwqxWRWYaDJ+AKXn/p2pLinnvaL6gOBueQihRvrjbyOnSxee2T4PEmupYT6M/h/V7Z067tl/BpbnIIvgHSAPtrv6IhuuvEjD9K3sf7KzI+5aKD3DVLCAHlbaEjl5KIMo2YKYNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735415502; c=relaxed/simple;
	bh=UWT3gyS7f70Y2SZtUq8d5fjLG9PFfGohk361NK62npk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyuCkX9d5F42eyNMRgLEw8YKNprm6CFuNp8HC2Sz5tw/CQVcew2rMxTprbpYx2NaCIbuTeT+6NNoGNeMXmm2vFZzVbGkJ7mNpcdXUx+Y29K+GDQc2JobNMS5KS+KPR+S9WAybicluIiEBoFfqxuDrgDbKeWQ2Ym66SPn/lj0TpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnWFQVV9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnWFQVV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735415498; x=1766951498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWT3gyS7f70Y2SZtUq8d5fjLG9PFfGohk361NK62npk=;
  b=SnWFQVV9p+7a0BuOtY946J9i3vnVem2dRMwGAB6mytL3UqKDcktZAvj6
   9WODMvwejRuSR3TvZ7pKbJEnhLBB5lQp5q6+eB7jh38sMxVwVLv1OAONj
   8kyerRDlFdqe/09w4XFFPIUFUa8vVnJGnNofGXMHFoVPfEQAKq1vDSCvD
   frCJRn6wjcSDohimCzi+mSkILYNFTjC1PsOJgzUBC//ezAMsQYtTCemMo
   BBu4gLrNLhLXpUFpwWEJOn09tLmC4rA5AALlyRVo+58YiJDIbu2Udy19K
   0t43TxY9MH4VRQOqTbKgEIkb3wU3v2K0Y9IAvbJ8thsoYmlqpyNFrwfDT
   g==;
X-CSE-ConnectionGUID: 6ilsCs+pSYC6anovpzLeWw==
X-CSE-MsgGUID: 1cDwKdh1T1quMBwuye8sKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23361781"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="23361781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 11:51:37 -0800
X-CSE-ConnectionGUID: HHzx4YJjQVueijjdVApTmA==
X-CSE-MsgGUID: A7dmgIptSsiGB/+XhRl5aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105492991"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2024 11:51:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRcqT-0004HQ-0p;
	Sat, 28 Dec 2024 19:51:33 +0000
Date: Sun, 29 Dec 2024 03:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@15020000:
 'mediatek,gce-client-reg' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202412290357.ChZ4lT8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   ca8e7ba4cbf9fe4c8fe507bf6d5f91c4f6d0b173
commit: 1999214a9b82af5cf44bb0d23b6fac29c18841da [4/4] CHROMIUM: arm64: dts: mt8183: add clocks for ISP direct-linked to MDP
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241229/202412290357.ChZ4lT8o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290357.ChZ4lT8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290357.ChZ4lT8o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
--
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: syscon@15020000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto'] is too long
   	'mediatek,mt7623-bdpsys' was expected
   	'mediatek,mt7623-imgsys' was expected
   	'mediatek,mt7623-vdecsys' was expected
   	'mediatek,mt2701-bdpsys' was expected
   	'mediatek,mt2701-imgsys' was expected
   	'mediatek,mt2701-vdecsys' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: syscon@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon', 'mediatek,mt8183-mdp3-imgi', 'mediatek,mt8183-mdp3-exto']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: vcodec@17020000: 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: vcodec@17020000: 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
