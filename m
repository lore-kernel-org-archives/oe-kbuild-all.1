Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE307F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679816981; x=1711352981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6MnFT9qrAEUQkVYK0bSJdJnJcnXrwAOO6zQ8esN5p8=;
  b=A8hDYyuAbJVrtwOibMKzG19SHgw3/whjAxz/TMfGoL3fBlREcxvaJwjU
   JqGDG4EHKNMRrD4Igf36Lr1bKYhQBvpCwNDi82UEkXboPUD93Zpcg5QJ9
   LhfiZI/m9UccWhINpGtn2YOyuqVdbbVR5PTKkv84dCc/JEqyYQl25An2x
   c9FjIrf5SLnqBeScGwFD+th3aHutgPFdsgYtrqU8E/AHPGSfi9T/2kpNR
   29Z2dUuf6Ha9XzUnVzMRMATOoibNsq1lGIDgucBbCrnrfcxmrlXdqbXG3
   Us3wX/jAD35Dg5jpPy90S8a/FW7cq5XPFqOOOQZTCSt1sexulHdGHVp/A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="337565958"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="337565958"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 00:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="683118150"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="683118150"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Mar 2023 00:49:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgL87-000GxP-2d;
	Sun, 26 Mar 2023 07:49:31 +0000
Date: Sun, 26 Mar 2023 15:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 51/60]
 drivers/xen/events/events_base.c:1201:58: error: too few arguments to
 function call, expected 3, have 2
Message-ID: <202303261510.FXfuK9Ic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   86de57a583009244b8dab2847952503da3a08a19
commit: 9cd1b7ae28690f24cc448eb0bf28ec7a237c0224 [51/60] xen/events: link interdomain events to associated xenbus device
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230326/202303261510.FXfuK9Ic-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=9cd1b7ae28690f24cc448eb0bf28ec7a237c0224
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 9cd1b7ae28690f24cc448eb0bf28ec7a237c0224
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261510.FXfuK9Ic-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/xen/events/events_base.c:1201:58: error: too few arguments to function call, expected 3, have 2
           return bind_evtchn_to_irq_chip(evtchn, &xen_lateeoi_chip);
                  ~~~~~~~~~~~~~~~~~~~~~~~                          ^
   drivers/xen/events/events_base.c:1153:12: note: 'bind_evtchn_to_irq_chip' declared here
   static int bind_evtchn_to_irq_chip(evtchn_port_t evtchn, struct irq_chip *chip,
              ^
   drivers/xen/events/events_base.c:1199:5: warning: no previous prototype for function 'bind_evtchn_to_irq_lateeoi' [-Wmissing-prototypes]
   int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
       ^
   drivers/xen/events/events_base.c:1199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
   ^
   static 
   1 warning and 1 error generated.
--
   drivers/tty/hvc/hvc_xen.c:422:47: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct xenbus_device *' [-Wint-conversion]
           irq = bind_interdomain_evtchn_to_irq_lateeoi(dev->otherend_id, evtchn);
                                                        ^~~~~~~~~~~~~~~~
   include/xen/events.h:39:66: note: passing argument to parameter 'dev' here
   int bind_interdomain_evtchn_to_irq_lateeoi(struct xenbus_device *dev,
                                                                    ^
>> drivers/tty/hvc/hvc_xen.c:587:15: error: implicit declaration of function 'bind_evtchn_to_irq_lateeoi' [-Werror,-Wimplicit-function-declaration]
                   info->irq = bind_evtchn_to_irq_lateeoi(info->evtchn);
                               ^
   1 warning and 1 error generated.


vim +1201 drivers/xen/events/events_base.c

e46cdb66c8fc1c arch/i386/xen/events.c           Jeremy Fitzhardinge 2007-07-17  1198  
54c9de89895e0a drivers/xen/events/events_base.c Juergen Gross       2020-09-07  1199  int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
54c9de89895e0a drivers/xen/events/events_base.c Juergen Gross       2020-09-07  1200  {
54c9de89895e0a drivers/xen/events/events_base.c Juergen Gross       2020-09-07 @1201  	return bind_evtchn_to_irq_chip(evtchn, &xen_lateeoi_chip);
54c9de89895e0a drivers/xen/events/events_base.c Juergen Gross       2020-09-07  1202  }
54c9de89895e0a drivers/xen/events/events_base.c Juergen Gross       2020-09-07  1203  EXPORT_SYMBOL_GPL(bind_evtchn_to_irq_lateeoi);
54c9de89895e0a drivers/xen/events/events_base.c Juergen Gross       2020-09-07  1204  

:::::: The code at line 1201 was first introduced by commit
:::::: 54c9de89895e0a36047fcc4ae754ea5b8655fb9d xen/events: add a new "late EOI" evtchn framework

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Juergen Gross <jgross@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
