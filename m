Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2C39D6FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787545; cv=none; b=C+tFnR/ZDqLK4v6+BRh/lNlBi5yV6h8PSEA18/btSbXc5UK5DWMHhc4/1MLTTFm20GMOq/qwgd7pGBdqdEdCDmzViYoBP3QZqBi8V17kNYJiRvLigMkplbsm1U7WJlPeCGOzfck1yKvUALAmdpkcwi2AO48Jgfubkt78ckKjMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787545; c=relaxed/simple;
	bh=dQcPZmfaIdYxDHpUQk8+kG7T69fft7GG0SI7wScjEJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHl0oHh3/HzrALEbcspwECR9GcqbKRNbxAIfeqNra9mKDRgpGuKq5hN/64l/NbQHqiU1+5QghrLLAXGinggs0poyqSvjWtavc0wFktdaFEyBbdCu2lPK6/6LAWk0w55rDtCvPpgxPWv/Wq+2VwON6umvPlnEkmtWhKQrA4Anap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1YFb8t8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1YFb8t8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778787544; x=1810323544;
  h=date:from:to:cc:subject:message-id;
  bh=dQcPZmfaIdYxDHpUQk8+kG7T69fft7GG0SI7wScjEJw=;
  b=f1YFb8t8Ofz282kyXuvW4weloWfXZAg6nonoxJrNfgqWzB8/m3JpKXAZ
   nDxIDgy52mq5QcaNrbSj0i/CF3TaoGgFjBvX4SGyFeWEVCIf92cZuHjq3
   Ylc7kX6OGpY2JnZUprVM5wkI403LiT84fb9kjlf+H+eu6Vf86qjxUtqHa
   0xm6PdLnv/hhgxAelQuEUsUnOogeMtN58RJ7Zmi7npoBU+B3wOy+We4Fx
   RlntrNJIi2UyvzfXO9U4QBB1N97s8RWt3OsBnHQl/EAB43lLcPjYU059I
   tpM9PFKfLjdTreJNZBe1MgVvpCz1S6wflWKmLHn6SikFLPyuJff0ansWc
   Q==;
X-CSE-ConnectionGUID: J6cNSBbPTiiMYkrKmnxDfA==
X-CSE-MsgGUID: pjB5X6hySbiRZQYKqcCeKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97315053"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="97315053"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:39:03 -0700
X-CSE-ConnectionGUID: SyQXoUr8QlyCOPAT4j3Dpg==
X-CSE-MsgGUID: EqmYxcaeSGer0UQZCbDmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238738239"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 12:39:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbta-000000008rR-3ZLf;
	Thu, 14 May 2026 19:38:58 +0000
Date: Thu, 14 May 2026 21:38:03 +0200
From: kernel test robot <lkp@intel.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb:
 pcie@0,0 (pci1179,0623): i2c-parent: [[419, 119]] is too short
Message-ID: <202605142114.TkUlMzxP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66182ca873a4e87b3496eca79d57f86b76d7f52d
commit: b64abb26a2916e33cc9dcc00a48fa31fef255697 arm64: dts: qcom: lemans-evk: Add IFP Mezzanine
date:   7 weeks ago
config: arm64-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260514/202605142114.TkUlMzxP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142114.TkUlMzxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b64abb26a291 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142114.TkUlMzxP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[419, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
