Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A51A6820
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773514050; cv=none; b=NI3at6qguAS2NU/TWt3X9IQIXT4G4LbOriZBMvvItapsZeQ+q/l6IuRlI9LKnMohI9E3mhsQcqvieTjcUXroxKcZtsVJDyugcW05Sx+y9aVOlFXrCSnT4i84y3pp6pgtSINQ8DcTVsbVE0AarQi4bhnBcHo/L/Z2bS/FZvWDmDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773514050; c=relaxed/simple;
	bh=PFfFiivtFGmeUAHGRKkvhEgcxsTI4NkTh4GjKcZimG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MrpKs1gErMxPb1LfBQCt/bZcLCS8ow/ke7T/qXz4ecPo8aVHuSjPkMUSUTiNyXWYCKDrxo5B3Vbphc7t9+CWz/Wy/NuOdoQBjoTHP+n2cS873YyJye0pGtP1/VESPCigsKX50oc1SCxAWxGZaBdAb6cTseXtjIBaVYydfXck/ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Htj58WQA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Htj58WQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773514047; x=1805050047;
  h=date:from:to:cc:subject:message-id;
  bh=PFfFiivtFGmeUAHGRKkvhEgcxsTI4NkTh4GjKcZimG8=;
  b=Htj58WQAfv45U+f5ncIV0qRPhDPkqHxLOlOZSvSGrva7tKKclkk7RV8C
   EiwxO4r1k1yR5Pxi+Kdd1n+2LVqfR6/6HWgbyLHrmW1PEyb5aI+X95J31
   CoZGhAalGknMRiiRA2ZiOU1k0pJmtc2tlSYPIq/LyF2SMcjliPLq40too
   MHHucnLRWzAPDUmISINYBx4qjBjY7krQSJIyshV9v4A9mO7125qKJnZRz
   SYDhv2tHK6o/iQvm/3kmYrgaKRw+Rl98a0e49FWeMTVYB2eo5y2mSsy5i
   GZHhHplVPhvQg4FOPY+ysgmOzdORIfjKC5vqxyZukhSfcDuC99kBpOQT2
   Q==;
X-CSE-ConnectionGUID: Zggmuv41RHeSuysU+d14kA==
X-CSE-MsgGUID: fEBNV7wSToGrOW9P8yQGhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="78436956"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="78436956"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 11:47:26 -0700
X-CSE-ConnectionGUID: UK5DIfP1QEGI3wUus3KAoA==
X-CSE-MsgGUID: WC2LpO8MSmKbeCwV1e/uEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="226150858"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Mar 2026 11:47:24 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1U1B-000000003px-2X6n;
	Sat, 14 Mar 2026 18:47:21 +0000
Date: Sat, 14 Mar 2026 19:46:56 +0100
From: kernel test robot <lkp@intel.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 2915/6488]
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000
 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required
 property
Message-ID: <202603141908.NKUvrVVi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b84a0ebe421ca56995ff78b66307667b62b3a900
commit: 9ed20e877239e5ca30892542dcaee1e5f9b0c413 [2915/6488] arm64: dts: qcom: Add base PURWA-IOT-EVK board
config: arm64-randconfig-2051-20260313 (https://download.01.org/0day-ci/archive/20260314/202603141908.NKUvrVVi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141908.NKUvrVVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141908.NKUvrVVi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
