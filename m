Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECB9281351
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757148679; cv=none; b=QAvboejJlbiWlWa+SXJmy8PCHXBrQGxjtMqtuRrU9m95AvSHIW7u2PIm4hWovTX8E38ELkTw61v1v1mikGDmzJx8NKHzbuJNj1D1HpypCfipLGaSEDsiLotAAxXXSmWHJm8gXjCdXxqdpiP6PmC04j1jNcgQenW7Axgx7uWrYMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757148679; c=relaxed/simple;
	bh=p42eu1I5C9odjx5HuEPFLHwFC9etgAoKljDDiAr27ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=intML+SXSt0VNP4gUecbRpDdy/xwITMaSYDTiPYpWS5SHxYBnEPBIAa+ltBCoeoRA1i187BeVlIKxaAy3KhJVhzftO0qQf2tQvvmFqOUC87MS2F/6cdeMLE8+nZJF0VQzCC1he7WakHW6qvZjVlQgIBlhnlGNNGjOvc9fJDvu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXZypiYE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXZypiYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757148678; x=1788684678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p42eu1I5C9odjx5HuEPFLHwFC9etgAoKljDDiAr27ZU=;
  b=fXZypiYE9MiMaGSonu6eS9ZXGvsRj/qhWN6Q/GxuNVM94US0hM4TNcK5
   JU0uahPPQ1jmB7Ezb27tplsiIBL+kV4Mii0crOHsdQ5T+G5/B6UQ7nXAT
   XlujO9xg11Cuefk8JvFFNxigaPTZnoe3dQYYRzgbKnctkWR43hKjYEPmf
   WQt9Ig5vYfbwV6r62PSgQX1RWIQrsgzMQ3CCIjVRDqaTbcMhRHxwtGGNn
   RV50+CKzXsV/4GubmAJkzrxjGa77a3wDHvLAe49OlTzEdeIA2b3J70KUU
   7HnptMCk6M/9uxgQm64eNh5i9X8DsvEwAqeCbv4O1ibMB3wc8iYEry3hG
   Q==;
X-CSE-ConnectionGUID: QpeyJIAzQrqPXPCDQ/DvHA==
X-CSE-MsgGUID: IebxrlMFTym3Tb7RWEDuHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59408232"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59408232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 01:51:16 -0700
X-CSE-ConnectionGUID: 3tOusPHNTl+p/UCW+diVdg==
X-CSE-MsgGUID: Cl8+o+5uStC/rA4HJwjCHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="203293111"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2025 01:51:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuodc-0001Jn-2x;
	Sat, 06 Sep 2025 08:51:12 +0000
Date: Sat, 6 Sep 2025 16:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6268/6355]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000
 (qcom,sa8775p-dp): clocks: [[225, 1], [225, 11], [225, 15], [225, 18], [225,
 19]] is too short
Message-ID: <202509061641.M9r43HWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5d4872e528796df9d7425f2bd9b3893eb3a42c
commit: e24f5bc637f5982a6f28e2bfd764eb255c9d9e48 [6268/6355] Merge branch 'msm-next-lumag' of https://gitlab.freedesktop.org/lumag/msm.git
config: arm64-randconfig-051-20250904 (https://download.01.org/0day-ci/archive/20250906/202509061641.M9r43HWa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061641.M9r43HWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061641.M9r43HWa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans.dtsi:4497.28-4558.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4579.28-4631.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[225, 1], [225, 11], [225, 15], [225, 18], [225, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[225, 1], [225, 28], [225, 32], [225, 35], [225, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4840.27-4913.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4934.27-4988.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[187, 0], [187, 12], [187, 18], [187, 21], [187, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
