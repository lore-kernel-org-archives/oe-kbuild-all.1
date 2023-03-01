Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65F7F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 01:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677633541; x=1709169541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TvF1MVjMrsp9d62Zv4rO7a2lufCC3TVj1puY2Vhirk=;
  b=MhLJfqkifatwjTmIxQnHDrwZTGkPtfntPG/IA/579BGHfxHq2yDY11Dc
   FgUCBJ8w6WxoKGOZvHYtK9VOcevPsq6vyRNcZxbD9gVjUoOFyjcDbl4h0
   g2HP2jMYzMDL2GHQ/8V73dn/w1qQlDYhLSfoFxazKIKKkgy0Z0Gx0UYco
   sU+Z/GwuQ2h+ARKqbRchLm6yVWV80HIeLUJ0vctxFtMV8aBvgUB0VWz1i
   vNsE/MRBxvnijbf77L0Woyz04W6+dbRvOmSgZ15iKrifZsjVVTXzHfSS9
   ddCkR5su8CGODHpyEJGq3ibOIDi7geOWNBxDcTDaEOzGmliBsF43wr6wr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314715044"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="314715044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 17:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="624275931"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="624275931"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Feb 2023 17:18:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXB7S-0005mf-1q;
	Wed, 01 Mar 2023 01:18:58 +0000
