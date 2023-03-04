Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14FED8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 01:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677891752; x=1709427752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i7UaOl9L7IIcPlH6Krqgx7ygxk467pWfEDMizug0CyQ=;
  b=HW8WXCaM6ZNg4nYRx7WaPwf2co+AtwNK+2KX7eL9gQsmdUsvO6kdClZi
   Po9f+dummv/YwUateJZsJGXa1Bp5rI80r5oPaWrJcwZZQQZIfGJkYBctF
   F/zwKylxaKo37gZmyibVZWoA7+Ju0JFsaYCm2G0jPq573wIXQViq/hCeS
   +zpTrDVoLUz14dWh0vD4ol0AzBfeqSKKUTVF6RiLRZC5cP3wJTVBnvggx
   SEvmotHkRksK92nNjaMlvzoozDA/bdrmXK+HeKP2vlSd9qUV8RnNyR2/q
   YXvnQUeiifSOYDcEc546I3RHX4T3644ooFK2yV/WQ4EhOMBPKjso7obDZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="319025096"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="319025096"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 17:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739700834"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="739700834"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2023 17:02:30 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYGIA-0001lk-12;
	Sat, 04 Mar 2023 01:02:30 +0000
Date: Sat, 4 Mar 2023 09:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 139/214] drivers/hid/hid-asus.c:411:13:
 error: redefinition of 'asus_schedule_work'
Message-ID: <202303040842.Mlcympch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   273024806c52933197cd3cde4a439e71a726c27d
commit: 1f4b1729450f6205a7253dcdf51f75e2056c512d [139/214] HID: asus: use spinlock to safely schedule workers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230304/202303040842.Mlcympch-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=1f4b1729450f6205a7253dcdf51f75e2056c512d
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 1f4b1729450f6205a7253dcdf51f75e2056c512d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040842.Mlcympch-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-asus.c:411:13: error: redefinition of 'asus_schedule_work'
     411 | static void asus_schedule_work(struct asus_kbd_leds *led)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus.c:401:13: note: previous definition of 'asus_schedule_work' with type 'void(struct asus_kbd_leds *)'
     401 | static void asus_schedule_work(struct asus_kbd_leds *led)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/hid/hid-asus.c:401:13: warning: 'asus_schedule_work' defined but not used [-Wunused-function]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/asus_schedule_work +411 drivers/hid/hid-asus.c

1f4b1729450f62 Pietro Borrello 2023-02-12  410  
037e399c969084 Pietro Borrello 2023-02-12 @411  static void asus_schedule_work(struct asus_kbd_leds *led)
037e399c969084 Pietro Borrello 2023-02-12  412  {
037e399c969084 Pietro Borrello 2023-02-12  413  	unsigned long flags;
037e399c969084 Pietro Borrello 2023-02-12  414  
037e399c969084 Pietro Borrello 2023-02-12  415  	spin_lock_irqsave(&led->lock, flags);
037e399c969084 Pietro Borrello 2023-02-12  416  	if (!led->removed)
037e399c969084 Pietro Borrello 2023-02-12  417  		schedule_work(&led->work);
037e399c969084 Pietro Borrello 2023-02-12  418  	spin_unlock_irqrestore(&led->lock, flags);
037e399c969084 Pietro Borrello 2023-02-12  419  }
037e399c969084 Pietro Borrello 2023-02-12  420  

:::::: The code at line 411 was first introduced by commit
:::::: 037e399c969084bed1a2b7a5c11b9ed14295c9b7 HID: asus: use spinlock to safely schedule workers

:::::: TO: Pietro Borrello <borrello@diag.uniroma1.it>
:::::: CC: Sasha Levin <sashal@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
