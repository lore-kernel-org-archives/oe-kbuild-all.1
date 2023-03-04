Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21F1FD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677930593; x=1709466593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YsJV/lI0ThR0n+kiByXM0RQnL6i/etOK139sJAMgPKg=;
  b=dERJ3GEFYJCyzcTirFPKtxUyaG6lg90rVPF0wBc9qq47Ah8HxnDOzyRb
   mZVgjTRa4OeWqw+k/3lGDTvP+N0R8jv3E5JAGbHup+NvMIKo/syG3gkXS
   w9oqnfkDQvF98xqdkJXR9x62mU7WyZWb8Lvcm3nQU0vc599WAt2HvhE2J
   0uIsuGLW8op0DXZfmWdvxguoqnG+yhe4bd2ObVwJ+QDR1rdN6GYo5sEo2
   dwHijM/SGotblLJGzlzYTJeHlFi80PKSorDyhgS6bCf5dQq7qFQbal9+W
   h+8oKRBDhQpMCI803B3sRnD+NlYXOyfsDrkxzaQslVeDaF639Wi8ErWXW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="362852282"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="362852282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 03:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="675649212"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675649212"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 03:49:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYQOd-00027i-17;
	Sat, 04 Mar 2023 11:49:51 +0000
Date: Sat, 4 Mar 2023 19:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 219/331] drivers/hid/hid-asus.c:411:13:
 error: redefinition of 'asus_schedule_work'
Message-ID: <202303041943.IemYKmnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   b0d244e76fc7a721be09631b379581334e9ce9ae
commit: 24f5322c15b856815640b8706f404048c466fc87 [219/331] HID: asus: use spinlock to safely schedule workers
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230304/202303041943.IemYKmnI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=24f5322c15b856815640b8706f404048c466fc87
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 24f5322c15b856815640b8706f404048c466fc87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash M=drivers/hid

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041943.IemYKmnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-asus.c:411:13: error: redefinition of 'asus_schedule_work'
   static void asus_schedule_work(struct asus_kbd_leds *led)
               ^
   drivers/hid/hid-asus.c:401:13: note: previous definition is here
   static void asus_schedule_work(struct asus_kbd_leds *led)
               ^
   1 error generated.


vim +/asus_schedule_work +411 drivers/hid/hid-asus.c

   410	
 > 411	static void asus_schedule_work(struct asus_kbd_leds *led)
   412	{
   413		unsigned long flags;
   414	
   415		spin_lock_irqsave(&led->lock, flags);
   416		if (!led->removed)
   417			schedule_work(&led->work);
   418		spin_unlock_irqrestore(&led->lock, flags);
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
