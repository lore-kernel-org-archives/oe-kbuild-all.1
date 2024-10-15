Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D17F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728951259; cv=none; b=OF8DfCTn6SpRNPgQdh/abGpSufIZ6UwSMSX3VvmoUxwEsY5k8ynLOQ4oRh2ef/mlWxp8cfaHoeT8IvjyjsvvdYSm90r/XVmZiJRtJJGrjo+6pA4IjS8L8MH+99TTJidfX2MoEV6RIEOGhQOwl17R1BgVLqHyVFjcIg7vCQpu98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728951259; c=relaxed/simple;
	bh=Tg7JX687x5251Ku5whEkeIFu+50VBNMoKFGSzdW/FRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DN8vrqx/RNiNS15FMs8E8yxtaa2+EF3mK9ca3ERM6LVX1yrf3kDBCXmoLQ2wdV0obvJGZpHnxrbiEPubrUcFHxkV6E/u/xDeNrD4by7jAkEH3J3B/Q+kr+s2MeNY9hE9pwbQksV75MbdHBheQk9QO0psfrHagv9uD9+Uq5J4US8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuA34u+Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuA34u+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728951256; x=1760487256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tg7JX687x5251Ku5whEkeIFu+50VBNMoKFGSzdW/FRE=;
  b=WuA34u+QXjQf0VdPSoKJMS5/143//FCdmXNCjkha7tAIhm/pI4NkKalf
   s7SB62eqAt3vhpE59xm1IfLpkoUf1yzu7T4UmzGmI2OQX3IVjKBNyfulM
   gNB/6fmW3Z386qvchNY0UWqt6UUeyLCARARaayyX1AUfDEEZj16LKZvFD
   Gl6Mt2yZrjr58IXmdRFh5/z76anonvm+j6P4SATLfXWdhloIQyEchl+YS
   IX4vr1AQOUR2ctun2aLWs2TQml/7JiqjJxSfEPNXezGHoTMZ89K6/7Qtd
   kRUhE5yc2EB+qgPFiHJs7q+9T72gYN7nMid+gVJib8HxIBTgvCI1ALdCp
   A==;
X-CSE-ConnectionGUID: blN2Y+uUTVeEgxn75GBkTQ==
X-CSE-MsgGUID: BEf7fejBQy2A5KzANJCFhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31201024"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="31201024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:14:16 -0700
X-CSE-ConnectionGUID: 0cSVu3LtTwiUNXSv9M/o4Q==
X-CSE-MsgGUID: wLM6z+8fTGiOes2nTNFf+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="78163062"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Oct 2024 17:14:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0VCW-000HLx-0Q;
	Tue, 15 Oct 2024 00:14:12 +0000
Date: Tue, 15 Oct 2024 08:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>
Subject: ti_k3_m4_remoteproc.c:undefined reference to
 `devm_ti_sci_get_by_phandle'
Message-ID: <202410150837.FOGlkGvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: ebcf9008a895a2a9416f69e186b56fbade35e12c remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem
date:   8 weeks ago
config: arm-randconfig-001-20241015 (https://download.01.org/0day-ci/archive/20241015/202410150837.FOGlkGvW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150837.FOGlkGvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150837.FOGlkGvW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
>> ti_k3_m4_remoteproc.c:(.text+0xc24): undefined reference to `devm_ti_sci_get_by_phandle'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
