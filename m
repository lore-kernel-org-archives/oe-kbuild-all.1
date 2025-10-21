Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD028E3F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058940; cv=none; b=gzdqwT6HQaCxLHgH6nJBvBRSMhznjG9OqvVT/maEaxPjL+f961H78wd59//+nonjbcruwEqqeZfY+JUbQ1skiJPca+EWCvGUEt0zl7bMEkZkfP70L75wogi094OzPsAkfPM8+ilIQDyyEQ8GRxde+PRMBwCax85cKpuxaEYC0Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058940; c=relaxed/simple;
	bh=fo69VcxBqaGRViKeIHQKP5pyEXEivx0Baaiuujr/C40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HFL0qyjdrP6hCB+COKRSzwwCXz3ctkwp7sHa6u/Yzj74R8CtfIWxoJVejHkARfKSkn5pXgbqBjT89J9cmR5QsPxa7zOODOsgJ38dxH4bibhZaXJxwhECNUaLhYTkvz3PIFWQ2AcELf8tFr+IPIcHegtGd6yK5UFuEM6OaCy1XJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJqiQcBZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJqiQcBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761058939; x=1792594939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fo69VcxBqaGRViKeIHQKP5pyEXEivx0Baaiuujr/C40=;
  b=EJqiQcBZNlcwWkEF39qgx2AuSwDduskPLoLFyw9sqdYSBrqaNem7546d
   BpxUnEjPOkyTkI8wukETl8LfgcmGMBsIGQ8411qM08e49JFRij6/PkLon
   LBXQ1fbrzowkSfa8ppWa51dII03MAMgx0PCXueevNNx70hmVYxw3TbIj2
   owxKwq4tblTCKZxv4X0R75Axl5LT+dYS1G+mEL7jzV3HkzIb6FP5GslbY
   Q5EUWlzMmCHpdHxUgWQeax22r0SgNOy/hQ9Rh8/kUR48Sjq7hP3d/UZr+
   i2X2ZxOkXH84OUdzJqU1DgXPZmuSrprwlz2tgCKsIKCD/mKvLCpZCwN6r
   Q==;
X-CSE-ConnectionGUID: Mp1nHfX+Qw6siISosZFikA==
X-CSE-MsgGUID: mYgEObcwQ0GLnZ2qisxeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66827897"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="66827897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:02:18 -0700
X-CSE-ConnectionGUID: maF9d3r5TMe3qhOz9ZRXtQ==
X-CSE-MsgGUID: 6g4kbKkPRd2XC2VF471HUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="220780273"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2025 08:02:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBDsM-000AvV-1S;
	Tue, 21 Oct 2025 15:02:14 +0000
Date: Tue, 21 Oct 2025 23:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yao Zi <ziyao@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [linux-next:master 2501/3056]
 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: pcie@fe000000
 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
Message-ID: <202510212223.LQlabZyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 263fac6b09b42a1b077c21354370d38758237ab0 [2501/3056] arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
config: arm64-randconfig-051-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212223.LQlabZyJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212223.LQlabZyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510212223.LQlabZyJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: pcie@fe000000 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: pcie@fe000000 (rockchip,rk3528-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3528-pcie' is not one of ['rockchip,rk3562-pcie', 'rockchip,rk3576-pcie', 'rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/pcie@fe000000: failed to match any schema with compatible: ['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: pcie@fe000000 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: pcie@fe000000 (rockchip,rk3528-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3528-pcie' is not one of ['rockchip,rk3562-pcie', 'rockchip,rk3576-pcie', 'rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: /soc/pcie@fe000000: failed to match any schema with compatible: ['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000 (rockchip,rk3528-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3528-pcie' is not one of ['rockchip,rk3562-pcie', 'rockchip,rk3576-pcie', 'rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/pcie@fe000000: failed to match any schema with compatible: ['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: pcie@fe000000 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: pcie@fe000000 (rockchip,rk3528-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3528-pcie' is not one of ['rockchip,rk3562-pcie', 'rockchip,rk3576-pcie', 'rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/pcie@fe000000: failed to match any schema with compatible: ['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: pcie@fe000000 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: pcie@fe000000 (rockchip,rk3528-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3528-pcie' is not one of ['rockchip,rk3562-pcie', 'rockchip,rk3576-pcie', 'rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/pcie@fe000000: failed to match any schema with compatible: ['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
