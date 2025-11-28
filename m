Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8368F244671
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764360668; cv=none; b=TG2N1XOhLMbvQLCs/GbEraEkXtMWZmOm7DmQa8dmNtxKbqmQWEEy4SRuQuUNn7s6DI75Qs5tTyKHngWAozCPMEhJm2yoF0dGxWag9nN2zynxO8WIgKfclvX5biWhej1M3WQmh1zGvjenSuMFkjvTSVqpVKstcVxbq//APWcq2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764360668; c=relaxed/simple;
	bh=8lkVO7qjoQwJ+QoDA+RQZTNHk/vMSA3nrL5L/ogpYcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7WCo89IAzseHfSvjU9UIIPPLUtoSAKkgeOWDZ2E8MP35FYTnUPXR8obYMo1ncLrnjTFXdv6Kgw/pfKi5LLdVJ5AnbMl9vMIvDJfO/Hswe8ix/2xk2k7LM+HGyxj+t5fG0a9cLjI7SVof4OtArfAmiJyGTNCK1Y3P/63j0Lh0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL8rdYOR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL8rdYOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764360667; x=1795896667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lkVO7qjoQwJ+QoDA+RQZTNHk/vMSA3nrL5L/ogpYcI=;
  b=QL8rdYORJyHGLoPaWiR+FYHFBBGIYW2lcPRsvwtBooEdpYsUfygJnbuQ
   0OGWyZqWC9KYeiIxFJ70yO3nTV100OzkYCO49zc7ulZyEIZbUJqfhXCvQ
   JPH6tenFvuUFCJOeh33FBQHDyEu5Tjmss4xibCt+KY7qgP8FVLhI6Q2jv
   IxqtFy2AED9BCLyZnUPysh7ouy/Fw6HcbPsJRx8T8JrvJCPlD/3vH/974
   p0BXQPoZyW6r+f+U+6jQOYkeC95D3IcJeoPYzOME+7aLu54HzLKfK0o/E
   Ygp4iFGGlV7jEYqJAz+uYDZjkinygCVsRrQur2QLdqZhKPzPC6bxfQWmL
   Q==;
X-CSE-ConnectionGUID: 7mbC3IrMQ26n+ehmj5JQuA==
X-CSE-MsgGUID: iF41/bIFRvKqudLz7nVYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="89040257"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="89040257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 12:11:01 -0800
X-CSE-ConnectionGUID: K45ybUoOSuitxNqBIRHEuw==
X-CSE-MsgGUID: zR40rqBTTTaIEW6gSC7tEg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Nov 2025 12:10:59 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP4nx-0000000028L-1ddN;
	Fri, 28 Nov 2025 20:10:57 +0000
Date: Fri, 28 Nov 2025 21:10:53 +0100
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 11922/12740]
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: remoteproc@5c00000
 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply'
 was unexpected)
Message-ID: <202511282123.CO50URi1-lkp@intel.com>
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
config: arm64-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251128/202511282123.CO50URi1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511282123.CO50URi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511282123.CO50URi1-lkp@intel.com/

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
