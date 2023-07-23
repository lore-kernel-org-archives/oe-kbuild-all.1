Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605371870
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690135879; x=1721671879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6U4ujofSsnsIojjwUl9eMlSD895ohSFLW0dlyOr4I8=;
  b=kSzNF7qcdG1BpU6QPHsIBkm0yWhmbgqKz8tEKgoenOM0FIoGcED2nrAR
   CbkhtmScQ5q8vWH7LbwFjbY4jyZAMAtb9kLPJNLysmkWpNS6pHRiqfdJs
   rVY5dOe9Q9woN8pbZR3g8uhXQQastOEQevqqy4/EfeMCBBxK2xdlKdvn/
   2LIIKWkHL61iVfHTvUAAKp+E94O+Jh1MuNY6tAv30d/avRDttyTs6Pxeb
   St67pp8v/9p3h5nPi41SSvVTto47viB88Boq9ZqQr2YwZRUjRBrS5Y8b3
   F8Y9aSPUYvqkkArPEgNI1410dFv3GEfDqdFq4BBLCGblj8nHfq8HKUa3N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="346898631"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="346898631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 11:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="815577753"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="815577753"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2023 11:11:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNdY1-0009AP-0Y;
	Sun, 23 Jul 2023 18:11:13 +0000
Date: Mon, 24 Jul 2023 02:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, stern@rowland.harvard.edu
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: host: ehci-sched: add itd/sitd_unlink_urb()
 functions
Message-ID: <202307240103.vWzkF4eB-lkp@intel.com>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718112600.3969141-1-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus westeri-thunderbolt/next linus/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-ehci-unlink-itd-sitds-from-hardware-list-if-the-controller-has-stopped-periodic-schedule/20230718-192747
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230718112600.3969141-1-xu.yang_2%40nxp.com
patch subject: [PATCH 1/2] usb: host: ehci-sched: add itd/sitd_unlink_urb() functions
config: microblaze-randconfig-r072-20230723 (https://download.01.org/0day-ci/archive/20230724/202307240103.vWzkF4eB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240103.vWzkF4eB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240103.vWzkF4eB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/ehci-hcd.c: note: in included file:
   drivers/usb/host/ehci-q.c:1390:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __hc32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-q.c:1390:27: sparse:     expected restricted __hc32 [usertype] old_current
   drivers/usb/host/ehci-q.c:1390:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c: note: in included file:
   drivers/usb/host/ehci-mem.c:187:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __hc32 [usertype] *periodic @@     got restricted __le32 [usertype] * @@
   drivers/usb/host/ehci-mem.c:187:24: sparse:     expected restricted __hc32 [usertype] *periodic
   drivers/usb/host/ehci-mem.c:187:24: sparse:     got restricted __le32 [usertype] *
   drivers/usb/host/ehci-hcd.c:568:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __hc32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-hcd.c:568:27: sparse:     expected restricted __hc32 [usertype] old_current
   drivers/usb/host/ehci-hcd.c:568:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c: note: in included file:
>> drivers/usb/host/ehci-sched.c:1829:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __hc32 [usertype] tag @@     got int @@
   drivers/usb/host/ehci-sched.c:1829:17: sparse:     expected restricted __hc32 [usertype] tag
   drivers/usb/host/ehci-sched.c:1829:17: sparse:     got int
>> drivers/usb/host/ehci-sched.c:1829:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __hc32 [usertype] tag @@     got int @@
   drivers/usb/host/ehci-sched.c:1829:17: sparse:     expected restricted __hc32 [usertype] tag
   drivers/usb/host/ehci-sched.c:1829:17: sparse:     got int

vim +1829 drivers/usb/host/ehci-sched.c

  1807	
  1808	/* unlink itd/sitd from the periodic list */
  1809	static inline void
  1810	unlink(struct ehci_hcd *ehci, unsigned frame, void *ptr)
  1811	{
  1812		union ehci_shadow	*prev = &ehci->pshadow[frame];
  1813		__hc32			*hw_p = &ehci->periodic[frame];
  1814		union ehci_shadow	here = *prev;
  1815	
  1816		while (here.ptr && here.ptr != ptr) {
  1817			prev = periodic_next_shadow(ehci, prev,
  1818				Q_NEXT_TYPE(ehci, *hw_p));
  1819			hw_p = shadow_next_periodic(ehci, &here,
  1820				Q_NEXT_TYPE(ehci, *hw_p));
  1821			here = *prev;
  1822		}
  1823	
  1824		*prev = *periodic_next_shadow(ehci, &here,
  1825				Q_NEXT_TYPE(ehci, *hw_p));
  1826	
  1827		if (!ehci->use_dummy_qh ||
  1828			*shadow_next_periodic(ehci, &here, Q_NEXT_TYPE(ehci, *hw_p)
> 1829			!= EHCI_LIST_END(ehci)))
  1830			*hw_p = *shadow_next_periodic(ehci, &here,
  1831						Q_NEXT_TYPE(ehci, *hw_p));
  1832		else
  1833			*hw_p = cpu_to_hc32(ehci, ehci->dummy->qh_dma);
  1834	}
  1835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
