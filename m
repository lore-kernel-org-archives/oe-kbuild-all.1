Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E320E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 22:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845802; cv=none; b=hdcna1/8n1eVZF2uepvhgcbipzxHSF62s9G15hPyRFALBvm4hESCz4BfNWQ0cO/fd8tItrs8IeQzpNsLBkgCKpRmSigKuKGa8xycmhF/MDo0eoqvID//iVJ4XWNdw0i/vREZKN43kcsymUORL5W7NqFXVq5HQtZqRn7bYaCnyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845802; c=relaxed/simple;
	bh=PmqaMgX/pniKMgxu40afF1xE3tcq0widiaKKXWFyR+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzE2LkfAnqaAF9SMoFiSn18JHRM0fkVm/kReSH1wwllyP2siQiP5L3v8nX9kKJC6f96YbN5i7UCSPa94VekOol/FX/aAaCYxYILvnDZv3PVks4akxW0xsV3a269hOKl6UqFcP+5K8DVflZq1T85XPGIgpw3ww5zt3KT2YBPCplw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6jBy5gN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6jBy5gN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723845800; x=1755381800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PmqaMgX/pniKMgxu40afF1xE3tcq0widiaKKXWFyR+Y=;
  b=X6jBy5gNkSG4oG8v6PCq6W1PvAU/QgIK0rIqnoALZkbE0+z6SQa/2hOW
   5Xy7Eu9tn7EBxx+GfCbI+HWvvdDqDb9mCUd+4c1LQgBAlcNB9aKeG9Lrr
   GwBAw8FRfTTvH7bD/mjpPGNg/iQtu3HE8/gTI4C82r8zo/yBwwxjKuelB
   DnFBplDrWOb67QM79qfWSfGQQk0b17bG1E1DhOJ33bx9NIDqTmEQoZJ57
   fSYgWhF0kWP3FU+HdvoXmADR8d/xL/b7Js5m7nJIypKHPNqvyYpLTGZmP
   0OwuxP7c/OwGrGT+lQdeqQT8KOvMmg12vLe7L/35f9tUwFFExV/Uqn0LP
   A==;
X-CSE-ConnectionGUID: vxA5d/CcRQ+iEn0ljtoCLw==
X-CSE-MsgGUID: fjcp3TpGRkeeDylF/dUmfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22297396"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="22297396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 15:03:20 -0700
X-CSE-ConnectionGUID: DJfOvRi1QPqXDV32DyfXlw==
X-CSE-MsgGUID: mGUjEAFjSLq0kE8sqKt0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="64461893"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2024 15:03:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf52Q-0006z4-1t;
	Fri, 16 Aug 2024 22:03:14 +0000
Date: Sat, 17 Aug 2024 06:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [linux-next:master 4788/5190]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000:
 glink-edge:fastrpc:compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593,
 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585,
 1184], [35, 11617, 1184], [35, 11649, 1024]...
