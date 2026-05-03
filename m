Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20F188596
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777776857; cv=none; b=rxqx46te/tXWV5IM7qm9W6hAVSX9xKfclp5krJlavAkQmNf2534AEmV0I5hZ/F67ZdTwzTkM5FKhW8GRqDOjPcQYHVyNe9P8Fs6FBce3rQS9kCYKGCF5AYmFUmMC3DlEH3/LIeb8eSnbgo/uVFheKoqLXkMy0v2Rp/1Dv2GL8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777776857; c=relaxed/simple;
	bh=UoevCn+LRaMev6ezvPwPs9UAvj9rIEZYLPDkjEh/s+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AoKCDN8HEdbakS22osdQZDwzNRZyFd4mzvAWSMVk5Rwnv9dK94luZct37dX+7imQ7inv/QJOUc8dD11KIJrbVjnpYg22uRWJtKzap282j+bgWhzjtSKXHI9P6aPJqx/CW2zvHpHgBhRay/M50+LKWAPBwULb3qaOVHtOnFy78Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT0Vwo2V; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT0Vwo2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777776855; x=1809312855;
  h=date:from:to:cc:subject:message-id;
  bh=UoevCn+LRaMev6ezvPwPs9UAvj9rIEZYLPDkjEh/s+8=;
  b=AT0Vwo2V77P/PYtvPMDuVGg4isU1IXH8mOxxZu6UeZn2uYro+SrOfuSN
   dE+CvUi4kj9GRH6qtFF+SEbJTz2OXra1DTMi/CVCiC5tCEefXfF6/7arZ
   yvnFj3Ur2OQ7C9GONbh0+PpWSEaLCimoUbWLytAD6SivGpI/Os2PfElSs
   luxNWnjjEs/lzLAmkkmiEIr2G8bgbhs/qw/MQIcROfozdHpPvMoCxN3G0
   DVhIIdOB9XNtB2NjKiA+grErqNPacAq+bwxzRruXBa2urfuF3+Neuw9fp
   wvyL8g5bvW8n2aLoxAglcKR/ESfhBiGYt6WNFHkWuHqeVgUCLg7By51Z7
   w==;
X-CSE-ConnectionGUID: qGgOPmmlRhiXJGNeD6xgIw==
X-CSE-MsgGUID: XUw744fwTt+K3yPiklpTIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77846080"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77846080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 19:54:14 -0700
X-CSE-ConnectionGUID: bGLlSS+uQIK8JFM/btc0Gg==
X-CSE-MsgGUID: KRwwK/C2Rv2n5bzkKMb66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="234332098"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 May 2026 19:54:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJMyA-000000005RN-1tMd;
	Sun, 03 May 2026 02:54:10 +0000
Date: Sun, 03 May 2026 04:53:15 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 118/147]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000
 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is
 not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0',
 'net_wo1_uart_txd_1', 'ne...
Message-ID: <202605030407.dEy79FZ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   445521c1e8057d80bfd079aa69ad69ba0a9293b3
commit: 0f1d88093e9361840ece6a323b08a0d70641f1d8 [118/147] arm64: dts: mediatek: mt7988-bpi-r4: add uart1 / uart2
config: arm64-randconfig-2052-20260502 (https://download.01.org/0day-ci/archive/20260503/202605030407.dEy79FZ0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030407.dEy79FZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030407.dEy79FZ0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
