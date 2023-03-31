Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E5A23BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680257559; x=1711793559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DP3yk9yYrBBnw+et9CEbq4vAq1ZuxAEy0EEQKOG0Ywk=;
  b=gmBEOBAWtkjCZGuOqymwiZPYHbV0I/knSyT4CK2v0N/i3jDOGXfQpO87
   u0NzB3ygGv/ikUlPVNmwQjvIse4bH8UhEMrONM3i1kiAyM71d/J94YTRL
   hGUNUBib6tIEWd0yQOFqDqFkNj/KtoIqIWBqfxS26XlWVS58ajjSo5IFP
   s/TKWg+/3e0lVcuzy4mTFOi29dXVz81vM+GMTLOi+mATDehI5+qgoev3p
   rwgFQN/KcVb6cTFL5ho2E+9+S6x4tyV2EoZgffXbFLbkDPHQbTjiXKW9H
   UP4WH2zaGu0fkGQoMXIJucVOG22Efw9njO3yznQyehSfiFg2OCLE705FO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343074058"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="343074058"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 03:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678566051"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="678566051"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Mar 2023 03:12:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piBkF-000Lg0-1R;
	Fri, 31 Mar 2023 10:12:31 +0000
Date: Fri, 31 Mar 2023 18:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:class_cleanup 105/105] drivers/char/dsp56k.c:509:31:
 error: 'dsp45k_class' undeclared; did you mean 'dsp56k_class'?
Message-ID: <202303311810.ETd3fMAl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   14c5a0d89561a3a5b20f1b2216395161444208a9
commit: 14c5a0d89561a3a5b20f1b2216395161444208a9 [105/105] driver core: convert class_create() to class_register()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230331/202303311810.ETd3fMAl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=14c5a0d89561a3a5b20f1b2216395161444208a9
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout 14c5a0d89561a3a5b20f1b2216395161444208a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311810.ETd3fMAl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/dsp56k.c: In function 'dsp56k_init_driver':
>> drivers/char/dsp56k.c:509:31: error: 'dsp45k_class' undeclared (first use in this function); did you mean 'dsp56k_class'?
     509 |         err = class_register(&dsp45k_class);
         |                               ^~~~~~~~~~~~
         |                               dsp56k_class
   drivers/char/dsp56k.c:509:31: note: each undeclared identifier is reported only once for each function it appears in


vim +509 drivers/char/dsp56k.c

   495	
   496	static int __init dsp56k_init_driver(void)
   497	{
   498		int err;
   499	
   500		if(!MACH_IS_ATARI || !ATARIHW_PRESENT(DSP56K)) {
   501			printk("DSP56k driver: Hardware not present\n");
   502			return -ENODEV;
   503		}
   504	
   505		if(register_chrdev(DSP56K_MAJOR, "dsp56k", &dsp56k_fops)) {
   506			printk("DSP56k driver: Unable to register driver\n");
   507			return -ENODEV;
   508		}
 > 509		err = class_register(&dsp45k_class);
   510		if (err)
   511			goto out_chrdev;
   512		device_create(&dsp56k_class, NULL, MKDEV(DSP56K_MAJOR, 0), NULL,
   513			      "dsp56k");
   514	
   515		printk(banner);
   516		goto out;
   517	
   518	out_chrdev:
   519		unregister_chrdev(DSP56K_MAJOR, "dsp56k");
   520	out:
   521		return err;
   522	}
   523	module_init(dsp56k_init_driver);
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
