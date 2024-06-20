Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86551AB362
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718880304; cv=none; b=UJhAx3aAKrMVpWYRfiyJAEDJXJ4n+oHqtTgiPFMJJ0ldPkG5/oHk4g650jIt8Sw5pNziDa5epzR6iodjDncgs2U0Y+1srPFf4cYDoXA/3rifRR+3jmHOmPiz2vQntkR1TbTtMUQ8h/15DjNVb0BFrT3qDrJ38H8E2/OZ2UujETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718880304; c=relaxed/simple;
	bh=ulHcqOEtQJX9GjkEASMoLw/azScvd8wGLh/KtvYqK58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPE4VjUhRX2w/uvLhX5HWn3Z1dKtPep6kKOMxEvjlTE2sdaz3zJ0FLhPqGv1J3xm7jBUy53rH9gT3gJw+S2gU4KeGGPhGwkV6X8McKKT30wXCFUSNWMnYrvqgxTPwHkFYJ+VPap309aMuzg9fm/Wb+7rhk3nAo/N4TqPxDhHR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYj2svPf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYj2svPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718880302; x=1750416302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulHcqOEtQJX9GjkEASMoLw/azScvd8wGLh/KtvYqK58=;
  b=lYj2svPfyN9mu1RNkxtueQ4J4dpFsY7dIjoS8TSRIhLGRm9QukgGfvoR
   QeECSlXAHMbr9XVd6+lJ5vKji5RGw8tdth9HjkuogDRMVQVUJLMN8HKKn
   YaEF/PoiZnMCCHpshxoHRXDwOT9tp4Xw4UdyCTxIu/x9/fvX2VpE1plvK
   APpeO6uVB/vEcWjVeDToYW98kQMuqF3/zT3jy7BoT/E/VMp/w6GQ6laYJ
   Fc8NE/Kh2Th+jRuCsEdzLE3bfuQ9M0qX98LkD7vG9IWni8HwI3zQ199LA
   gng3kc6TsudwFsjyRxZhW9lehTFS/Hgi4p6y5LvsM6PZeCcvUZMzahpPq
   g==;
X-CSE-ConnectionGUID: 0K1q2/RUTDWv8HafBDgGjQ==
X-CSE-MsgGUID: obcGQMv0RrG/aPCM0X/xxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27254635"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="27254635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 03:44:57 -0700
X-CSE-ConnectionGUID: pQ+eqKRpTmqzAB3cQJ8nog==
X-CSE-MsgGUID: MsVh8MNhR56tlMPDPLLlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42142055"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2024 03:44:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKFHh-0007Xa-3C;
	Thu, 20 Jun 2024 10:44:53 +0000
Date: Thu, 20 Jun 2024 18:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 120/132]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed to
 match any schema with compatible: ['renesas,gray-hawk-single',
 'renesas,r8a779h0']
Message-ID: <202406201854.Pp3ZqJ0W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.34-2024-06-17
head:   caf7f9c42b2dc056f352a35527e2efc1e4ffd4b6
commit: e8478eceea52bc2f0721d029cf3ee4a31a75544f [120/132] arm64: dts: renesas: Add Gray Hawk Single board support
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240620/202406201854.Pp3ZqJ0W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201854.Pp3ZqJ0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201854.Pp3ZqJ0W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed to match any schema with compatible: ['renesas,gray-hawk-single', 'renesas,r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed to match any schema with compatible: ['renesas,gray-hawk-single', 'renesas,r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/watchdog@e6020000: failed to match any schema with compatible: ['renesas,r8a779h0-wdt', 'renesas,rcar-gen4-wdt']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/pinctrl@e6050000: failed to match any schema with compatible: ['renesas,pfc-r8a779h0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6050180: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6050980: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6058180: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6058980: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6060180: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6060980: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6061180: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e6061980: failed to match any schema with compatible: ['renesas,gpio-r8a779h0', 'renesas,rcar-gen4-gpio']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e60f0000: failed to match any schema with compatible: ['renesas,r8a779h0-cmt0', 'renesas,rcar-gen4-cmt0']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e6130000: failed to match any schema with compatible: ['renesas,r8a779h0-cmt1', 'renesas,rcar-gen4-cmt1']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e6140000: failed to match any schema with compatible: ['renesas,r8a779h0-cmt1', 'renesas,rcar-gen4-cmt1']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e6148000: failed to match any schema with compatible: ['renesas,r8a779h0-cmt1', 'renesas,rcar-gen4-cmt1']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/clock-controller@e6150000: failed to match any schema with compatible: ['renesas,r8a779h0-cpg-mssr']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/reset-controller@e6160000: failed to match any schema with compatible: ['renesas,r8a779h0-rst']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/thermal@e6198000: failed to match any schema with compatible: ['renesas,r8a779h0-thermal']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/interrupt-controller@e61c0000: failed to match any schema with compatible: ['renesas,intc-ex-r8a779h0', 'renesas,irqc']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e61e0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h0', 'renesas,tmu']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e6fc0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h0', 'renesas,tmu']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e6fd0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h0', 'renesas,tmu']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@e6fe0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h0', 'renesas,tmu']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@ffc00000: failed to match any schema with compatible: ['renesas,tmu-r8a779h0', 'renesas,tmu']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6500000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0', 'renesas,rcar-gen4-i2c']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6508000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0', 'renesas,rcar-gen4-i2c']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6510000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0', 'renesas,rcar-gen4-i2c']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e66d0000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0', 'renesas,rcar-gen4-i2c']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof-r8a779h0', 'renesas,rcar-gen4-msiof']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6ea0000: failed to match any schema with compatible: ['renesas,msiof-r8a779h0', 'renesas,rcar-gen4-msiof']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6c00000: failed to match any schema with compatible: ['renesas,msiof-r8a779h0', 'renesas,rcar-gen4-msiof']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6c10000: failed to match any schema with compatible: ['renesas,msiof-r8a779h0', 'renesas,rcar-gen4-msiof']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6c20000: failed to match any schema with compatible: ['renesas,msiof-r8a779h0', 'renesas,rcar-gen4-msiof']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6c28000: failed to match any schema with compatible: ['renesas,msiof-r8a779h0', 'renesas,rcar-gen4-msiof']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/dma-controller@e7350000: failed to match any schema with compatible: ['renesas,dmac-r8a779h0', 'renesas,rcar-gen4-dmac']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/dma-controller@e7351000: failed to match any schema with compatible: ['renesas,dmac-r8a779h0', 'renesas,rcar-gen4-dmac']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/mmc@ee140000: failed to match any schema with compatible: ['renesas,sdhi-r8a779h0', 'renesas,rcar-gen4-sdhi']
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@ee200000: failed to match any schema with compatible: ['renesas,r8a779h0-rpc-if', 'renesas,rcar-gen4-rpc-if']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
