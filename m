Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8D10F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599678; cv=none; b=UQvOfz3Bv3nX2/rRK1fC+KtXyUhWqJECO/nWCPdXK6x7Q4MTy2aeAc2T8fmVTwThLLie+WUmjiiwYb+fCXMBaJYSjth8XCc0ScgDew3u1md4MeTnru2j2MKyQnAp0xTA6pdd7W7S1E009Tdiiwz/a5zi9Q2SwrmOCSoOQ3xv4a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599678; c=relaxed/simple;
	bh=G+jmch+k1eCh6+cG5EM2O+h5Y266BnU2YRU/EU407F8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/42qrQKScZV2mTZKaSeWk7Imp1FdOwOgBVQGDcYLsdunCO7TM/s1XgnKy6/OyLl09VnEAaD9zLQzb/9ne/dYgGwe0T4RTwZAEkJq/XYs1h6g5AKC0QErlx2Kxi8j/nkYLkRNGzCxeYRke5S5bQGiMgDhsJd5Ji4fct9L9hOBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7/ISgLp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7/ISgLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784599677; x=1816135677;
  h=date:from:to:cc:subject:message-id;
  bh=G+jmch+k1eCh6+cG5EM2O+h5Y266BnU2YRU/EU407F8=;
  b=F7/ISgLpdneAkdoS0buwSWDzG6DYxIaW6ZG+hrMlMAIzSil97dxJ6jnI
   O+QUd4XUcnJKtYP7oB3tv2dwwMgCY4mv8jz0NoXPq+hiQ0x42iJusPEap
   iA/CCAmRt3xpvgB0FwmPxH94/vogSrj+1xVWUvPVB1r2D6PY21DNpjHWA
   gQ1Nk65p1rj7we6eJQCFWtEe5kW0Tt+FM1q3gx6fZPlZ0ae6iMHjKxkwk
   8vU6ks0sRztnMWMf7jRIXj7TdIU3MFACWppHr0zEI4NajqIL+CYGeWVY1
   g9eGSHQFb50AXXAo8HZgr4AJryCkjws/k1i+dvfAtNy+3KiPu/0biKqOr
   A==;
X-CSE-ConnectionGUID: FLn7+lQ2RmCMABnNlJc5BQ==
X-CSE-MsgGUID: 4Cwmx5lJTYWVFxLZS1b7Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85284645"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="85284645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 19:07:57 -0700
X-CSE-ConnectionGUID: xAWhGVpORpiUVi6fw4shYw==
X-CSE-MsgGUID: MPxkLCzgQeW1SaNjOVD8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="261409915"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Jul 2026 19:07:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlztg-00000000X6P-1wmX;
	Tue, 21 Jul 2026 02:07:52 +0000
Date: Tue, 21 Jul 2026 10:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 264/264]
 drivers/usb/host/xhci-mem.c:100:6: warning: no previous prototype for
 'xhci_link_segments'
Message-ID: <202607210957.EsjQBsuk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daehwan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   7bba16151fbf8efa422aa754a5ddda682ec74a96
commit: 731d2da95e413d9ecf6c7995456f9736b02d0bbd [264/264] ANDROID: usb: host: export xhci symbols for ring management
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260721/202607210957.EsjQBsuk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607210957.EsjQBsuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607210957.EsjQBsuk-lkp@intel.com/

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
