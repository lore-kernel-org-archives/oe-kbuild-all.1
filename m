Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20901853
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695720; cv=none; b=touCD/p+yvMpOWPLtvgyRyGDhr7lccjzk3HzSPTzOVdx0a5T8AC+sq5T48tqaxLLijKDBu8BNTcJlihU8NfWH07+fpKvb980ZvGC/wHKmeyA3Qz9txHrYlwF5e3LDkMaBAArE4J5Y/pUiVia+CsH1D/Cx7OBdVzEc5JmNh3lCQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695720; c=relaxed/simple;
	bh=NTZ6Wc//mzRQoSyyrWMeXJfHiO8NAjtr81QTatmqx8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PA6feZ1NESwS7EBSHtSiBI0CgOQYlbPtwvh4UdmLbTlNX6d9AB11wILHZn8vUElVZaI/IGQK67ijWpbDn8g8RHo+YNwVsyt/Xm9t34SD5DskU+2XdgEs9yZlMEDOJ+o4L8TH4ilSJgTmgNjTDUEOlmXgYjIOeQWPPsGEsLGF4yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiz0E82a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiz0E82a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734695718; x=1766231718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTZ6Wc//mzRQoSyyrWMeXJfHiO8NAjtr81QTatmqx8w=;
  b=hiz0E82aXZybw4Yb9/3eYwzMiaWoAGY6E99pD8rtCBejMe/xjecnyN+x
   b7aE7+gedrlaH6HwBE7ZyHnuwza8PmyEMsK5l6ngHDO4cha+Nd3X0C4vz
   L6vEaul3hlqgJGTBj/0xdMiAuNKM1f90PAkUiNw/2y0hXwTozZaKGMe5h
   4sluX/p0ZR2Dl8O29kY8ZRBL/GYNkoMrniayqIKTXCd3p41BGjWUYuQwT
   6/vHBcqCLBZBRjpQUsyyytjtt7H/gVJfCmzbLQlKUy982xRRm/ckJ1TEL
   9P+Mp4NG6tuDuN0mfb4Ng/BBPu/fRiHRnsUz0LNsKoTGU7WL/KysZFnYz
   A==;
X-CSE-ConnectionGUID: bbkmRvmMSu2qliRV3AGtZw==
X-CSE-MsgGUID: /J83yHJcSa6gbFcydToUgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34564181"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="34564181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:55:17 -0800
X-CSE-ConnectionGUID: uRwWRU2cTXS9p55Q9bDaTg==
X-CSE-MsgGUID: HxvTzezjRZyOByNJ74z0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="103477605"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2024 03:55:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tObb8-00017D-05;
	Fri, 20 Dec 2024 11:55:14 +0000
Date: Fri, 20 Dec 2024 19:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [avpatel:riscv_defconfig_v1 10/59]
 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml: warning:
 ignoring duplicate '$id' value
 'http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#'
Message-ID: <202412201958.iLZA04Cg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   4fd509619498a267ba245e95fefba09eef65a97e
commit: 7ca90572711132b6a91cdd146150fda505b10f4f [10/59] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
config: csky-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201958.iLZA04Cg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201958.iLZA04Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201958.iLZA04Cg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#'
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
