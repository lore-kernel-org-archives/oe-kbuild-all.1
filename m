Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209646FC3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252295; cv=none; b=NCHgVKowgKAzguN4i7pOB1rHcaRZL5oUR5yMORumhbk4Q/H0yyKiKYLLvtkL1J52kLs7yhT6MM3ENbhXgZgMB/tzFKI5N8yzhiCq3SsPyehQQflY6D4qv8ZgsI+bpDhy519FTvsS2NsZyMi53RWnGf2kabQqhqLqTVUnTuC5sWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252295; c=relaxed/simple;
	bh=FpUGwnPRoOTsrU0WcfuFmaXDNnMk5gIXBrk9G1lnlVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdW+Wuyvy1Ex3HxS/CIL1MlS/Sokehvned4oodaNXfWcqdinBoWHnRf/surknqFw9qLyw/GCrTUsfhF4PKPHbbzuhxgB4IFaKcKVI65KT/+Ktj8cwokorcAWch4lomxGvRF+c1R20GeQSOHIjbfPWYrkUnUWRFOY7yDnnjtGoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKErqYxa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKErqYxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729252294; x=1760788294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpUGwnPRoOTsrU0WcfuFmaXDNnMk5gIXBrk9G1lnlVg=;
  b=YKErqYxa66Qtnh816iuZ//poHCUowwfz6iDZX30ww8gFfokia5q8BRKY
   PH2HaoFmaAnVipqYlIQoTOrMuWLWknjR37Y4bRqoVCNGXIwknN9nGRFf2
   DGVApT//Ew05j2tF9FTar3QG0mSI3szJRXfAZGoxyKQvv4S40VHf19rvE
   kXfGwk2JjfmMynSkfKb+guUVZbTnGQWN98YsUpj9NzmQ3TiniIh87ITyX
   9guwJMbZTpTFmC+EfqNsdAir6IsopVTB1wj5/I5DsNlJ9SOwdVYNRSDK6
   A0PUU/g+TNLPMPS8kzkT4xVcduqTkwOPwviwpVvWh6N2Llx6JV0Z2UFzc
   Q==;
X-CSE-ConnectionGUID: oFt9Bxc6R52WByLqyKjeHg==
X-CSE-MsgGUID: 5LMjdt1ERuOZ5E1MhZdemQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="16394498"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="16394498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 04:51:33 -0700
X-CSE-ConnectionGUID: /Fy54rNsRo2kWQJ8xRVh7Q==
X-CSE-MsgGUID: NVJnZK2hSWCmkHktiUluMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83623895"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2024 04:51:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1lVx-000Nkv-1m;
	Fri, 18 Oct 2024 11:51:29 +0000
Date: Fri, 18 Oct 2024 19:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410181936.dXnsVxkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 1eef2deae95a3f819afbe06798f1fd70a0048e11 [376/382] arm64: dts: ti: k3-am62a7-sk: Add peripherals and pinmux to enable display
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241018/202410181936.dXnsVxkB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181936.dXnsVxkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181936.dXnsVxkB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +844 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi

555df2427c6270 Aradhya Bhatia 2023-04-21 @844  		dss_ports: ports {

:::::: The code at line 844 was first introduced by commit
:::::: 555df2427c62703f82029d150939d027a85c50c2 arm64: dts: ti: k3-am62a-main: Add node for Display SubSystem

:::::: TO: Aradhya Bhatia <a-bhatia1@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
