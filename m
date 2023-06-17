Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04537748E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687001433; x=1718537433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XD0DYedJ2YfPNL3HGMq4aFK02Di4emUHzwpoPbVnyJg=;
  b=PI8Dm1tnOTA0ffePepZDnZQkVZXPHTlCHB25NtP7PxCq6Jdcjcniny8z
   0brf/osTeLy5nnKQkSrQWdSk543Nhhy3jXeA/S+ESGKoSR/DbbqHqbUK4
   qIfl9G0NGjIFvYkVx4AiKZz6zuO7g2+Dp5D8fdwUQOzCz7CFcVN7R9HmR
   24S5tJbm463se/sUpjjcEf8FhS56ZTDdl1w0ffqrb2lvggfJj5rGLVvu7
   KoJ9HMr7jz6imqxDfOB90mzYJ4mbtX5OXxCrWy5+P5GgHn6rxOE6T96zl
   MN2oyWUCc2cATcsbNBHyHsMcjlDcZlPmVPlMjuHY7Fbt61YHQPi84Mo+6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="361917713"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="361917713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 04:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="707373087"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="707373087"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jun 2023 04:30:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAU8U-0002ho-1I;
	Sat, 17 Jun 2023 11:30:30 +0000
Date: Sat, 17 Jun 2023 19:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-tip/x86/tdx/v7 4/15] ivm.c:undefined
 reference to `__tdx_hypercall_ret'
Message-ID: <202306171916.M1d15pxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-tip/x86/tdx/v7
head:   8b6ccc53857db9fe8e915646c5ffc220f5750ddc
commit: 40528e7b482a0dcdb8a8b888640ba3e73a4b0ff6 [4/15] x86/hyperv: Support hypercalls for TDX guests
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230617/202306171916.M1d15pxo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171916.M1d15pxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171916.M1d15pxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/hyperv/ivm.o: in function `hv_tdx_hypercall':
>> ivm.c:(.text+0x76): undefined reference to `__tdx_hypercall_ret'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
