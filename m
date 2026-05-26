Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F13A16A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804697; cv=none; b=RI2x1LpD2/9iOjiIxAroDVVWYsDogJEIz1tGxCN+gQShtWFT6T89oWhJ3FdWxFBOYCsQXCr+xk3taqldUMjlbdNQ+rmBrk81/ye2CdwiYIXyOWRWfTkbTXuWUdDpGQ0ebn+0RKeB7dVH1yOv6Wt6DwxqrvpHeC2NoSrZ5Xh8k3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804697; c=relaxed/simple;
	bh=4EOXkUENEIgOk8qIvfbcaRJKEt6FJEae6aC1V9QpHqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ko4+cM1F921U7JZbRwTGkatTQB/LUTuin+a205ecb2uUsI15gTGnOvLZlePk0hbAmhY8y/DX23O13PqBU12SgfeSxBxE0YkhAxpuaI2vqB+kbz3a/UhWuOlQtAyi3nl6nrvp7eVx3UTo8OFn6RfjxvIv5eMw92NZeH5byKRHSt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJHy1C0v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJHy1C0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779804695; x=1811340695;
  h=date:from:to:cc:subject:message-id;
  bh=4EOXkUENEIgOk8qIvfbcaRJKEt6FJEae6aC1V9QpHqk=;
  b=YJHy1C0vN4Tb5d/VYWZIEKC684UtYIaV6PB9Bd5K594k9OyUd4vbUQ6k
   HXpKER6JIjWkdnjOT8N6R1brGKxoBvw45e8WHwnVjJPOVI0jMuAIfVJdm
   D87qa5ZpjXQbnz7NO1p/f6Pn7hoEIOm13EGAHAMY7MRQkMTiqxqikG69t
   rto9aWivHY5d5AYkaRiNGZU0AghdwEnoiygRWg4rurGH+UEKzv64sMU37
   mFY91GoxXL1tfu6njNPx0kTP5coYsT12vgtfgLxmg6uw+/9i5A/Uf/M5W
   EyKzaaePKno0aFDj2D7kge7dB5MF/uOJy0pclw0vCIWXC4Aje5/W5eh0i
   Q==;
X-CSE-ConnectionGUID: rRJHU/egR92MFCfLGngMzg==
X-CSE-MsgGUID: iEQeeHi4R6qgHDACZDPUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90918004"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="90918004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 07:11:34 -0700
X-CSE-ConnectionGUID: zOLjcWUkRMCm1vJRCfGeMA==
X-CSE-MsgGUID: MHTjmWfNRK6QXDT8Svpxcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246903737"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 May 2026 07:11:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRsVG-00000000CQ9-303f;
	Tue, 26 May 2026 14:11:30 +0000
Date: Tue, 26 May 2026 16:11:02 +0200
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./usr/include/fwctl/bnxt.h:9:10: fatal error: linux/sizes.h:
 No such file or directory
Message-ID: <202605261655.szuShNqp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pavan-Chebbi/fwctl-Add-driver_data-field-to-fwctl_rpc/20260522-160839
head:   d6ce23e99fb2a6800a2af4ebb99cdcc9e6b06f4f
commit: d6ce23e99fb2a6800a2af4ebb99cdcc9e6b06f4f fwctl/bnxt: add DMA buffer support for HWRM commands
date:   4 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260526/202605261655.szuShNqp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261655.szuShNqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261655.szuShNqp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/fwctl/bnxt.h:9:10: fatal error: linux/sizes.h: No such file or directory
       9 | #include <linux/sizes.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
