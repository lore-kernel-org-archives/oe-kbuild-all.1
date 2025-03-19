Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EC723CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401902; cv=none; b=qLTK/17+umiwpNYrdSDY4N7Oov9mmkdbzkomFePwIHnc54tpZQjNcUiNTMdA/Cqa3fy/PXoi6rKiw6euCurO26i0vc4wfiY7jdtrbDUY/E8aTYMge53tOIQQ/g6XcylytsnffYikUEe/eKMdIhLtJ2zV4VlbXeXbafDVQJqFplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401902; c=relaxed/simple;
	bh=wJPtvAWURl9Zl61DM86Ux1WDvjGUHCzaWLFOJhSCBEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7Jpx5GgVGrn5vVU90mUt8JjgzGb2hCb9NnCU7LZ/p2tYSGSXXgkEw446dM/sRGnk5rhisY1Wqe7Dg6fwGlk1qzSE327g38uA/wHowqCL7IYFsdhGGnpq69cTg3bc9GQKelYFbumFb7U4olfLHq7CPJ+ivSHqjMbdzJPko5jGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U98ixxUg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U98ixxUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742401901; x=1773937901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJPtvAWURl9Zl61DM86Ux1WDvjGUHCzaWLFOJhSCBEE=;
  b=U98ixxUgUzV5fEahIx5uIKXADGOWY4J1W4N+jjITiICxhXkshAK60Ve1
   CoOeaI82waZiBNMfOwe592P4fXMeGBfPYjfSh+rE4w7p3XdC/MXQ6rQFZ
   JH2ezAh385Vm6FgWVcgkRkoY0PhbwWNa42VLJgkwAHBDtrV62TB5PXes1
   28tw//9by9GyEPu++dToxSIDZ3ALJQJBFfBuOVyJn5CUKWJHS0TKVXig6
   K3wNyNJHlR468WnU/iKrSMgz8P+oSPnlgWkJyJ4ih7BWU1r4hcRyZqT0Y
   BkdagxJpX1y5jCMot7Fhxz3WAR2CVUV03BkFiiZl3AdI9OapKADdrw7K3
   g==;
X-CSE-ConnectionGUID: kMU7bv+UQVakfwLSf26YBw==
X-CSE-MsgGUID: rKzOaJASQVCYKC1SBeurWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43522543"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43522543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 09:31:40 -0700
X-CSE-ConnectionGUID: bSj+AH6ARdaOVXexRQi1nA==
X-CSE-MsgGUID: f58FcP4vSzSTz1PaD5c2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123204596"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2025 09:31:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuwKN-000FWa-20;
	Wed, 19 Mar 2025 16:31:35 +0000
Date: Thu, 20 Mar 2025 00:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Belokobylskiy <belokobylskij@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [linux-next:master 10620/12447]
 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'reg' is a
 required property
Message-ID: <202503200053.dQaSJw7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: f5b7564fedcfd32df68d56781b9d7698343f8fbf [10620/12447] ARM: dts: qcom: Initial dts for LG Nexus 4
config: arm-randconfig-052-20250318 (https://download.01.org/0day-ci/archive/20250320/202503200053.dQaSJw7r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200053.dQaSJw7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200053.dQaSJw7r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1535.14-1566.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1096.21-1144.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@4700000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:1162.21-1216.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: soc: replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@1200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: timer@200a000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@5700000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
