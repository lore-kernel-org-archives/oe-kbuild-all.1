Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D29A7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 04:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678507243; x=1710043243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XpY+I9XmzHcHMDOHMDWQgmRo3bGs36Sp42F5TDxUJvo=;
  b=kqI1WarCLfz37uYbSWPVxlpipeO+0FxDAKM778fVHl9HATIY3Sw09qnX
   VO2ZDZSoI4MbG1MSynMTiGG2Dln/H0EF+6hvgZZiJoIvYhQ8Upxk0BCYz
   iqYDZW1iP6ef5tQxVziHKX6sBrrIH9Rcw56G18aDDhd9J8ehOL41wVJab
   AEhdsWeYEkv5aScqPgZxClFquT8nnBlPDLWNhNUU/4e2jMHGij+srsZuw
   V4tud0IsRfkwbbcIu6ki/21+SOlCotwcZDsda0x51PyB6vdkaK+KbcMhf
   leR8l4gV19wgPfmWVJNkI0dd09Tcuoz1ox35OHdrdrqsg8Vu10KnDXLNQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423141690"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="423141690"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 20:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="628053093"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="628053093"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 20:00:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paqPP-0004K3-1m;
	Sat, 11 Mar 2023 04:00:39 +0000
Date: Sat, 11 Mar 2023 12:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Baron <jbaron@akamai.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:modules-next 9/9] lib/dynamic_debug.c:857:6: warning: no
 previous prototype for '__dynamic_pr_debug'
Message-ID: <202303111154.0Bioi0Ph-lkp@intel.com>
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
config: openrisc-randconfig-r002-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111154.0Bioi0Ph-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof modules-next
        git checkout 40cf65c2c7dfb5bd2e553e80c20f4693430b6d4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111154.0Bioi0Ph-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:857:6: warning: no previous prototype for '__dynamic_pr_debug' [-Wmissing-prototypes]
     857 | void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
         |      ^~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:877:6: warning: no previous prototype for '__dynamic_dev_dbg' [-Wmissing-prototypes]
     877 | void __dynamic_dev_dbg(struct _ddebug *descriptor,
         |      ^~~~~~~~~~~~~~~~~


vim +/__dynamic_pr_debug +857 lib/dynamic_debug.c

640d1eaff2c09e Jim Cromie      2021-05-04  856  
906d201530f2c5 Joe Perches     2014-09-24 @857  void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
8ba6ebf583f12d Bart Van Assche 2011-01-23  858  {
8ba6ebf583f12d Bart Van Assche 2011-01-23  859  	va_list args;
431625dac14de7 Jason Baron     2011-10-04  860  	struct va_format vaf;
640d1eaff2c09e Jim Cromie      2021-05-04  861  	char buf[PREFIX_SIZE] = "";
8ba6ebf583f12d Bart Van Assche 2011-01-23  862  
8ba6ebf583f12d Bart Van Assche 2011-01-23  863  	BUG_ON(!descriptor);
8ba6ebf583f12d Bart Van Assche 2011-01-23  864  	BUG_ON(!fmt);
8ba6ebf583f12d Bart Van Assche 2011-01-23  865  
8ba6ebf583f12d Bart Van Assche 2011-01-23  866  	va_start(args, fmt);
798efc60e42768 Joe Perches     2012-09-12  867  
431625dac14de7 Jason Baron     2011-10-04  868  	vaf.fmt = fmt;
431625dac14de7 Jason Baron     2011-10-04  869  	vaf.va = &args;
798efc60e42768 Joe Perches     2012-09-12  870  
906d201530f2c5 Joe Perches     2014-09-24  871  	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
798efc60e42768 Joe Perches     2012-09-12  872  
8ba6ebf583f12d Bart Van Assche 2011-01-23  873  	va_end(args);
8ba6ebf583f12d Bart Van Assche 2011-01-23  874  }
8ba6ebf583f12d Bart Van Assche 2011-01-23  875  EXPORT_SYMBOL(__dynamic_pr_debug);
8ba6ebf583f12d Bart Van Assche 2011-01-23  876  
906d201530f2c5 Joe Perches     2014-09-24 @877  void __dynamic_dev_dbg(struct _ddebug *descriptor,
cbc4663552ee47 Joe Perches     2011-08-11  878  		      const struct device *dev, const char *fmt, ...)
cbc4663552ee47 Joe Perches     2011-08-11  879  {
cbc4663552ee47 Joe Perches     2011-08-11  880  	struct va_format vaf;
cbc4663552ee47 Joe Perches     2011-08-11  881  	va_list args;
cbc4663552ee47 Joe Perches     2011-08-11  882  
cbc4663552ee47 Joe Perches     2011-08-11  883  	BUG_ON(!descriptor);
cbc4663552ee47 Joe Perches     2011-08-11  884  	BUG_ON(!fmt);
cbc4663552ee47 Joe Perches     2011-08-11  885  
cbc4663552ee47 Joe Perches     2011-08-11  886  	va_start(args, fmt);
798efc60e42768 Joe Perches     2012-09-12  887  
cbc4663552ee47 Joe Perches     2011-08-11  888  	vaf.fmt = fmt;
cbc4663552ee47 Joe Perches     2011-08-11  889  	vaf.va = &args;
798efc60e42768 Joe Perches     2012-09-12  890  
798efc60e42768 Joe Perches     2012-09-12  891  	if (!dev) {
906d201530f2c5 Joe Perches     2014-09-24  892  		printk(KERN_DEBUG "(NULL device *): %pV", &vaf);
798efc60e42768 Joe Perches     2012-09-12  893  	} else {
640d1eaff2c09e Jim Cromie      2021-05-04  894  		char buf[PREFIX_SIZE] = "";
798efc60e42768 Joe Perches     2012-09-12  895  
a39d4a857d4bb0 Joe Perches     2014-12-10  896  		dev_printk_emit(LOGLEVEL_DEBUG, dev, "%s%s %s: %pV",
798efc60e42768 Joe Perches     2012-09-12  897  				dynamic_emit_prefix(descriptor, buf),
666f355f3805d6 Joe Perches     2012-09-12  898  				dev_driver_string(dev), dev_name(dev),
666f355f3805d6 Joe Perches     2012-09-12  899  				&vaf);
798efc60e42768 Joe Perches     2012-09-12  900  	}
798efc60e42768 Joe Perches     2012-09-12  901  
cbc4663552ee47 Joe Perches     2011-08-11  902  	va_end(args);
cbc4663552ee47 Joe Perches     2011-08-11  903  }
cbc4663552ee47 Joe Perches     2011-08-11  904  EXPORT_SYMBOL(__dynamic_dev_dbg);
cbc4663552ee47 Joe Perches     2011-08-11  905  

:::::: The code at line 857 was first introduced by commit
:::::: 906d201530f2c52aeb4eee31895c71cdccf1e9a0 dynamic_debug: change __dynamic_<foo>_dbg return types to void

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
