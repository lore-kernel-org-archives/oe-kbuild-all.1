Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA51E518
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 17:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689098378; x=1720634378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcsR/ebubTj9DtTZTNKt2gpDylDrRpyC5mtNDjLKz8k=;
  b=OWdQ8V5HNDHcq/7jKwes6A4p6HIVImTC9Z1EpSO2NVTRPZ4TSXZjJYCh
   DIXbddkRD4hRoZ9sdWFswcoFrUayUZT5DWBmCngXlKffWpUaX/UmzaGmq
   SFC4Z/nbg8dlTlI22Dmy9ihu9oFSLUmkgd2KY3+TnFbmGodTtyDlMpNd+
   fyOpICmY2AQewqXSfcJWpWB53Y62BT/QeAb+6NK1szFoX4HMi/XVnHXx2
   riE/y/kJHZh6aIWyRlreS0S8L5eIrpHv1nhXQAlEiJXqn70v69PGqUn8D
   EFx+KPXqk9Qq8UMbnDfoc4QsMVkBQblPqWHL6npqji6Ir3vLImT3MI6Wp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363557431"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="363557431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786694454"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="786694454"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jul 2023 10:59:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJHdo-0004zR-20;
	Tue, 11 Jul 2023 17:59:12 +0000
Date: Wed, 12 Jul 2023 01:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Eugene Loh <eugene.loh@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>
Subject: [oracle-dtrace:v2/6.4 9/13] csky-linux-nm: 'a.out': No such file
Message-ID: <202307120116.M7hieeuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 39e8b5a2ee1ef9dcd1ce239c640a065b10dcd36f [9/13] kallsyms: add reliable symbol size info
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230712/202307120116.M7hieeuJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120116.M7hieeuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120116.M7hieeuJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> csky-linux-nm: 'a.out': No such file
   scripts/link-vmlinux.sh: 147: [[: not found
>> csky-linux-nm: 'a.out': No such file
   scripts/link-vmlinux.sh: 147: [[: not found
   Usage: kallsyms [--all-symbols] [--absolute-percpu] [--base-relative] [--lto-clang] [--builtin=modules.builtin.objs]  in.map > out.S

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VMLINUX_MAP
   Depends on [n]: EXPERT [=n]
   Selected by [y]:
   - KALLMODSYMS [=y] && KALLSYMS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
