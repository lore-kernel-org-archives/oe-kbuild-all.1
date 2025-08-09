Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067CE21CC55
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754764177; cv=none; b=Nh++O6XnbyunlelEeYsBGYaXFIiX7rzie9I0q8eusK/qCrQRtsetrEYSJlScX5VK2voBCGPMmzH4FLEI9LWGnkry5QYr1BvBDErMNSa/vkQ2VMPgFYIiwjxt5H9rvZ/kLHBS8LyVajhNpJI6AfLdgZh0zJTS2p1vLjWoM+cpOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754764177; c=relaxed/simple;
	bh=A27DwkfBTmZLXH7cp4awk20HtDvmeAn+fmBUXgedoAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCniv7tplpmxfzQt3zx0YTmRxPhcGQVYkjZQTKEtNbahD6aW2P292tv+rHuMD43hao2cvRzIu0JH9BZLFsI7yLxTkaN9QvoNah25q/AWfsWR6A00x5jrxlCGwNIJcf+ctwBtmbSTGhhGxiPI3pJ0l5B9Hri8cRLcF1pqhHLlfGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkpG4ZCB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkpG4ZCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754764176; x=1786300176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A27DwkfBTmZLXH7cp4awk20HtDvmeAn+fmBUXgedoAM=;
  b=bkpG4ZCB7iTlJxwvHy0vIRnZUNZMhwJRpkr3egMnDiahDYaJtRPEp5/L
   omgPbDVp5Leyc57r4dRyUfHX4i6ZIZNQZAY2ps4ut4DmZILWG0Y7kpUPr
   5/na3KdH38g7OwTQfXcjd72BDwDIG7MZ7JMMtxk/83704Inih8Qpb599W
   jTRxb0Jvv/3eKRnjycdjAUjyvDsac7iXbR35OOgIdpp25YHUtJr7myWU2
   WmrdfauR4Zj+97slBTRfkeNHpkGlryvymVLwh+zNqDdpSj612Hx2gOyuQ
   DveXY8b5kv7npMkc3w9S473VeHVHHqCyVRkbpxBi59kIkDIwn/UvClEyO
   g==;
X-CSE-ConnectionGUID: xpN/U1sNTFmUUzP5Ns3fiA==
X-CSE-MsgGUID: eUIqkttxT52tsQwzgIqLsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57038933"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57038933"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 11:29:36 -0700
X-CSE-ConnectionGUID: M7BlC/tkQJ+P8odu8eDqEA==
X-CSE-MsgGUID: YI1XhZT3SFmmtHcFblItyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196551180"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2025 11:29:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukoJG-0004zw-1s;
	Sat, 09 Aug 2025 18:29:00 +0000
Date: Sun, 10 Aug 2025 02:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: arch/mips/boot/dts/xilfpga/nexys4ddr.dtb:
 interrupt-controller@10200000 (xlnx,xps-intc-1.00.a): #interrupt-cells: 2
 was expected
Message-ID: <202508100230.lbLbquJt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   561c80369df0733ba0574882a1635287b20f9de2
commit: 7ce3c2713b45e349468fd5f9166f376ad9a361e3 dt-bindings: interrupt-controller: Add missing Xilinx INTC binding
date:   2 weeks ago
config: mips-randconfig-052-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100230.lbLbquJt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100230.lbLbquJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508100230.lbLbquJt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/xilfpga/nexys4ddr.dts:17.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   xlnx,rx-ping-pong: size (4) error for type flag
   xlnx,tx-ping-pong: size (4) error for type flag
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: /: failed to match any schema with compatible: ['digilent,nexys4ddr']
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: / (digilent,nexys4ddr): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: / (digilent,nexys4ddr): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: interrupt-controller@10200000 (xlnx,xps-intc-1.00.a): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/xlnx,intc.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: gpio@10600000 (xlnx,xps-gpio-1.00.a): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: gpio@10600000 (xlnx,xps-gpio-1.00.a): Unevaluated properties are not allowed ('#gpio-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): 'device_type', 'mdio', 'xlnx,duplex', 'xlnx,include-global-buffers', 'xlnx,include-internal-loopback', 'xlnx,include-mdio', 'xlnx,instance', 'xlnx,s-axi-id-width', 'xlnx,use-internal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,rx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml#
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,tx-ping-pong: 1 is not of type 'boolean'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
