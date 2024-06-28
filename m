Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA81D6A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 04:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719547494; cv=none; b=BJ4ajuK1ecyX3fGV/ZkFFQhOyLbx14mhfFGbtu99TeIrdNg6pLNY2y3ieL9cZUpC8aOLVwHeCrvJWWM+9+5/bi8YYC4JIgG4iKv5HoczjzkC1NUHc8XCCfgDTD7Z8uDlBCenrPsod/3P569wOFhXsHTXD4DcN05QpMymX3C3Rto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719547494; c=relaxed/simple;
	bh=6z58p4LZ/N2Y/lg7vktDu7xFfujCsuahqgw/kDmkNMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+Oz1tGRlqaPGTvyNmgHhxXWtt7ikCixsyNazRviI74SGa2tPKOxn92CSi1HUsOHQb9V6iQkyZDiGbg1zWkabyKnJsftVFf6e4T0IHgxXaaFB8F5XgsJ7dDwGl9k4MKhl5S5sW6584fPwAcLdvV9zqsoJM98IIKOSe94zOxJLTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5SmBkeL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5SmBkeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719547492; x=1751083492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6z58p4LZ/N2Y/lg7vktDu7xFfujCsuahqgw/kDmkNMw=;
  b=m5SmBkeLcEET0rNIi6HF4KokMG3xO0VLGpUg1huWOZZJc4OOakDFXJw8
   x8sKKTorntB7c88B58iB4K1ATXq/wpJ0sabny/pW/y5q27OJhToW3HFJE
   Yg3TP4h1Utwgye88tZY75jzQD5YAXvrI7W0Uetcp4CcF0+TE6TnHAfMXN
   QsNIjoaOsRGShBMebXe7Fbzwi4yAjUou2dIEqQCcGkICrJRBu094wY4MO
   5R0E6uo89GlrO5UFbHLwbaqFe3gMYnT78bpaKvsLGlcUlVyiLJ80tKwQh
   gflDRSz+DbD5Wv2lIedgheupBFKwv/NWHQ+QZDXWo8zhsL+tn8C92UkWk
   g==;
X-CSE-ConnectionGUID: zRo28trsQXWoo4NSi+J4VA==
X-CSE-MsgGUID: rZI+YFsbS3mOYW5ie6xWdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27304590"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="27304590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 21:04:52 -0700
X-CSE-ConnectionGUID: NOzIfKPvSBmiSQlloo0ZHg==
X-CSE-MsgGUID: NLfYDZKyQOy1JpnB+3ZhHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="44665527"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2024 21:04:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN2qu-000Gmk-1V;
	Fri, 28 Jun 2024 04:04:48 +0000
Date: Fri, 28 Jun 2024 12:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 111/251]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb:
 /soc@0/system-cache-controller@9200000: failed to match any schema with
 compatible: ['qcom,sa8775p-llcc']
Message-ID: <202406281110.oY7rhCZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: 809c20b1ffc80200bfcbbeceb0d946a3e0eed3a4 [111/251] arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406281110.oY7rhCZ1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281110.oY7rhCZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281110.oY7rhCZ1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/system-cache-controller@9200000: failed to match any schema with compatible: ['qcom,sa8775p-llcc']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
