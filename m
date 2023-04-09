Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48C15A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 01:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681004901; x=1712540901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33r9H7Pw1bgE4Efd9Mtdouc4e+HX+sCANC2zgcXRGXk=;
  b=OGg2dWzHAy1u2oYF5HVOlgDkUwTILpdOq/DAYg7niKwd3+e03FWPghGz
   NXSvgmiQCDo29BIfObtM0kaAwFgjZDbELeDJ2Ca8gy8pr/0eFqrJiY45X
   eLlQIwsmuxspPkKwTHMso2gJ61+gDcDZjD7mGD1wRSn5gyorA2El1W0pJ
   rDxtnu4IR52W1m+PhnxSW3iRVoqdXdHdkVb/mq3YqcijcU8WRzBkvZtQz
   F1rYLuxKC8ZZ5wgVsxeApAUevDMahU0sUaj1tIPgxLh2wf7UfhzhRdGTs
   StapP5D5D7kpL1OgLiOKKtQnJ+Hu00zrxhJZNKdsc1fj/DVwGNwz9k9xb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="340668254"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="340668254"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 18:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="1017624910"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="1017624910"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2023 18:48:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plKAF-000UGb-07;
	Sun, 09 Apr 2023 01:48:19 +0000
Date: Sun, 9 Apr 2023 09:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.3-rc2-net-next-rap 3/4] ERROR: modpost:
 "nf_br_call_iptable_enabled" [net/bridge/br_netfilter.ko] undefined!
Message-ID: <202304090941.7zGktPS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-rap
head:   14c8b0ccb80d5ef154d134ba63a009c83a650eee
commit: da29564dd46d0fc799d3efc75e6348a693f08be2 [3/4] net: bridge: Add static key for net.bridge.bridge-nf-call-iptables
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230409/202304090941.7zGktPS0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/lunn/linux/commit/da29564dd46d0fc799d3efc75e6348a693f08be2
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-rap
        git checkout da29564dd46d0fc799d3efc75e6348a693f08be2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090941.7zGktPS0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nf_br_call_iptable_enabled" [net/bridge/br_netfilter.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
