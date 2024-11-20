Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BA18035
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065155; cv=none; b=ZyZRIaufGbjqOkxrWP8dvYxq54YP6qO+YbDR8WvBydY3gvvrwdaWRCzO7J7zycuHuNabag1MmSRE5Vi+PwYSxasRfriKwV/ln/EViNykXkoO9yptVJmgEPsXlm2BFanNPXTd3jnz1ZSxEfClsAyP+V8BCY3L5mKVi8Mjwjoj3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065155; c=relaxed/simple;
	bh=WqCAG0y0amROGWcSsWgFqEJdUyjz+mJMoxVGgc4bnTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgvxuW3q02a2YC+Kq1os00oYdU9uTDfAkK5qGac2Lm2GkxyyzWeTatofx+abXz0OxyDduxnMHtEDKbf3SJOXVEzHLXovEfxwyVsm/HFeZB/j/kuz1ZZOK+NuWHZ91WiKq3Dfp+V/IWen2rUmBfAG2lHQKMlbRYVukZInYnzDyzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnH6TeAk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnH6TeAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065154; x=1763601154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqCAG0y0amROGWcSsWgFqEJdUyjz+mJMoxVGgc4bnTs=;
  b=QnH6TeAktam31RKrz+EsawkmS8yjT2f1oOw5Jnu/UMLXW6lDIXkPkQmo
   XKPrESJqda5ZJf+cd0lQMmZeZTapf00YgY3v8MtY0WrIiZLPrvvTIUPOV
   BASTS/nFni4Hk+vuzBF7alarbLPYT+lVQtyezL4Q1iFl/3aRKyBsVkfMw
   1+axkpDyM3sML0NsKS1ZBJu0wnWdGD18UwoUD0WiEBeq5y2dADlfkmYAc
   5P/SYFpe9CgFMAMp6TKVWnziHbBdMAPb/J+LAY4P1Vz152N0L55qik9Sv
   ehNRBMvG5Lpt7AsnTFfQU7Xxlhv8g03Ba3g/nsSpt7BySD6iI9wdUCBIu
   A==;
X-CSE-ConnectionGUID: B2VaHSXBR+es+N7Veyw6fw==
X-CSE-MsgGUID: feqmjM+KTIeskO/Vk0punA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54602147"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="54602147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:12:30 -0800
X-CSE-ConnectionGUID: uDUlFF09TaeetxXuBzXkYw==
X-CSE-MsgGUID: z50ysmlHTgWq7kwjmdgdhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94805464"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2024 17:12:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZGc-0000On-1Y;
	Wed, 20 Nov 2024 01:12:26 +0000
Date: Wed, 20 Nov 2024 09:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wen Zhiwei <wenzhiwei@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484]
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202411192024.25esZpo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd76a7555127aa134a2a1113685da60b70553e6f
commit: 15796d41b1a74a45dcc01d7b62e800b4cd8b0436 [1484/1484] arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus
config: arm64-randconfig-051-20241119 (https://download.01.org/0day-ci/archive/20241119/202411192024.25esZpo8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411192024.25esZpo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411192024.25esZpo8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:704.17-712.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['friendlyarm,nanopi-r2s-plus', 'rockchip,rk3328'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'anbernic,rg351m' was expected
   	'anbernic,rg353p' was expected
   	'anbernic,rg353ps' was expected
   	'anbernic,rg353v' was expected
   	'anbernic,rg353vs' was expected
   	'anbernic,rg503' was expected
--
   	'vamrs,rk3288-vmarc-som' was expected
   	'vamrs,rk3399pro-vmarc-som' was expected
   	'rockchip,rk3036' was expected
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3128' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /: failed to match any schema with compatible: ['friendlyarm,nanopi-r2s-plus', 'rockchip,rk3328']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
   arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: mmc@ff520000: Unevaluated properties are not allowed ('num-slots', 'supports-emmc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: ethernet@ff540000: Unevaluated properties are not allowed ('snps,txpbl' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
