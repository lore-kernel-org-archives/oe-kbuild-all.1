Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7841377
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 03:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693367729; x=1724903729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UYm+oAmnNyaQYWyiDSxQNloSuMEtmQ+hsqAQRKUJ7mw=;
  b=P7SY8GKzUnjhnSWI8xhaUab/2r3reayp09JoKAMBqDtX57l1VEyrJCfe
   iUxGnOSVMObqL+Mzt/oIOa7JZl8mgHkJGL6q0t9uwINeOlw0YKvIYkO0U
   S+GhoRcdvXfcdrmmTg03mlTSYX3Z9Oxx4ax8j6v6hJjDEo9PvF6gl/YNy
   tL1NbHTeiFwT0IfjVmMZiO3RDHYsv+1uIcaGB6eeL7KsA8gxpURDc9UY8
   Y34S9OwlRDDU2OesuUKcV9/V3fIaHefTk12RdNXF31n7d/Xx5nAGi6ZYK
   CYhHrFZBd9lqCAplerj6l0Ki/R640Lt7Pr7eUbLjS2spneBmJ+5QI15Jm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378255864"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="378255864"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 20:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="768285515"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="768285515"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Aug 2023 20:55:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCIg-0009OJ-0W;
	Wed, 30 Aug 2023 03:55:26 +0000
Date: Wed, 30 Aug 2023 11:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/usb/gadget/function/f_accessory.c:270:20: warning: implicit
 truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1
Message-ID: <202308301110.PBuqJJQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Benoit,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: fc65a210c3bffecf9ea9ef0b77b8252e2f393102 ANDROID: usb: gadget: f_accessory: Add Android Accessory function
date:   2 years, 9 months ago
config: i386-randconfig-003-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301110.PBuqJJQE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301110.PBuqJJQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301110.PBuqJJQE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_accessory.c:270:20: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
           dev->disconnected = 1;
                             ^ ~
   drivers/usb/gadget/function/f_accessory.c:772:25: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
           _acc_dev->disconnected = 1;
                                  ^ ~
   drivers/usb/gadget/function/f_accessory.c:822:5: warning: no previous prototype for function 'acc_ctrlrequest' [-Wmissing-prototypes]
   int acc_ctrlrequest(struct usb_composite_dev *cdev,
       ^
   drivers/usb/gadget/function/f_accessory.c:822:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest(struct usb_composite_dev *cdev,
   ^
   static 
   drivers/usb/gadget/function/f_accessory.c:1172:14: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
           dev->online = 1;
                       ^ ~
   drivers/usb/gadget/function/f_accessory.c:1232:6: warning: no previous prototype for function 'acc_disconnect' [-Wmissing-prototypes]
   void acc_disconnect(void)
        ^
   drivers/usb/gadget/function/f_accessory.c:1232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void acc_disconnect(void)
   ^
   static 
   drivers/usb/gadget/function/f_accessory.c:1303:18: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
           struct acc_dev *dev;
                           ^
   drivers/usb/gadget/function/f_accessory.c:1330:5: warning: no previous prototype for function 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
   int acc_ctrlrequest_configfs(struct usb_function *f,
       ^
   drivers/usb/gadget/function/f_accessory.c:1330:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acc_ctrlrequest_configfs(struct usb_function *f,
   ^
   static 
   7 warnings generated.


vim +/int +270 drivers/usb/gadget/function/f_accessory.c

   267	
   268	static void acc_set_disconnected(struct acc_dev *dev)
   269	{
 > 270		dev->disconnected = 1;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
