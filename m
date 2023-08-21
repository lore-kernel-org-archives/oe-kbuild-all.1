Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EF8C0F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692649914; x=1724185914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcoNin1dcpjCKiiQBJ1TpPGGTFQOqcdQJpRwCUVnx4w=;
  b=BblvgLZ+2CLUgW8gfMImNchs37UKnXSPblTtqlUBh0o+/7OPbjEVD1Iq
   5jWqtFS9t/ZHcXMdcCNjtXaaU/ZTQuMr4tr2uQfO0QDSNoZLLgkv216m2
   BxYrEMIIfcBFj136T8IbCcuZeyQhj3+U7773C5MUcFDmOXQ8OQWE9XOCB
   zibIZGMglSRfSBLM4Apai7AVOPlyJT9SQ4JxETAQg3vaH0C1yUcxCti8x
   1buz6iPzb3f5DIwtED+u5jHNkuwbmD5xjZ17efC9fvRSgmt9j2ILWAlWe
   zu3Sv2UkhdBK+Iy8n/JQoK2ixS24/VmO40Zef01bU9Oo/wUmIuP/4Ldlx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440068806"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="440068806"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 13:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859617070"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="859617070"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Aug 2023 13:31:53 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYBZ1-0000uL-16;
	Mon, 21 Aug 2023 20:31:52 +0000
Date: Tue, 22 Aug 2023 04:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 7/9] fair.c:(.rodata.cst4+0xd4):
 undefined reference to `approximate_util_avg'
Message-ID: <202308220408.K5KZafUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   c33dc1443a3c5aebf846a5b6ea54b0cc8a2dc90f
commit: d3a66c0a71a07d1d534985b7a9cbefdcc4da6846 [7/9] sched/fair: Remove magic margin in fits_capacity()
config: parisc-randconfig-r012-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220408.K5KZafUQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220408.K5KZafUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220408.K5KZafUQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/fair.o: in function `.LC224':
>> fair.c:(.rodata.cst4+0xd4): undefined reference to `approximate_util_avg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
