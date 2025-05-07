Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC82820A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623323; cv=none; b=uDc219BZE7mov3qNjBa7PDSbLce7Rqfdw5Y5O4W5PPOtYDmIrZzO/qgnieotYe9QOsDN3kFpzhHkfMtI25LPb+6ugFR1ZkFsWUidPVMblWKlKYXDcCD2ju4HJa05qCb8uhHqVR9jNBczSor/6dJcmEWv7Vc/7tEcmod5XgX8qCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623323; c=relaxed/simple;
	bh=31m/08ig0VfNkrMk4343Qa54/eWB+4Dem9Dww8wH3CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhJxywugH28S6dA59B7vJUTMg2fV/mppLR8NXypT1iGstqWxT6+yf5u+2W/SQz/ezokePApUbD8/h0eLTkTbbCuiwDVlAni0PdjTEFp9mb5ac8qyFLVI/BPbvguKNloCSKOnoPmk4Hhd5pQEkWtDppV6D2wHrdTp3SI4fc+aLgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arVYJNtq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arVYJNtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746623319; x=1778159319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=31m/08ig0VfNkrMk4343Qa54/eWB+4Dem9Dww8wH3CU=;
  b=arVYJNtqi6zeG6aX1ljtxCTP64+K48tCCVo855ugHDx+6mdsiBLb4ZbB
   VfKA8rZTZ8ENNddm3AIStPLKoXSjFE3lJHCcSLw3uEMuQRVkrKv0xKU6s
   fS1F2zgiVozJPn5O4kUf+wQGgDnMSWkMtMBYkoVcz6V+OIFGnoRqUS+uI
   vLSPJqRFqEbjdGD6/vJBP9hZw9h+AbWXty0UR9GYnDNyG9nilHkrg4h+Q
   mbr3oGwCVVxWToZjooEXM9eQySbRc+zePW1dswHP1ar2hWuScgcJfonMm
   8GPRSUSGjxwMvazrlOxncTlCyz6Cup4/nUDdUZnlzhVlI6Tq4cjhupCup
   g==;
X-CSE-ConnectionGUID: hgYaOOZnSY+jwNeBc2rjvg==
X-CSE-MsgGUID: Q2Mo68tDT7+hI3VSy7mt7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48464749"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48464749"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:08:38 -0700
X-CSE-ConnectionGUID: HltUxPkLRcWZCdm3fng9Yg==
X-CSE-MsgGUID: CMZrrmWdQwa00LnQwmKLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140907169"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 06:08:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeVn-0007qC-09;
	Wed, 07 May 2025 13:08:35 +0000
Date: Wed, 7 May 2025 21:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Message-ID: <202505072013.1EqwjtaR-lkp@intel.com>
References: <20250424090000.136804-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424090000.136804-7-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[cannot apply to robh/for-next broonie-spi/for-next krzk-dt/for-next linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-memory-Document-RZ-G3E-support/20250424-210301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20250424090000.136804-7-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI support
config: alpha-randconfig-r132-20250426 (https://download.01.org/0day-ci/archive/20250507/202505072013.1EqwjtaR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072013.1EqwjtaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072013.1EqwjtaR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/memory/renesas-rpc-if.c:1066:19: sparse: sparse: symbol 'rpcif_impl' was not declared. Should it be static?
>> drivers/memory/renesas-rpc-if.c:1075:19: sparse: sparse: symbol 'xspi_impl' was not declared. Should it be static?
   drivers/memory/renesas-rpc-if.c: note: in included file (through arch/alpha/include/asm/core_cia.h, arch/alpha/include/asm/io.h, include/linux/io.h):
   arch/alpha/include/asm/io_trivial.h:64:16: sparse: sparse: undefined identifier '__kernel_ldbu'
   arch/alpha/include/asm/io_trivial.h:70:16: sparse: sparse: undefined identifier '__kernel_ldwu'
   arch/alpha/include/asm/io_trivial.h:76:9: sparse: sparse: undefined identifier '__kernel_stb'
   arch/alpha/include/asm/io_trivial.h:82:9: sparse: sparse: undefined identifier '__kernel_stw'

vim +/rpcif_impl +1066 drivers/memory/renesas-rpc-if.c

  1065	
> 1066	struct rpcif_impl rpcif_impl = {
  1067		.hw_init = rpcif_hw_init_impl,
  1068		.prepare = rpcif_prepare_impl,
  1069		.manual_xfer = rpcif_manual_xfer_impl,
  1070		.dirmap_read = rpcif_dirmap_read_impl,
  1071		.status_reg = RPCIF_CMNSR,
  1072		.status_mask = RPCIF_CMNSR_TEND,
  1073	};
  1074	
> 1075	struct rpcif_impl xspi_impl = {
  1076		.hw_init = xspi_hw_init_impl,
  1077		.prepare = xspi_prepare_impl,
  1078		.manual_xfer = xspi_manual_xfer_impl,
  1079		.dirmap_read = xspi_dirmap_read_impl,
  1080		.status_reg = XSPI_INTS,
  1081		.status_mask = XSPI_INTS_CMDCMP,
  1082	};
  1083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
