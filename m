Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669B1116
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677669917; x=1709205917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAXKStIoQ8GZYQ4MvYngkyH4KqBY/pYFyMKjRKEDOVo=;
  b=I+SO6GMBLxCbZaf/SAqLIKJ/R6GXbisHJxRQ9yL7IVK8HqrEP5P5zsQg
   CdxxiNL2G+A6X5avMGoVqs5l46h/IjIwaPqM8fDVyWliiAAtPK1t58UQT
   tt5zXXUbg6Pdn11Rat8QWNu09brR96Gc+7gi3+zZvhVMDHvDOdAfkdwo+
   Zw8gfWywwyakd8OMxm6hcwKUsj52lFT290CYJe5whhcQRggVFWOYHDBu0
   98iF2yPUpEfQJ91olzDsX6B0PCeLKHu8CPBiz6fUrnFvS3l4r9UlKhhVI
   t9yMTx0NWHe+Eu+DoJWY8k1IFcwjf4ToCNRsMIhSB+HjK0LIinlqydGS+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="361964033"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="361964033"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 03:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="920211568"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="920211568"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Mar 2023 03:25:15 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXKaB-00066l-04;
	Wed, 01 Mar 2023 11:25:15 +0000
Date: Wed, 1 Mar 2023 19:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:bus_cleanup 22/36]
 drivers/ata/pata_parport/pata_parport.c:618:20: error: initialization of
 'ssize_t (*)(const struct bus_type *, const char *, size_t)' {aka 'int
 (*)(const struct bus_type *, const char *, unsigned int)'} from incompatible
 pointer type 'ssize_t (*)(struct b...
Message-ID: <202303011947.T9OsRu7f-lkp@intel.com>
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
commit: 40cef43fa58c8d53ea4c4a531facada6147216e7 [22/36] driver core: bus: mark the struct bus_type for sysfs callbacks as constant
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230301/202303011947.T9OsRu7f-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=40cef43fa58c8d53ea4c4a531facada6147216e7
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core bus_cleanup
        git checkout 40cef43fa58c8d53ea4c4a531facada6147216e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/ata/pata_parport/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011947.T9OsRu7f-lkp@intel.com/

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
