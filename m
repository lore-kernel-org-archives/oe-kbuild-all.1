Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648253DDDDE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390620; cv=none; b=MNL78mpJq/cxQu11/slrV23jj7RqaZskSzUVsNTUaLt+WH9CjMAr0k723IYgreamLnDEawk++1ZpKqw96mgFfEmS8EzgM0i57n3ez18gswfV7CKQ3PJcKvhPJINl5+AARxKGajHWcRrVyNz9U+l+Pk4Ag0K/hvPBqPV3zhF5cy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390620; c=relaxed/simple;
	bh=5poX0MRFO+yGykJL1pB1WQwb0xhlJoEsmh4SMvfdJW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJS4oGhvxLenAfFXrZS+lp4qpOywOw3ODxU9/A8quVMTP92BSi7ILLAbvTcD69WpaQLDrXGq2Ib4Q2qNY/F1mm67n6kukv7vnTZu0i3ugAD2+T57ETgYwLSnloqwjzc2sZUhTTucygo+oZI5jtP2gif7huvdwZG9uaHQFqGjHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMfGSBs3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMfGSBs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792390617; x=1823926617;
  h=date:from:to:cc:subject:message-id;
  bh=5poX0MRFO+yGykJL1pB1WQwb0xhlJoEsmh4SMvfdJW4=;
  b=hMfGSBs3e2JRJmw1Hqf56ub+R36RubY8jqogIcTDmyyfdFcNRAzbKkGr
   Iq0IlYW2UErlnYbrv5EbGrTXuG9s7lkqP3vtQ+gtRahqsw8Y50z+kP9j/
   VKSmKn7WJ/gu8EJ0hH/fvAhRZpFkfy2vyP/4pTduT7YTV5E2zFl/My7ix
   /+MHn//bHbwJ6Gz/+bVaTdVbBEQ80OLqZb84Ia8oBcXV9eBix/u+R00Wc
   0wJNkdLGQt0QgaD1j6C09hhl/kECq9Ct6euDgaFFFPAAbCwS0g0VlcasQ
   E0Ikw8mX3U0E+0aFp+Pntn2RJlqkWDYSNMj16o0COdNcD9lplCWWQ/IVC
   w==;
X-CSE-ConnectionGUID: EF3+KQ0oTkartzh2vxon2Q==
X-CSE-MsgGUID: RwQDThj7RCq0FZRjsuwSkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="958647"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="958647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:16:56 -0700
X-CSE-ConnectionGUID: EZLiDHO+SzSL4LOEZoHa+A==
X-CSE-MsgGUID: IfN5nzcgQ1OVa51iKEs0lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2440701"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2026 23:16:56 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIgg1-000000005Vj-0QyI;
	Mon, 19 Oct 2026 06:16:53 +0000
Date: Mon, 19 Oct 2026 08:16:28 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 drivers/usb/host/xhci-mem.c:68:6: warning: no previous prototype for function
 'xhci_segment_free'
Message-ID: <202610190826.SWSZZ9Aw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Howard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   48e3cd973485465613da6d71fa17139773546573
commit: 6496f6cfbbd3bf241c6f16c7621db32088a1f073 [1/1] ANDROID: usb: host: export symbols for xhci hooks usage
config: i386-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190826.SWSZZ9Aw-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190826.SWSZZ9Aw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190826.SWSZZ9Aw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-mem.c:68:6: warning: no previous prototype for function 'xhci_segment_free' [-Wmissing-prototypes]
      68 | void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
         |      ^
   drivers/usb/host/xhci-mem.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
         | ^
         | static 
>> drivers/usb/host/xhci-mem.c:79:6: warning: no previous prototype for function 'xhci_free_segments_for_ring' [-Wmissing-prototypes]
      79 | void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
         |      ^
   drivers/usb/host/xhci-mem.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
         | ^
         | static 
>> drivers/usb/host/xhci-mem.c:100:6: warning: no previous prototype for function 'xhci_link_segments' [-Wmissing-prototypes]
     100 | void xhci_link_segments(struct xhci_segment *prev,
         |      ^
   drivers/usb/host/xhci-mem.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | void xhci_link_segments(struct xhci_segment *prev,
         | ^
         | static 
>> drivers/usb/host/xhci-mem.c:2075:5: warning: no previous prototype for function 'xhci_check_trb_in_td_math' [-Wmissing-prototypes]
    2075 | int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
         |     ^
   drivers/usb/host/xhci-mem.c:2075:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2075 | int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
         | ^
         | static 
   4 warnings generated.


vim +/xhci_segment_free +68 drivers/usb/host/xhci-mem.c

    67	
  > 68	void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
    69	{
    70		if (seg->trbs) {
    71			dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
    72			seg->trbs = NULL;
    73		}
    74		kfree(seg->bounce_buf);
    75		kfree(seg);
    76	}
    77	EXPORT_SYMBOL_GPL(xhci_segment_free);
    78	
  > 79	void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
    80					struct xhci_segment *first)
    81	{
    82		struct xhci_segment *seg;
    83	
    84		seg = first->next;
    85		while (seg != first) {
    86			struct xhci_segment *next = seg->next;
    87			xhci_segment_free(xhci, seg);
    88			seg = next;
    89		}
    90		xhci_segment_free(xhci, first);
    91	}
    92	
    93	/*
    94	 * Make the prev segment point to the next segment.
    95	 *
    96	 * Change the last TRB in the prev segment to be a Link TRB which points to the
    97	 * DMA address of the next segment.  The caller needs to set any Link TRB
    98	 * related flags, such as End TRB, Toggle Cycle, and no snoop.
    99	 */
 > 100	void xhci_link_segments(struct xhci_segment *prev,
   101				struct xhci_segment *next,
   102				enum xhci_ring_type type, bool chain_links)
   103	{
   104		u32 val;
   105	
   106		if (!prev || !next)
   107			return;
   108		prev->next = next;
   109		if (type != TYPE_EVENT) {
   110			prev->trbs[TRBS_PER_SEGMENT-1].link.segment_ptr =
   111				cpu_to_le64(next->dma);
   112	
   113			/* Set the last TRB in the segment to have a TRB type ID of Link TRB */
   114			val = le32_to_cpu(prev->trbs[TRBS_PER_SEGMENT-1].link.control);
   115			val &= ~TRB_TYPE_BITMASK;
   116			val |= TRB_TYPE(TRB_LINK);
   117			if (chain_links)
   118				val |= TRB_CHAIN;
   119			prev->trbs[TRBS_PER_SEGMENT-1].link.control = cpu_to_le32(val);
   120		}
   121	}
   122	EXPORT_SYMBOL_GPL(xhci_link_segments);
   123	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
