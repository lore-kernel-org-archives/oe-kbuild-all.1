Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BE53A1BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718450791; cv=none; b=P1XdSRp6SNiTqBFWRuETdvo167Az95LpWU+JEQcJib9aYqwuK4qS8+mVweTMQOYMUDzih4tzhYN+hOIl6Lp3ups+1ypmahBjsYB1a6znHsqLBW1gEUQha7CgGIhdPsxP84vfkXTeUH0iH4Is6icro8c2UeYwHz7UiouOtomuSSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718450791; c=relaxed/simple;
	bh=cGStRU4MvlVmdGW05ntyJslSC5dv/7365ZNCfSZudik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeW5mChTdcDt3V9PmcGZJHa8UvFjbx4qhP+JOmun/G+1PqXf7pHXAGqq/kN56jg/ofWUQioMyqYCRHNsryZFOPGBInphBwFwdCxCOy15NKY4gGtGL/kuSVBu0ZSNZgnNk13hA7LH41Xp+/OL/endDQqsPw1yZ6kGDYRs8nkWZds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbdhAYH1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbdhAYH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718450789; x=1749986789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGStRU4MvlVmdGW05ntyJslSC5dv/7365ZNCfSZudik=;
  b=EbdhAYH149BQDMqvu52IBkIoKaLS0zGNCFedklC0hSeQ3ijucHw3SISe
   iZx/c1Iimt/6+WhkbLZvPDfD8vnAqGuXOk8QhjtuHLG8S7JJ1tsJZMAWW
   7H/+lf+rHJg7Oyr6jGUcli+8aLkltdDLKOIIvWOoCuA3liOpRK9mVlqzV
   OAvuE0gV3knWX0FoNZQtOAoy4rIdQZARdcusUK6k2KV9YhHAMRNkEud/R
   SDid5oeyQnPg6ZhtakiNBr8GsPc4BCL4mZ1HXOKJxWQk2Rn4YauhacAEP
   4LwpiqZk4kYwzZSAKOBcoZvDh5rM3ZtL1xG/mW5DxHWCKryfa3TN7HLTf
   Q==;
X-CSE-ConnectionGUID: PURSU/IrQSux7kOYm8OOvQ==
X-CSE-MsgGUID: V9ZvRohhSVq0+AsrYRKWAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15067643"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="15067643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 04:26:26 -0700
X-CSE-ConnectionGUID: APMgzgLBQAOUIbL1Jz3GGQ==
X-CSE-MsgGUID: x8kj4RgjTjOoI+Dt0rpioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40855870"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2024 04:26:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIRY6-00007h-1z;
	Sat, 15 Jun 2024 11:26:22 +0000
Date: Sat, 15 Jun 2024 19:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 175/185]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/sio@236400000: failed to
 match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
Message-ID: <202406151937.rGU3GSIL-lkp@intel.com>
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
commit: 1212770ff131d327ecfb1e919626df600582e26a [175/185] arm64: apple: t8103: Add SIO, DPA nodes; hook up to DCP
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151937.rGU3GSIL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151937.rGU3GSIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151937.rGU3GSIL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48: 'VA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000: power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000/touchbar@0: failed to match any schema with compatible: ['apple,j293-touchbar', 'apple,z2-touchbar', 'apple,z2-multitouch']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000/touchbar@0: failed to match any schema with compatible: ['apple,j293-touchbar', 'apple,z2-touchbar', 'apple,z2-multitouch']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235100000/touchbar@0: failed to match any schema with compatible: ['apple,j293-touchbar', 'apple,z2-touchbar', 'apple,z2-multitouch']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000: power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000: power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48: 'VA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: codec@48: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000: power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
--
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48: 'VA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: codec@48: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235100000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8103-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/sio@236400000: failed to match any schema with compatible: ['apple,t8103-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/audio-controller@238330000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/audio-controller@238334000: failed to match any schema with compatible: ['apple,t8103-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000: power-controller@2b8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
