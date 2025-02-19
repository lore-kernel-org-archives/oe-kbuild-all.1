Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BBC1D6DD8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739961711; cv=none; b=Ov6Mb/fkKkOHuxXdzx1K2MwTYIqtKIaXfChEGvjJzaTwcGGq3fwb8O8prhTs3HJknu0AxdgdLtDG7LysxFSKWTZrZt7QH2h/79xMGjMQmdqS0uUkoy3FKmA7c8m2PT1DdVk9CWII20bTwTSROwVQTsgz8U1WSv5jlYoTGhM65iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739961711; c=relaxed/simple;
	bh=MbyFXckvhvzrch3hqc2jyVIAnRhZI/Tv8sA7bdsRl2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQmv/fu/7OO1u7wEoGiM5HO6/7s8TyC5MgLqxkl7A8T3CPw62WVhNNq2dzx+uNyQUw70OSjWnmUptiogb9nTRk/+iohqnHB1/XWcxZ48T0M4J9lxpAhHjfgLEx1WU3vwmYnO/Vq+feDFWydyL5BmUH28ik5tfI6MJHpfMHD3faE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3RV8Cmi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3RV8Cmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739961708; x=1771497708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MbyFXckvhvzrch3hqc2jyVIAnRhZI/Tv8sA7bdsRl2g=;
  b=A3RV8CmiKUmrncMMMesK5KhSfWOHO2MHdbPrpT3ViIQaezZCN0p8x91S
   T4SNv3uZpY3gH5O2NinVpXO1OQzPk4rFIpt1TV8IqQenNeaISFBsgVeCA
   1G4OTIHhOuNk8h0LT5nTkiBKUmCF7HJzyR76Vt7dip6TMaNSqHvmRKjjL
   XOhhBb6xUIDGoVMW9YdnmKvKre8QWxBP4KCjf9tSBb7MLK6gy+yMvjEpC
   LXiyFKet/7QJPE0LnJwcrYSlAhB18qVdfL4KunTMXISS+UOG9e97bApWg
   VGhsJJj6ScupXk5d8pVJJmYWAfu/8hjb/ja4xkNRPI8nIIIZvez5dotdm
   Q==;
X-CSE-ConnectionGUID: QFZaGAm/RVenuBpj/NhJEQ==
X-CSE-MsgGUID: caVsHArBSVO20p1VSAPMaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="66047035"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="66047035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 02:41:48 -0800
X-CSE-ConnectionGUID: KAm0Nh7hSDC7RBadp5N9PQ==
X-CSE-MsgGUID: LxwOWktbR2OzkqBfx+Ox+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="115334297"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 Feb 2025 02:41:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkhWH-0002n9-0e;
	Wed, 19 Feb 2025 10:41:35 +0000
Date: Wed, 19 Feb 2025 18:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/usb/host/xhci.c:2829:23: warning:
 variable 'ep' set but not used
Message-ID: <202502191838.723K5eFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mathias,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: d36374fdfb259bac4511762bb349e69c6d093d37 [1/1] xhci: cleanup virtual endoint structure, remove stopped_stream
config: xtensa-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191838.723K5eFF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191838.723K5eFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191838.723K5eFF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/bug.h:57:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:150:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:57:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:308:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:308:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:160:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
   include/asm-generic/bug.h:57:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:150:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:57:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:308:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:308:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:160:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
   include/asm-generic/bug.h:57:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:150:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:57:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:308:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:308:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:171:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   include/asm-generic/bug.h:57:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:150:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:57:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:308:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:308:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:171:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   include/asm-generic/bug.h:57:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:150:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:57:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:308:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:308:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/usb/host/xhci.c: In function 'xhci_cleanup_stalled_ring':
