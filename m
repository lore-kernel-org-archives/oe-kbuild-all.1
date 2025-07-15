Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4E274672
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569442; cv=none; b=aekbuz4InQSsd8WNG687/A+x8353Bmz7hS5/b7VG2k98oZClvNjVRfHheUzXtf8BdBJsDGIGZgTBhhuV5SWb6QJTwd5jD96akPwadAYTjLAwcRXP03Wcwk7v3PfWIl50nY4mdoTMi/x+r0qIpV4uKUdRWo/1xuWSmMZgfpqYwj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569442; c=relaxed/simple;
	bh=hHm/eFSTInEg5D7Zs1fZPhoNNLhZJT1F2q/4x0jpdwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TE/lE4eqIN3yhfPONzWbt6gxoVUoVYGULqn5WkkWVbUa23sy1r1x7lGkenFTssZE6uEf+ogLxHNQiXrB7gm7CcbVBWB+9bah8s9gWN8izAUdfzK4ZK85Ul4EDgdbYyxqjfGuzYtyDU5HFr0Khb5X5Pw9JCkDtqoXgdS5AU+21PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8+Qw3ZE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8+Qw3ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752569441; x=1784105441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHm/eFSTInEg5D7Zs1fZPhoNNLhZJT1F2q/4x0jpdwY=;
  b=m8+Qw3ZE2jwml1HLPWMf/S54dmgNK42/GZ1OfJ2m1KFjvMb8Xkva9ZC9
   SUJRVB9+czRdTFfB+KTysAmEYjIWtiUoTbzMBDEDqQ/GWrHQMJTcmL3mt
   FgoYkZlT6cCwz5Cj8rWOf9hJnjHX4wJZOxdKoAd8uckwg9uxx8SLG6tMO
   K41SkheuKKejTFAtYS57U2Xd2/k8pJmH7twrVIvh40JAtjIbWK/WPfRou
   LQYT7kKHJMZIjIHDHyTdTOzzGmPC92WZngj+oPquZc0zqes+WQ5z3PCs5
   qKGVDUawXFRnitMJYL19kN2WO+lbD0Knn3ufea1qMCM1BilgpiCv/gUql
   A==;
X-CSE-ConnectionGUID: OpySIpi2TJeTZsLZTc3lqA==
X-CSE-MsgGUID: /QmbP/adR4eSBL1cy31VAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58435441"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58435441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:50:40 -0700
X-CSE-ConnectionGUID: rKVLyZJQQ+WFUr1xGK5aGQ==
X-CSE-MsgGUID: mGsEpOk8Sga0IrLDpim/WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161190192"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2025 01:50:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubbMz-0009sp-0I;
	Tue, 15 Jul 2025 08:50:37 +0000
Date: Tue, 15 Jul 2025 16:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('mdio',
 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth',
 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config',...
Message-ID: <202507151616.4RLdufpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   b64c8a8cf865a837d7b16f8d32f56de627f77976
commit: 120ab6c06f69b39e54c949542fa85fd49ff51278 [36/36] arm64: dts: qcom: sa8775p-ride: enable ethernet0
config: arm64-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250715/202507151616.4RLdufpS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 3deed4211a46632a25b1b558b357273a5ce4ee96)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151616.4RLdufpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151616.4RLdufpS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
