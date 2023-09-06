Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12CDA32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012056; x=1725548056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6jaImX9YvimtJqn16ZXj5qU2hw3Fxkd4BFdOSr0WULQ=;
  b=YgJJ0unnIHHQ4MC5cTWrItNUciBR9hL8eVMg++IexY8ky1Q/A67u5EtE
   1zDXgX/3rPuSf2PsH/H7AMvLXjUxZ3jdavJk1INOLfJpLJi00xnRE5iA9
   LxMg7o2nShFUH8GztyjadF8l+QQ42J1Q7iny7uyI0zvXIwrT9ReUhG/e5
   2QE4pHThgMLi3/kxKts3A3bZvIamEf6Aqtv8LHNuMfnIYWw9oCZvLAjOV
   f7MbgXPi9sDdbrrLIaNw1O4Q9cCWizpncl449LUwUUyGrbec/aPVs7KE0
   xnLXBgcNz258BlMqt2B422itjYjSjYyo3FlPlIXlMXABBJ3MOOlb6iJ4t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463463285"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="463463285"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807044454"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="807044454"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2023 07:54:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdtv2-0000In-2g;
	Wed, 06 Sep 2023 14:54:12 +0000
Date: Wed, 6 Sep 2023 22:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Eugene Loh <eugene.loh@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>
Subject: [oracle-dtrace:v2/6.5 9/13] scripts/link-vmlinux.sh: 147: [[: not
 found
Message-ID: <202309062242.sbGXYV5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: a1ee8f0025cfb81b4e4e3c779c1d3aad45a5b3f9 [9/13] kallsyms: add reliable symbol size info
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20230906/202309062242.sbGXYV5D-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062242.sbGXYV5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062242.sbGXYV5D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mips-linux-nm: 'a.out': No such file
>> scripts/link-vmlinux.sh: 147: [[: not found
>> mips-linux-nm: 'a.out': No such file
>> scripts/link-vmlinux.sh: 147: [[: not found
   Usage: kallsyms [--all-symbols] [--absolute-percpu] [--base-relative] [--lto-clang] [--builtin=modules.builtin.objs]  in.map > out.S

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VMLINUX_MAP
   Depends on [n]: EXPERT [=n]
   Selected by [y]:
   - KALLMODSYMS [=y] && KALLSYMS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
