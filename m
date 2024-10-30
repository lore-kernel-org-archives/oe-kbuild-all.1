Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3338C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 02:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730255687; cv=none; b=aeuF6Qg9ErVftgZb1TLdG8rDXpkh2jbpGOu8HNbtArH+3oyc92MZhvVV8PeuhO5FYi8NefaXoYzHFO8H4BHwvpKWVievu0drx6r8nn53glXhqs1I8Owqv3jVZwijIsmO49kuDSwB7ymB9K39+RV2zLysz60IJ+i8+Y0uayEb+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730255687; c=relaxed/simple;
	bh=SoAl6gcC7Zp8n8qY9QWdlZLJUdAuG9tjXNEXvwTOLQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lg5IasmwtWZ40HYLbQok3oQU7H3E9T1lRQbu4Ihl1QqAMi55e77Ar6H+jSB05U3Yf11dEOBLs5ZofzYf5zRNV7A7nGdeBbFKnvylXDaZyqCC3tZ7pvsJFtlhGL4P1jE+zvvoAqSvuGD+EO6NxskFOsZi+nuAuIxT7gDtzWbiHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzxqSAiy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzxqSAiy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730255685; x=1761791685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoAl6gcC7Zp8n8qY9QWdlZLJUdAuG9tjXNEXvwTOLQ4=;
  b=nzxqSAiywShtI7kNQEtlHWA0uiFgSwI5CgaANIBkKfjrHylIIYxgz46r
   MQT4wfyAnR/fZttP0ZX4IQ+HhSFQR+sxEypj/bVl257qoubXAuExi87Pq
   AUxJiUFPXYsEgjF/V81M9umeiS8zCWRTg91pje5r0Jh/OIsdUCN1/11i2
   jdK/+njCqgTlXTB6b2aNDp+6l8I/Zz39/VYjWrv8dkaDrU9q7Ou468PuX
   crinEmLKtgpLgdEJVTMi8GQq2A/gDnVAEcYn3+pKIjAETPHVR9X8WIdII
   FGcb8fWLgTFRJwBOY2lLTXytlzR18u8XzeBTf0K/cnpT+oe8o/MlVgYJf
   w==;
X-CSE-ConnectionGUID: l8u+q60eSeyGzlLOJX7yMw==
X-CSE-MsgGUID: TttYoSXWSsuYdn1cd24vQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47399982"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47399982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 19:34:44 -0700
X-CSE-ConnectionGUID: MHRVLjU2QY+jEVEF4Wh3mw==
X-CSE-MsgGUID: 64dG5xf2SAmRsLZaDmXsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="119646039"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2024 19:34:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5yXh-000eQA-0k;
	Wed, 30 Oct 2024 02:34:41 +0000
Date: Wed, 30 Oct 2024 10:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7626/7771]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: scmi: Unevaluated
 properties are not allowed ('max-rx-timeout-ms' was unexpected)
Message-ID: <202410301014.6mKNuBt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
commit: efe82994bf5bcd1cfa506f919c2eac8dd9565451 [7626/7771] Merge branch 'for-linux-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
config: arm64-randconfig-052-20241029 (https://download.01.org/0day-ci/archive/20241030/202410301014.6mKNuBt3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301014.6mKNuBt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301014.6mKNuBt3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: scmi: Unevaluated properties are not allowed ('max-rx-timeout-ms' was unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
