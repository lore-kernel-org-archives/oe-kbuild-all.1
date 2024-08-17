Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C1646
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 02:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723862849; cv=none; b=IPpQ242/jHYQU5+3lPN7BJGtaUsK0xGK5DdeIosybnCofHNSqtQVai44UfYvU8WSH2+6nGwuVFUVmJ2A8BaajyVrgU3uOGzmGhw39545HtR1+JDCbTzzg1YnnSUzRv9JgQMDI0ZzEOyB9JOq7FjMhbZMZZlXTZQyqqOmjLy56gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723862849; c=relaxed/simple;
	bh=G0inHfACKzzSDcVJuV5zunnJ/rye1z+ZiBRMuiLZjRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ItCRSnPyw5eWMHlREXecy30j+dSb/KFYtVmJ35kmbz9hxlQaq30s26EQXeA9BH5lW7dl8X/DIeNfoLERSeUqEApWUctXeL3qIa2Kc4jOLMOsclfCIce/w/h/PJ3OsIIcyaeuzNxe4tKWQrLod/OCMEOiTcZrpWZVKb5Ox2tNS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lhs2nJvM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lhs2nJvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723862848; x=1755398848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0inHfACKzzSDcVJuV5zunnJ/rye1z+ZiBRMuiLZjRw=;
  b=Lhs2nJvMjYsyUa2PoprM+asN0NSe/gQBTxrjQKVcM73A0LYU7nsfRAmQ
   3Fyj3V/W+dphvr2jtMgO9F+2BkDOpCOhn1xxX7hNyIQKOvC03uRATL7or
   m7MhjRsBsCtj12YPyMh7VOxifaV5uvKjEfPLdsy/2RZ7WjpZr9+CgR1ky
   6H2Ez6tXhO7ML4fWAD8YUrO98EpH90X5iJW1bhEDyKKJ7TydFlac3gYyh
   +XFJivEkjRh5ka1QSm0gOMus24cgfbpG5s1TfEH4PT5x6kgD4cYzoaxPh
   RHZ3NcKh3Yw0WovGY4+4cH1fb/MqoVP4aLkNDWQIk9ozP89A1ISRhgzdj
   g==;
X-CSE-ConnectionGUID: UJJ1zHyzTh+Q7uTXKTbRuQ==
X-CSE-MsgGUID: gYlwvMxoSymgH4zCHTGCcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25964945"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="25964945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 19:47:26 -0700
X-CSE-ConnectionGUID: CSGUPANdQgii5bburgsArg==
X-CSE-MsgGUID: Xw4qOneJRB+S/cnoZVkLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="90612557"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2024 19:47:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf9TO-00077q-0O;
	Sat, 17 Aug 2024 02:47:22 +0000
Date: Sat, 17 Aug 2024 10:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 4789/5190]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:
 Unevaluated properties are not allowed ('fastrpc' was unexpected)
