Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC417C79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722398296; cv=none; b=Il6Hk736qr/0lBPy4j87O1FNohEwfPUPKcCLkHSFdS8LaaPiY2/ia0rBn3k9UUMF1YA17kc7aq4Yis5rsB2DyCvVDpAQiBbfi3nNDVcYD5as8soyTySt51wEpV5YQX2fb/HL2lyG5SBANeHdbkqH4A1gg7OplpTfJthD4nSzOcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722398296; c=relaxed/simple;
	bh=dVbpogBLRKYlomQ9MJGjHE9zby5oBRlt5/4IWlP2DfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkJb+WLCbtrxvFGB+CJDPAXgcGKSvnUUPQILZd03QQPx33o4Kj1kMCn4NUdI6Az3Qj04Xm+Kly/lAgy6CbLCBr/4lH0OTa7y1VLlFv7uUttx/HmMve6Q0vZ2kf3PCR18mnNUqvgMZEpBgEGtzRFnH4utkrB0YD46TsZ1Nifq6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkF2xzTD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkF2xzTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722398295; x=1753934295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVbpogBLRKYlomQ9MJGjHE9zby5oBRlt5/4IWlP2DfQ=;
  b=MkF2xzTDc94uiEaxS8yNwwdt2/zoXw23D/huhWDA7GtpB2QC+ykQ1ixZ
   kK57gQkycL4kSN1ydhW52Z4lvz6M5DuoFJe2UceEnFgmBO32/Iy4CZX81
   5Re1QCxS8PK4HTCyvOA3RzGWmTwytM3zD8YqJSfO0QwjPaTBDxdVCC2B7
   psqRST/xAAl8BcXWZy7VRVU+jZI4C10Z36qTd52A3mkeHAd8WTs9rYGtN
   EqzXGgRJ+aWiH9E7BL1ADOG3KuIcHspcLoCn9td11gYunPjIqMRcSuk98
   3uNcznQP10pgUTWiQ9/ofnowa7mkxUTykHtGw8ADNKG7efaCILtSW8iSZ
   w==;
X-CSE-ConnectionGUID: crEzSZ9ZSaqIA+zL2x7ISA==
X-CSE-MsgGUID: blctDDXIStW3oBxsByNxJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31404934"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="31404934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 20:58:14 -0700
X-CSE-ConnectionGUID: PTza1bMOQhmgnQhNihjMUQ==
X-CSE-MsgGUID: I0GlRRUKT9aEi1fDx1TYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="85187597"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2024 20:58:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ0Ta-000tiz-2R;
	Wed, 31 Jul 2024 03:58:10 +0000
Date: Wed, 31 Jul 2024 11:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:fix_dbc_halted_ep 1/1]
 drivers/usb/host/xhci-dbgcap.c:762:36: warning: format '%d' expects argument
 of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'}
Message-ID: <202407311104.kC2MeszH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_dbc_halted_ep
head:   8532b621314e93336535528d5d45e41974c75e01
commit: 8532b621314e93336535528d5d45e41974c75e01 [1/1] xhci: dbc: Fix handling halted endpoints
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240731/202407311104.kC2MeszH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311104.kC2MeszH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311104.kC2MeszH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/usb/host/xhci-dbgcap.c:10:
   drivers/usb/host/xhci-dbgcap.c: In function 'dbc_handle_xfer_event':
>> drivers/usb/host/xhci-dbgcap.c:762:36: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     762 |                 dev_warn(dbc->dev, "Stall error at bulk TRB %llx, untransferred %d, ep_ctx->deq %llx\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/usb/host/xhci-dbgcap.c:762:17: note: in expansion of macro 'dev_warn'
     762 |                 dev_warn(dbc->dev, "Stall error at bulk TRB %llx, untransferred %d, ep_ctx->deq %llx\n",
         |                 ^~~~~~~~
   drivers/usb/host/xhci-dbgcap.c:762:82: note: format string is defined here
     762 |                 dev_warn(dbc->dev, "Stall error at bulk TRB %llx, untransferred %d, ep_ctx->deq %llx\n",
         |                                                                                 ~^
         |                                                                                  |
         |                                                                                  int
         |                                                                                 %ld


vim +762 drivers/usb/host/xhci-dbgcap.c

   712	
   713	static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
   714	{
   715		struct dbc_ep		*dep;
   716		struct xhci_ring	*ring;
   717		int			ep_id;
   718		int			status;
   719		struct xhci_ep_ctx	*ep_ctx;
   720		u32			comp_code;
   721		size_t			remain_length;
   722		struct dbc_request	*req = NULL, *r;
   723	
   724		comp_code	= GET_COMP_CODE(le32_to_cpu(event->generic.field[2]));
   725		remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
   726		ep_id		= TRB_TO_EP_ID(le32_to_cpu(event->generic.field[3]));
   727		dep		= (ep_id == EPID_OUT) ?
   728					get_out_ep(dbc) : get_in_ep(dbc);
   729		ep_ctx		= (ep_id == EPID_OUT) ?
   730					dbc_bulkout_ctx(dbc) : dbc_bulkin_ctx(dbc);
   731		ring		= dep->ring;
   732	
   733		/* Match the pending request: */
   734		list_for_each_entry(r, &dep->list_pending, list_pending) {
   735			if (r->trb_dma == event->trans_event.buffer) {
   736				req = r;
   737				break;
   738			}
   739		}
   740	
   741		if (!req) {
   742			dev_warn(dbc->dev, "no matched request\n");
   743			return;
   744		}
   745	
   746		trace_xhci_dbc_handle_transfer(ring, &req->trb->generic);
   747	
   748		switch (comp_code) {
   749		case COMP_SUCCESS:
   750			remain_length = 0;
   751			fallthrough;
   752		case COMP_SHORT_PACKET:
   753			status = 0;
   754			break;
   755		case COMP_TRB_ERROR:
   756		case COMP_BABBLE_DETECTED_ERROR:
   757		case COMP_USB_TRANSACTION_ERROR:
   758			dev_warn(dbc->dev, "tx error %d detected\n", comp_code);
   759			status = -comp_code;
   760			break;
   761		case COMP_STALL_ERROR:
 > 762			dev_warn(dbc->dev, "Stall error at bulk TRB %llx, untransferred %d, ep_ctx->deq %llx\n",
   763				 event->trans_event.buffer, remain_length, ep_ctx->deq);
   764			status = 0;
   765			dep->halted = 1;
   766			/*
   767			 * DbC start processing TRBs at ep_ctx->deq when halt is cleared.
   768			 * If this is the same TRB we got the stall event for then
   769			 * avoid retransmitting it by turning the TRB into a no-op TRB
   770			 */
   771			if (ep_ctx->deq == event->trans_event.buffer) { // FIXME do we need to worry about cycle bit?
   772				dev_warn(dbc->dev, "Stall error TRB matches ep_ctx->deq, clear it\n");
   773				trb_to_noop(req->trb);
   774			}
   775			break;
   776	
   777		default:
   778			dev_err(dbc->dev, "unknown tx error %d\n", comp_code);
   779			status = -comp_code;
   780			break;
   781		}
   782	
   783		ring->num_trbs_free++;
   784		req->actual = req->length - remain_length;
   785		xhci_dbc_giveback(req, status);
   786	}
   787	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
