Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED22FB621
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938885; cv=none; b=sufPypB6foOHHUKs7eMrZZZQ5Z9TLPKFgvJVxpN7YHgKBbe9VZ+X1xx5s23RedWoKWTn4NzomwsDgPrMZPJu/+NauFONQpqsX0YHu4D5loAWadjMZuQWp+YpTPDX24Erx9bsMUxROql34dPRuWwsHWKNkbbWJcmwTdUwf7+eF4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938885; c=relaxed/simple;
	bh=MmaCCW7a60H55ccMq5pa5fPLLG++fVTj+HUagQAMS84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kGVbpzeyhrZWmU/qWB6g+vQeGKVnPcXUhK+Tn43koiQExCQJurApm/txC7Cu/nLQgqKGg+H4TooLaeoD9b08+Y7lkDG1liZVVu0jSpIS1IWxtXJPFMtfUy/D6euzN0ssoNW4+mg1Mdnc96lsK54OkDJNEK5XptRwEu4RlVW9tfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0nXYDCS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0nXYDCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761938884; x=1793474884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmaCCW7a60H55ccMq5pa5fPLLG++fVTj+HUagQAMS84=;
  b=D0nXYDCSoEG4hcZ3gVxQehd46wH9b/xiUBpn1FP2E33ZAk3RcYaofGIN
   IjdEbCvKBuEqwyQCezRe4x5A/liFtBxtLmkq6xNkU7NInCRrpqqMRsfXo
   +I2bJKF+n0vOdz7ckjXXivNZuwgBFGhexC+odwohUFKSYh6/GyggSqaNO
   eUi2RdL4S3NB+WPb+4O9zeYh95S6wnvyex8f/vxXsP3n+9jgooPUUl4+c
   Sxh5Hsyvt5QpiX3XK7ZzgkO6jUM//qYyeOLEpBEqQdp9PTnbBQ7JsCaOQ
   IoBoZzzyiLg31uBvvHwi9aStvRrvzS8fKncBqmO0vpq2++ETN+eKYqmx4
   g==;
X-CSE-ConnectionGUID: w4OoVHezSsWgLs3DTQPMrw==
X-CSE-MsgGUID: KuWa7BB7SyuaJd28pp1lZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86733809"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="86733809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 12:28:03 -0700
X-CSE-ConnectionGUID: oTZAClNTQ2mxxuICXnWinw==
X-CSE-MsgGUID: /G+sAtvGSi+BxgoIiLrkew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="209873123"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2025 12:28:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEumk-000NbI-15;
	Fri, 31 Oct 2025 19:27:47 +0000
Date: Sat, 1 Nov 2025 03:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/17] virtio_msg_user.c:(.text+0x26c):
 multiple definition of `virtio_msg_ffa_heap_create'; nios2-linux-ld: DWARF
 error: could not find abbrev number 25
Message-ID: <202511010326.Gr6FU3m4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   94d3d88b1da7e37623fae3c98ecdfebb1fa540d7
commit: 7155ab4d05c12fed195478a0905d0808b3452db5 [10/17] virtio-msg: ffa: Add DMA Heap
config: nios2-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010326.Gr6FU3m4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010326.Gr6FU3m4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010326.Gr6FU3m4-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1897488
   drivers/virtio/virtio_msg_user.o: in function `virtio_msg_ffa_heap_create':
>> virtio_msg_user.c:(.text+0x26c): multiple definition of `virtio_msg_ffa_heap_create'; nios2-linux-ld: DWARF error: could not find abbrev number 25
   drivers/virtio/virtio_msg.o:virtio_msg.c:(.text+0xf18): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1331322
   drivers/virtio/virtio_msg_loopback.o: in function `virtio_msg_ffa_heap_create':
   virtio_msg_loopback.c:(.text+0x75c): multiple definition of `virtio_msg_ffa_heap_create'; drivers/virtio/virtio_msg.o:virtio_msg.c:(.text+0xf18): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