>> drivers/usb/host/xhci.c:2829:23: warning: variable 'ep' set but not used [-Wunused-but-set-variable]
     struct xhci_virt_ep *ep;
                          ^~
   drivers/usb/host/xhci.c: In function 'xhci_discover_or_reset_device':
   drivers/usb/host/xhci.c:3354:6: warning: variable 'last_freed_endpoint' set but not used [-Wunused-but-set-variable]
     int last_freed_endpoint;
         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/mod_devicetable.h:11,
                    from include/linux/pci.h:20,
                    from drivers/usb/host/xhci.c:23:
   drivers/usb/host/xhci.c: In function 'xhci_calculate_intel_u1_timeout':
   include/linux/compiler.h:160:5: warning: this statement may fall through [-Wimplicit-fallthrough=]
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
        ^
   include/linux/compiler.h:158:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   drivers/usb/host/xhci.c:4276:3: note: in expansion of macro 'if'
      if (intr_type == USB_ENDPOINT_INTR_NOTIFICATION) {
      ^~
   drivers/usb/host/xhci.c:4281:2: note: here
     case USB_ENDPOINT_XFER_ISOC:
     ^~~~


vim +/ep +2829 drivers/usb/host/xhci.c

ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2824  
d36374fdfb259b drivers/usb/host/xhci.c     Mathias Nyman    2017-06-15  2825  void xhci_cleanup_stalled_ring(struct xhci_hcd *xhci, unsigned int ep_index,
d36374fdfb259b drivers/usb/host/xhci.c     Mathias Nyman    2017-06-15  2826  			       unsigned int stream_id, struct xhci_td *td)
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2827  {
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2828  	struct xhci_dequeue_state deq_state;
63a0d9abd18cdc drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-09-04 @2829  	struct xhci_virt_ep *ep;
d97b4f8d690b9f drivers/usb/host/xhci.c     Mathias Nyman    2014-11-27  2830  	struct usb_device *udev = td->urb->dev;
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2831  
a0254324eeea3b drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2832  	xhci_dbg_trace(xhci, trace_xhci_dbg_reset_ep,
a0254324eeea3b drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2833  			"Cleaning up stalled endpoint ring");
63a0d9abd18cdc drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-09-04  2834  	ep = &xhci->devs[udev->slot_id]->eps[ep_index];
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2835  	/* We need to move the HW's dequeue pointer past this TD,
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2836  	 * or it will attempt to resend it on the next doorbell ring.
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2837  	 */
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2838  	xhci_find_new_dequeue_state(xhci, udev->slot_id,
d36374fdfb259b drivers/usb/host/xhci.c     Mathias Nyman    2017-06-15  2839  			ep_index, stream_id, td, &deq_state);
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2840  
365038d8331395 drivers/usb/host/xhci.c     Mathias Nyman    2014-08-19  2841  	if (!deq_state.new_deq_ptr || !deq_state.new_deq_seg)
365038d8331395 drivers/usb/host/xhci.c     Mathias Nyman    2014-08-19  2842  		return;
365038d8331395 drivers/usb/host/xhci.c     Mathias Nyman    2014-08-19  2843  
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2844  	/* HW with the reset endpoint quirk will use the saved dequeue state to
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2845  	 * issue a configure endpoint command later.
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2846  	 */
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2847  	if (!(xhci->quirks & XHCI_RESET_EP_QUIRK)) {
a0254324eeea3b drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2848  		xhci_dbg_trace(xhci, trace_xhci_dbg_reset_ep,
a0254324eeea3b drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2849  				"Queueing new dequeue state");
1e3452e3f08c5a drivers/usb/host/xhci.c     Hans de Goede    2014-08-20  2850  		xhci_queue_new_dequeue_state(xhci, udev->slot_id,
8790736dbf2676 drivers/usb/host/xhci.c     Mathias Nyman    2017-06-02  2851  				ep_index, &deq_state);
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2852  	} else {
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2853  		/* Better hope no one uses the input context between now and the
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2854  		 * reset endpoint completion!
e9df17eb1408cf drivers/usb/host/xhci.c     Sarah Sharp      2010-04-02  2855  		 * XXX: No idea how this hardware will react when stream rings
e9df17eb1408cf drivers/usb/host/xhci.c     Sarah Sharp      2010-04-02  2856  		 * are enabled.
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2857  		 */
4bdfe4c38fd5b0 drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2858  		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
4bdfe4c38fd5b0 drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2859  				"Setting up input context for "
4bdfe4c38fd5b0 drivers/usb/host/xhci.c     Xenia Ragiadakou 2013-08-06  2860  				"configure endpoint command");
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2861  		xhci_setup_input_ctx_for_quirk(xhci, udev->slot_id,
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2862  				ep_index, &deq_state);
ac9d8fe7c6a804 drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2863  	}
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2864  }
82d1009f537c2a drivers/usb/host/xhci-hcd.c Sarah Sharp      2009-08-07  2865  

:::::: The code at line 2829 was first introduced by commit
:::::: 63a0d9abd18cdcf5a985029c266c6bfe0511768f USB: xhci: Endpoint representation refactoring.

:::::: TO: Sarah Sharp <sarah.a.sharp@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
