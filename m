Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF134D2EFC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658538; cv=none; b=RiiZMsyJW/v3sJbvzw6/vjjwduB+ewI/G9XCeqhoFmEqm5PECLMdzYwPxvd5XXQ7r3EiTdgOijk4RlYqVetr47NjHMcCB1Z89UTlJr0t94W25DgJZEASacmeD+0PX4iX6lP4wmf2iz7qibHYqGgUPYTDDIsc3J6E+Csbw4FQb2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658538; c=relaxed/simple;
	bh=PyKEtWaz5nsufmvCJqCYTbjgSommOYZZyNsgi227Q04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XEPo6K8UeNoeujk/JakN1Mhm6is5Zl9KtrkosAH1H3qW+AwdnPZscsKRgjjgGkQzcVO/SluHxsdPcTMzrKlf5g9JjpKEUbUC2IhlX1TnloQaaJkU3Gnw4ZG0psjrBaoHc7MqyWfZz8XSewxz7veT0Y8PGgb//AvMPIoeG/paQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpQPtbQO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpQPtbQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780658537; x=1812194537;
  h=date:from:to:cc:subject:message-id;
  bh=PyKEtWaz5nsufmvCJqCYTbjgSommOYZZyNsgi227Q04=;
  b=IpQPtbQOEJbVKoP3+T3R4gZi4zMtXE4BsKp8t1Udlc7QP8FvKv7BWYXV
   PAXol2TQ3k2yPx7cPQKQzogrFVTmnuTFqOFP46RagmCjh6WuYhfvubNfx
   2f8BvdmAV1Afc9KPQv9G3CqocK75VSGUJ2Q8b87l1w0h9zSVCFGR+m8ja
   2Dwp+oGGCSVdjSdlUW24oZLC6q08iqHycpJgInSxWOJmO5YW4p8Ls867X
   uC/cOEjYm9ggWS0K1A+CZU2uDO5YS1gY9XANWDf9+F1Fs2k456gcJ2Hs6
   G3HdiXyRSsS2+y0lV7J5bl/s9nOalu8QMZ2qkul+ho+3so3O4xOs8bZOk
   Q==;
X-CSE-ConnectionGUID: cBotHYhBRni4Ao1VXwr6Lg==
X-CSE-MsgGUID: Zh8uv26GRIiDecdKNyT6vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="84070880"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="84070880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 04:22:16 -0700
X-CSE-ConnectionGUID: 6+lhd6bVS3mmiTL6vkIM9w==
X-CSE-MsgGUID: cempb0ZdSXmBqzgdB0hOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="244886269"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2026 04:22:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVScu-000000002Yh-2NLY;
	Fri, 05 Jun 2026 11:22:12 +0000
Date: Fri, 05 Jun 2026 13:21:19 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7841/11439]
 arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000: failed to
 match any schema with compatible: ['cortina,gemini-syscon', 'syscon',
 'simple-mfd']
Message-ID: <202606051334.luCA6R5X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b99ae45861eccff1e1d8c7b05a13650be805d437
commit: 0b6084ebde381d808c80bf42364298e2ae326175 [7841/11439] ARM: dts: Add a Raidsonic IB-4210-B DTS
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260605/202606051334.luCA6R5X-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051334.luCA6R5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051334.luCA6R5X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
   arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: ide@63400000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
