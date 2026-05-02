Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5929C27A907
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777735878; cv=none; b=tdK2MHcZPx6TBW7HGxH56OWaKF7Q+HGvf0FcYfxZhEQUk/JELCAR90iwUK8NSO5LFup5D4nxh0/DBl8+YhJW0YUgb6vkxUOpOJE2DAGdlVF9RAXK2yrayFptBMmBQgDF/45CpK5Q6zMR9J4JkOUHuQoQ4GpJp4TOlv9MPV3EEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777735878; c=relaxed/simple;
	bh=Tzh6u8ZVsG/3zCcarzMYvhkD23p3lWdBoQwmH4OAHqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uKB/H70FUStbE4FKs5ajHPiDoarp8N6XDp+KEK81E0foz6lLNIdSxsDOCRNJIqgC+NOCK/0onzYRAxC8JDa6MEBT9pg0ZkoS71AAOTXs+vh3jw3fz/SlH77HpNtTkKlD32Z6zwX1O2O038eAjorO/3G5J5dfEv+BV0aVKSPSzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqpIHl5M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqpIHl5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777735875; x=1809271875;
  h=date:from:to:cc:subject:message-id;
  bh=Tzh6u8ZVsG/3zCcarzMYvhkD23p3lWdBoQwmH4OAHqI=;
  b=DqpIHl5Mx84cKyxsD3aIuEVz+MM4rbFLaMgYANA3cYzNjS9SOsBw/TSW
   OWGdAVTgSRwZD5loDlKIGxzutc5cUnPngSL361L7cGS9/y2C3i82Hx4xg
   tFyZeZN0FaupNNFmsKqw6lADkMrESMpk7202z4ImOmXfFQSznCrskYC+w
   Radger3nmlKrByFzT7vXHyNFwhh6AtaY/4CAoQT7b3PsOk6/WTfsiaO/5
   5a8Hv7bDE12q3PVHUY9/jGt4mZo6KLgDLPFEUhnDhnaFOvldiEX4w0AVH
   XPu3qURpPcVaba5XpZcS1vILGbIG1pVCfFFLPceh5gKvAkF8DLiMCQ0Rk
   A==;
X-CSE-ConnectionGUID: NKPXc2HoSFyLkFLCnz2eag==
X-CSE-MsgGUID: KmWAwpeNRFSVCUOl42hv6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82520457"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="82520457"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 08:31:15 -0700
X-CSE-ConnectionGUID: 9Xc+PM5eSAaWGe7X8QrVdA==
X-CSE-MsgGUID: kl+pjKHZThK0Senzcr4IgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="235186785"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2026 08:31:14 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJCJC-000000001UT-3yCE;
	Sat, 02 May 2026 15:31:10 +0000
Date: Sat, 02 May 2026 23:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:for-usb-linus 1/1]
 drivers/usb/host/xhci-ring.c:780:30: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202605022341.Wly02RYQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-linus
head:   5a2eae179a9b34eddd47a25bdb48bfd93411cef9
commit: 5a2eae179a9b34eddd47a25bdb48bfd93411cef9 [1/1] xhci: move dequeue to next valid td instead of past cancelled one
config: parisc-randconfig-r134-20260502 (https://download.01.org/0day-ci/archive/20260502/202605022341.Wly02RYQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022341.Wly02RYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605022341.Wly02RYQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/host/xhci-ring.c:780:30: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/host/xhci-ring.c:781:30: sparse: sparse: Using plain integer as NULL pointer

vim +780 drivers/usb/host/xhci-ring.c

   688	
   689	/*
   690	 * Move the endpoint dequeue pointer to the next queued TD on ring->td_list or
   691	 * to enqueue if no TDs are queued (empty ring)
   692	 * Remember to move all cancelled TDs from ring->td_list to
   693	 * ep->cancelled_td_list before calling this function
   694	 */
   695	static int xhci_move_deq_to_next_td(struct xhci_hcd *xhci,
   696					    struct xhci_virt_ep *ep,
   697					    unsigned int stream_id)
   698	{
   699		struct xhci_command *cmd;
   700		struct xhci_ring *ring;
   701		struct xhci_td *td;
   702		dma_addr_t addr;
   703		int new_cycle;
   704		u32 trb_sct = 0;
   705		int ret = 0;
   706	
   707		ring = xhci_virt_ep_to_ring(xhci, ep, stream_id);
   708		if (!ring) {
   709			xhci_warn(xhci, "WARN can't find new dequeue, invalid stream ID %u\n",
   710				  stream_id);
   711			return -ENODEV;
   712		}
   713	
   714		if ((ep->ep_state & SET_DEQ_PENDING)) {
   715			xhci_warn(xhci, "Set TR Deq already pending\n");
   716			return -EBUSY;
   717		}
   718	
   719		/* This function gets called from contexts where it cannot sleep */
   720		cmd = xhci_alloc_command(xhci, false, GFP_ATOMIC);
   721		if (!cmd) {
   722			xhci_warn(xhci, "Can't alloc Set TR Deq cmd\n");
   723			return -ENOMEM;
   724		}
   725	
   726		td = list_first_entry_or_null(&ring->td_list, struct xhci_td, td_list);
   727	
   728		/*
   729		 * Move dequeue to the beginning of next td, or to enqueue if ring is
   730		 * empty. Avoid moving dequeue to a link trb (empty ring) as it causes
   731		 * issues on some hosts. In that case advance the enqueue to next segment
   732		 * before moving dequeue to it
   733		 */
   734	
   735		if (td) {
   736			ep->queued_deq_seg = td->start_seg;
   737			ep->queued_deq_ptr = td->start_trb;
   738			new_cycle = le32_to_cpu(td->start_trb->generic.field[3]) & TRB_CYCLE;
   739		} else {
   740			if (trb_is_link(ring->enqueue))
   741				inc_enq_past_link(xhci, ring, 0);
   742			ep->queued_deq_seg = ring->enq_seg;
   743			ep->queued_deq_ptr = ring->enqueue;
   744			new_cycle = ring->cycle_state;
   745		}
   746	
   747		addr = xhci_trb_virt_to_dma(ep->queued_deq_seg, ep->queued_deq_ptr);
   748		if (addr == 0) {
   749			xhci_warn(xhci, "Can't find new dequeue dma of seg %p, ptr %p\n",
   750				  ep->queued_deq_seg, ep->queued_deq_ptr);
   751			ret = -EINVAL;
   752			goto err_out;
   753		}
   754	
   755		if (stream_id)
   756			trb_sct = SCT_FOR_TRB(SCT_PRI_TR);
   757		ret = queue_command(xhci, cmd,
   758			lower_32_bits(addr) | trb_sct | new_cycle,
   759			upper_32_bits(addr),
   760			STREAM_ID_FOR_TRB(stream_id), SLOT_ID_FOR_TRB(ep->vdev->slot_id) |
   761			EP_INDEX_FOR_TRB(ep->ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
   762		if (ret < 0)
   763			goto err_out;
   764	
   765		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
   766			       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
   767	
   768		/*
   769		 * Stop the TD queueing code from ringing the doorbell until this
   770		 * command completes. The HC won't set the dequeue pointer if the ring
   771		 * is running, and ringing the doorbell starts the ring.
   772		 */
   773		ep->ep_state |= SET_DEQ_PENDING;
   774		xhci_ring_cmd_db(xhci);
   775	
   776		return 0;
   777	
   778	err_out:
   779		xhci_free_command(xhci, cmd);
 > 780		ep->queued_deq_seg = 0;
   781		ep->queued_deq_ptr = 0;
   782	
   783		return ret;
   784	}
   785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
