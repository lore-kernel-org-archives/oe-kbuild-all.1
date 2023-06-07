Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9FF6118
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686164080; x=1717700080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7za4CCs5s9aBNMuiU6f+xQlTA6skRmO0zwrLGfukTgg=;
  b=DYYmOHrvnkW9bmwqrjrY3CipjLEb0dECiXsgYaMqYCWNGMCHk9TtaUo/
   hsLrw81QkctY7oDju2eK220DqwAqDhSX8H7P0xz5tkH6UNiUmU7+CNccL
   OZEl8a48Jv4p5blUt5Vqj4Cd52JgaBTa9rOyetReut9Vkj6xOtG+S4K0p
   FGO7JVRyG8JMVZa1ssN9ueRs4TANEVLAu9dlhzjN3IO6yW/VJ7hMZ72po
   QfV/OYusjypmN7GSVz8JUTfQdNJ9SNpi8Yni7b6z0tDCaHEV8y6zNMQrV
   K7vybKApeNAGk1EYPWzonJln7dIU1lu+BVglxp8tUd3S8Vu/2Ll5k3kKW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360409639"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="360409639"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 11:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687085512"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="687085512"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jun 2023 11:54:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6yIn-0006pt-21;
	Wed, 07 Jun 2023 18:54:37 +0000
Date: Thu, 8 Jun 2023 02:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>
Subject: [tnguy-next-queue:dev-queue 25/62] ERROR: modpost:
 "ice_vf_vsi_disable_port_vlan" [drivers/net/ethernet/intel/ice/ice.ko]
 undefined!
Message-ID: <202306080231.44ByZBRA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   1ecd2f861f59dda7810777ecfa3e4b2eb8407747
commit: 290dcbd2db2cb3f85e637f798e687d1e37e2281b [25/62] ice: implement bridge port vlan
config: parisc-randconfig-r014-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080231.44ByZBRA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=290dcbd2db2cb3f85e637f798e687d1e37e2281b
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue dev-queue
        git checkout 290dcbd2db2cb3f85e637f798e687d1e37e2281b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080231.44ByZBRA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ice_vf_vsi_disable_port_vlan" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_vf_vsi_enable_port_vlan" [drivers/net/ethernet/intel/ice/ice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
