Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5F2820AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095642; cv=none; b=j69yqe4KgtB7yN9W1mtQH+Fcl1TuEFrVJAaR1d0fF5zYCSvJZD9kytAlzQo/damwwT4MYZx1ha1ZnUR025VTWj7cg6E7ln4CQ/JxHlgcJPXdIS1EFRmynax53x1yXwHhJxcmju+GDxcgfMe6sBXQAv31zH/LGy7wZ6Kw763ELvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095642; c=relaxed/simple;
	bh=LbkfP5Bd/5UM8IUxg/VZj9uOY/6cK5iEjqviX1HJq2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/dE1EbW2RfjsF6kPF82zaihbmReu/KVTwA8BcgQYqf+jzTaMT8IBCA5ak5Cx6DgzJhUy+9M2NpU/wMuzbTkij04CllMH9DN46ZYl96KFr3tTp8Qt3NISPa99aFgLTMf2rll4sb0ecIZaRCewYNY/q8skefoC6v4bDdZZ9Twkrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYXAAyta; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYXAAyta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750095641; x=1781631641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LbkfP5Bd/5UM8IUxg/VZj9uOY/6cK5iEjqviX1HJq2E=;
  b=UYXAAyta1vPJLihLkO+YHroqHTQW34xK9xBIg1yztwsQbfn9oYR/ypVA
   Nqgw0oZv0BLh4eeDw58cKS8G/zqFLusaPC4twxF2pgBZ8vT9YMprcF601
   za+LXs1wuKgPJbF2GnQBRvu0qj/KEKaIi7/kWJTVa/uUOh7m1wuBHvf1m
   ZwF6rfv/d9wLT43a5RRUbJhggRt9dKL2VVFT3d9h3nuCBS9hL5dKRfjZW
   2sGJ9t8CHPq8trYi4frfE96EwbHOmk2YR1OUQiqppXL1BFpzMTJ6J9KdB
   dUKCUekBGRxejUSOigASDB65mqX/8Y4tEfBO9fW5igrhDumRrr9OZ3eRT
   A==;
X-CSE-ConnectionGUID: kMPxqLZkS02CfJRYVlEw9g==
X-CSE-MsgGUID: M+NXEUPpQwSDBWVhyf8pbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62520758"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="62520758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 10:40:40 -0700
X-CSE-ConnectionGUID: XJJGtaZeTnWwEszJU3qxeA==
X-CSE-MsgGUID: 2mN1K21qReOom9H6vT/TYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="149072348"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2025 10:40:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRDoy-000FDo-39;
	Mon, 16 Jun 2025 17:40:36 +0000
Date: Tue, 17 Jun 2025 01:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1866/2828]
 arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001530 (altr,juart-1.0):
 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202506170136.TT6okg6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   050f8ad7b58d9079455af171ac279c4b9b828c11
commit: ed2a6ff0234e21cd5e56b63d8bff80120bbe5f15 [1866/2828] dt-bindings: serial: Convert altr,juart-1.0 to DT schema
config: nios2-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170136.TT6okg6z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170136.TT6okg6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170136.TT6okg6z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): clock@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
>> arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001530 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001600 (altr,16550-FIFO32): auto-flow-control: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001600 (altr,16550-FIFO32): Unevaluated properties are not allowed ('auto-flow-control' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/sysid@18001528: failed to match any schema with compatible: ['altr,sysid-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:2: 'tx_csr' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
--
   arch/nios2/boot/dts/3c120_devboard.dts:46.11-50.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /sopc@0)
   arch/nios2/boot/dts/3c120_devboard.dtb: /: failed to match any schema with compatible: ['altr,qsys_ghrd_3c120']
   arch/nios2/boot/dts/3c120_devboard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['altr,nios2-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
   arch/nios2/boot/dts/3c120_devboard.dtb: bridge@8000000 (simple-bus): $nodename:0: 'bridge@8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@400000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@8000: failed to match any schema with compatible: ['altr,timer-1.0']
>> arch/nios2/boot/dts/3c120_devboard.dtb: serial@4d50 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/serial@4c80: failed to match any schema with compatible: ['altr,uart-1.0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
