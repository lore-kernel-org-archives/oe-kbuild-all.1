Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197F1BF37
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730057131; cv=none; b=G6MF8xN3vICMFiYCIcJlOto3bv3JUcu+HpnKtdXsdjMHwIFeW30eiSbvbB8Bq+yz4n5XDaAr/aPvjS7agY4iii5+eBz3/vzAqpsMMc/RaVpwIzoDPkqZGV55z0VTOfPNiyPj2ktH+wkUK1Yq+o7eiaqsK46PPDlhr4qnnVgVXh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730057131; c=relaxed/simple;
	bh=nYGVFjFRvfdcpyOZjt8lrMr//Trc4r3IVv7RrPg5SQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVPe6mBviGHxR47kJgOleO2EUXGSAEv3AaaATQfbsDde3nu0Gv2ODhdkrYo4QcxQ0kT8TK6xGcKUg89NJkYwRFe7ycybqTRhjJKeF9N5GopAxbOPo5jQzUdh6TVD3K0F/G1zbsGt1FZxnbYUYuLXRaO8u+AAu8Ah72fk2IPQwiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFDYaZfA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFDYaZfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730057126; x=1761593126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYGVFjFRvfdcpyOZjt8lrMr//Trc4r3IVv7RrPg5SQc=;
  b=mFDYaZfAr/hI4eUhlUqvMspM0gq8zzHB6f9AohyC3LHJISqgJbpZfIxv
   /8ebfxMN7rKfJMoLRhWN86hBo0+s1Qzkqfc8CAoTGHU7XLzn43cryigCi
   p9B0fYtvKUBZI5JZG/RjCkFPcFWrDBQMoAYOpJUu33QRhw+LUNVGcVxNa
   NpRQ7sK6xgRNU0LpTAW2KLRyRPPpUSxRJTmffeRjltV+A13jbVElyYJWS
   zKULoUEbFMta4EuS8S8WcMEwtvS/8Ls7h3k+HRoFCoOM8jrHAkNv+NTsi
   ptEeJVURaoPj4i8gk8K4uEJ7fqxvSx4/HpQKykW+1ScjnDLha/nNcWOmo
   Q==;
X-CSE-ConnectionGUID: l1YATNmGTFeocOZmUA20Qw==
X-CSE-MsgGUID: fuAHgHtPStOlS3cguZYMMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="40235294"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="40235294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 12:25:25 -0700
X-CSE-ConnectionGUID: hqCmDxBqTieJnN2qTHymqw==
X-CSE-MsgGUID: 9gZ800w+QRWylRzHi/Dpmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81359884"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2024 12:25:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t58t7-000avj-1A;
	Sun, 27 Oct 2024 19:25:21 +0000
Date: Mon, 28 Oct 2024 03:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: [linux-next:master 5515/7183]
 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any
 schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
Message-ID: <202410280343.WJE7GVzN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: c3f5d76a6e036b55cacf6489914aa7b82637843c [5515/7183] ARM: dts: imx6dl: Add support for i.MX6DL DHCOM SoM on PDK2 carrier board
config: arm-randconfig-051-20241023 (https://download.01.org/0day-ci/archive/20241028/202410280343.WJE7GVzN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280343.WJE7GVzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280343.WJE7GVzN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx6dl' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /: failed to match any schema with compatible: ['dh,imx6dl-dhcom-pdk2', 'dh,imx6dl-dhcom-som', 'fsl,imx6dl']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/i2c@21a8000/pmic@3c: failed to match any schema with compatible: ['lltc,ltc3676']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
