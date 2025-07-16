Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE6366
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 06:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646596; cv=none; b=lLztjpNxkLBEeMPeFbLywXD0Z8G3SpkW1ebepCDEN6S04lGqxE+2h03ps62AV1z4DGIXr7BBg64vT6VHgesOO1DUd5SaRRcIrjj5Wel2Crj9512+BzsL1SVBsD1so0cups6K2lcWWV6CAZiKS594fR80CLCRK+2dw1JG+ZLFB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646596; c=relaxed/simple;
	bh=H30ttSgHLbHIkgI8tJB+qlj5a8nFJK+OkozgNM3Bqrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zi4MiCDUxS7VApZ35BzHoMv5oChHBDLDgnHp1o4GgvziHKb1MIraHhs5OmcU4u458JAreOGgIjHG/2ya2ipaUEhvPBGX8wiXzi2Dyv6DX6uYtvcsqA4Nl14l+Pef41/zApqQRSN82D5XPxu7IDyIQ7KDfus8q8W2UPmDdvf+Tkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlbxWGyr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlbxWGyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752646595; x=1784182595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H30ttSgHLbHIkgI8tJB+qlj5a8nFJK+OkozgNM3Bqrg=;
  b=GlbxWGyrZY2THaFwsG+mWeJbLG/tlUFLq9CCFh+WSiNatu3gQ2D2PYPL
   LRAJ3JnD5LyhWKb9HDOGvdnmIvTA4iLWnNQxzgSvd3Foeqeg8uYdxywmw
   +BUwAtGfYSoIin7rXF6EVMQOKnS7nYPRe9rmgxShX5x2nnkSH6kqfWD1y
   cmqLXNf5KfMngAToXBNCfFyvLu0X/IV9baEXxonj7XNOG7ijVX2+715NR
   uJ4+Z0PYMjMOnDlaa+XDqxPgLw95AM3Fs9ebXg5JJaJuLqGibNnI7Z8WQ
   woIoZxLdZGM5gJlr6sR50xLZJRIIKmGBq5fuucPeV+UWVlTwA2oRIwFqS
   w==;
X-CSE-ConnectionGUID: 2DaLIu0dRrqrdqmm+8+qTg==
X-CSE-MsgGUID: cSfrbE8TStKlsFWgad0mRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55030081"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="55030081"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:16:35 -0700
X-CSE-ConnectionGUID: iKQRZQcLQpuDX09CEqay5g==
X-CSE-MsgGUID: QXH6xHMATGegFBYUfTjXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157767217"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2025 23:16:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubvRP-000Bzk-37;
	Wed, 16 Jul 2025 06:16:31 +0000
Date: Wed, 16 Jul 2025 14:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('phy-handle',
 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config',
 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,p...
Message-ID: <202507161457.x4VNuHUR-lkp@intel.com>
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
commit: 27eb552ef585c9852d1d04afde9fde34f8b69dc2 [36/36] arm64: dts: qcom: sa8775p-ride: enable EMAC1
config: arm64-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250716/202507161457.x4VNuHUR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 3deed4211a46632a25b1b558b357273a5ce4ee96)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161457.x4VNuHUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161457.x4VNuHUR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
