Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F252D20EA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694015671; x=1725551671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79fNnctLFe8MdBBNJoXOxHM5sLje0G3TtylLIf5ueO8=;
  b=RML1tUcg9/9fvuLbd0lbOyxdWhv5akSjHeh45Gt5yqSDYXO/3DAvgGqH
   WEKCKPFBqLrjw19XDyZcLMreKgT5DnWgAioKF7ndk9lkbodS8rBij+kza
   XFe0JrrUyjXCVuw+HFQ5TfVqp02YX/O/tFWIExUAxjws0pcRKd6sQmp2Q
   lJSsKAGH9ijPQLoHSvbSHQBxJCk6rD52Pj7oEFgXjH71p1ltAslNrPCkG
   ECbQfLCU/tUDwRR9Z18VulYAbfKkkur4YLpgHwcXEAetBAzq22DRhmEn3
   ZHIOa6s55ROgJmMIJu5MRxHFY9FgSTIuCrIc9/ejMg2Bd0Wa71RB9hhqo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376004406"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="376004406"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741597566"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741597566"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 08:54:28 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdurJ-0000Ln-2d;
	Wed, 06 Sep 2023 15:54:25 +0000
Date: Wed, 6 Sep 2023 23:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.5 12/13] /bin/bash: line 1: 26297 Aborted
                 s390-linux-ld -m elf64_s390 --ctf-variables -z noexecstack
 --no-warn-rwx-segments -r -o vmlinux.o -Map=vmlinux.o.map -T
 .tmp_remove-ctf.lds --whole-archive vmlinux.a --no-whole-archive
 --start-group lib/lib...
Message-ID: <202309062343.uvbXktMl-lkp@intel.com>
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
commit: 8eb9c2162bfbe04cdd23185854d8d298497b35e8 [12/13] ctf: generate CTF information for the kernel
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20230906/202309062343.uvbXktMl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062343.uvbXktMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062343.uvbXktMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: relocatable linking with relocations from format elf64-s390 (arch/s390/kernel/head64.o) to format elf32-s390 (vmlinux.o) is not supported
   double free or corruption (out)
>> /bin/bash: line 1: 26297 Aborted                 s390-linux-ld -m elf64_s390 --ctf-variables -z noexecstack --no-warn-rwx-segments -r -o vmlinux.o -Map=vmlinux.o.map -T .tmp_remove-ctf.lds --whole-archive vmlinux.a --no-whole-archive --start-group lib/lib.a arch/s390/lib/lib.a --end-group

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VMLINUX_MAP
   Depends on [n]: EXPERT [=n]
   Selected by [y]:
   - KALLMODSYMS [=y] && KALLSYMS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
