Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B52C1584
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783804371; cv=none; b=TCRdTRs3MPxej3muSDgbnvBvK7Pncc0W5EYvqXUcVeqfX/zoCnyGBaH2l5jGaoGrHWLfmJokvyv4CMA7CkwjxcsbU1gd9b4GaNOvpT4eSpL7zE2svFRjxyUWAowBABkIcdc/YIZkUuu/IJZFQzcw/AJQ0GBlvUpfkDQWdMis8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783804371; c=relaxed/simple;
	bh=gFfb7BNnnrTHrQaxD+MGSnxx4BV13K982Go2dsPQbNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z4erCN/nAo+r1LFW8quO/1fLuzJxtHU8NJWPPUmWpXg6uBWfwY1H2iOhqYX39lxXFTA8FUcoYyB3RfwHSZ41eSiPsCOg8kFBIrRous11rLQrh054FH5EjR3TNfh/z0nqJ1VCppIJceIeJIWig9CTDkTrCO5ZbGM/hISr/ko3K4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMKhQpMz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMKhQpMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783804369; x=1815340369;
  h=date:from:to:cc:subject:message-id;
  bh=gFfb7BNnnrTHrQaxD+MGSnxx4BV13K982Go2dsPQbNc=;
  b=lMKhQpMzxTWsv9MVWLfquYTRQ9rYvuh1moz6Va+gb+8XV1/x0tQ7Dc4U
   Qz+4zeLuR6UTiF3WarTha6K2McnUQxbW85ng6hR5OBCaoimjH2TbIdxR8
   jP181dZiVIJ9/ZDwSmgySa4QpPFaK2nz9fpfm/IASfPychn1q9W/cuODH
   sugJxuIrFvH+4EZ11VyyG/ThlvloJwN0b/V4N3RudBdCfbhn0f4kiIRxt
   8uedXXO3aP07yTb4CeyXskzqCMVxQU9K6hXl1XEyYmgSHJfb3leghvj6a
   pdNdO/xwMmLJZP8TWR50hvHke1zJrQlvV1DZQLH7zCL67BH5ELhGjCStk
   w==;
X-CSE-ConnectionGUID: /9VcJrqhTt2afcCXJVUgyg==
X-CSE-MsgGUID: FD8sB9DHRGyzODqopB77zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84570392"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84570392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 14:12:49 -0700
X-CSE-ConnectionGUID: nf0AJs2wQFWZ4l/JKJdcnA==
X-CSE-MsgGUID: kGCpRzmKStaY04l5LVozTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254682360"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2026 14:12:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wif05-00000000KP0-3u8o;
	Sat, 11 Jul 2026 21:12:42 +0000
Date: Sun, 12 Jul 2026 05:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 264/264]
 drivers/usb/host/xhci-mem.c:100:6: warning: no previous prototype for
 'xhci_link_segments'
Message-ID: <202607120413.95vuQouI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daehwan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   3ca916c6fe6ce53501541ce826747ff8bb77fb23
commit: 731d2da95e413d9ecf6c7995456f9736b02d0bbd [264/264] ANDROID: usb: host: export xhci symbols for ring management
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260712/202607120413.95vuQouI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120413.95vuQouI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120413.95vuQouI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-mem.c:68:6: warning: no previous prototype for 'xhci_segment_free' [-Wmissing-prototypes]
      68 | void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
         |      ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:79:6: warning: no previous prototype for 'xhci_free_segments_for_ring' [-Wmissing-prototypes]
      79 | void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:100:6: warning: no previous prototype for 'xhci_link_segments' [-Wmissing-prototypes]
     100 | void xhci_link_segments(struct xhci_segment *prev,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:2047:5: warning: no previous prototype for 'xhci_check_trb_in_td_math' [-Wmissing-prototypes]
    2047 | int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xhci_link_segments +100 drivers/usb/host/xhci-mem.c

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
    79	void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
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
