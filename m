Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0185510791
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694014939; x=1725550939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XpsQWl6oXyfgjij4VGm42wdyER3FUy7M4z4PWqJG8nI=;
  b=aSobMKHA14fPOItaKXzSEUpjfo3a3arvo4zzBmy6kSZgNgMFcMwNHnGJ
   a+xYxRoGfY2wBuESbNgKK7LivO3pMQD5Vd1NLhaaFjEbJEP/CGH9ohKjf
   oxYwcj2gqSVaBk0wAnbGdsYlk5dAWc+Fag0+wnm8MolsG5sZnDMGi6rEy
   pQhVp13FSdS2vQ7oOPE9MucnPyG739tqWwSV7dV77OOHSYAyMoWUr70Fy
   RRkHefguTuPDpXYWbjyt3/r6a3Fnl+pVi/qDxE/SDktqzSRnSb3zkpR0h
   Ga0A0avvfsazJlNFqNd1MYTWDOeUOBgRpvoIBFHZ5+7jj53aGa1mbVka0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377013822"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="377013822"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807057471"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="807057471"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2023 08:42:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdufX-0000L9-2J;
	Wed, 06 Sep 2023 15:42:15 +0000
Date: Wed, 6 Sep 2023 23:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Eugene Loh <eugene.loh@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>
Subject: [oracle-dtrace:v2/6.5 9/13] aarch64-linux-nm: 'a.out': No such file
Message-ID: <202309062325.WIQnSkZD-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230906/202309062325.WIQnSkZD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062325.WIQnSkZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062325.WIQnSkZD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-nm: 'a.out': No such file
   scripts/link-vmlinux.sh: 147: [[: not found
>> aarch64-linux-nm: 'a.out': No such file
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
