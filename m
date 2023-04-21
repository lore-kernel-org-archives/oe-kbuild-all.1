Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C001840
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682061428; x=1713597428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A61WlnRcEtJmYb52Y7HEBULz9HaZeWkCkVQZu2xH5uk=;
  b=MWjS1MPKbSZaxLDF/MsiHv7P2UtqWL+JoTQJJG68wi4KQQY/Qh2Q2GNL
   iCQAUAFdioY2KQORhGw3c8SMSHYMgltJfuRlzgaaUYwTnhmrX3Ii1L2kY
   lmBZExQU1qg8X7mpzZr9f25xKuZ/c+QlLvjMNi9v11Hhx+3rySkM2fN0r
   O2SLUkYfytiDsunckZClnNZ0nt/cPMAUgsDJDeZ0ijCTSEZqIdbGOtUMJ
   3RVwN92wly9jLG1ewo5XmqXn14OhHnQKqUuYTNhbhf2xJxxhNbaXnj1EQ
   6pjsLCgxxSdisNVsKT/8Yr5YMJUDGZF+7ZvCy+KDecvfsdwivRfwTz0DZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411201515"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="411201515"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 00:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816321879"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="816321879"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 00:17:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppl10-000gPk-0V;
	Fri, 21 Apr 2023 07:17:06 +0000
Date: Fri, 21 Apr 2023 15:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 4/7] ERROR: modpost:
 "ieee80211_sta_restart" [net/mac80211/mac80211.ko] undefined!
Message-ID: <202304211557.cMVdwht8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   bfd348e6d886d1d5773fb7413e469182db1a1dd1
commit: e4ea4f879886cbbc5b5ec8fef5b52964594cdc23 [4/7] UPSTREAM: mac80211: Add support to trigger sta disconnect on hardware restart
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230421/202304211557.cMVdwht8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout e4ea4f879886cbbc5b5ec8fef5b52964594cdc23
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211557.cMVdwht8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ieee80211_sta_restart" [net/mac80211/mac80211.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
