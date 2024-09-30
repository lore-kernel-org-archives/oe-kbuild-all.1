Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BB1CFA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708960; cv=none; b=mSqF8X1E06mpMvUt3r+e4XmEqXmk3zr4nY1jAjVsflkD55EL8woWcMS54oxzJzbOLNV2gJ8/FuSc/y17IiCzoKQ9dpZNcqVUMWboQM3K2z9IjqPK4MSKwe6qxTwl9fFl0Zesel9SyOVk7WXogBDJULNhZ0AbItBKXw3A9VlPM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708960; c=relaxed/simple;
	bh=EtRlOroVjiBX2vffHANcYFh9sMO1N8HEiD/JKgTWXbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hftzkOdn/3tTBIBgYqqh1KwqK0TWtnXP4ns1Vrs1QHMCa8DRwhiANyZDlQwUgCrIXnEbJ9bEOig8wMM95fb3PqOhFi+TH/P3CaAWGacTxwpgnlhdVtnMocnIgpDgRNQYbSiOdKVlJMoxO4RqR1XBveHppWgVuGwqL87g+Nmu5kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ekr9bim9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ekr9bim9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727708959; x=1759244959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtRlOroVjiBX2vffHANcYFh9sMO1N8HEiD/JKgTWXbQ=;
  b=Ekr9bim9o+aHgULKHBzbD6Alh5DuJO+OJnU5+jHY+SXbaxow8fE7Kv1d
   gz6wyRm868JCS5HHsYksSSOth5tOQNx5tnlniJxBaIIbjYewex+3KeXEx
   bw+5PFsPQAJvJBvz/C6KMcCQwBZOPSzm7gD1sO7AvLNiUSMRzsJpYKNxB
   /Ie2kYrjgnC7lEYp3TpLVaxjyNY4UT7HjkM470oFR9N3nFvBoRnNkhhHZ
   dABE8bCc35U5mD2EKt2ISovVymsNOf8y+LRZqMi4WEovjwtjr050o/rXN
   HQAgChJPdr1mfjCVnyTo37Ua5tkudZYhS7zZwezJGuyKGcFZeqTNpUM1p
   w==;
X-CSE-ConnectionGUID: fOHUGqr3TyW7jRa09Ju82A==
X-CSE-MsgGUID: KWeQZ3BfTjempXdvtFxeLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26981398"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="26981398"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 08:09:18 -0700
X-CSE-ConnectionGUID: g22Y45+uQaKN3H2JmRH7dQ==
X-CSE-MsgGUID: KP/B5Cl8RQO233tjvbwAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="78082487"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2024 08:09:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svI1T-000PZS-0B;
	Mon, 30 Sep 2024 15:09:15 +0000
Date: Mon, 30 Sep 2024 23:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 876/966]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning
 (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has
 single child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202409302225.tdLrxapj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 32578217ee63eb5e33832ba6f821ad7510ba078a [876/966] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409302225.tdLrxapj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302225.tdLrxapj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302225.tdLrxapj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