Message-ID: <202408170533.HwV84hBp-lkp@intel.com>
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
commit: df54dcb34ff2eaabc5f74afbdb2fec104e2263e6 [4788/5190] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes
config: arm64-randconfig-052-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170533.HwV84hBp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170533.HwV84hBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170533.HwV84hBp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024], [35, 11713, 1184], [35, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@2:iommus: [[35, 10562, 1184], [35, 10594, 1184], [35, 10626, 1024], [35, 10690, 1184], [35, 10722, 1184], [35, 11586, 1184], [35, 11618, 1184], [35, 11650, 1024], [35, 11714, 1184], [35, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@3:iommus: [[35, 10563, 1184], [35, 10595, 1184], [35, 10627, 1024], [35, 10691, 1184], [35, 10723, 1184], [35, 11587, 1184], [35, 11619, 1184], [35, 11651, 1024], [35, 11715, 1184], [35, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@4:iommus: [[35, 10564, 1184], [35, 10596, 1184], [35, 10628, 1024], [35, 10692, 1184], [35, 10724, 1184], [35, 11588, 1184], [35, 11620, 1184], [35, 11652, 1024], [35, 11716, 1184], [35, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@5:iommus: [[35, 10565, 1184], [35, 10597, 1184], [35, 10629, 1024], [35, 10693, 1184], [35, 10725, 1184], [35, 11589, 1184], [35, 11621, 1184], [35, 11653, 1024], [35, 11717, 1184], [35, 11749, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@6:iommus: [[35, 10566, 1184], [35, 10598, 1184], [35, 10630, 1024], [35, 10694, 1184], [35, 10726, 1184], [35, 11590, 1184], [35, 11622, 1184], [35, 11654, 1024], [35, 11718, 1184], [35, 11750, 1184]] is too long
--
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
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024], [35, 11713, 1184], [35, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@2:iommus: [[35, 10562, 1184], [35, 10594, 1184], [35, 10626, 1024], [35, 10690, 1184], [35, 10722, 1184], [35, 11586, 1184], [35, 11618, 1184], [35, 11650, 1024], [35, 11714, 1184], [35, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@3:iommus: [[35, 10563, 1184], [35, 10595, 1184], [35, 10627, 1024], [35, 10691, 1184], [35, 10723, 1184], [35, 11587, 1184], [35, 11619, 1184], [35, 11651, 1024], [35, 11715, 1184], [35, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@4:iommus: [[35, 10564, 1184], [35, 10596, 1184], [35, 10628, 1024], [35, 10692, 1184], [35, 10724, 1184], [35, 11588, 1184], [35, 11620, 1184], [35, 11652, 1024], [35, 11716, 1184], [35, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@5:iommus: [[35, 10565, 1184], [35, 10597, 1184], [35, 10629, 1024], [35, 10693, 1184], [35, 10725, 1184], [35, 11589, 1184], [35, 11621, 1184], [35, 11653, 1024], [35, 11717, 1184], [35, 11749, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc: compute-cb@6:iommus: [[35, 10566, 1184], [35, 10598, 1184], [35, 10630, 1024], [35, 10694, 1184], [35, 10726, 1184], [35, 11590, 1184], [35, 11622, 1184], [35, 11654, 1024], [35, 11718, 1184], [35, 11750, 1184]] is too long
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024], [35, 11713, 1184], [35, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@2:iommus: [[35, 10562, 1184], [35, 10594, 1184], [35, 10626, 1024], [35, 10690, 1184], [35, 10722, 1184], [35, 11586, 1184], [35, 11618, 1184], [35, 11650, 1024], [35, 11714, 1184], [35, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@3:iommus: [[35, 10563, 1184], [35, 10595, 1184], [35, 10627, 1024], [35, 10691, 1184], [35, 10723, 1184], [35, 11587, 1184], [35, 11619, 1184], [35, 11651, 1024], [35, 11715, 1184], [35, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@4:iommus: [[35, 10564, 1184], [35, 10596, 1184], [35, 10628, 1024], [35, 10692, 1184], [35, 10724, 1184], [35, 11588, 1184], [35, 11620, 1184], [35, 11652, 1024], [35, 11716, 1184], [35, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@5:iommus: [[35, 10565, 1184], [35, 10597, 1184], [35, 10629, 1024], [35, 10693, 1184], [35, 10725, 1184], [35, 11589, 1184], [35, 11621, 1184], [35, 11653, 1024], [35, 11717, 1184], [35, 11749, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@2a300000: glink-edge:fastrpc:compute-cb@6:iommus: [[35, 10566, 1184], [35, 10598, 1184], [35, 10630, 1024], [35, 10694, 1184], [35, 10726, 1184], [35, 11590, 1184], [35, 11622, 1184], [35, 11654, 1024], [35, 11718, 1184], [35, 11750, 1184]] is too long
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
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@1:iommus: [[35, 10561, 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721, 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024], [35, 11713, 1184], [35, 11745, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@2:iommus: [[35, 10562, 1184], [35, 10594, 1184], [35, 10626, 1024], [35, 10690, 1184], [35, 10722, 1184], [35, 11586, 1184], [35, 11618, 1184], [35, 11650, 1024], [35, 11714, 1184], [35, 11746, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@3:iommus: [[35, 10563, 1184], [35, 10595, 1184], [35, 10627, 1024], [35, 10691, 1184], [35, 10723, 1184], [35, 11587, 1184], [35, 11619, 1184], [35, 11651, 1024], [35, 11715, 1184], [35, 11747, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@4:iommus: [[35, 10564, 1184], [35, 10596, 1184], [35, 10628, 1024], [35, 10692, 1184], [35, 10724, 1184], [35, 11588, 1184], [35, 11620, 1184], [35, 11652, 1024], [35, 11716, 1184], [35, 11748, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@5:iommus: [[35, 10565, 1184], [35, 10597, 1184], [35, 10629, 1024], [35, 10693, 1184], [35, 10725, 1184], [35, 11589, 1184], [35, 11621, 1184], [35, 11653, 1024], [35, 11717, 1184], [35, 11749, 1184]] is too long
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: fastrpc: compute-cb@6:iommus: [[35, 10566, 1184], [35, 10598, 1184], [35, 10630, 1024], [35, 10694, 1184], [35, 10726, 1184], [35, 11590, 1184], [35, 11622, 1184], [35, 11654, 1024], [35, 11718, 1184], [35, 11750, 1184]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
