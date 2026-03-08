Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C6B1A23AC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772967742; cv=none; b=A6/cbJW+eOCVMOsvbnNWjcqK6+pdVqrqI5DAFiUSL84YNgjZPOEY6gIjTjc7mqupmfQspzLYqdwibJgF/ZQCHaF1fwbDcoJZqRkIfQ/J+QwtL6nBjHCJx7tIXfUkAPuvmyY/4yS3c4LWQK+Dy2LP6Pv5W3zeEVbdBW57gKeq9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772967742; c=relaxed/simple;
	bh=dSDYX/QdbPZ0kQu8Sujem/cMJjIx8bsdGpUxIMBPdR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IaDxewMwuwKXshg2SapMir0o3UBRqAQ3RCjCb5ngoZ4bpqo8w8d1LLwq3rWPIVxupiKXqaAaVX/2oly70Fd0+eEjQrthk5Veo6J3v8w3zeabBD2h9x8w7IRhaIX/cfsywv0ZuXXQ7A7LUs9n6rnH3SkVzoWn0tqJHnuu0HT4xtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+Wmty6P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+Wmty6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772967740; x=1804503740;
  h=date:from:to:cc:subject:message-id;
  bh=dSDYX/QdbPZ0kQu8Sujem/cMJjIx8bsdGpUxIMBPdR0=;
  b=K+Wmty6PwSxXO4Mz4XxT4qY/3t8tPkrycYgf01T+gQ+s6C0bplaoVrFR
   3YxGPjwAJCgOGtp/LaN9SfNNR9V5QRDShnNHkeZFx242+Wp7xlo3NNYu7
   coWJmOXTbkLyptb7zMqcCz+PB2i9nD63rfARZiUbuV7oW8tucJpTNkbBt
   R9KfHly5+Zj4ZAkXRQ5HEPNBj2wxnIZ5mi903d+eamNvgALdSQB7PkMTc
   O2/grwpwHsusmDyIwnaAq/l+nALP1wS8pnT+VrJdLiP9OS8e/Hacnz0D7
   dJ/Cn0RhbSsdbWaemVg6Xp5BhzW28NL63m3bnjQXrlMniiAngGsfqKx4t
   A==;
X-CSE-ConnectionGUID: VbXOURtCT3i9O+X1/07ErA==
X-CSE-MsgGUID: ZtCdL4qiTISvju3Enz4rvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85368241"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85368241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:02:20 -0700
X-CSE-ConnectionGUID: E9Y4mryLT7G604keW8OGyQ==
X-CSE-MsgGUID: Vkq6gNWkRL6UyXFRZiQF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="218671963"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2026 04:02:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBto-000000002ev-1E20;
	Sun, 08 Mar 2026 11:02:16 +0000
Date: Sun, 08 Mar 2026 12:01:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed
 ('interconnect-names', 'interconnects' were unexpected)
Message-ID: <202603081142.PfVXONOh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 71ee90ed1756724d62cb55873555e006372792c7 [3/3] arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260308/202603081142.PfVXONOh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081142.PfVXONOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081142.PfVXONOh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clocks: [[56, 70], [56, 68], [56, 94], [56, 72], [56, 74], [56, 77]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clocks: [[56, 84], [56, 82], [56, 94], [56, 86], [56, 88], [56, 91]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
