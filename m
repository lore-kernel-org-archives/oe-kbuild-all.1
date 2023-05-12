Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5FBE4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 14:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683901612; x=1715437612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xx5+wlf/N8+iZI9Bp4G6CTUNM1ojf6HIXWta0j61j1Y=;
  b=BaiaW93QuBQraYFRJt2NMSL97TM8HwNqIsaNn/W/1Caiv34KU6aXgnKr
   LFf7OkNRLUO1skpspszuSL9uX+ugqEz0uIAqOlOrbxcSjrBgXJttL7efl
   8lxU1lRbV3NhknBiu9gtjRAPD2tyRs5iLzh5RZeJQyDminotxbyTVmhjj
   uMUYVOKtOVpXEr9lM4njaEtiiAGQS50y6kdRaYnlNSEyLD+lGg4VfPZei
   Zp0LPZbzlblQg+zRZO9Frh1NLdnbu4mK26j9wbujvpKceltGgOxQsLGSg
   hQkNok7NULyiOMTwJS9p5Uz12yegK0uWrqX4CoHIMgAR7F6lOpBlnJ4ja
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353933405"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353933405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 07:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650652032"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650652032"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 07:26:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxTjN-0004vg-0Q;
	Fri, 12 May 2023 14:26:49 +0000
Date: Fri, 12 May 2023 22:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [kvalo-ath:pending 50/51]
 drivers/net/wireless/ath/ath11k/testmode.h:19: multiple definition of
 `ath11k_tm_wmi_event';
 drivers/net/wireless/ath/ath11k/wmi.o:drivers/net/wireless/ath/ath11k/testmode.h:19:
 first defined here
Message-ID: <202305122213.1eOA66xV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   229ea354bdd24bf3c33c9447674fab8d609e24a2
commit: f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c [50/51] wifi: ath11k: factory test mode support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230512/202305122213.1eOA66xV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122213.1eOA66xV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   aarch64-linux-ld: drivers/net/wireless/ath/ath11k/mac.o: in function `ath11k_tm_wmi_event':
>> drivers/net/wireless/ath/ath11k/testmode.h:19: multiple definition of `ath11k_tm_wmi_event'; drivers/net/wireless/ath/ath11k/wmi.o:drivers/net/wireless/ath/ath11k/testmode.h:19: first defined here
--
   In file included from drivers/net/wireless/ath/ath11k/wmi.c:22:
>> drivers/net/wireless/ath/ath11k/testmode.h:17:6: warning: no previous prototype for 'ath11k_tm_wmi_event' [-Wmissing-prototypes]
      17 | void ath11k_tm_wmi_event(struct ath11k_base *ab, u32 cmd_id, struct sk_buff *skb)
         |      ^~~~~~~~~~~~~~~~~~~


vim +19 drivers/net/wireless/ath/ath11k/testmode.h

d5c65159f28953 Kalle Valo            2019-11-23  16  
f3d1f7ae115e12 Govindaraj Saminathan 2023-05-12 @17  void ath11k_tm_wmi_event(struct ath11k_base *ab, u32 cmd_id, struct sk_buff *skb)
d5c65159f28953 Kalle Valo            2019-11-23  18  {
d5c65159f28953 Kalle Valo            2019-11-23 @19  }
d5c65159f28953 Kalle Valo            2019-11-23  20  

:::::: The code at line 19 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
