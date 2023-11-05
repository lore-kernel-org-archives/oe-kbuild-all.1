Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D366A14278
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKwOUSD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699217161; x=1730753161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4iNG7BEsTxLbf8CvZEU0SeUJlXWe6IFkzklo11qloBo=;
  b=IKwOUSD4n1Vpr/HVvQtH+A9al2iZElkbQZPHjBFz/N5naS9wkYFcmTzd
   1j4JRa/CNLiXCuWnyq518Ol1bZCzkQ079znOpUgeTX2biPZBwIHcV2TzU
   vPuEk1RC8QTJq0EBFfHyGq2PjxHQavQ8q5Ing7vLv54O0IgeP5ILmbWdj
   mSlcpZhY85DGEfnIRjaonnet+Tl6o+at77n2tvvcj9ZMFC928gKaBtKR/
   HK3Je/xmTYyk5IDoCUYZrZ0xdm4mWaBPLjJinlQ46KCVIb9dZ8HlSu9Zh
   DDVTjBR/R3CyYmyRAfZquB3b4e7Oy1B8JpxiRfGg4vWlWZtm0Q5Rpuhon
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392042058"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392042058"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093586450"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1093586450"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 12:45:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzk0L-0005mJ-2c;
	Sun, 05 Nov 2023 20:45:57 +0000
Date: Mon, 6 Nov 2023 04:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 4980/30000]
 drivers/usb/host/xhci-ring.c:2900:5: warning: no previous prototype for
 'xhci_handle_event'
Message-ID: <202311060408.2WEgiDs9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Howard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: 26afe6712de0fad3a5de2b372286d029f8ff3231 [4980/30000] FROMLIST: usb: host: export symbols for xhci hooks usage
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231106/202311060408.2WEgiDs9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060408.2WEgiDs9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060408.2WEgiDs9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-ring.c:2900:5: warning: no previous prototype for 'xhci_handle_event' [-Wmissing-prototypes]
    2900 | int xhci_handle_event(struct xhci_hcd *xhci)
         |     ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-ring.c:2976:6: warning: no previous prototype for 'xhci_update_erst_dequeue' [-Wmissing-prototypes]
    2976 | void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/xhci_handle_event +2900 drivers/usb/host/xhci-ring.c

  2893	
  2894	/*
  2895	 * This function handles all OS-owned events on the event ring.  It may drop
  2896	 * xhci->lock between event processing (e.g. to pass up port status changes).
  2897	 * Returns >0 for "possibly more events to process" (caller should call again),
  2898	 * otherwise 0 if done.  In future, <0 returns should indicate error code.
  2899	 */
> 2900	int xhci_handle_event(struct xhci_hcd *xhci)
  2901	{
  2902		union xhci_trb *event;
  2903		int update_ptrs = 1;
  2904		u32 trb_type;
  2905		int ret;
  2906	
  2907		/* Event ring hasn't been allocated yet. */
  2908		if (!xhci->event_ring || !xhci->event_ring->dequeue) {
  2909			xhci_err(xhci, "ERROR event ring not ready\n");
  2910			return -ENOMEM;
  2911		}
  2912	
  2913		event = xhci->event_ring->dequeue;
  2914		/* Does the HC or OS own the TRB? */
  2915		if ((le32_to_cpu(event->event_cmd.flags) & TRB_CYCLE) !=
  2916		    xhci->event_ring->cycle_state)
  2917			return 0;
  2918	
  2919		trace_xhci_handle_event(xhci->event_ring, &event->generic);
  2920	
  2921		/*
  2922		 * Barrier between reading the TRB_CYCLE (valid) flag above and any
  2923		 * speculative reads of the event's flags/data below.
  2924		 */
  2925		rmb();
  2926		trb_type = TRB_FIELD_TO_TYPE(le32_to_cpu(event->event_cmd.flags));
  2927		/* FIXME: Handle more event types. */
  2928	
  2929		switch (trb_type) {
  2930		case TRB_COMPLETION:
  2931			handle_cmd_completion(xhci, &event->event_cmd);
  2932			break;
  2933		case TRB_PORT_STATUS:
  2934			handle_port_status(xhci, event);
  2935			update_ptrs = 0;
  2936			break;
  2937		case TRB_TRANSFER:
  2938			ret = handle_tx_event(xhci, &event->trans_event);
  2939			if (ret >= 0)
  2940				update_ptrs = 0;
  2941			break;
  2942		case TRB_DEV_NOTE:
  2943			handle_device_notification(xhci, event);
  2944			break;
  2945		default:
  2946			if (trb_type >= TRB_VENDOR_DEFINED_LOW)
  2947				handle_vendor_event(xhci, event, trb_type);
  2948			else
  2949				xhci_warn(xhci, "ERROR unknown event type %d\n", trb_type);
  2950		}
  2951		/* Any of the above functions may drop and re-acquire the lock, so check
  2952		 * to make sure a watchdog timer didn't mark the host as non-responsive.
  2953		 */
  2954		if (xhci->xhc_state & XHCI_STATE_DYING) {
  2955			xhci_dbg(xhci, "xHCI host dying, returning from "
  2956					"event handler.\n");
  2957			return 0;
  2958		}
  2959	
  2960		if (update_ptrs)
  2961			/* Update SW event ring dequeue pointer */
  2962			inc_deq(xhci, xhci->event_ring);
  2963	
  2964		/* Are there more items on the event ring?  Caller will call us again to
  2965		 * check.
  2966		 */
  2967		return 1;
  2968	}
  2969	EXPORT_SYMBOL_GPL(xhci_handle_event);
  2970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
