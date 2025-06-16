Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450A2BEFE1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096964; cv=none; b=CxuzNtViqwH9020ZI0aA5oORytYWroFCnQ0fiKIayBNtj+5h/HUqjLl6OCe/8JeaajhyqSQcEwhtSD8i+9NaX66fH3nPCRs0Md5IemlKRCUm6wqJgucyWOS5j2unWzn0U4ae7fkKk6yc4hdwjzsFyJW42iGklJh5Psm4zvB0DHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096964; c=relaxed/simple;
	bh=IE5dKhhKzNUxYm1X8y9UsSSsyeyOi21cohXekYwwkqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=StHDxFRujWeaW8IbYlqFe/EwC4YOueZs940vyfsCIpwijPCXJJmGsFYY7HIuKVB132nHzUpUT31xqPABv86sqmtDwOYcLxMVOfoRQeAkXsPnG89EKF7Tt9TS+HsBNUe2tDu1Jyqu1ilER64BkZ4iqaGWfeS1LedV8eu4f2hn0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X25fC6Em; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X25fC6Em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750096963; x=1781632963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IE5dKhhKzNUxYm1X8y9UsSSsyeyOi21cohXekYwwkqs=;
  b=X25fC6EmNeZo/ILc9mAGJDSLh0YTZvhpAobEZJBXTiLdx7w5QCXtnD9l
   51OIU211Ylsm7nA8IcxEUc+KgjIZ8KRzVJz7GUQzaqoXrHsUsDA10zfC4
   vVU0SNvGI3pPDEXG/mNQTzeQPe+q5bKnOPkcDxtH2lajgFeXT+bUEHkBs
   vuxq6d/mCQF+O6kFmGojDqsVV3dw4g00X5LnPUzkAwbB0JpGrXf61Okai
   3gViegujiQR40Jt0kEUEZfkTL45s9THAq1mNXad+xnItQEUyLrZt5UU99
   AzLd+xKJakAa32PyvBV9goOOsjxKWjzUVtdSlHhtTKPatWCaFEahVCUqr
   g==;
X-CSE-ConnectionGUID: lNGb0O8mRPuNKtwG4urONw==
X-CSE-MsgGUID: CC3YfPLBQIKiUPHXfAwZGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52338889"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52338889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:02:42 -0700
X-CSE-ConnectionGUID: mkD1U+V2Qy6O6BOId41Zzw==
X-CSE-MsgGUID: YjswnBmfTsyTgET2NexgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179528092"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2025 11:02:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uREAJ-000FEm-07;
	Mon, 16 Jun 2025 18:02:39 +0000
Date: Tue, 17 Jun 2025 02:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1867/2828]
 arch/nios2/boot/dts/3c120_devboard.dtb: serial@4c80 (altr,uart-1.0):
 Unevaluated properties are not allowed ('current-speed', 'interrupt-parent',
 'interrupts', 'reg' were unexpected)
Message-ID: <202506170106.WaUYeqq6-lkp@intel.com>
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
commit: f75794b6077ec729f57de9a1ad24f14d288a68bb [1867/2828] dt-bindings: serial: Convert altr,uart-1.0 to DT schema
config: nios2-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170106.WaUYeqq6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170106.WaUYeqq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170106.WaUYeqq6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/nios2/boot/dts/3c120_devboard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['altr,nios2-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
   arch/nios2/boot/dts/3c120_devboard.dtb: bridge@8000000 (simple-bus): $nodename:0: 'bridge@8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@400000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@8000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: serial@4d50 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml#
>> arch/nios2/boot/dts/3c120_devboard.dtb: serial@4c80 (altr,uart-1.0): Unevaluated properties are not allowed ('current-speed', 'interrupt-parent', 'interrupts', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/altr,uart-1.0.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
