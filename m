Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B472139C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735538; cv=none; b=hsQV1PsZRdE3LJJFfDqmkVv1DpDz9PMH1P8NKog2Ny3c5KwjiUVow03sndJvJyjEr9X+m9ZsR8B0SgiUxdzPAKKO45e6LTVfczaxD+oT86hRx3bvf+s68ippWK9nLJo00P0GrwaJcFMC/vozwTxBNjknPrUTwX0pv2eLrHwVk1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735538; c=relaxed/simple;
	bh=44Ffrw78+FGKODjxxL8jMCLE/G1lS+MgQEVmOXZG2UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UY9OTKU2VpWnPczMkTkad2D4xgyj2HCevCB1g1vNsVnLDHk7qic4DghLhd7VKBYCFDxGBiyLrijw79RugBZr2kV8HwLWXQmjuVaJa5seln2tr925JSondx2fvO+ZaFAEgtBmT7/RLK0l4OFn2zMBsuFqvJI/iAlrtrZuJvQF37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzUWDqvO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzUWDqvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718735537; x=1750271537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=44Ffrw78+FGKODjxxL8jMCLE/G1lS+MgQEVmOXZG2UQ=;
  b=NzUWDqvOZZcUrMgFNBmjlaKTPK/KLlFVviPXcYxFA9fjYlPqwy2XteNv
   3NccBiSdT9KXZxjd7U6h4093Sh2cDG3VeH9FSc6zy0O62B7Y7iUVjufJx
   M8z+7BU6gzyKi58niBv1tXGMqaCyFM2XGvP7FzmecMbLSp0g8rnQaNUtw
   8uUBIptahv2NwYE2V4FMchfQHhRR6FcRO1N5ijOdiuH7JkYSPFjP9E8DD
   N1AoBFRTXoYQIqZXNjmLzgdlEwET6tXv3ClgyOcPnMQJeFkLuoFpkVIow
   d7k/gwezZsM5zuzr0C60+O0vSssBh31Q/hsX7RpPFO76zZQnxuSRKxKOQ
   Q==;
X-CSE-ConnectionGUID: cAFlZBj+TION5J7mrHjbbw==
X-CSE-MsgGUID: g40/0lONRciEuVNNVtlIUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27054540"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="27054540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 11:32:16 -0700
X-CSE-ConnectionGUID: d+xOL6g3TbWTtR/vFCMclg==
X-CSE-MsgGUID: Nm50JRFFQMKNZoGVyQkGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="64888073"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2024 11:32:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJdcq-0005p6-1P;
	Tue, 18 Jun 2024 18:32:12 +0000
Date: Wed, 19 Jun 2024 02:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4993/6864]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10006000: failed to
 match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon',
 'simple-mfd']
Message-ID: <202406190248.TDevN6lD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
commit: 136f4647f27e6edd6a014156f2e24046e32db0ec [4993/6864] arm64: dts: mediatek: mt8188: Add support for SoC power domains
config: arm64-randconfig-051-20240618 (https://download.01.org/0day-ci/archive/20240619/202406190248.TDevN6lD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190248.TDevN6lD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190248.TDevN6lD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000: $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000: compatible: 'oneOf' conditional failed, one must be fixed:
--
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000: $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000: compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
