Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF833E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752448235; cv=none; b=K8n8VkuzhydohgUmvhufTMW1Wh7IF4nSceT+AQ2Xr2xx4VR/d1fUM7w1xSSFlVAtAfnIk0zycS0CojBD3HmvZM6o6FjZO0kQOqb7eOY5ONKmVd0MZPPjceWZkc1UH+/x2McJrLSGbVt/y6nSRi08DwnykCR0V5nb9H2/X704/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752448235; c=relaxed/simple;
	bh=xwHHOQNQdVpLkPZIqbT1IhFUMADcEkfA0L7+Nt+84kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7IKDI95wk1hyfM1rlCF+NzqzziQDKM1t4pJN7wfcqYwzoL75i3HUBIqGXIuz/+0XnE9xd4zv1K6Zmr+bcLkvAWbg+NIOUt6Dw3D1P5wYp8TdLCfKaoFSKdmbv74SRyw53lEIbN8X4PU605hlZxYzgHf+8kYF5ah4oXUlvcsLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cC/8elcF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cC/8elcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752448233; x=1783984233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwHHOQNQdVpLkPZIqbT1IhFUMADcEkfA0L7+Nt+84kU=;
  b=cC/8elcFR2Vh9q7kXSDHP2QxhwyYh9rmsVK/ZiMwK8o8n+KECGhkRwcd
   x/6VBVT5LMJxh/Xb5zQhRQc9EmAmK/2YVSrsT6dgtKqgHdMFgP6zD+bLu
   Ui+hL0hxCyMSyZEaYdpVJuJRiuUT1xw9ZlCKC9+FXY4iPZOj+sO4S0c1I
   5YyyVm1OHuy8yTQBTpE+hNm94bcvau0Ft+5DtvS4EskcM/enr/eLFfrHq
   04aD8gt5w6xmw9RRg9uNPIoylHP00MqCSEWPMIJD7hltetAQti9XNtc0R
   04dz1vDj9owp97T1a5CmumI71igAeJXwB01/kc2nw454tegVrhKZhAdLM
   w==;
X-CSE-ConnectionGUID: ONbkqYDKS6m3wPSS7sf0bQ==
X-CSE-MsgGUID: opVnLlflT3ml5wawex1+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54578387"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="54578387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 16:10:32 -0700
X-CSE-ConnectionGUID: y4c4ElNISWOIU0ZgANMomQ==
X-CSE-MsgGUID: tM/BYgMmTN6sn57Yx5+pCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="157537016"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jul 2025 16:10:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub5q0-0008Kx-2o;
	Sun, 13 Jul 2025 23:10:28 +0000
Date: Mon, 14 Jul 2025 07:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>
Subject: [linux-next:master 8201/9053]
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: mdio@3009800
 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
Message-ID: <202507140738.XRjv3G8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
commit: a4fb40b240fecc3cf84e12277e5b66818a80e3ad [8201/9053] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
config: riscv-randconfig-052-20250714 (https://download.01.org/0day-ci/archive/20250714/202507140738.XRjv3G8i-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140738.XRjv3G8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507140738.XRjv3G8i-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