Message-ID: <202408171022.7A5t36eW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   367b5c3d53e57d51a5878816804652963da90950
commit: 2bec6f6a22815c6a5651d2b9aa4f54baf1ae5e73 [4789/5190] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
config: arm64-randconfig-052-20240816 (https://download.01.org/0day-ci/archive/20240817/202408171022.7A5t36eW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171022.7A5t36eW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171022.7A5t36eW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@9:iommus: [[35, 10569, 1184], [35, 10601, 1184], [35, 10633, 1024], [35, 10697, 1184], [35, 10729, 1184], [35, 11593, 1184], [35, 11625, 1184], [35, 11657, 1024], [35, 11721, 1184], [35, 11753, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@10:iommus: [[35, 10570, 1184], [35, 10602, 1184], [35, 10634, 1024], [35, 10698, 1184], [35, 10730, 1184], [35, 11594, 1184], [35, 11626, 1184], [35, 11658, 1024], [35, 11722, 1184], [35, 11754, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@11:iommus: [[35, 10571, 1184], [35, 10603, 1184], [35, 10635, 1024], [35, 10699, 1184], [35, 10731, 1184], [35, 11595, 1184], [35, 11627, 1184], [35, 11659, 1024], [35, 11723, 1184], [35, 11755, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@12:iommus: [[35, 10572, 1184], [35, 10604, 1184], [35, 10636, 1024], [35, 10700, 1184], [35, 10732, 1184], [35, 11596, 1184], [35, 11628, 1184], [35, 11660, 1024], [35, 11724, 1184], [35, 11756, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@13:iommus: [[35, 10573, 1184], [35, 10605, 1184], [35, 10637, 1024], [35, 10701, 1184], [35, 10733, 1184], [35, 11597, 1184], [35, 11629, 1184], [35, 11661, 1024], [35, 11725, 1184], [35, 11757, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024], [35, 11713, 1184], [35, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@2:iommus: [[35, 10562, 1184], [35, 10594, 1184], [35, 10626, 1024], [35, 10690, 1184], [35, 10722, 1184], [35, 11586, 1184], [35, 11618, 1184], [35, 11650, 1024], [35, 11714, 1184], [35, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@3:iommus: [[35, 10563, 1184], [35, 10595, 1184], [35, 10627, 1024], [35, 10691, 1184], [35, 10723, 1184], [35, 11587, 1184], [35, 11619, 1184], [35, 11651, 1024], [35, 11715, 1184], [35, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@4:iommus: [[35, 10564, 1184], [35, 10596, 1184], [35, 10628, 1024], [35, 10692, 1184], [35, 10724, 1184], [35, 11588, 1184], [35, 11620, 1184], [35, 11652, 1024], [35, 11716, 1184], [35, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@5:iommus: [[35, 10565, 1184], [35, 10597, 1184], [35, 10629, 1024], [35, 10693, 1184], [35, 10725, 1184], [35, 11589, 1184], [35, 11621, 1184], [35, 11653, 1024], [35, 11717, 1184], [35, 11749, 1184]] is too long
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@9:iommus: [[35, 10569, 1184], [35, 10601, 1184], [35, 10633, 1024], [35, 10697, 1184], [35, 10729, 1184], [35, 11593, 1184], [35, 11625, 1184], [35, 11657, 1024], [35, 11721, 1184], [35, 11753, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@10:iommus: [[35, 10570, 1184], [35, 10602, 1184], [35, 10634, 1024], [35, 10698, 1184], [35, 10730, 1184], [35, 11594, 1184], [35, 11626, 1184], [35, 11658, 1024], [35, 11722, 1184], [35, 11754, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@11:iommus: [[35, 10571, 1184], [35, 10603, 1184], [35, 10635, 1024], [35, 10699, 1184], [35, 10731, 1184], [35, 11595, 1184], [35, 11627, 1184], [35, 11659, 1024], [35, 11723, 1184], [35, 11755, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@12:iommus: [[35, 10572, 1184], [35, 10604, 1184], [35, 10636, 1024], [35, 10700, 1184], [35, 10732, 1184], [35, 11596, 1184], [35, 11628, 1184], [35, 11660, 1024], [35, 11724, 1184], [35, 11756, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@13:iommus: [[35, 10573, 1184], [35, 10605, 1184], [35, 10637, 1024], [35, 10701, 1184], [35, 10733, 1184], [35, 11597, 1184], [35, 11629, 1184], [35, 11661, 1024], [35, 11725, 1184], [35, 11757, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024], [35, 11713, 1184], [35, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@2:iommus: [[35, 10562, 1184], [35, 10594, 1184], [35, 10626, 1024], [35, 10690, 1184], [35, 10722, 1184], [35, 11586, 1184], [35, 11618, 1184], [35, 11650, 1024], [35, 11714, 1184], [35, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@3:iommus: [[35, 10563, 1184], [35, 10595, 1184], [35, 10627, 1024], [35, 10691, 1184], [35, 10723, 1184], [35, 11587, 1184], [35, 11619, 1184], [35, 11651, 1024], [35, 11715, 1184], [35, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@4:iommus: [[35, 10564, 1184], [35, 10596, 1184], [35, 10628, 1024], [35, 10692, 1184], [35, 10724, 1184], [35, 11588, 1184], [35, 11620, 1184], [35, 11652, 1024], [35, 11716, 1184], [35, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@5:iommus: [[35, 10565, 1184], [35, 10597, 1184], [35, 10629, 1024], [35, 10693, 1184], [35, 10725, 1184], [35, 11589, 1184], [35, 11621, 1184], [35, 11653, 1024], [35, 11717, 1184], [35, 11749, 1184]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
