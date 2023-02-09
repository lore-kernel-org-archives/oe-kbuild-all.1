Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA428E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 23:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675983814; x=1707519814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQMaAMKCbYboTnODOigDAPqkG1qaRZ+Y8HUfOV+pEC4=;
  b=bZrq3E+N/2OQfD7p6ggfFlwYxwbPt6Xk0xERZX6B4rVgSZqR2ZfF/8XB
   VAFYzQ5HO7hWpKUorp1rr/lON8PL0syNIJqcAxdAjjmhdpHq3GdrLFfNX
   GtBa3qHyNYhAcJexfMct6F959jgUukQJtc8jCyH2XA1IBNH9geph2vgpT
   4dLN6D56OiQDhcrHTuFCApOmE80xa4zxlfwAO1y4m9OZsplM9GD/fLAIJ
   bk1UyZUNUmwslB9AziYguwBhteFacuEvHXn9GCJww3Ed16EqDtcByu1Hs
   a95E7wOy1xGcGa5WynmAXwwYfAPgLq0R+b2IptOPlRdgizSsVEUQCJaW0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="394871043"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="394871043"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 15:03:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="731511981"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="731511981"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2023 15:03:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQFwc-0005Mo-2f;
	Thu, 09 Feb 2023 23:03:10 +0000
Date: Fri, 10 Feb 2023 07:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:kobject-const-2 71/78]
 drivers/sh/intc/userimask.c:67:46: error: 'struct bus_type' has no member
 named 'dev_root'
Message-ID: <202302100648.6stAb27m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git kobject-const-2
head:   0be8abebbd476395ee73f4a83d4988dc9958f83c
commit: 7389911cf9a8bc346a6aa2662645298627c44cb6 [71/78] driver core: bus: move dev_root out of struct bus_type
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230210/202302100648.6stAb27m-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=7389911cf9a8bc346a6aa2662645298627c44cb6
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core kobject-const-2
        git checkout 7389911cf9a8bc346a6aa2662645298627c44cb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100648.6stAb27m-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/sh/intc/userimask.c: In function 'userimask_sysdev_init':
>> drivers/sh/intc/userimask.c:67:46: error: 'struct bus_type' has no member named 'dev_root'
      67 |         return device_create_file(intc_subsys.dev_root, &dev_attr_userimask);
         |                                              ^
   drivers/sh/intc/userimask.c:68:1: error: control reaches end of non-void function [-Werror=return-type]
      68 | }
         | ^
   cc1: some warnings being treated as errors


vim +67 drivers/sh/intc/userimask.c

2be6bb0c79c7fb Paul Mundt  2010-10-05  57  
f4e73bfcd9cca0 Kay Sievers 2011-12-21  58  static DEVICE_ATTR(userimask, S_IRUSR | S_IWUSR,
2be6bb0c79c7fb Paul Mundt  2010-10-05  59  		   show_intc_userimask, store_intc_userimask);
2be6bb0c79c7fb Paul Mundt  2010-10-05  60  
2be6bb0c79c7fb Paul Mundt  2010-10-05  61  
2be6bb0c79c7fb Paul Mundt  2010-10-05  62  static int __init userimask_sysdev_init(void)
2be6bb0c79c7fb Paul Mundt  2010-10-05  63  {
2be6bb0c79c7fb Paul Mundt  2010-10-05  64  	if (unlikely(!uimask))
2be6bb0c79c7fb Paul Mundt  2010-10-05  65  		return -ENXIO;
2be6bb0c79c7fb Paul Mundt  2010-10-05  66  
f4e73bfcd9cca0 Kay Sievers 2011-12-21 @67  	return device_create_file(intc_subsys.dev_root, &dev_attr_userimask);
2be6bb0c79c7fb Paul Mundt  2010-10-05  68  }
2be6bb0c79c7fb Paul Mundt  2010-10-05  69  late_initcall(userimask_sysdev_init);
2be6bb0c79c7fb Paul Mundt  2010-10-05  70  

:::::: The code at line 67 was first introduced by commit
:::::: f4e73bfcd9cca0b64cc8096175852936fb1d111f sh: intc - convert sysdev_class to a regular subsystem

:::::: TO: Kay Sievers <kay.sievers@vrfy.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
