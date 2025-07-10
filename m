Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605F4A3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752167799; cv=none; b=tJGiw00vXVoAu4WbzHTk+ZMVxHJLUqZLnkmFXti05s57f4W1yiGgYpyle6QLP15+0kVUODUG7KczN361OQdTwGwB7w3RBjuLuC6qmZl933/dPJsxjC0evkuQ1oUkhsRhY6wS3+jDpSstAESYM0PQwpM+0pMwuyfm6x2ZSgH/DLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752167799; c=relaxed/simple;
	bh=cbr8E3jm51fQ5qYgcIH2G6FwehgTdiN7zyDXdaaXs3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YwdxDyDR9XXw8isklIWjZxtvBqARPzNht3S98uEaXUU3+8u8McUlfaFYDWro3zv/SUmxCxokSUmVGZXntsQ8ut4lvH3cQf6AVkpDXFIlvaRDR90UyiOEcYPRgqndzPVm4Rx61hcQG4mBbNw1WYFyQmymAeZ8Vc0mDJqyotI23KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flZ1Rulu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flZ1Rulu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752167798; x=1783703798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbr8E3jm51fQ5qYgcIH2G6FwehgTdiN7zyDXdaaXs3Y=;
  b=flZ1Rulun/ifRG3A9XOnb4/B4YpO4tGSZ0jSe5ILOhj9OvZtHd9gVTHa
   TyegjeVYkE5a8LwHL23arIeS8+C2+q1F0EfHwy5vPX2Q6o92nyEqQXxIL
   7UxgKk8PQfzPDX48N9izRBMgUPK3rIbJzpo+8IpHGHN/i4wr8+GsN3Kv7
   5hPdoQ2aw9Q0e6QMp08xq2hz52WaJw8zSmB2L/byUJMN05mm/mXTO40bT
   h6O3xlwPvmG0brkZGcQXR+V2S4ECZNHdwFaoOrK455/x+auKcYvYP5I5o
   J7/inqEy+G8f5BJmdgvlX8XZWzfMh7kh2WO1XuP9Jw6O7V6p/KnedByvR
   w==;
X-CSE-ConnectionGUID: IHYXcu48RYCJFan0D2g6tA==
X-CSE-MsgGUID: 9c5g+5OES9yVBb7lPauRgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54550886"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="54550886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 10:16:37 -0700
X-CSE-ConnectionGUID: 5fa7LTlSRJ6HKKhl922UXg==
X-CSE-MsgGUID: j8j/DWMAQ4WX50jpUda+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="155778911"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jul 2025 10:16:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZusr-0005H9-1w;
	Thu, 10 Jul 2025 17:16:33 +0000
Date: Fri, 11 Jul 2025 01:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('mdio',
 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth',
 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config',...
Message-ID: <202507110140.N2atiyUy-lkp@intel.com>
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
config: arm64-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250711/202507110140.N2atiyUy-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 3deed4211a46632a25b1b558b357273a5ce4ee96)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110140.N2atiyUy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110140.N2atiyUy-lkp@intel.com/

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
