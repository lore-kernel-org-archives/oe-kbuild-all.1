Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2A377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679015571; x=1710551571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtrHSj+zadicHbt54/iVRcG7RfGHvbeZCZMH/fYxFiY=;
  b=amtlX/EEw67/xnaLdu+JLiCQK2gsoDo2Vw/BbieM9WIydk7rDsa5ouaT
   Y6KmOI4UJ92BV6MEJ5+0kvipYMy8Z9jDmCsLGgF++xHhdpIczrN1kwC5J
   tN21YUpUmrPH5AxMNioEOLsiFFSGb8R9NRCH19fwL17exF8DJzH+qW848
   2mpWr3PfTrV6YUEQRU4MjGS7UJxBvVlA2ejXOv5OyItfrlqFxZv//0bci
   VVRWqEUQ3Hmm/dJyEoWWUKLZAntTYZeq7lBmPSdWQ6arSObz52n+vMzqp
   K6mYwdPf+qCyDDfOcvkrFD9qeZvtSObidgyJSwhBn/wSs5L0qBfwFMhzn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318547146"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="318547146"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 18:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823478053"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="823478053"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2023 18:12:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcyeH-0008wc-2X;
	Fri, 17 Mar 2023 01:12:49 +0000
Date: Fri, 17 Mar 2023 09:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/9] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_USER_API_ENABLE_OBSOLETE when selected by
 IWL7000
Message-ID: <202303170933.weAjNLvl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   105289787142cf4c9a90015989c8bdbb4532afe0
commit: e24232a03b3a5f5332467027ee8b0bd6b21f3fee [1/9] FIXUP: CHROMIUM: driver:  Support iwl7000 driver on v6.1
config: x86_64-kismet-CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE-CONFIG_IWL7000-0-0 (https://download.01.org/0day-ci/archive/20230317/202303170933.weAjNLvl-lkp@intel.com/config)
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout e24232a03b3a5f5332467027ee8b0bd6b21f3fee
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE --selectors CONFIG_IWL7000 -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170933.weAjNLvl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_USER_API_ENABLE_OBSOLETE when selected by IWL7000
   .config:4952:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_ENABLE_OBSOLETE
     Depends on [n]: CRYPTO [=y] && CRYPTO_USER_API [=n]
     Selected by [m]:
     - IWL7000 [=m] && NETDEVICES [=y] && WLAN [=y] && PCI [=y] && HAS_IOMEM [=y] && CFG80211 [=y] && X86_64 [=y] && m && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
