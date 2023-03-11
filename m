Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4DA7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 05:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678510963; x=1710046963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnixHhyFMp/OHQdxiGvp2nKgtDueEoWkEPOnjFT/8yY=;
  b=kvISHx7VZh61+XVexHnSzR2W8PpraHmM4eigpBEBENx9DZUS1iGNRmuY
   Nh880IXa2/w9pvHwYa9KuXgcW6cBjNj0M+Gx3+conc0GHQRZ7dr0giyNK
   7Po9vFL0zrIhUAWAdATKDotUsz+ivYEWxcJc6Dp6e6+oEuRGTyYNUFHVE
   1b7LSZo5YVb7G+8IvJEut45g5N9ZeshpbLEx3DFGXe2yHmEHcNsd4oLu0
   AZ+xeYrfjR2bld14GcOzyyeu0WXC9QSvo0KO1hiIFNF0tM27kwdlksPz5
   Gjm+nGVMeHiQbC3pnt5pnguOlNWexyi0LZ0QD4qOjZOa4c/qLeMcShHeM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335574616"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="335574616"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 21:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788296204"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="788296204"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 21:02:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1parNQ-0004Ll-1s;
	Sat, 11 Mar 2023 05:02:40 +0000
Date: Sat, 11 Mar 2023 13:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Baron <jbaron@akamai.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:modules-next 9/9] lib/dynamic_debug.c:857:6: warning: no
 previous prototype for '__dynamic_pr_debug'
