Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0029C320B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678480830; x=1710016830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tBfcaIiHFbsWgVXudK4IbW70gDeKO45ljcVBc0g7M0=;
  b=SGXVajBfyOmSur6Gg1zlxoZHV31bc6H/8BoexdKai69NvnAFjJqJH30B
   ZGaVBq2KcEljmxTkrANlaz7lvwbb3MKhcQeh2Dz7bm4uM3HRVL9k13rGp
   Kn2XbzUmXAQack5+eaB0/QemZO8hFEghT/yNneHX1iJ3wRmdjJkt/RGjG
   L57aY5IAyMXBYbrhomYW4eDD2HJnn23B4zBfWpjRn1Gk8UScxzAcIjjA1
   qj7r0qJY/QZbHNmtBjuR+dTHhcW7oWcgn+CGpbp2mEEhdE84WfD1waz6T
   goI0fnZAMitjSbh2c4qCl6lgx2Wn6jfoOawPKjsTkRXn0s3JtCMXklVA2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325180055"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325180055"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 12:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852048417"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="852048417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 12:40:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pajXP-000455-2F;
	Fri, 10 Mar 2023 20:40:27 +0000
Date: Sat, 11 Mar 2023 04:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/11] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_ARC4 when selected by IWL7000
Message-ID: <202303110405.h2VypY06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   421400b80a607403ae326e6a5d2c9fd957296120
commit: 91a70c368104217f438758873200771879116f92 [1/11] CHROMIUM: driver:  Support iwl7000 driver on v6.1
config: x86_64-kismet-CONFIG_CRYPTO_ARC4-CONFIG_IWL7000-0-0 (https://download.01.org/0day-ci/archive/20230311/202303110405.h2VypY06-lkp@intel.com/config)
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 91a70c368104217f438758873200771879116f92
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_CRYPTO_ARC4 --selectors CONFIG_IWL7000 -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110405.h2VypY06-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ARC4 when selected by IWL7000
   .config:5018:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for CRYPTO_ARC4
     Depends on [n]: CRYPTO [=y] && CRYPTO_USER_API_ENABLE_OBSOLETE [=n]
     Selected by [m]:
     - IWL7000 [=m] && NETDEVICES [=y] && WLAN [=y] && PCI [=y] && HAS_IOMEM [=y] && CFG80211 [=y] && X86_64 [=y] && m && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
