Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEA6ADE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694032264; x=1725568264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ipPLZihPVLwzS0+KRJPW5fWJjhc2L6iNwT8/TTYrHrw=;
  b=Hbkewj3GeU9Pwx1Kwj8CwiAeldRnjPuJghB18+Vb0J1fpvn8KUSdM7C2
   XNYml3/WGs3zzBBiXZys9sd8WpRA6gAEVEzbFBZlgqgC1llru/F5eN4jk
   ucZGPyfA4LVlXJxeIiGEhsLGmNK9UoXXlXV4p9+gtClGT1tNes++FNL4t
   pSQreJ5sebySkmYSVuGgFF9e0l3bOuNyMzBLEuUuvvrStpaKjPG/kvwZM
   Gg765t9U6MIuHGS4CpAwVvIKeMAEtWC1qo2uQm5by920YoUqzXCQ1acH8
   Z8KR66sYU386dDQcCCSbngwYV5X7WMWZ28E3AcXmVUAoRmnUJkkK51rOW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357488125"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="357488125"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 13:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691438733"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="691438733"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Sep 2023 13:31:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzAw-0000ZH-2a;
	Wed, 06 Sep 2023 20:30:58 +0000
Date: Thu, 7 Sep 2023 04:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.5 12/13] ld: warning: CTF linking failed; output
 will have no CTF section: Type name must not be empty.
Message-ID: <202309070401.z72YGcqR-lkp@intel.com>
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
config: i386-randconfig-012-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070401.z72YGcqR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070401.z72YGcqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070401.z72YGcqR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   CTF error: drivers/net/ethernet/mellanox/mlxsw/pci.c (0): while emitting deduplicated forward, error emitting target type from input type 2a
   CTF error: deduplicating link type emission failed for drivers/net/ethernet/mellanox/mlxsw/pci.c
>> ld: warning: CTF linking failed; output will have no CTF section: Type name must not be empty.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