Date: Wed, 1 Mar 2023 09:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:bus_cleanup 22/36]
 drivers/ata/pata_parport/pata_parport.c:618:20: error: initialization of
 'ssize_t (*)(const struct bus_type *, const char *, size_t)' {aka 'int
 (*)(const struct bus_type *, const char *, unsigned int)'} from incompatible
 pointer type 'ssize_t (*)(struct b...
Message-ID: <202303010953.nAJe0ITf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git bus_cleanup
head:   5447398fb1728b20784bfde814b2d524b9cb051a
commit: 16f725b161c2f7db9ecd3b3af38b87ad6078ac4e [22/36] driver core: bus: mark the struct bus_type for sysfs callbacks as constant
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230301/202303010953.nAJe0ITf-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=16f725b161c2f7db9ecd3b3af38b87ad6078ac4e
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core bus_cleanup
        git checkout 16f725b161c2f7db9ecd3b3af38b87ad6078ac4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/ata/pata_parport/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010953.nAJe0ITf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from drivers/ata/pata_parport/pata_parport.c:7:
>> drivers/ata/pata_parport/pata_parport.c:618:20: error: initialization of 'ssize_t (*)(const struct bus_type *, const char *, size_t)' {aka 'int (*)(const struct bus_type *, const char *, unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct bus_type *, const char *, size_t)' {aka 'int (*)(struct bus_type *, const char *, unsigned int)'} [-Werror=incompatible-pointer-types]
     618 | static BUS_ATTR_WO(new_device);
         |                    ^~~~~~~~~~
   include/linux/sysfs.h:135:19: note: in definition of macro '__ATTR_WO'
     135 |         .store  = _name##_store,                                        \
         |                   ^~~~~
   drivers/ata/pata_parport/pata_parport.c:618:8: note: in expansion of macro 'BUS_ATTR_WO'
     618 | static BUS_ATTR_WO(new_device);
         |        ^~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c:618:20: note: (near initialization for 'bus_attr_new_device.store')
     618 | static BUS_ATTR_WO(new_device);
         |                    ^~~~~~~~~~
   include/linux/sysfs.h:135:19: note: in definition of macro '__ATTR_WO'
     135 |         .store  = _name##_store,                                        \
         |                   ^~~~~
   drivers/ata/pata_parport/pata_parport.c:618:8: note: in expansion of macro 'BUS_ATTR_WO'
     618 | static BUS_ATTR_WO(new_device);
         |        ^~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c:650:20: error: initialization of 'ssize_t (*)(const struct bus_type *, const char *, size_t)' {aka 'int (*)(const struct bus_type *, const char *, unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct bus_type *, const char *, size_t)' {aka 'int (*)(struct bus_type *, const char *, unsigned int)'} [-Werror=incompatible-pointer-types]
     650 | static BUS_ATTR_WO(delete_device);
         |                    ^~~~~~~~~~~~~
   include/linux/sysfs.h:135:19: note: in definition of macro '__ATTR_WO'
     135 |         .store  = _name##_store,                                        \
         |                   ^~~~~
   drivers/ata/pata_parport/pata_parport.c:650:8: note: in expansion of macro 'BUS_ATTR_WO'
     650 | static BUS_ATTR_WO(delete_device);
         |        ^~~~~~~~~~~
   drivers/ata/pata_parport/pata_parport.c:650:20: note: (near initialization for 'bus_attr_delete_device.store')
     650 | static BUS_ATTR_WO(delete_device);
         |                    ^~~~~~~~~~~~~
   include/linux/sysfs.h:135:19: note: in definition of macro '__ATTR_WO'
     135 |         .store  = _name##_store,                                        \
         |                   ^~~~~
   drivers/ata/pata_parport/pata_parport.c:650:8: note: in expansion of macro 'BUS_ATTR_WO'
     650 | static BUS_ATTR_WO(delete_device);
         |        ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +618 drivers/ata/pata_parport/pata_parport.c

246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  556  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  557  static ssize_t new_device_store(struct bus_type *bus, const char *buf,
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  558  				size_t count)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  559  {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  560  	char port[12] = "auto";
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  561  	char protocol[8] = "auto";
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  562  	int mode = -1, unit = -1, delay = -1;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  563  	struct pi_protocol *pr, *pr_wanted;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  564  	struct device_driver *drv;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  565  	struct parport *parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  566  	int port_num, port_wanted, pr_num;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  567  	bool ok = false;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  568  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  569  	if (sscanf(buf, "%11s %7s %d %d %d",
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  570  			port, protocol, &mode, &unit, &delay) < 1)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  571  		return -EINVAL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  572  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  573  	if (sscanf(port, "parport%u", &port_wanted) < 1) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  574  		if (strcmp(port, "auto")) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  575  			pr_err("invalid port name %s\n", port);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  576  			return -EINVAL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  577  		}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  578  		port_wanted = -1;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  579  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  580  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  581  	drv = driver_find(protocol, &pata_parport_bus_type);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  582  	if (!drv) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  583  		if (strcmp(protocol, "auto")) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  584  			pr_err("protocol %s not found\n", protocol);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  585  			return -EINVAL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  586  		}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  587  		pr_wanted = NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  588  	} else {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  589  		pr_wanted = container_of(drv, struct pi_protocol, driver);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  590  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  591  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  592  	mutex_lock(&pi_mutex);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  593  	/* walk all parports */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  594  	idr_for_each_entry(&parport_list, parport, port_num) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  595  		if (port_num == port_wanted || port_wanted == -1) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  596  			parport = parport_find_number(port_num);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  597  			if (!parport) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  598  				pr_err("no such port %s\n", port);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  599  				mutex_unlock(&pi_mutex);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  600  				return -ENODEV;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  601  			}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  602  			/* walk all protocols */
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  603  			idr_for_each_entry(&protocols, pr, pr_num) {
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  604  				if (pr == pr_wanted || !pr_wanted)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  605  					if (pi_init_one(parport, pr, mode, unit,
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  606  							delay))
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  607  						ok = true;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  608  			}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  609  			parport_put_port(parport);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  610  		}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  611  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  612  	mutex_unlock(&pi_mutex);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  613  	if (!ok)
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  614  		return -ENODEV;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  615  
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  616  	return count;
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  617  }
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23 @618  static BUS_ATTR_WO(new_device);
246a1c4c6b7ffb drivers/ata/pata_parport.c Ondrej Zary 2023-01-23  619  

:::::: The code at line 618 was first introduced by commit
:::::: 246a1c4c6b7ffba88a2553d2b88f7b6280f253a2 ata: pata_parport: add driver (PARIDE replacement)

:::::: TO: Ondrej Zary <linux@zary.sk>
:::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
