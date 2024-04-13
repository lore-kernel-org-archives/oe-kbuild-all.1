Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0033EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712983767; cv=none; b=WawleSHqAxebuARU2Qy97wZA6gRPQBLd9NpIU1IKwR22jjrdKsObleOzhuy16G1jIbTyEzPgbgtvDY6UbXubWIswbFRHTwNkPH+nHqIOWUI6LKQ4KoETRDa/lIbKLB+A7F272ym8dMe80o2hFYqBN376WXAAcLDk+X1Yy30W66g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712983767; c=relaxed/simple;
	bh=iBM8cRE/gGvtVz420DYp3zyTDpaAXWjITjYqUPDEVSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQgh9PxSGGElLhJ3k62y/kiPjjQCM/QbRfouYujLJfZ6N1GzpUqwDj2oJkI8RoRIU+6vW8a0Ej6WMFedW5AYZs/KqxA5JN6Nh954k2qnFIGhuOsaix5s0p4i/PaUWf383/1U3h/fKRJl1mrowm/zuA7u+MEGotCH5drevWpbZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6TyEjfJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6TyEjfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712983765; x=1744519765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBM8cRE/gGvtVz420DYp3zyTDpaAXWjITjYqUPDEVSA=;
  b=i6TyEjfJ6CvyZqeIzxGL9S9uSzXkA+bUBPR1RGl95odU3xnb1RePEx8w
   svPSn6lOSUvQ0BObt3kKRzKpfSZZftwHeoZl4CfEw9P2qP+EdS8JwPLun
   Y5Kx8WHLVL/VHzb+wXqI+nyOw0m1F+XNaYp/Ddfux9MvOgnmTpZ4ogF3i
   ghLEf9m20RLlCelQ93FyoWAOaPp1dnISvXo8fB9fBJ5FgPhENTclg02CZ
   2nWnor9TnfnksPJzZRxlO1VNJzZrQ/9N0zqTx7qndnh9jNS2U+O82K83c
   pXRpsCTCVScFZ1oEAByd91g4sRcFFrCHWfkcEKUr+jMFb5ZE33mQhMzEU
   g==;
X-CSE-ConnectionGUID: a2agVyYXTeSWGPIIrySazQ==
X-CSE-MsgGUID: dECjtgeMSgSBWIJlioJRGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="9000849"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="9000849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 21:49:24 -0700
X-CSE-ConnectionGUID: rQsBXm/2TaOYD78huV/9vQ==
X-CSE-MsgGUID: WWQaYT6nSW2+1NNCK9NgvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21347787"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2024 21:49:23 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvVKK-0001lk-0i;
	Sat, 13 Apr 2024 04:49:20 +0000
Date: Sat, 13 Apr 2024 12:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 4872/6010] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/i2c/i2c-pnx.txt
Message-ID: <202404131250.WuXac3Mt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: 4f6ed948efc6fc92462ad397f14c6494b3056eb5 [4872/6010] dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschema
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131250.WuXac3Mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131250.WuXac3Mt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-pnx.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
