Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04E2E7F1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319677; cv=none; b=bwY4qeBb5QTy48l77BiFlvdvpE2h6db4Alanv0p4jA+kFC2w2uvxJMkNaV+Y0oRth5v5LFwKrddKGSXYkRnnQXm2iJqh3mMBJxndw2EdkCQNrcYYvTnvlLckNDwHpL3fYQGOXUa+8GzM/IpdiIZce1468NA3/Mvouc3OPPX89bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319677; c=relaxed/simple;
	bh=HookyMoJq4wmDfZLiJWTuLTdQD1L7ndu8Od9SZFY4xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJePYM3vUwPrd6mAhDdaSQ76jiKSyLA/kvLdye37Y/Ry0NX6ABQ4kkHGgo49TqZfgzwvq1fUUgSS6vpGHSFTpvF2j7HpAgx0OfsecFsLf70HabWudEtaBsGATejUeTbzfEZvQc1hIldRU+ms4+c03pTwVJDxBklwln387TRNsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC9EidKE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC9EidKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764319675; x=1795855675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HookyMoJq4wmDfZLiJWTuLTdQD1L7ndu8Od9SZFY4xg=;
  b=LC9EidKEy40k7SFK1XN+WUc3188XsXjMpjoP8ghKmew15Wz3ixfRBE2I
   A2Cy9ln0jR/Qpkguj+VWxpFOuCae/uA10XVJPMOxy0efterN58OnSgGnX
   qvGRUIf9HvLyfqkkRvB9xBOJ/yx97xW3uVvf4VTyp2zBCcxJufWf2pSyt
   naHeJHlyh6vx2a0+G+4ZpnlM6lX57RECDHsCHeVuk4/GbEQ9Ri4H8/+un
   wSkzg5EQRImFR7y3vvKWgENFQtZFTMv8yCp2xOjBM4QphGUoULa4Ir1uR
   qZyi6VTZUEdYScWK4QjAwCGGrLjPJq7PJYJy40EoDeMuj8Qr0PKYk72t6
   g==;
X-CSE-ConnectionGUID: Stk6efYsSIGVxFynS9V4aw==
X-CSE-MsgGUID: FYDsoy6GTA+p5IJUXVClVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70212042"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="70212042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 00:47:54 -0800
X-CSE-ConnectionGUID: KLDKIEhaQaiJH23C/LnmNw==
X-CSE-MsgGUID: OYPIiWWwRVm3eK6/G9pz0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193417108"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2025 00:47:53 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOu8s-000000001zp-2mmY;
	Fri, 28 Nov 2025 08:47:50 +0000
Date: Fri, 28 Nov 2025 09:47:39 +0100
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 11922/12740]
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: remoteproc@5c00000
 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply'
 was unexpected)
Message-ID: <202511280908.11aaUUGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 3d447dcdae53b13b5d7df32c4d1d35971d460008 [11922/12740] dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
config: arm64-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280908.11aaUUGU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280908.11aaUUGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280908.11aaUUGU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:602.10-643.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@60' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
