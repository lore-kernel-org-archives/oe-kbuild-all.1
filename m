Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A872225A32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391259; cv=none; b=tkoeE0I5Nc64DhZvl+L5At+9vA/8AcLsC5d5HBzRIeBjiAOkj8JtjI+A5MOuQkhweefYTDz+Zp+6cxqu+0CH0VPTtIgqxJOHxb9XG/Z/8MmXIg54mwpjhqscDw4hj1iyvEksIJdqUkzws+MvrZcCHgdlJ0kP3OiC2j5fW+6LzlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391259; c=relaxed/simple;
	bh=N9jQGRdJaHeIsa5V4s3tFr9GYlDp2lD8HQUqtRoIWu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKRsRGsp/TvzdxCz4oikdP3uc6tt7Hi1o5ZeB7xxED/l1N5nHa+kp6R9ENZpVlwS6O8A8+z458qNl2ObvNE8UnKLjaZSZZersn2ArPeGLQNK3PlVQclvijmMnEfPz3ZPI0yt61IwfDlE7U7v9C1dWZCuG4OjhqMjhbwROi7+27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AP5HmBz0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AP5HmBz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744391257; x=1775927257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N9jQGRdJaHeIsa5V4s3tFr9GYlDp2lD8HQUqtRoIWu0=;
  b=AP5HmBz0yohV4v5K9p7D2R/4WTaPjQBLebfyVxkpsy0Mpg9ALPWYwK61
   BLbZNcnG/+s4nBSQ9hCuXuSi8YqmA3UDd+C8pOulw7uDKl92WOm0LyMGv
   NAy0F2+qkgkpwOksuLhLYPHNyFunTiqfcbRFs7vrcl4Rz7kKQeH8jiLHP
   CLoS7dGS8fa5o95E503ceyTENHCJPbhzj84vl8wmBdG5cdWOmYARqWaiu
   cJMi958pWuZ2qpyuhdqPL+1yR4R7PdXKAu+g6MCvxALi4SAc0snOP+qQK
   bdYisimLebZgWTh+gxr/PvitXzS41aRHgDWzg5jSbtOHs/oKACJ+nR3LR
   A==;
X-CSE-ConnectionGUID: +h5MjT/dSyC6djJffWlQiA==
X-CSE-MsgGUID: mdDnqBaaQ86O0a7pjAv9lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49785130"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="49785130"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 10:07:36 -0700
X-CSE-ConnectionGUID: ntu4XxxiRgShCnbWYSGFIg==
X-CSE-MsgGUID: XefqF/BQTbKY9F/Uhn8Lyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="134351268"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 10:07:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Hqn-000BGg-2L;
	Fri, 11 Apr 2025 17:07:33 +0000
Date: Sat, 12 Apr 2025 01:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 2956/3149]
 arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: cpu@0: 'cpu-release-addr'
 is a required property
Message-ID: <202504120001.0BUVZFgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01c6df60d5d4ae00cd5c1648818744838bba7763
commit: 333ff6b5b1a80ca3ec5542ccbe3736d240ca7f86 [2956/3149] dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
config: arm64-randconfig-053-20250411 (https://download.01.org/0day-ci/archive/20250412/202504120001.0BUVZFgM-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120001.0BUVZFgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120001.0BUVZFgM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: cpu@1: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: syscon@600000000: mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: mux-controller: #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000: num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb134.dtb: spi@600104000: spi@e:reg:0:0: 14 is greater than the maximum of 3
--
   arch/arm64/boot/dts/microchip/sparx5.dtsi:104.21-483.4: Warning (unit_address_vs_reg): /axi@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/microchip/sparx5.dtsi:124.30-138.5: Warning (unique_unit_address_if_enabled): /axi@600000000/syscon@600000000: duplicate unit-address (also used in node /axi@600000000/switch@600000000)
>> arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: cpu@1: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: syscon@600000000: mux-controller:#mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: mux-controller: #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000: num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb135.dtb: spi@600104000: spi@e:reg:0:0: 14 is greater than the maximum of 3
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: cpu@0: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: cpu@1: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: cpu@2: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: cpu@3: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: cpu@100: 'cpu-release-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: cpu@101: 'cpu-release-addr' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
