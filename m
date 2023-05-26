Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC1523D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685093140; x=1716629140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDsqW8+zIu6qtAGeLLTB5X/4+H54BoLa1MhwADKfGoE=;
  b=lfRXYhGnGvAK3hEHOB3XoXQ8LSdAgSSZT3Yv0uMGFcaSfHh6rVV4V9gH
   54sBDGz4Cmgk82FbxTGMLU5MP3cDVwLtyLzXsSwoe1eK7nYMTel1hA1ys
   BjtAZ0di7JFWcXWSzjnm+O0gDNGUmYqFFeZYY31amkscr9kpJUFGkncte
   S5vJKYAZEjDLBTWPx9NstbbQua558kMzjD9jgnhhd0YBIJHtZ9KOZsjF8
   MMATvNw4H+4A4Avu59Rqg3qzhCvGY265lHru9PSMviFp03YGBvvHvsKwt
   fAUxmGwt3p2q8OconO39gBK3YIdWHCmoKnRFuO7W8T9bVmwZsbdC5IG1C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343657431"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="343657431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="738198736"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="738198736"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 02:25:25 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2ThM-000JDH-1H;
	Fri, 26 May 2023 09:25:24 +0000
Date: Fri, 26 May 2023 17:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Danielle Ratson <danieller@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 82/100] net/bridge/br.c:241:23: error:
 implicit declaration of function 'br_switchdev_port_replay'; did you mean
 'br_switchdev_port_offload'?
Message-ID: <202305261700.WzCRKMGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   c427b9397e54c14546a250b6329ae6ec02b6aa35
commit: 28e3430527466ec1bc7c865f9f5d804ffcf236f3 [82/100] net: switchdev: Add a helper to replay objects on a bridge port
config: openrisc-randconfig-r031-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261700.WzCRKMGw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/28e3430527466ec1bc7c865f9f5d804ffcf236f3
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw combined_queue
        git checkout 28e3430527466ec1bc7c865f9f5d804ffcf236f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash net/bridge/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261700.WzCRKMGw-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br.c: In function 'br_switchdev_blocking_event':
>> net/bridge/br.c:241:23: error: implicit declaration of function 'br_switchdev_port_replay'; did you mean 'br_switchdev_port_offload'? [-Werror=implicit-function-declaration]
     241 |                 err = br_switchdev_port_replay(p, b->dev, b->ctx, b->atomic_nb,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                       br_switchdev_port_offload
   cc1: some warnings being treated as errors


vim +241 net/bridge/br.c

   204	
   205	/* called under rtnl_mutex */
   206	static int br_switchdev_blocking_event(struct notifier_block *nb,
   207					       unsigned long event, void *ptr)
   208	{
   209		struct netlink_ext_ack *extack = netdev_notifier_info_to_extack(ptr);
   210		struct net_device *dev = switchdev_notifier_info_to_dev(ptr);
   211		struct switchdev_notifier_brport_info *brport_info;
   212		const struct switchdev_brport *b;
   213		struct net_bridge_port *p;
   214		int err = NOTIFY_DONE;
   215	
   216		p = br_port_get_rtnl(dev);
   217		if (!p)
   218			goto out;
   219	
   220		switch (event) {
   221		case SWITCHDEV_BRPORT_OFFLOADED:
   222			brport_info = ptr;
   223			b = &brport_info->brport;
   224	
   225			err = br_switchdev_port_offload(p, b->dev, b->ctx,
   226							b->atomic_nb, b->blocking_nb,
   227							b->tx_fwd_offload, extack);
   228			err = notifier_from_errno(err);
   229			break;
   230		case SWITCHDEV_BRPORT_UNOFFLOADED:
   231			brport_info = ptr;
   232			b = &brport_info->brport;
   233	
   234			br_switchdev_port_unoffload(p, b->ctx, b->atomic_nb,
   235						    b->blocking_nb);
   236			break;
   237		case SWITCHDEV_BRPORT_REPLAY:
   238			brport_info = ptr;
   239			b = &brport_info->brport;
   240	
 > 241			err = br_switchdev_port_replay(p, b->dev, b->ctx, b->atomic_nb,
   242						       b->blocking_nb, extack);
   243			err = notifier_from_errno(err);
   244			break;
   245		}
   246	
   247	out:
   248		return err;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