Message-ID: <202303111333.Rqs7rhRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
head:   40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
commit: 40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d [9/9] dyndbg: cleanup dynamic usage in ib_srp.c
config: parisc-randconfig-r011-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111333.Rqs7rhRE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof modules-next
        git checkout 40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111333.Rqs7rhRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:857:6: warning: no previous prototype for '__dynamic_pr_debug' [-Wmissing-prototypes]
     857 | void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
         |      ^~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:877:6: warning: no previous prototype for '__dynamic_dev_dbg' [-Wmissing-prototypes]
     877 | void __dynamic_dev_dbg(struct _ddebug *descriptor,
         |      ^~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:908:6: warning: no previous prototype for '__dynamic_netdev_dbg' [-Wmissing-prototypes]
     908 | void __dynamic_netdev_dbg(struct _ddebug *descriptor,
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/__dynamic_pr_debug +857 lib/dynamic_debug.c

640d1eaff2c09e Jim Cromie       2021-05-04  856  
906d201530f2c5 Joe Perches      2014-09-24 @857  void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
8ba6ebf583f12d Bart Van Assche  2011-01-23  858  {
8ba6ebf583f12d Bart Van Assche  2011-01-23  859  	va_list args;
431625dac14de7 Jason Baron      2011-10-04  860  	struct va_format vaf;
640d1eaff2c09e Jim Cromie       2021-05-04  861  	char buf[PREFIX_SIZE] = "";
8ba6ebf583f12d Bart Van Assche  2011-01-23  862  
8ba6ebf583f12d Bart Van Assche  2011-01-23  863  	BUG_ON(!descriptor);
8ba6ebf583f12d Bart Van Assche  2011-01-23  864  	BUG_ON(!fmt);
8ba6ebf583f12d Bart Van Assche  2011-01-23  865  
8ba6ebf583f12d Bart Van Assche  2011-01-23  866  	va_start(args, fmt);
798efc60e42768 Joe Perches      2012-09-12  867  
431625dac14de7 Jason Baron      2011-10-04  868  	vaf.fmt = fmt;
431625dac14de7 Jason Baron      2011-10-04  869  	vaf.va = &args;
798efc60e42768 Joe Perches      2012-09-12  870  
906d201530f2c5 Joe Perches      2014-09-24  871  	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
798efc60e42768 Joe Perches      2012-09-12  872  
8ba6ebf583f12d Bart Van Assche  2011-01-23  873  	va_end(args);
8ba6ebf583f12d Bart Van Assche  2011-01-23  874  }
8ba6ebf583f12d Bart Van Assche  2011-01-23  875  EXPORT_SYMBOL(__dynamic_pr_debug);
8ba6ebf583f12d Bart Van Assche  2011-01-23  876  
906d201530f2c5 Joe Perches      2014-09-24 @877  void __dynamic_dev_dbg(struct _ddebug *descriptor,
cbc4663552ee47 Joe Perches      2011-08-11  878  		      const struct device *dev, const char *fmt, ...)
cbc4663552ee47 Joe Perches      2011-08-11  879  {
cbc4663552ee47 Joe Perches      2011-08-11  880  	struct va_format vaf;
cbc4663552ee47 Joe Perches      2011-08-11  881  	va_list args;
cbc4663552ee47 Joe Perches      2011-08-11  882  
cbc4663552ee47 Joe Perches      2011-08-11  883  	BUG_ON(!descriptor);
cbc4663552ee47 Joe Perches      2011-08-11  884  	BUG_ON(!fmt);
cbc4663552ee47 Joe Perches      2011-08-11  885  
cbc4663552ee47 Joe Perches      2011-08-11  886  	va_start(args, fmt);
798efc60e42768 Joe Perches      2012-09-12  887  
cbc4663552ee47 Joe Perches      2011-08-11  888  	vaf.fmt = fmt;
cbc4663552ee47 Joe Perches      2011-08-11  889  	vaf.va = &args;
798efc60e42768 Joe Perches      2012-09-12  890  
798efc60e42768 Joe Perches      2012-09-12  891  	if (!dev) {
906d201530f2c5 Joe Perches      2014-09-24  892  		printk(KERN_DEBUG "(NULL device *): %pV", &vaf);
798efc60e42768 Joe Perches      2012-09-12  893  	} else {
640d1eaff2c09e Jim Cromie       2021-05-04  894  		char buf[PREFIX_SIZE] = "";
798efc60e42768 Joe Perches      2012-09-12  895  
a39d4a857d4bb0 Joe Perches      2014-12-10  896  		dev_printk_emit(LOGLEVEL_DEBUG, dev, "%s%s %s: %pV",
798efc60e42768 Joe Perches      2012-09-12  897  				dynamic_emit_prefix(descriptor, buf),
666f355f3805d6 Joe Perches      2012-09-12  898  				dev_driver_string(dev), dev_name(dev),
666f355f3805d6 Joe Perches      2012-09-12  899  				&vaf);
798efc60e42768 Joe Perches      2012-09-12  900  	}
798efc60e42768 Joe Perches      2012-09-12  901  
cbc4663552ee47 Joe Perches      2011-08-11  902  	va_end(args);
cbc4663552ee47 Joe Perches      2011-08-11  903  }
cbc4663552ee47 Joe Perches      2011-08-11  904  EXPORT_SYMBOL(__dynamic_dev_dbg);
cbc4663552ee47 Joe Perches      2011-08-11  905  
0feefd97861f9b Jason Baron      2011-10-04  906  #ifdef CONFIG_NET
0feefd97861f9b Jason Baron      2011-10-04  907  
906d201530f2c5 Joe Perches      2014-09-24 @908  void __dynamic_netdev_dbg(struct _ddebug *descriptor,
ffa10cb47a94c9 Jason Baron      2011-08-11  909  			  const struct net_device *dev, const char *fmt, ...)
ffa10cb47a94c9 Jason Baron      2011-08-11  910  {
ffa10cb47a94c9 Jason Baron      2011-08-11  911  	struct va_format vaf;
ffa10cb47a94c9 Jason Baron      2011-08-11  912  	va_list args;
ffa10cb47a94c9 Jason Baron      2011-08-11  913  
ffa10cb47a94c9 Jason Baron      2011-08-11  914  	BUG_ON(!descriptor);
ffa10cb47a94c9 Jason Baron      2011-08-11  915  	BUG_ON(!fmt);
ffa10cb47a94c9 Jason Baron      2011-08-11  916  
ffa10cb47a94c9 Jason Baron      2011-08-11  917  	va_start(args, fmt);
b004ff4972e2a4 Joe Perches      2012-09-12  918  
ffa10cb47a94c9 Jason Baron      2011-08-11  919  	vaf.fmt = fmt;
ffa10cb47a94c9 Jason Baron      2011-08-11  920  	vaf.va = &args;
b004ff4972e2a4 Joe Perches      2012-09-12  921  
b004ff4972e2a4 Joe Perches      2012-09-12  922  	if (dev && dev->dev.parent) {
640d1eaff2c09e Jim Cromie       2021-05-04  923  		char buf[PREFIX_SIZE] = "";
b004ff4972e2a4 Joe Perches      2012-09-12  924  
a39d4a857d4bb0 Joe Perches      2014-12-10  925  		dev_printk_emit(LOGLEVEL_DEBUG, dev->dev.parent,
ccc7f4968a18b9 Veaceslav Falico 2014-07-17  926  				"%s%s %s %s%s: %pV",
b004ff4972e2a4 Joe Perches      2012-09-12  927  				dynamic_emit_prefix(descriptor, buf),
b004ff4972e2a4 Joe Perches      2012-09-12  928  				dev_driver_string(dev->dev.parent),
b004ff4972e2a4 Joe Perches      2012-09-12  929  				dev_name(dev->dev.parent),
ccc7f4968a18b9 Veaceslav Falico 2014-07-17  930  				netdev_name(dev), netdev_reg_state(dev),
ccc7f4968a18b9 Veaceslav Falico 2014-07-17  931  				&vaf);
b004ff4972e2a4 Joe Perches      2012-09-12  932  	} else if (dev) {
906d201530f2c5 Joe Perches      2014-09-24  933  		printk(KERN_DEBUG "%s%s: %pV", netdev_name(dev),
ccc7f4968a18b9 Veaceslav Falico 2014-07-17  934  		       netdev_reg_state(dev), &vaf);
b004ff4972e2a4 Joe Perches      2012-09-12  935  	} else {
906d201530f2c5 Joe Perches      2014-09-24  936  		printk(KERN_DEBUG "(NULL net_device): %pV", &vaf);
b004ff4972e2a4 Joe Perches      2012-09-12  937  	}
b004ff4972e2a4 Joe Perches      2012-09-12  938  
ffa10cb47a94c9 Jason Baron      2011-08-11  939  	va_end(args);
ffa10cb47a94c9 Jason Baron      2011-08-11  940  }
ffa10cb47a94c9 Jason Baron      2011-08-11  941  EXPORT_SYMBOL(__dynamic_netdev_dbg);
ffa10cb47a94c9 Jason Baron      2011-08-11  942  

:::::: The code at line 857 was first introduced by commit
:::::: 906d201530f2c52aeb4eee31895c71cdccf1e9a0 dynamic_debug: change __dynamic_<foo>_dbg return types to void

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
