Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE4722D7B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 22:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766183364; cv=none; b=AZDHUrOdoo877gnMCbWdmH+eis0gAhT6KkEe45LToYp7z8zsyXp3ADSWCIXXTXM8z346gIKUb+CtASiEdpgojeV3I8n5lJbf65pzFSXsGLpdsvU2kC9HGxqIv8gSMAzzP90fffrDQJoVs5LtPVvc+p+JJ2KOJgDhUVYKQfg1E/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766183364; c=relaxed/simple;
	bh=XrqjR1Gv94bgxM3H5/Hx7YpLtFhJQ/wSgbVtcFjs4pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H9MtwSGM2GaDaUWdJ0MswuCTkXpTL1/8VZon/ZZKY3ULXxd94G5G7Zbgu/ubv2c7fUdJQBurAOxncq61ILyUgNhzgvBpjI5u3m8y3ImCiBdGoP90LxBQgnfUWN269WhSTlG2pHvwCWR8/HIyV82pc5Kj53kHJhXmnslihCXAAgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejzEbEvk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejzEbEvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766183363; x=1797719363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XrqjR1Gv94bgxM3H5/Hx7YpLtFhJQ/wSgbVtcFjs4pc=;
  b=ejzEbEvkhmIXtmmEkI2OQYQcutTjX4RtjUMHe2VQvvrBbllEdpGTA+vx
   G2vL+U5PJt+qC0sToBK50VUxWIgZxp9A3ZDXbzYC9qRQc4NcfubfIFdzv
   JTW5HjsxXrZp9k2Rl267Dj25dg6LjTlyHZtvwxYDsZpyPODNYAZziCOiR
   upWSsNbUWJrZa3O9AAlq5hCgqFwhiTO2GgHlJ1ZNZAkhR/r4n3IwatEl1
   iKl1ozGMdqO9ozYc3X/Qrc7K8urtmbpDNyAQtJCgSAlivcK/dTc/IXcJM
   UWyivYPBOIe3MVXlRjQpTk6nNn8Ofdg8Nlf4zWUsblCtWBtOdjyAO3Lc9
   w==;
X-CSE-ConnectionGUID: oPwCr6EuRwiXhgSDqZmWuA==
X-CSE-MsgGUID: aLbryxJyRz2c98efC70yzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79264864"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="79264864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 14:29:21 -0800
X-CSE-ConnectionGUID: +ntj8RBFTgybIbxV2PywkA==
X-CSE-MsgGUID: KYwqnGkRQpGd0+cVTXyewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198886059"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2025 14:29:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWiyL-0000000043l-1GY9;
	Fri, 19 Dec 2025 22:29:17 +0000
Date: Sat, 20 Dec 2025 06:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/usb/host/xhci-ring.c:2900:5: warning: no previous prototype for
 'xhci_handle_event'
Message-ID: <202512200601.teKIOtnP-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 26afe6712de0fad3a5de2b372286d029f8ff3231 [0/4] FROMLIST: usb: host: export symbols for xhci hooks usage
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512200601.teKIOtnP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200601.teKIOtnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200601.teKIOtnP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-ring.c:2900:5: warning: no previous prototype for 'xhci_handle_event' [-Wmissing-prototypes]
    2900 | int xhci_handle_event(struct xhci_hcd *xhci)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-ring.c:2976:6: warning: no previous prototype for 'xhci_update_erst_dequeue' [-Wmissing-prototypes]
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
  2971	/*
  2972	 * Update Event Ring Dequeue Pointer:
  2973	 * - When all events have finished
  2974	 * - To avoid "Event Ring Full Error" condition
  2975	 */
> 2976	void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
  2977			union xhci_trb *event_ring_deq)
  2978	{
  2979		u64 temp_64;
  2980		dma_addr_t deq;
  2981	
  2982		temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
  2983		/* If necessary, update the HW's version of the event ring deq ptr. */
  2984		if (event_ring_deq != xhci->event_ring->dequeue) {
  2985			deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
  2986					xhci->event_ring->dequeue);
  2987			if (deq == 0)
  2988				xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr\n");
  2989			/*
  2990			 * Per 4.9.4, Software writes to the ERDP register shall
  2991			 * always advance the Event Ring Dequeue Pointer value.
  2992			 */
  2993			if ((temp_64 & (u64) ~ERST_PTR_MASK) ==
  2994					((u64) deq & (u64) ~ERST_PTR_MASK))
  2995				return;
  2996	
  2997			/* Update HC event ring dequeue pointer */
  2998			temp_64 &= ERST_PTR_MASK;
  2999			temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
  3000		}
  3001	
  3002		/* Clear the event handler busy flag (RW1C) */
  3003		temp_64 |= ERST_EHB;
  3004		xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
  3005	}
  3006	EXPORT_SYMBOL_GPL(xhci_update_erst_dequeue);
  3007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
