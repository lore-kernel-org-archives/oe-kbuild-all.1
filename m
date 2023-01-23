Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D9880A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 21:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674509784; x=1706045784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWx9mqMyxIwoVkHn1rGTx1fA7LTwEQh6IFFXDVWQLqQ=;
  b=c4hOK/EoYpAzXdbBnqLyXs6LkyHthOoRopboXRL2lhxNqk7+t/hQXCfM
   xGo9JeBFu3Zya3x22oiQHKglDgKtaJbLCO7JWCVUrtElMoybxw9DjlNLi
   5J4zNz/35cTDIRFUfzgdT0p0o7OVvyyMxpdOmd6L/+GdxY2PshJVSap97
   3wPTn5islPVuruclMq3okDjtNhLF0JKHSpVGVoZBtt2xd8O3GFeV0aApw
   EOkrIBBEWGAJeKzKKaLdD/yuhhr0a8S6O/kFOy8WPDaE8NBDi6795fN+E
   Smz96d0jZM6Tcjk4nAc5+AOknTcfTNCJ4h/a3D857KBCINHr6u50BnIKf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324834202"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="324834202"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 13:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907254595"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="907254595"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2023 13:36:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK4UI-0005tu-0K;
	Mon, 23 Jan 2023 21:36:22 +0000
Date: Tue, 24 Jan 2023 05:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-q-release
 1268/7614] drivers/net/wireless/virt_wifi.c:432:31: warning: variable
 'w_priv' set but not used
Message-ID: <202301240504.tex6V9DA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-q-release
head:   39793952000376f86462e9cfc33766da2aa57084
commit: 55fabf05a9f648f8b93735bc9d801d662220eca0 [1268/7614] FROMGIT: mac80211-next: rtnetlink wifi simulation device
config: x86_64-randconfig-a011-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240504.tex6V9DA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/55fabf05a9f648f8b93735bc9d801d662220eca0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-q-release
        git checkout 55fabf05a9f648f8b93735bc9d801d662220eca0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/virt_wifi.c:432:31: warning: variable 'w_priv' set but not used [-Wunused-but-set-variable]
           struct virt_wifi_wiphy_priv *w_priv;
                                        ^
   1 warning generated.


vim +/w_priv +432 drivers/net/wireless/virt_wifi.c

   427	
   428	/* Called with rtnl lock held. */
   429	static int virt_wifi_net_device_stop(struct net_device *dev)
   430	{
   431		struct virt_wifi_netdev_priv *n_priv = netdev_priv(dev);
 > 432		struct virt_wifi_wiphy_priv *w_priv;
   433	
   434		n_priv->is_up = false;
   435	
   436		if (!dev->ieee80211_ptr)
   437			return 0;
   438		w_priv = wiphy_priv(dev->ieee80211_ptr->wiphy);
   439	
   440		virt_wifi_cancel_scan(dev->ieee80211_ptr->wiphy);
   441		virt_wifi_cancel_connect(dev);
   442		netif_carrier_off(dev);
   443	
   444		return 0;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
