Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E3383C85
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772480915; cv=none; b=kAMf8k6HST+f+sUugwlTZOPSgExkBSJtj1zY/B7IGmrJvN64nwn9lUqJcNQ/AYECChc06VIrH4gm0jHLaIme2WjHv71R9vtu+M2g0YahLNGshqZ+DqsSZ9ShQ6USt1N2FrIENfdxXlS2T/c4DJ//OkRWJvZLmcH/Woas1e91MzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772480915; c=relaxed/simple;
	bh=p/jR7mB6P0CIKFzmqNc00PFQirLZlpYCsL4oGXnfz/w=;
	h=Date:From:Cc:Subject:Message-ID; b=kbAviP6AlNpdqyRXJwomWI+qgG/7TDf99Ga3tdnE8QxQ54hYSLt9pbJOo578LyDXW1fyN+Yy9dUxZ0a3CHYmozNpQrF0QHY1AeGQhRAMRBQ9mayrppWTlylvJQKcwVUafrAl5tXbd7jmQlxtjQwlvxyMMRDM30QOrUfRSNBgCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEZVL4tL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEZVL4tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772480891; x=1804016891;
  h=date:from:cc:subject:message-id;
  bh=p/jR7mB6P0CIKFzmqNc00PFQirLZlpYCsL4oGXnfz/w=;
  b=fEZVL4tLJNvmPFR2p4Sr/d1yKptHhXlcfMUVNpD2m8qCrly+vbUkd0hj
   ssX94fqhR3aZG/gw+1IF4xWYS1gLJSfYH+QyHJca5YDlbfeT/7R3J1QiN
   0Rxok2xBmYAoS8Eq4gYTEfj2Nt6HL3vzvB8P7MQK+ukDJ45W1v7UUjybM
   SFJ1bpt43B0lOOMBDu/4JQ0tUIu1CT1oUb3SR6gGDtgOaJF0fTKp556lv
   JeogMnYYTXgyziR1bMssG+e/0TBxJvnuvi0WJ8he6ThqrZOcYDSEYDAss
   ZhZjnUlBu1dhIDsFwKGIKYm7ivlkbtwhYopN5cgUbxSPPf0aOJi7eIhv+
   A==;
X-CSE-ConnectionGUID: 3PLjwdZ6SVq2V6fLAZKJeQ==
X-CSE-MsgGUID: XfTlSfZ6T7eNpuwNRK9jbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73407523"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73407523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 11:48:09 -0800
X-CSE-ConnectionGUID: 89tD0WZnR9qNlLcb0o7c7g==
X-CSE-MsgGUID: 7oAga5hxSzCIKJNfVhX0Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="215355248"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2026 11:48:08 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx9FO-000000001HB-0rfT;
	Mon, 02 Mar 2026 19:48:06 +0000
Date: Mon, 02 Mar 2026 20:47:44 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200):
 reg-names:1: 'cx_dbgc' was expected
Message-ID: <202603022051.BdknyZpo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   c7c481f14ae7838859098e9873d18c44e73fa7cc
commit: 58c0b917fdca3a6052d61bd1df140ea6e8a22763 [1/1] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
config: arm64-randconfig-2051-20260302 (https://download.01.org/0day-ci/archive/20260302/202603022051.BdknyZpo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603022051.BdknyZpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603022051.BdknyZpo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1895.27-1968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1853.11-1863.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): reg-names:1: 'cx_dbgc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): reg-names: ['kgsl_3d0_reg_memory', 'cx_mem', 'cx_dbgc'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
