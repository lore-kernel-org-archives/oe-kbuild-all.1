Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCB8F48
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUGrepeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700812652; x=1732348652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uQuOvZFRnpjMZzmopghDkOi3DV3bXYBgoM0u8yn81+0=;
  b=CUGrepeHXEMBcSxMcN/8Im3/N6r/Arps5TcWBFei63V8vxTVLvhGd/M4
   tk3stF1zs1ifjViy5ZbIaX1JPwp+86m14xmQi2IzL+Ut3GqQRE585+ETA
   8BeovhqhFk7pSwRmNq15c1fOcwP1IwwJxlSx+4YAP33+AflFU5vLaHzGp
   BVFMN6ygbmB0UG4OohbbdbB3KCbJu5u4aw3uSU5f2NhvRPrV6pQlYyAzI
   NkTZB/BOLZb2frqvAJ9RCORLSbd2W5cJza6LJBBf1m22ZmiiocVft1ftr
   V8Ph79NKb/M7LCJWbCSR53shh0o2delujmFCH3p+xblVIFXmjpdz/p8Vw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395199284"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395199284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 23:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767393115"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="767393115"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2023 23:57:31 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6R44-0002Et-2c;
	Fri, 24 Nov 2023 07:57:28 +0000
Date: Fri, 24 Nov 2023 15:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 07/11] mm/mempolicy: add task mempolicy syscall
 variants
Message-ID: <202311241259.01p5nxh1-lkp@intel.com>
References: <20231122211200.31620-8-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122211200.31620-8-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20231123-115126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231122211200.31620-8-gregory.price%40memverge.com
patch subject: [RFC PATCH 07/11] mm/mempolicy: add task mempolicy syscall variants
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20231124/202311241259.01p5nxh1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241259.01p5nxh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241259.01p5nxh1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o:(.data+0x724): undefined reference to `sys_set_task_mempolicy'
>> or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o:(.data+0x728): undefined reference to `sys_get_task_mempolicy'
>> or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o:(.data+0x72c): undefined reference to `sys_set_task_mempolicy_home_node'
>> or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o:(.data+0x730): undefined reference to `sys_task_mbind'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
