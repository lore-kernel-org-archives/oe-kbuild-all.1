Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E12A64E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 05:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679808992; x=1711344992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIa4vUD0cnD04PtqCIU+4fHe6tuuzrPvWugF9MIixyQ=;
  b=OCgn5Z4cE51ro2IcafnscbMtd9TMrm815WHWEOI2laUGHIoOJRd030Ay
   VdbKKM9ebi6GasF4LLqvnTehSfJ9tQTz5uY80rGEtWxUL6oKHR0Ksil32
   vfWH97L7wEXGMiVdwNLLBMluJBxdan7VL2M0FThXx07ac3FSlZLJ4Ba7i
   t/FK/Vy3pWfPcsY0wGyx01vuzqZB74+S/3qCnuD/1fN5+QnQFzzHorHf9
   FEC1CATpjAKXCUO9MEHhukrsVO4Bdf2nlj9waRsp4vcEyHFxP0EH+3byh
   RXVIuKXO02OP8d2CZ2OM2n1QPDW45jgHkUJaz+nBxbibQl/6/KRHiwf/a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="338770865"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="338770865"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 22:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="752317708"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="752317708"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Mar 2023 22:36:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgJ3N-000Gu1-26;
	Sun, 26 Mar 2023 05:36:29 +0000
Date: Sun, 26 Mar 2023 13:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 51/60] drivers/tty/hvc/hvc_xen.c:422:47:
 warning: incompatible integer to pointer conversion passing 'int' to
 parameter of type 'struct xenbus_device *'
Message-ID: <202303261357.feTBks8e-lkp@intel.com>
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
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230326/202303261357.feTBks8e-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/tty/hvc/ drivers/xen/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261357.feTBks8e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/hvc/hvc_xen.c:422:47: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct xenbus_device *' [-Wint-conversion]
           irq = bind_interdomain_evtchn_to_irq_lateeoi(dev->otherend_id, evtchn);
                                                        ^~~~~~~~~~~~~~~~
   include/xen/events.h:39:66: note: passing argument to parameter 'dev' here
   int bind_interdomain_evtchn_to_irq_lateeoi(struct xenbus_device *dev,
                                                                    ^
   drivers/tty/hvc/hvc_xen.c:587:15: error: implicit declaration of function 'bind_evtchn_to_irq_lateeoi' [-Werror,-Wimplicit-function-declaration]
                   info->irq = bind_evtchn_to_irq_lateeoi(info->evtchn);
                               ^
   1 warning and 1 error generated.
--
   drivers/xen/events/events_base.c:1201:58: error: too few arguments to function call, expected 3, have 2
           return bind_evtchn_to_irq_chip(evtchn, &xen_lateeoi_chip);
                  ~~~~~~~~~~~~~~~~~~~~~~~                          ^
   drivers/xen/events/events_base.c:1153:12: note: 'bind_evtchn_to_irq_chip' declared here
   static int bind_evtchn_to_irq_chip(evtchn_port_t evtchn, struct irq_chip *chip,
              ^
>> drivers/xen/events/events_base.c:1199:5: warning: no previous prototype for function 'bind_evtchn_to_irq_lateeoi' [-Wmissing-prototypes]
   int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
       ^
   drivers/xen/events/events_base.c:1199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
   ^
   static 
   1 warning and 1 error generated.


vim +422 drivers/tty/hvc/hvc_xen.c

02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  410  
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  411  static int xencons_connect_backend(struct xenbus_device *dev,
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  412  				  struct xencons_info *info)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  413  {
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  414  	int ret, evtchn, devid, ref, irq;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  415  	struct xenbus_transaction xbt;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  416  	grant_ref_t gref_head;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  417  
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  418  	ret = xenbus_alloc_evtchn(dev, &evtchn);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  419  	if (ret)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  420  		return ret;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  421  	info->evtchn = evtchn;
8fa3a370cc2af8 drivers/tty/hvc/hvc_xen.c Juergen Gross       2021-12-16 @422  	irq = bind_interdomain_evtchn_to_irq_lateeoi(dev->otherend_id, evtchn);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  423  	if (irq < 0)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  424  		return irq;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  425  	info->irq = irq;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  426  	devid = dev->nodename[strlen(dev->nodename) - 1] - '0';
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  427  	info->hvc = hvc_alloc(xenbus_devid_to_vtermno(devid),
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  428  			irq, &domU_hvc_ops, 256);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  429  	if (IS_ERR(info->hvc))
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  430  		return PTR_ERR(info->hvc);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  431  	ret = gnttab_alloc_grant_references(1, &gref_head);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  432  	if (ret < 0)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  433  		return ret;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  434  	info->gntref = gref_head;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  435  	ref = gnttab_claim_grant_reference(&gref_head);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  436  	if (ref < 0)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  437  		return ref;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  438  	gnttab_grant_foreign_access_ref(ref, info->xbdev->otherend_id,
859e3267c515d0 drivers/tty/hvc/hvc_xen.c Julien Grall        2015-08-07  439  					virt_to_gfn(info->intf), 0);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  440  
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  441   again:
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  442  	ret = xenbus_transaction_start(&xbt);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  443  	if (ret) {
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  444  		xenbus_dev_fatal(dev, ret, "starting transaction");
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  445  		return ret;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  446  	}
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  447  	ret = xenbus_printf(xbt, dev->nodename, "ring-ref", "%d", ref);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  448  	if (ret)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  449  		goto error_xenbus;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  450  	ret = xenbus_printf(xbt, dev->nodename, "port", "%u",
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  451  			    evtchn);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  452  	if (ret)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  453  		goto error_xenbus;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  454  	ret = xenbus_transaction_end(xbt, 0);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  455  	if (ret) {
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  456  		if (ret == -EAGAIN)
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  457  			goto again;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  458  		xenbus_dev_fatal(dev, ret, "completing transaction");
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  459  		return ret;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  460  	}
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  461  
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  462  	xenbus_switch_state(dev, XenbusStateInitialised);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  463  	return 0;
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  464  
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  465   error_xenbus:
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  466  	xenbus_transaction_end(xbt, 1);
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  467  	xenbus_dev_fatal(dev, ret, "writing xenstore");
02e19f9c7cacfb drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-30  468  	return ret;
eb5ef07151ba3c drivers/tty/hvc/hvc_xen.c Stefano Stabellini  2012-01-27  469  }
6b9b732d0e396a drivers/char/hvc_xen.c    Jeremy Fitzhardinge 2008-05-26  470  

:::::: The code at line 422 was first introduced by commit
:::::: 8fa3a370cc2af858a9ba662ca4f2bd0917550563 xen/console: harden hvc_xen against event channel storms

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
