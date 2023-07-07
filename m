Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FE31852
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 06:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688710735; x=1720246735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MkRE//IDAootJLyPoh+RwHPmTACJw2KJneRG/ZGrKsg=;
  b=aA8gNYM8LQkvXQn3J7NQ8Xaqgbt0ZGtXPOC3+tevMFRnX4SnInL4LlMw
   UmCcRd6kjyFLHSvDqX/PR0ZpYRKbd7Dm7OfujRyMJQvJZqo20gxRIS7C+
   WzZS9yjDRLsluJ8MJQ0jF82p6W7z5zVCG6C85cGULzKj9HR0aKK69oEc1
   Qi0KqDziYM9a3Twdezz5U4iTF0cS/jCCma9eJGK5A33Cc3JM9ysIRoFwO
   DpgdyluPb2s92PJVGe9+xlQ9/DD+TZDSnNwcK3UU3fRY6GkfbXFY/sLpa
   IR1uyKrGWTPEMWYkoAml8I0OJfdJRa34GDwgm3dGPUdXdy4VTkj98TD03
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427495685"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="427495685"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 23:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="809919418"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="809919418"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2023 23:18:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHens-0001pa-1I;
	Fri, 07 Jul 2023 06:18:52 +0000
Date: Fri, 7 Jul 2023 14:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-xvuart-host-driver 1/3]
 drivers/usb/host/xhci.c:821:2: error: implicit declaration of function
 'pci_reset_function_locked'
Message-ID: <202307071417.LjEvXTQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-xvuart-host-driver
head:   8384d7b383c2aff772d5503ddddd8a938e48c43f
commit: 2f1386a42c87b79737b1363bbfd01f7b6c1aee2e [1/3] xhci: Reset controller on xhci shutdown
config: x86_64-buildonly-randconfig-r002-20230706 (https://download.01.org/0day-ci/archive/20230707/202307071417.LjEvXTQi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071417.LjEvXTQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071417.LjEvXTQi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/xhci.c:821:2: error: implicit declaration of function 'pci_reset_function_locked' [-Werror,-Wimplicit-function-declaration]
           pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));
           ^
   1 error generated.


vim +/pci_reset_function_locked +821 drivers/usb/host/xhci.c

   773	
   774	/*
   775	 * Shutdown HC (not bus-specific)
   776	 *
   777	 * This is called when the machine is rebooting or halting.  We assume that the
   778	 * machine will be powered off, and the HC's internal state will be reset.
   779	 * Don't bother to free memory.
   780	 *
   781	 * This will only ever be called with the main usb_hcd (the USB3 roothub).
   782	 */
   783	void xhci_shutdown(struct usb_hcd *hcd)
   784	{
   785		struct xhci_hcd *xhci = hcd_to_xhci(hcd);
   786	
   787		if (xhci->quirks & XHCI_SPURIOUS_REBOOT)
   788			usb_disable_xhci_ports(to_pci_dev(hcd->self.sysdev));
   789	
   790		/* Don't poll the roothubs after shutdown. */
   791		xhci_dbg(xhci, "%s: stopping usb%d port polling.\n",
   792				__func__, hcd->self.busnum);
   793		clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
   794		del_timer_sync(&hcd->rh_timer);
   795	
   796		if (xhci->shared_hcd) {
   797			clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
   798			del_timer_sync(&xhci->shared_hcd->rh_timer);
   799		}
   800	
   801		spin_lock_irq(&xhci->lock);
   802		xhci_halt(xhci);
   803	
   804		/*
   805		 * Workaround for spurious wakeps at shutdown with HSW, and for boot
   806		 * firmware delay in ADL-P PCH if port are left in U3 at shutdown
   807		 */
   808		if (xhci->quirks & XHCI_SPURIOUS_WAKEUP ||
   809		    xhci->quirks & XHCI_RESET_TO_DEFAULT)
   810			xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
   811	
   812		spin_unlock_irq(&xhci->lock);
   813	
   814		xhci_cleanup_msix(xhci);
   815	
   816		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
   817				"xhci_shutdown completed - status = %x",
   818				readl(&xhci->op_regs->status));
   819	
   820		/* TI XHCI controllers do not come back after kexec without this hack */
 > 821		pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));
   822	}
   823	EXPORT_SYMBOL_GPL(xhci_shutdown);
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
