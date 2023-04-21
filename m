Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62C160
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 00:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682036345; x=1713572345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TTF/zt7ciOazndabtoTkit0qJpAdHTm1TFK1o6y1Tcw=;
  b=bN3Z/0gcZwDsqCgXw3myUmUwkdY/zh76QLv4TLqR/HZU5ya+bXCL7msu
   hr0p4eHiIbKGvLN+9AKt5g8brjvall4/lWkHcWsGBI4l6cLCSyUPa8lIQ
   HTsX2+iJ1NMfXHM1dop0oG4G/lzhefNzob+C8upGHaNoMJHS72Bjcg9S2
   i4aZK6he6uLI4BZCb96nGH1T9ZWy+5f3EshWTQ9kg0kg1ukkByAuFFRtT
   QpEnj563buQbl6KH3Dlf7ugMy97O1TUJ1mixSaUhrn4RVWQXAQcM6O1F8
   UpA+bQT3nCPzQygNocqOfi1t25K/bY8pgwQ0sFA9aylV2P5x4fD1nyxQK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432162795"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="432162795"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 17:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="761385727"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="761385727"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2023 17:18:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppeUM-000gC4-0f;
	Fri, 21 Apr 2023 00:18:58 +0000
Date: Fri, 21 Apr 2023 08:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 4/6] util.c:undefined reference to
 `ieee80211_sta_restart'
Message-ID: <202304210808.GGZhtUJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   9f82de5e886d8c876a430542996789e3db318e57
commit: e4ea4f879886cbbc5b5ec8fef5b52964594cdc23 [4/6] UPSTREAM: mac80211: Add support to trigger sta disconnect on hardware restart
config: nios2-randconfig-r023-20230416 (https://download.01.org/0day-ci/archive/20230421/202304210808.GGZhtUJ1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout e4ea4f879886cbbc5b5ec8fef5b52964594cdc23
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210808.GGZhtUJ1-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: net/mac80211/util.o: in function `ieee80211_reconfig':
>> util.c:(.text+0x466c): undefined reference to `ieee80211_sta_restart'
   util.c:(.text+0x466c): relocation truncated to fit: R_NIOS2_CALL26 against `ieee80211_sta_restart'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_CORE_CONSOLE
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - EARLY_PRINTK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
