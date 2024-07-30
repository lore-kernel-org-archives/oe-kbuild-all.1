Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC4146A73
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 04:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722313588; cv=none; b=ExLtlR09fg+dwbBwXbfE3IdNvEIvo9VFgPBaY/sOuxszcx7r907AWikmh5VpvyB0+gPCdPGA7dHiFHvssPreI7v/ML8s5PCv3ppDSOAPve6UTbCjchzbMr8xWnmfN9N7SsKEHaqvgUBAI5OquE+vkWMKqIqw/bWTJtuGVjEw324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722313588; c=relaxed/simple;
	bh=YNDxoFrtn01dD9aUeYwsQwl2Jr9Rsml+mFgwJ5fK4JE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gODMjWjqJ5VnrlPcpxeHZHug4k6DGDcnqrDC12fyOykKkpujCny4Us6J72bKVWbHtlPZnXWOpJvnx0blLTkWbSCdB6c7gMBzzWiXceL0828jYoIXVhTQxwZz2DuvhPJWUz+uAV3M7Du4M2/jxvM6GbD+Dd/7PNaGOtzWvDcGisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8ZnnMY3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8ZnnMY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722313586; x=1753849586;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YNDxoFrtn01dD9aUeYwsQwl2Jr9Rsml+mFgwJ5fK4JE=;
  b=m8ZnnMY3NPaqp9oclpeTTXiF2ZtXVXxbZAliWR9gFK4WJ6cQaG8nxHaP
   2GBGpl+6khAGc3q2azK1g5QhiXz4YYAoEVhWN07hBW9oweP+kTFX5uC8S
   +Jmp865A3pDOEPXdPpNZPv9bqEqlMt2EpsvwfWJVa1NgNmJH4xkCHnKOW
   8b9a5qzuJWyz9M4h7IB0L30za2hqVU9jfoFfY04TyHt3SvHgnaV6DkmuG
   VFMSqNwVcRwqYDGgHLwsqFJbOsKoLRs2kBd9cAdBaXwW58rES1CKCbVCP
   Tz9wP3hcbPeGEt1nyn+rsm4LK7hhiF1G53GPb6Y93aIkW3plhqflLVrNw
   A==;
X-CSE-ConnectionGUID: gm9g19hMTmGf9x+OaJwsPw==
X-CSE-MsgGUID: Z4u0lS/ESoeUwMdMoXovFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30736081"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="30736081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 21:26:23 -0700
X-CSE-ConnectionGUID: rM/BgcUGTJW4+Ch7XyWVRw==
X-CSE-MsgGUID: tFd/hMzxRcOXycaGEjC3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54101602"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2024 21:26:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYeRH-000sU8-0X;
	Tue, 30 Jul 2024 04:26:19 +0000
Date: Tue, 30 Jul 2024 12:25:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
	Hari Nagalla <hnagalla@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 32/46] kismet: WARNING: unmet direct
 dependencies detected for OMAP2PLUS_MBOX when selected by
 TI_K3_M4_REMOTEPROC
Message-ID: <202407301223.vHZWx3n3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   6de6e418c80edfbe08f4a5f851c721bd60c0123b
commit: acc3573ed94e855c69e7bec2855bc05caebc829d [32/46] remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem
config: x86_64-kismet-CONFIG_OMAP2PLUS_MBOX-CONFIG_TI_K3_M4_REMOTEPROC-0-0 (https://download.01.org/0day-ci/archive/20240730/202407301223.vHZWx3n3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407301223.vHZWx3n3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301223.vHZWx3n3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX when selected by TI_K3_M4_REMOTEPROC
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
     Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
     Selected by [y]:
     - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
