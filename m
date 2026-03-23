Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD62741A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277517; cv=none; b=K6YwXXTV8ijY3UdHZH+4qDspniLAgQbL0JRO2bf05Va8P5rPat6d3JcgeMBYB5ba4/5S2g8W7fGBZJoF/qhI+BVBe3EabTPDJWlRVE66MajQUjnvzTPZetjMBiDqiBHEJIyiY41fadlsbWIq4nER0yNneATkat/aXpofcvtTP/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277517; c=relaxed/simple;
	bh=nDubeEG2JN1lQEIlkTDp7BaQtFKLKy6ZWmqC5aQFXA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vAwTmNmhUUd55YM5kKVCTuZWkCNnp6Qoz6w4h6jZ3ODqBsFeORMG+1N4OshoIzL5H30iRmFKDjKGw7MeXtfj2rQfRMYyNGuqQIXCTe5PzzGKs5cvWu+kcwWR5TSdHuNk1O1UNrtERQajgLuqh97Dq1Fptjbx6z+R5q/7+MH1OZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5LUfLAS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5LUfLAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774277515; x=1805813515;
  h=date:from:to:cc:subject:message-id;
  bh=nDubeEG2JN1lQEIlkTDp7BaQtFKLKy6ZWmqC5aQFXA0=;
  b=a5LUfLASt3C+GqqmTkFHyOMQ7QZ8QDbxCIASczOC0RX56OfZHPbG/oIc
   GpnzvHmXXCD+n3gL/mv2VTsrPLNoQRMhI+Xkunm1J/mI8R3Lt0NjFWd5d
   6FbQP8lZkyPfWHydZhX+WUBiLUAxVopBra2VC0IvSUh07478iyQnlGde6
   Ei7NWp0+04JznQt3PykKWXbp1+9VOk1Xh7+u2Al6NhWWA2mso7Q6zTMgh
   3/a7AEh2EgbJ0U5dYzRHYQLeSlpbp50veGKb8rTUnIf8SCdex72GGkCiK
   KFBMMleCQvbaxnjapcapcQztTM0ikz4q6sf9C/an7KEnGjvP7s4bbUSN/
   w==;
X-CSE-ConnectionGUID: zjvu3QMzRDigZkeLZLu8ew==
X-CSE-MsgGUID: 0/q6mWLGQAO+/hhDcQMSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86351188"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86351188"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 07:51:55 -0700
X-CSE-ConnectionGUID: RT8VAfzESPCARGBQO+dn/g==
X-CSE-MsgGUID: 0KbaIKRlQha9tAcUA6XsCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247079353"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2026 07:51:53 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4gdD-000000001Kr-1PX3;
	Mon, 23 Mar 2026 14:51:51 +0000
Date: Mon, 23 Mar 2026 22:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 7/7]
 drivers/usb/host/xhci-mem.c:79:6: warning: no previous prototype for
 'xhci_free_segments_for_ring'
Message-ID: <202603232218.XO4odkw2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Howard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b8fc2a67e08ecb1e9ba7f5f5ee2352b956ca941e
commit: 6496f6cfbbd3bf241c6f16c7621db32088a1f073 [7/7] ANDROID: usb: host: export symbols for xhci hooks usage
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260323/202603232218.XO4odkw2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232218.XO4odkw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232218.XO4odkw2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-mem.c:68:6: warning: no previous prototype for 'xhci_segment_free' [-Wmissing-prototypes]
      68 | void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/usb/host/xhci-mem.c:79:6: warning: no previous prototype for 'xhci_free_segments_for_ring' [-Wmissing-prototypes]
      79 | void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:100:6: warning: no previous prototype for 'xhci_link_segments' [-Wmissing-prototypes]
     100 | void xhci_link_segments(struct xhci_segment *prev,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2075:5: warning: no previous prototype for 'xhci_check_trb_in_td_math' [-Wmissing-prototypes]
    2075 | int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xhci_free_segments_for_ring +79 drivers/usb/host/xhci-mem.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
