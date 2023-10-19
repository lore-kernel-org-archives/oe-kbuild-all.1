Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6B838C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 00:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry6m4wik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697676819; x=1729212819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/p4rg2zEuANhgTwFR/9lCx+AQqBCga4s7oBZdvwtdUs=;
  b=Ry6m4wikcOsy9MiCZqr/oFAWWXii+sNvqpNl1Jn7vwQbuB3rfgDtJxvO
   tZK/zCJ2DAfbyqlAga/X1xcKw332m2Ts/oOY2mWPCa+g2KwvFNQb6pRyu
   lqJ45t8T5KTZEgkxczfBGa6vmnltWVQIbTfMTxGNXv0X6vSNkULu7MHr+
   VtsTm/NyUwXCaqmW3QSS/I9aEh6OTb3cac7qQ6DbbzOR8+Jy/3aIF7zvG
   yXJkRh5lXiogYCnOx0eOSLoMjH3xPv/0DepBRKjHxF+uqkXRTpe7tgWNf
   3oPMMecajJFBlBKsyWobs0X/bT8y1vgvdX/lWVCSFPgN1BbYwf5N7l1wT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4740026"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4740026"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 17:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4567754"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2023 17:52:28 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtHI7-0001Ls-0e;
	Thu, 19 Oct 2023 00:53:35 +0000
Date: Thu, 19 Oct 2023 08:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 2/2] tty: serial: uartps: Add rs485 support to uartps
 driver
Message-ID: <202310190816.kxgkr4cZ-lkp@intel.com>
References: <20231011145602.3619616-3-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011145602.3619616-3-manikanta.guntupalli@amd.com>

Hi Manikanta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-Add-optional-gpio-property-to-uartps-node-to-support-rs485/20231011-225836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231011145602.3619616-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V2 2/2] tty: serial: uartps: Add rs485 support to uartps driver
config: i386-randconfig-062-20231018 (https://download.01.org/0day-ci/archive/20231019/202310190816.kxgkr4cZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190816.kxgkr4cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190816.kxgkr4cZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/xilinx_uartps.c:214:21: sparse: sparse: symbol 'cdns_rs485_supported' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
